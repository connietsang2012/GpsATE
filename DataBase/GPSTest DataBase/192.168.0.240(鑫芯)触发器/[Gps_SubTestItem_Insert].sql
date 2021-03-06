USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_SubTestItem_Insert]    Script Date: 11/23/2017 14:43:09 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  CREATE TRIGGER [dbo].[Gps_SubTestItem_Insert] ON [dbo].[Gps_SubTestItem] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ParentId INTEGER,@SubTestItemId INTEGER,@SubTestItemName NVARCHAR(50),@SubTestItemDes NVARCHAR(50)

	SELECT @ParentId=ParentId,
		@SubTestItemId=Id,
		@SubTestItemName=SubTestItemName,
		@SubTestItemDes=SubTestItemDes
	FROM Gps_SubTestItem

	INSERT Gps_SrcSubItem(SoftModel,ParentId,SubTestItemId,SubTestItemName,SubTestItemDes) 
	VALUES('GT06B',@ParentId,@SubTestItemId,@SubTestItemName,@SubTestItemDes)
END
