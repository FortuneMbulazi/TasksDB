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
			SELECT 'Email already in use' AS ErrorMessage,
					@StatusCode AS StatusCode;
			RETURN
		END

		IF(@Name IS NOT NULL AND @Email IS NOT NULL)
		BEGIN
			INSERT INTO [dbo].[Person]([Name], Surname, Age, email)
			VALUES(@Name, @Surname, @Age, @Email);

			SELECT 'User successfully created' AS ErrorMessage,
					1 AS StatusCode;
		END
	END TRY
	BEGIN CATCH
		SELECT	@@ERROR AS ErrorMessage,
				@StatusCode AS StatusCode;
	END CATCH
END