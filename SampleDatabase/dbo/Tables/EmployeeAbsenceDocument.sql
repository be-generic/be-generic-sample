CREATE TABLE [dbo].[EmployeeAbsenceDocument] (
    [EmployeeAbsenceDocumentId] UNIQUEIDENTIFIER CONSTRAINT [DF_EmployeeAbsenceDocument_EmployeeAbsenceDocumentId] DEFAULT (newid()) NOT NULL,
    [FilePath]                  NVARCHAR (2000)  NOT NULL,
    [UploadedDate]              DATETIME2 (7)    CONSTRAINT [DF_EmployeeAbsenceDocument_UploadedDate] DEFAULT (getdate()) NOT NULL,
    [EmployeeAbsenceId]         UNIQUEIDENTIFIER NOT NULL,
    CONSTRAINT [PK_EmployeeAbsenceDocument] PRIMARY KEY CLUSTERED ([EmployeeAbsenceDocumentId] ASC),
    CONSTRAINT [FK_EmployeeAbsenceDocument_EmployeeAbsence] FOREIGN KEY ([EmployeeAbsenceId]) REFERENCES [dbo].[EmployeeAbsence] ([EmployeeAbsenceId])
);

