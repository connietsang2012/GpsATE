USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_OQC_DstSubItem_Delete]    Script Date: 11/23/2017 14:40:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_OQC_DstSubItem_Delete] ON [dbo].[Gps_OQC_DstSubItem] 
FOR DELETE  
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM DELETED

	INSERT Gps_OQC_SrcSubItem(ItemModel,ItemName) 
	VALUES(@ItemModel,@ItemName)
END
