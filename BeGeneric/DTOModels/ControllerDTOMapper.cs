using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;

namespace BeGeneric.DTOModels
{
    public class ControllerDTOMapper
    {
        public static readonly Dictionary<string, Type> MAPPINGS = new()
        {
            { "employee-absence", typeof(EmployeeAbsenceDTO) },
            { "employee-absence.base", typeof(EmployeeAbsenceBaseDTO) },

            { "department", typeof(DepartmentDTO) },
            { "department.base", typeof(DepartmentBaseDTO) },

            { "employee", typeof(EmployeeDTO) },
            { "employee.base", typeof(EmployeeBaseDTO) },

            { "job", typeof(JobDTO) },
            { "job.base", typeof(JobBaseDTO) },

            { "absence-category", typeof(AbsenceCategoryDTO) },
            { "absence-category.base", typeof(AbsenceCategoryBaseDTO) },

        };
    }
}