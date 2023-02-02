using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BeGeneric.Models;

namespace BeGeneric.BaseModels
{
    public class EmployeeAbsenceBase
    {
        [Required]
        public Guid AbsenceCategoryId { get; set; }
        [ForeignKey("AbsenceCategoryId")]
        public virtual AbsenceCategory AbsenceCategory { get; set; }

        public string AbsenceStatus { get; set; }

        [Required]
        public DateTime DateFrom { get; set; }

        [Required]
        public DateTime DateTo { get; set; }

        [Key]
        [Required]
        public Guid EmployeeAbsenceId { get; set; }

        [Required]
        public Guid EmployeeId { get; set; }
        [ForeignKey("EmployeeId")]
        public virtual Employee Employee { get; set; }

    }
}
