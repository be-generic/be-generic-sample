CREATE TABLE [dbo].[AbsenceCategory] (
    [AbsenceCategoryId] UNIQUEIDENTIFIER CONSTRAINT [DF_AbsenceCategory_AbsenceCategoryId] DEFAULT (newid()) NOT NULL,
    [Name]              NVARCHAR (200)   NOT NULL,
    [Description]       NVARCHAR (MAX)   NULL,
    [SalaryFactor]      DECIMAL (5, 2)   CONSTRAINT [DF_AbsenceCategory_SalaryFactor] DEFAULT ((1)) NOT NULL,
    CONSTRAINT [PK_AbsenceCategory] PRIMARY KEY CLUSTERED ([AbsenceCategoryId] ASC)
);

