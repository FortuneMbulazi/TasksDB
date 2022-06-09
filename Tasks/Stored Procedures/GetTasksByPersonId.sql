-- =============================================
-- Author:		Simphiwe Mabaso
-- Create date: 08 May 2022
-- Description:	When called this stored procedure gets a task or tasks based on the personId.
-- =============================================
CREATE PROCEDURE [dbo].[GetTasksByPersonId]
	@FK_PersonID BIGINT,
	@TaskID BIGINT = 0
AS
BEGIN
	SELECT	TaskId,
			Task,
			FK_TaskStatusId,
			FK_PersonId,
			CreatedOn
	INTO #Task
	FROM [dbo].[Tasks]
	WHERE FK_PersonId = @FK_PersonID;

	IF((SELECT TOP 1 1 FROM #Task) = 1 AND @TaskID = 0 OR @TaskID IS NULL)
	BEGIN
		SELECT	TaskId,
				Task,
				FK_TaskStatusId,
				FK_PersonId,
				CreatedOn
		FROM #Task;
	END
	ELSE IF(@TaskID > 0)
	BEGIN
		SELECT 
			TaskId,
			Task,
			FK_TaskStatusId,
			FK_PersonId,
			CreatedOn
		FROM #Task
		WHERE TaskId = @TaskID;
	END

	DROP TABLE #Task;
END