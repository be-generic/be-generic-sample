using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using BeGeneric.Models;

namespace BeGeneric.BaseModels
{
    public class JobBase
    {
        [Key]
        [Required]
        public Guid JobId { get; set; }

        [Required]
        public string Name { get; set; }

        public virtual List<Employee> EmployeeList { get; set; }
    }
}
