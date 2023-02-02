CREATE TABLE [dbo].[Department] (
    [DepartmentId] UNIQUEIDENTIFIER CONSTRAINT [DF_Department_DepartmentId] DEFAULT (newid()) NOT NULL,
    [Name]         NVARCHAR (500)   NOT NULL,
    [Description]  NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED ([DepartmentId] ASC)
);

