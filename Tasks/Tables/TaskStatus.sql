CREATE TABLE [dbo].[TaskStatus] (
    [TaskStatusId]   INT           IDENTITY (1, 1) NOT NULL,
    [TaskStatusName] NVARCHAR (50) NULL,
    PRIMARY KEY CLUSTERED ([TaskStatusId] ASC)
);

