﻿using System;

namespace BeGeneric.Services.BeGeneric.DatabaseStructure
{
    public interface IDatabaseStructureService
    {
        Type GetFieldType(string fieldName, string tableName);

        string[] GetEnumValues(string fieldName, string tableName);

        DatabaseFieldSizeLimitation GetFieldSizeLimitation(string fieldName, string tableName);
        bool GetFieldNullable(string propertyName, string tableName);

        string GetRegexValues(string fieldName, string tableName);

        string ColumnDelimiterLeft { get; }

        string ColumnDelimiterRight { get; }

        string StringDelimiter { get; }
    }

    public class DatabaseFieldSizeLimitation
    {
        public int? Min { get; set; }
        public int? Max { get; set; }
    }
}
