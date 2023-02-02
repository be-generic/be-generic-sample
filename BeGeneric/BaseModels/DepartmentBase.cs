using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BeGeneric.Models;

namespace BeGeneric.BaseModels
{
    public class DepartmentBase
    {
        [Key]
        [Required]
        public Guid DepartmentId { get; set; }

        public string Description { get; set; }

        [Required]
        public string Name { get; set; }

        public virtual List<Employee> EmployeeList { get; set; }
    }
}
