USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_AutoTestSMTItem_Insert]    Script Date: 11/23/2017 14:38:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_AutoTestSMTItem_Insert] ON [dbo].[Gps_AutoTestSMTItem] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	--SELECT @ItemModel=ItemModel,@ItemName=ItemName
	--FROM inserted

	INSERT INTO Gps_AutoTestSMT_SrcSubItem(ItemModel,ItemName)
	SELECT ItemModel,ItemName
	FROM inserted 
	--VALUES(@ItemModel,@ItemName)
END
