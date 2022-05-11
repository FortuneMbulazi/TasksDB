-- =============================================
-- Author:		Simphiwe Mabaso
-- Create date: 08 May 2022
-- Description:	When called this stored procedure create a task.
-- =============================================
CREATE PROCEDURE [dbo].[CreateTasks]
	@Task NVARCHAR(MAX),
	@FK_PersonId BIGINT
AS
BEGIN
	DECLARE @FK_TaskStatusId INT = 0;
	DECLARE @StatusCode INT = 0;

	BEGIN TRY
		SELECT *
		INTO #Person
		FROM [dbo].[Person]
		WHERE PersonId = @FK_PersonId;

		IF EXISTS(SELECT PersonId FROM #Person)
		BEGIN
			SET @StatusCode = 1;
			SET @FK_TaskStatusId = 1;

			INSERT INTO [dbo].[Tasks](Task, FK_TaskStatusId, FK_PersonId, CreatedOn)
			VALUES(@Task, @FK_TaskStatusId, @FK_PersonId, GETDATE());

			SELECT 'Task succesfully created.' AS ResponseMessage,
					@StatusCode AS StatusCode;
		END
		ELSE IF NOT EXISTS(SELECT PersonId FROM #Person)
		BEGIN
			SELECT 'Failed to create a task, check if you have a user first.' AS ResponseMessage,
					@StatusCode AS StatusCode;
		END

		DROP TABLE #Person;
	END TRY
	BEGIN CATCH
		SELECT @@ERROR AS ResponseMessage,
				@StatusCode AS StatusCode;
	END CATCH
END