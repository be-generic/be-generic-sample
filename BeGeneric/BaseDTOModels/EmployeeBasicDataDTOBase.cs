using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class EmployeeBasicDataDTOBase
    {
        public Guid? EmployeeId { get; set; }

        public string LastName { get; set; }

    }
}
