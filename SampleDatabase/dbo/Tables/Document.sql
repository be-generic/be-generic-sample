CREATE TABLE [dbo].[Document] (
    [DocumentId]   UNIQUEIDENTIFIER CONSTRAINT [DF_Document_DocumentId] DEFAULT (newid()) NOT NULL,
    [FilePath]     NVARCHAR (2000)  NOT NULL,
    [UploadedDate] DATETIME2 (7)    CONSTRAINT [DF_Document_UploadedDate] DEFAULT (getdate()) NOT NULL,
    CONSTRAINT [PK_Document] PRIMARY KEY CLUSTERED ([DocumentId] ASC)
);

