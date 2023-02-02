using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class EmployeeDTOBase
    {
        public DepartmentBaseDTO Department { get; set; }

        public DateTime? EmployedFrom { get; set; }

        public Guid? EmployeeId { get; set; }

        public string EmployeeType { get; set; }

        public string FirstName { get; set; }

        public JobBaseDTO Job { get; set; }

        public string LastName { get; set; }

        public ManagerBaseDTO Manager { get; set; }

        public string MiddleName { get; set; }

        public byte? VacationDays { get; set; }

    }
}
