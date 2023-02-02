CREATE TABLE [dbo].[Employee] (
    [EmployeeId]   UNIQUEIDENTIFIER CONSTRAINT [DF_Employee_EmployeeId] DEFAULT (newid()) NOT NULL,
    [FirstName]    NVARCHAR (500)   NOT NULL,
    [LastName]     NVARCHAR (500)   NOT NULL,
    [MiddleName]   NVARCHAR (500)   NULL,
    [EmployedFrom] DATETIME2 (7)    NOT NULL,
    [EmployedTo]   DATETIME2 (7)    NULL,
    [SuperiorId]   UNIQUEIDENTIFIER NULL,
    [DepartmentId] UNIQUEIDENTIFIER NOT NULL,
    [JobId]        UNIQUEIDENTIFIER NOT NULL,
    [VacationDays] TINYINT          NULL,
    [EmployeeType] VARCHAR (50)     NOT NULL,
    [IsActive]     BIT              CONSTRAINT [DF_Employee_IsActive] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_Employee] PRIMARY KEY CLUSTERED ([EmployeeId] ASC),
    CONSTRAINT [FK_Employee_Department] FOREIGN KEY ([DepartmentId]) REFERENCES [dbo].[Department] ([DepartmentId]),
    CONSTRAINT [FK_Employee_Employee] FOREIGN KEY ([SuperiorId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_Employee_Job] FOREIGN KEY ([JobId]) REFERENCES [dbo].[Job] ([JobId])
);

