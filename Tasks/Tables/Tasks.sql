CREATE TABLE [dbo].[Tasks] (
    [TaskId] BIGINT PRIMARY KEY IDENTITY(1, 1),
    [Task]            NVARCHAR (MAX) NOT NULL,
    [FK_TaskStatusId] INT            NOT NULL,
    [FK_PersonId]     BIGINT         NOT NULL,
    [CreatedOn] DATETIME NOT NULL, 
    CONSTRAINT [FK_Tasks_Person] FOREIGN KEY ([FK_PersonId]) REFERENCES [dbo].[Person] ([PersonId]),
    CONSTRAINT [FK_Tasks_TaskStatus] FOREIGN KEY ([FK_TaskStatusId]) REFERENCES [dbo].[TaskStatus] ([TaskStatusId])
);

