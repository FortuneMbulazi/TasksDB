-- =============================================
-- Author:		Simphiwe Mabaso
-- Create date: 08 May 2022
-- Description:	When called this stored procedure updates the task.
-- =============================================
CREATE PROCEDURE [dbo].[UpdateTask]
	@TaskID BIGINT,
	@Task NVARCHAR(MAX)
AS
BEGIN
	UPDATE Tasks
	SET Task = @Task
	WHERE TaskId = @TaskID;
END