using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class EmployeeBaseDTOBase
    {
        public DepartmentBaseDTO Department { get; set; }

        public Guid? EmployeeId { get; set; }

        public string EmployeeType { get; set; }

        public string FirstName { get; set; }

        public string LastName { get; set; }

        public ManagerBaseDTO Manager { get; set; }

        public string MiddleName { get; set; }

    }
}
