﻿using BeGeneric.Helpers;
using BeGeneric.Models;
using BeGeneric.Services.BeGeneric.Exceptions;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.Json;

namespace BeGeneric.Services.BeGeneric
{
    public class ComparerObject : ComparerObjectGroup
    {
        public string Operator { get; set; }
        public string Property { get; set; }
        public object Filter { get; set; }

        public override Tuple<string, int, List<Tuple<string, object>>> ToSQLQuery(string userName, Entity entity, int counter, string originTableAlias, Dictionary<string, SelectPropertyData> joinData)
        {
            if (this.Comparisons != null)
            {
                return base.ToSQLQuery(userName, entity, counter, originTableAlias, joinData);
            }

            List<Tuple<string, object>> parameters = new();
            string operation = ResolveOperator(Property.IndexOf(".") > -1);
            operation = operation.Replace("$property", ResolvePropertyName(entity, originTableAlias));

            if (operation.Contains("$filterParam"))
            {
                operation = operation.Replace("$filterParam", $@"@Filter{counter}");

                if (Filter is JsonElement jsonFilter)
                {
                    Filter = jsonFilter.ToString();
                }

                if (Filter is string strFilter && string.Equals(strFilter, "$user", StringComparison.OrdinalIgnoreCase))
                {
                    if (!string.IsNullOrEmpty(userName))
                    {
                        Filter = userName;
                    }
                    else
                    {
                        Filter = DBNull.Value;
                    }
                }

                parameters.Add(new Tuple<string, object>($@"Filter{counter}", Filter));
            }

            return new Tuple<string, int, List<Tuple<string, object>>>(operation, counter + 1, parameters);
        }

        public static Tuple<string, int, List<Tuple<string, object>>> ToGroupSQLQuery(List<ComparerObject> comparers, Entity entity, int counter, string originTableAlias)
        {
            List<Tuple<string, object>> parameters = new();

            string operation = null;

            StringBuilder sb = new("(");
            bool isFirst = true;
            int internal_counter = 0;
            foreach (string word in comparers[0].Filter.ToString().Split(" ").Where(x => !string.IsNullOrEmpty(x)))
            {
                if (!isFirst)
                {
                    sb.Append(" AND ");
                }
                else
                {
                    isFirst = false;
                }

                bool isFirstInBatch = true;
                sb.Append("(");

                foreach (var comparer in comparers)
                {
                    string propertyName = comparer.ResolvePropertyName(entity, originTableAlias);
                    if (!isFirstInBatch)
                    {
                        sb.Append($@" OR ");
                    }
                    else
                    {
                        isFirstInBatch = false;
                    }

                    sb.Append($@"{propertyName} LIKE @Filter{counter}_{internal_counter} ");
                    parameters.Add(new Tuple<string, object>($@"Filter{counter}_{internal_counter++}", "%" + word.Trim() + "%"));
                }

                sb.Append(")");
            }

            sb.Append(")");
            operation = sb.ToString();

            return new Tuple<string, int, List<Tuple<string, object>>>(operation, counter + 1, parameters);
        }

