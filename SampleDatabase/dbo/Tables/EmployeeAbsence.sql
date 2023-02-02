CREATE TABLE [dbo].[EmployeeAbsence] (
    [EmployeeAbsenceId] UNIQUEIDENTIFIER CONSTRAINT [DF_EmployeeAbsence_EmployeeAbsenceId] DEFAULT (newid()) NOT NULL,
    [EmployeeId]        UNIQUEIDENTIFIER NOT NULL,
    [DateFrom]          DATETIME2 (7)    NOT NULL,
    [DateTo]            DATETIME2 (7)    NOT NULL,
    [AbsenceStatus]     VARCHAR (50)     CONSTRAINT [DF_EmployeeAbsence_AbsenceStatus] DEFAULT ('InApproval') NULL,
    [AbsenceCategoryId] UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_EmployeeAbsence] PRIMARY KEY CLUSTERED ([EmployeeAbsenceId] ASC),
    CONSTRAINT [FK_EmployeeAbsence_AbsenceCategory] FOREIGN KEY ([AbsenceCategoryId]) REFERENCES [dbo].[AbsenceCategory] ([AbsenceCategoryId]),
    CONSTRAINT [FK_EmployeeAbsence_Employee] FOREIGN KEY ([EmployeeAbsenceId]) REFERENCES [dbo].[Employee] ([EmployeeId])
);

