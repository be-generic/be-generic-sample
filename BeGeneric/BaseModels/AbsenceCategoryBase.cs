using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BeGeneric.Models;

namespace BeGeneric.BaseModels
{
    public class AbsenceCategoryBase
    {
        [Key]
        [Required]
        public Guid AbsenceCategoryId { get; set; }

        public string Description { get; set; }

        [Required]
        public string Name { get; set; }

        [Required]
        public decimal SalaryFactor { get; set; }

        public virtual List<EmployeeAbsence> EmployeeAbsenceList { get; set; }
    }
}
