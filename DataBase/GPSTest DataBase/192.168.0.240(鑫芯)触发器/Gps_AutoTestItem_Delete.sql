USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_AutoTestItem_Delete]    Script Date: 11/23/2017 14:36:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_AutoTestItem_Delete] ON [dbo].[Gps_AutoTestItem] 
INSTEAD OF  DELETE--INSERT, UPDATE,
--FOR DELETE  
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName	FROM DELETED

	IF EXISTS (SELECT *  FROM Gps_AutoTestSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_AutoTestSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	
	IF EXISTS (SELECT *  FROM Gps_AutoTest_DstSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_AutoTest_DstSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	IF EXISTS (SELECT *  FROM Gps_AutoTest_SrcSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_AutoTest_SrcSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	DELETE Gps_AutoTestItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
end
