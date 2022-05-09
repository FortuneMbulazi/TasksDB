/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/

IF NOT EXISTS(SELECT TOP 1 1 FROM [dbo].[TaskStatus])
BEGIN
	SET IDENTITY_INSERT [dbo].[TaskStatus] ON
		INSERT [dbo].[TaskStatus] ([TaskStatusId], [TaskStatusName]) 
		VALUES	(1, N'Active'),
				(2, N'Complete');
	SET IDENTITY_INSERT [dbo].[TaskStatus] OFF
END