using System;
using System.Collections.Generic;
using BeGeneric.DTOModels;

namespace BeGeneric.BaseDTOModels
{
    public class JobBaseDTOBase
    {
        public Guid? JobId { get; set; }

        public string Name { get; set; }

    }
}
