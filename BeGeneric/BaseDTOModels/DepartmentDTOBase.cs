using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class DepartmentDTOBase
    {
        public Guid? DepartmentId { get; set; }

        public string Description { get; set; }

        public string Name { get; set; }

    }
}
