using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class EmployeeAbsenceDTOBase
    {
        public AbsenceCategoryBaseDTO AbsenceCategory { get; set; }

        public string AbsenceStatus { get; set; }

        public DateTime? DateFrom { get; set; }

        public DateTime? DateTo { get; set; }

        public EmployeeBasicDataBaseDTO Employee { get; set; }

        public Guid? EmployeeAbsenceId { get; set; }

    }
}
