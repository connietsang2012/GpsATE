USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_AutoTestSMT_DstSubItem_Insert]    Script Date: 11/23/2017 14:38:11 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_AutoTestSMT_DstSubItem_Insert] ON [dbo].[Gps_AutoTestSMT_DstSubItem] 
FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(50),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM Gps_AutoTestSMT_DstSubItem

	DELETE Gps_AutoTestSMT_SrcSubItem WHERE @ItemModel=ItemModel AND @ItemName=ItemName
END
