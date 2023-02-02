using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BeGeneric.Models;

namespace BeGeneric.BaseModels
{
    public class EmployeeBase
    {
        [Required]
        public Guid DepartmentId { get; set; }
        [ForeignKey("DepartmentId")]
        public virtual Department Department { get; set; }

        [Required]
        public DateTime EmployedFrom { get; set; }

        [Key]
        [Required]
        public Guid EmployeeId { get; set; }

        [Required]
        public string EmployeeType { get; set; }

        [Required]
        public string FirstName { get; set; }

        [Required]
        public Guid JobId { get; set; }
        [ForeignKey("JobId")]
        public virtual Job Job { get; set; }

        [Required]
        public string LastName { get; set; }

        public string MiddleName { get; set; }

        public Guid? SuperiorId { get; set; }
        [ForeignKey("SuperiorId")]
        public virtual Employee Manager { get; set; }

        public byte? VacationDays { get; set; }

        public virtual List<EmployeeAbsence> EmployeeAbsenceList { get; set; }
        public virtual List<Employee> Subordinates { get; set; }
    }
}
