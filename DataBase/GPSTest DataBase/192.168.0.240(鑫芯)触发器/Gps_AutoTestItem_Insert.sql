USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_AutoTestItem_Insert]    Script Date: 11/23/2017 14:37:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_AutoTestItem_Insert] ON [dbo].[Gps_AutoTestItem] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	--SELECT @ItemModel=ItemModel,@ItemName=ItemName
	--FROM inserted

	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName)
	SELECT ItemModel,ItemName
	FROM inserted 
	--VALUES(@ItemModel,@ItemName)
END
