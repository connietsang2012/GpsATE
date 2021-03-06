USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_OQC_DstSubItem_Insert]    Script Date: 11/23/2017 14:40:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_OQC_DstSubItem_Insert] ON [dbo].[Gps_OQC_DstSubItem] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(50),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM Gps_OQC_DstSubItem

	DELETE Gps_OQC_SrcSubItem WHERE @ItemModel=ItemModel AND @ItemName=ItemName
END
