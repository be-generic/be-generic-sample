﻿using System;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeGeneric.Models
{
    public class EntityRelation
    {
        [Key]
        public Guid EntityRelationId { get; set; }

        public string CrossTableName { get; set; }

        public Guid Entity1Id { get; set; }
        public string Entity1ReferencingColumnName { get; set; }
        public string Entity1PropertyName { get; set; }

        public Guid Entity2Id { get; set; }
        public string Entity2ReferencingColumnName { get; set; }
        public string Entity2PropertyName { get; set; }

        public string ValidFromColumnName { get; set; }
        public string ValidToColumnName { get; set; }
        public string ActiveColumnName { get; set; }

        public bool ShowInEntity1Min { get; set; }
        public bool ShowInEntity2Min { get; set; }

        public virtual Entity Entity1 { get; set; }

        public virtual Entity Entity2 { get; set; }
    }

}
