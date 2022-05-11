-- =============================================
-- Author:		Simphiwe Mabaso
-- Create date: 08 May 2022
-- Description:	When called this stored procedure create a task.
-- =============================================
CREATE PROCEDURE [dbo].[CreatePerson]
	@Name NVARCHAR(50),
	@Surname NVARCHAR(50),
	@Age INT,
	@Email NVARCHAR(200)
AS
BEGIN
	DECLARE @StatusCode INT = 0;

	BEGIN TRY
		IF EXISTS(SELECT email FROM [dbo].[Person] WHERE email = @Email)
		BEGIN
			SELECT 'Email already in use' AS ResponseMessage,
					@StatusCode AS StatusCode;
			RETURN
		END

		IF(@Name IS NOT NULL AND @Email IS NOT NULL)
		BEGIN
			SET @StatusCode = 1;

			INSERT INTO [dbo].[Person]([Name], Surname, Age, email, CreatedOn)
			VALUES(@Name, @Surname, @Age, @Email, GETDATE());

			SELECT 'User successfully created' AS ResponseMessage,
					@StatusCode AS StatusCode;
		END
	END TRY
	BEGIN CATCH
		SELECT	@@ERROR AS ResponseMessage,
				@StatusCode AS StatusCode;
	END CATCH
END