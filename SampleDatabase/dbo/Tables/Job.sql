CREATE TABLE [dbo].[Job] (
    [JobId]       UNIQUEIDENTIFIER CONSTRAINT [DF_Job_JobId] DEFAULT (newid()) NOT NULL,
    [Name]        NVARCHAR (500)   NOT NULL,
    [Description] NVARCHAR (MAX)   NULL,
    CONSTRAINT [PK_Job] PRIMARY KEY CLUSTERED ([JobId] ASC)
);

