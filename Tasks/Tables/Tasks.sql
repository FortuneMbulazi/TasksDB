CREATE TABLE [dbo].[Tasks] (
    [TaskId]          BIGINT         NULL,
    [Task]            NVARCHAR (MAX) NULL,
    [FK_TaskStatusId] INT            NULL,
    [FK_PersonId]     BIGINT         NULL,
    CONSTRAINT [FK_Tasks_Person] FOREIGN KEY ([FK_PersonId]) REFERENCES [dbo].[Person] ([PersonId]),
    CONSTRAINT [FK_Tasks_TaskStatus] FOREIGN KEY ([FK_TaskStatusId]) REFERENCES [dbo].[TaskStatus] ([TaskStatusId])
);

