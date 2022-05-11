CREATE TABLE [dbo].[Person] (
    [PersonId] BIGINT         IDENTITY (1, 1) NOT NULL,
    [Name]     NVARCHAR (50)  NOT NULL,
    [Surname]  NVARCHAR (50)  NULL,
    [Age]      INT            NULL,
    [email]    NVARCHAR (200) NOT NULL,
    [CreatedOn] DATETIME NULL, 
    PRIMARY KEY CLUSTERED ([PersonId] ASC)
);