        private string ResolvePropertyName(Entity entity, string originTableAlias, Dictionary<string, SelectPropertyData> joinData = null)
        {
            var properties = Property.Split(".");

            if (properties.Length == 1)
            {
                Property property = entity.Properties.FirstOrDefault(x => x.CamelCaseName().ToLowerInvariant() == properties[0].ToLowerInvariant());
                if (property == null)
                {
                    throw new GenericBackendSecurityException(SecurityStatus.BadRequest, "Search filter is not valid");
                }

                return property.PropertyName;
            }
            else if (joinData != null && joinData.Any(x => string.Equals(x.Value.TableDTOName, string.Join(".", properties[..^1]), StringComparison.OrdinalIgnoreCase)))
            {
                var data = joinData.First(x => string.Equals(x.Value.TableDTOName, string.Join(".", properties[..^1]), StringComparison.OrdinalIgnoreCase)).Value;
                return $"[{data.TableName}].[{data.Properties.First(x => string.Equals(properties[^1], x.Item2, StringComparison.OrdinalIgnoreCase)).Item3}]";
            }
            else
            {
                StringBuilder sb = new();
                sb.Append($@"(SELECT fil_tab{properties.Length - 2}.{properties[^1]} FROM ");

                Entity iterationEntity = entity;
                string firstKey = "";
                string secondKey = "";
                string secondKeyTabName = "fil_tab0";

                for (int i = 0; i < properties.Length - 1; i++)
                {
                    string prop = properties[i].ToLowerInvariant();
                    Property property = iterationEntity.Properties.FirstOrDefault(x => x.CamelCaseName().ToLowerInvariant() == prop);
                    bool referencingProperty = false;

                    if (property == null)
                    {
                        property = iterationEntity.ReferencingProperties.FirstOrDefault(x => iterationEntity.ReferencingProperties[0].RelatedModelPropertyName.ToLowerInvariant() == prop);
                        referencingProperty = property != null;
                    }

                    if (property == null)
                    {
                        EntityRelation crossEntity = iterationEntity.EntityRelations1.FirstOrDefault(x => x.Entity1PropertyName.ToLowerInvariant() == prop);
                        Entity entity1 = crossEntity?.Entity1;
                        string propertyFrom = crossEntity?.Entity1ReferencingColumnName;
                        string propertyTo = crossEntity?.Entity2ReferencingColumnName;

                        if (crossEntity == null)
                        {
                            crossEntity = iterationEntity.EntityRelations2.FirstOrDefault(x => x.Entity2PropertyName.ToLowerInvariant() == prop);
                            entity1 = crossEntity?.Entity2;
                            propertyFrom = crossEntity?.Entity2ReferencingColumnName;
                            propertyTo = crossEntity?.Entity1ReferencingColumnName;
                        }

                        if (crossEntity == null)
                        {
                            throw new GenericBackendSecurityException(SecurityStatus.BadRequest, "Search filter is not valid");
                        }

                        if (i > 0)
                        {
                            sb.Append(" INNER JOIN ");
                        }
                        else
                        {
                            secondKeyTabName = "fil_cross_tab0";
                            secondKey = propertyFrom;
                        }

                        sb.Append($@"{GenericDataService.SCHEMA}.[{crossEntity.CrossTableName}] AS fil_cross_tab{i} ");

                        if (i > 0)
                        {
                            string originalKey = iterationEntity.Properties.FirstOrDefault(x => x.IsKey).PropertyName ?? "Id";
                            sb.Append($@" ON fil_tab{i - 1}.[{originalKey}]=fil_cross_tab{i}.[{propertyFrom}]");
                        }
                        else
                        {
                            firstKey = entity.Properties.FirstOrDefault(x => x.IsKey)?.PropertyName ?? "Id";
                        }

                        iterationEntity = crossEntity.Entity1.EntityId != entity1.EntityId ? crossEntity.Entity1 : crossEntity.Entity2;

                        sb.Append($@" INNER JOIN ");
                        sb.Append($@"{GenericDataService.SCHEMA}.[{iterationEntity.TableName}] AS fil_tab{i} ");

                        string key = iterationEntity.Properties.FirstOrDefault(x => x.IsKey).PropertyName ?? "Id";
                        sb.Append($@" ON fil_cross_tab{i}.[{propertyTo}]=fil_tab{i}.{key}");

                        continue;
                    }

                    if (i > 0)
                    {
                        sb.Append(" INNER JOIN ");
                    }
                    else
                    {
                        firstKey = property.PropertyName;
                    }

                    if (!referencingProperty && property.ReferencingEntity != null)
                    {
                        iterationEntity = property.ReferencingEntity;
                        sb.Append($@"{GenericDataService.SCHEMA}.[{iterationEntity.TableName}]");
                        sb.Append($@" AS fil_tab{i}");

                        if (i > 0)
                        {
                            string key = iterationEntity.Properties.FirstOrDefault(x => x.IsKey).PropertyName ?? "Id";
                            sb.Append($@" ON fil_tab{i - 1}.{property.PropertyName}=fil_tab{i}.{key}");
                        }
                        else
                        {
                            secondKey = iterationEntity.Properties.FirstOrDefault(x => x.IsKey).PropertyName ?? "Id";
                        }
                    }
                    else if (referencingProperty)
                    {
                        iterationEntity = property.Entity;
                        sb.Append($@"{GenericDataService.SCHEMA}.[{iterationEntity.TableName}]");
                        sb.Append($@" AS fil_tab{i}");

                        if (i > 0)
                        {
                            string key = iterationEntity.Properties.FirstOrDefault(x => x.IsKey).PropertyName ?? "Id";
                            sb.Append($@" ON fil_tab{i - 1}.{property.PropertyName}=fil_tab{i}.{key}");
                        }
                        else
                        {
                            secondKey = property.PropertyName;
                        }
                    }
                    else
                    {
                        throw new GenericBackendSecurityException(SecurityStatus.BadRequest, "Search filter is not valid");
                    }
                }

                sb.Append(" WHERE ");

                // IMPORTAINT!!! tab1 is always the table belonging to target entity !!!IMPORTANT
                sb.Append($"{secondKeyTabName}.{secondKey} = {originTableAlias}.{firstKey})");

                return sb.ToString();
            }
        }

        private string ResolveOperator(bool includeAny)
        {
            string any = includeAny ? "ANY " : string.Empty;
            return Operator?.ToLowerInvariant() switch
            {
                null => $"$filterParam = {any}$property",
                "eq" => $"$filterParam = {any}$property",
                "neq" => $"$filterParam != {any}$property",
                "lte" => $"$filterParam >= {any}$property",
                "gte" => $"$filterParam <= {any}$property",
                "lt" => $"$filterParam > {any}$property",
                "gt" => $"$filterParam < {any}$property",
                "not null" => $"$property IS NOT NULL",
                "null" => $"$property IS NULL",
                "contains" => "$property LIKE '%' + $filterParam + '%'",
                "startswith" => "$property LIKE $filterParam + '%'",
                "endswith" => "$property LIKE '%' + $filterParam",
                _ => "1 = 1",
            };
        }
    }
}
