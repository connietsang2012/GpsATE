USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_DstSubItem_Insert]    Script Date: 11/23/2017 14:39:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Gps_DstSubItem_Insert] ON [dbo].[Gps_DstSubItem] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ParentId INTEGER,@SubTestItemId INTEGER,@SubTestItemName NVARCHAR(50),@SoftModel NVARCHAR(50)

	SELECT @ParentId=ParentId,
		@SubTestItemId=SubTestItemId,
		@SubTestItemName=SubTestItemName,
		@SoftModel=SoftModel
	FROM Gps_DstSubItem

	DELETE Gps_SrcSubItem WHERE ParentId=@ParentId AND SubTestItemId=@SubTestItemId AND SubTestItemName=@SubTestItemName AND SoftModel=@SoftModel
END