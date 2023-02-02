CREATE TABLE [dbo].[EmployeeSalary] (
    [EmployeeSalaryId] UNIQUEIDENTIFIER CONSTRAINT [DF_EmployeeSalary_EmployeeSalaryId] DEFAULT (newid()) NOT NULL,
    [EmployeeId]       UNIQUEIDENTIFIER NOT NULL,
    [Salary]           DECIMAL (18, 2)  NOT NULL,
    [ValidFrom]        DATETIME2 (7)    NOT NULL,
    [ValidTo]          DATETIME2 (7)    NULL,
    [SalaryType]       VARCHAR (50)     CONSTRAINT [DF_EmployeeSalary_SalaryType] DEFAULT ('Monthly') NOT NULL,
    CONSTRAINT [PK_EmployeeSalary] PRIMARY KEY CLUSTERED ([EmployeeSalaryId] ASC),
    CONSTRAINT [FK_EmployeeSalary_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

