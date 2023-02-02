using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class AbsenceCategoryDTOBase
    {
        public Guid? AbsenceCategoryId { get; set; }

        public string Description { get; set; }

        public string Name { get; set; }

        public decimal? SalaryFactor { get; set; }

    }
}
