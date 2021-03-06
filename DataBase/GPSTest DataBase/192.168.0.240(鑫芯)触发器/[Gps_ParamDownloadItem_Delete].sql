USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_ParamDownloadItem_Delete]    Script Date: 11/23/2017 14:42:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_ParamDownloadItem_Delete] ON [dbo].[Gps_ParamDownloadItem] 
INSTEAD OF  DELETE--INSERT, UPDATE,
--FOR DELETE  
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName	FROM DELETED

	IF EXISTS (SELECT *  FROM Gps_ParamDownloadSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_ParamDownloadSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	
	IF EXISTS (SELECT *  FROM Gps_ParamDownload_DstSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_ParamDownload_DstSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	IF EXISTS (SELECT *  FROM Gps_ParamDownload_SrcSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName)
	BEGIN
		DELETE Gps_ParamDownload_SrcSubItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
	END
	DELETE Gps_ParamDownloadItem WHERE ItemModel=@ItemModel AND ItemName=@ItemName
end
