CREATE TABLE [dbo].[EmployeeDocument] (
    [EmployeeDocumentId] UNIQUEIDENTIFIER CONSTRAINT [DF_EmployeeDocument_EmployeeDocumentId] DEFAULT (newid()) NOT NULL,
    [FilePath]           NVARCHAR (2000)  NOT NULL,
    [UploadedDate]       DATETIME2 (7)    CONSTRAINT [DF_EmployeeDocument_UploadedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_EmployeeDocument] PRIMARY KEY CLUSTERED ([EmployeeDocumentId] ASC)
);

