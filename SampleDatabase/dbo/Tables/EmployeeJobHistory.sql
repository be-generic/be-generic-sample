CREATE TABLE [dbo].[EmployeeJobHistory] (
    [EmployeeJobHistoryId] UNIQUEIDENTIFIER CONSTRAINT [DF_EmployeeJobHistory_EmployeeJobHistoryId] DEFAULT (newid()) NOT NULL,
    [EmployeeId]           UNIQUEIDENTIFIER NOT NULL,
    [JobId]                UNIQUEIDENTIFIER NOT NULL,
    [StartDate]            DATETIME2 (7)    NOT NULL,
    [EndDate]              DATETIME2 (7)    NOT NULL,
    CONSTRAINT [PK_EmployeeJobHistory] PRIMARY KEY CLUSTERED ([EmployeeJobHistoryId] ASC),
    CONSTRAINT [FK_EmployeeJobHistory_Employee] FOREIGN KEY ([EmployeeId]) REFERENCES [dbo].[Employee] ([EmployeeId]),
    CONSTRAINT [FK_EmployeeJobHistory_Job] FOREIGN KEY ([JobId]) REFERENCES [dbo].[Job] ([JobId])
);

