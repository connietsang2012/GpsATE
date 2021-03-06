USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_SubTestItem_Delete]    Script Date: 11/23/2017 14:42:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Gps_SubTestItem_Delete] ON [dbo].[Gps_SubTestItem] 
INSTEAD OF  DELETE--INSERT, UPDATE,
--FOR DELETE  
AS
BEGIN
	DECLARE @ParentId INTEGER,@SubTestItemId INTEGER,@SubTestItemName NVARCHAR(50)

	SELECT @ParentId=ParentId,
		@SubTestItemId=Id,
		@SubTestItemName=SubTestItemName
	FROM DELETED

	IF EXISTS (SELECT *  FROM Gps_DstSubItem WHERE ParentId=@ParentId AND SubTestItemId=@SubTestItemId AND SubTestItemName=@SubTestItemName)
	BEGIN
		DELETE Gps_DstSubItem WHERE ParentId=@ParentId AND SubTestItemId=@SubTestItemId AND SubTestItemName=@SubTestItemName
	END
	IF EXISTS (SELECT *  FROM Gps_SrcSubItem WHERE ParentId=@ParentId AND SubTestItemId=@SubTestItemId AND SubTestItemName=@SubTestItemName)
	BEGIN
		DELETE Gps_SrcSubItem WHERE ParentId=@ParentId AND SubTestItemId=@SubTestItemId AND SubTestItemName=@SubTestItemName
	END
	DELETE Gps_SubTestItem WHERE ParentId=@ParentId AND ID=@SubTestItemId AND SubTestItemName=@SubTestItemName
	--INSERT Gps_DstSubItem(SoftModel,ParentId,SubTestItemId,SubTestItemName) VALUES('GT06B',@ParentId,@SubTestItemId,@SubTestItemName)
end