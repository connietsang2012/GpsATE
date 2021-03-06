USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_AutoTestSMTItem_Delete]    Script Date: 11/23/2017 14:38:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_AutoTestSMTItem_Delete] ON [dbo].[Gps_AutoTestSMTItem] 
INSTEAD OF  DELETE--INSERT, UPDATE,
--FOR DELETE  
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName	FROM DELETED

	IF EXISTS (SELECT *  FROM Gps_AutoTestSMTSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_AutoTestSMTSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	
	IF EXISTS (SELECT *  FROM Gps_AutoTestSMT_DstSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_AutoTestSMT_DstSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	IF EXISTS (SELECT *  FROM Gps_AutoTestSMT_SrcSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_AutoTestSMT_SrcSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	DELETE Gps_AutoTestSMTItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
end
