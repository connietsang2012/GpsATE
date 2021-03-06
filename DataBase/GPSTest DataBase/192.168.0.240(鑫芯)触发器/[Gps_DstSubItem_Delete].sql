USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_DstSubItem_Delete]    Script Date: 11/23/2017 14:39:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TRIGGER [dbo].[Gps_DstSubItem_Delete] ON [dbo].[Gps_DstSubItem] 
FOR DELETE  
AS
BEGIN
	DECLARE @ParentId INTEGER,@SubTestItemId INTEGER,@SubTestItemName NVARCHAR(50),@SubTestItemDes NVARCHAR(50),@SoftModel NVARCHAR(50)

	SELECT @SoftModel=SoftModel,
		@ParentId=ParentId,
		@SubTestItemId=SubTestItemId,
		@SubTestItemName=SubTestItemName,
		@SubTestItemDes=SubTestItemDes
	FROM DELETED

	INSERT Gps_SrcSubItem(SoftModel,ParentId,SubTestItemId,SubTestItemName,SubTestItemDes) 
	VALUES(@SoftModel,@ParentId,@SubTestItemId,@SubTestItemName,@SubTestItemDes)
END
