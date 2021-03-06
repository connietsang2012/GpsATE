USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_ParamDownloadItem_Update]    Script Date: 11/23/2017 14:42:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_ParamDownloadItem_Update] ON [dbo].[Gps_ParamDownloadItem] 
INSTEAD OF  UPDATE--INSERT, UPDATE,
--FOR DELETE  
AS
BEGIN
	DECLARE @BItemName NVARCHAR(50),@AItemName NVARCHAR(50),@cItemModel NVARCHAR(20)

	
	SELECT @BItemName=ItemName,@cItemModel=ItemModel	FROM DELETED 
	SELECT @AItemName=ItemName,@cItemModel=ItemModel	FROM INSERTED

	UPDATE Gps_ParamDownload_SrcSubItem SET ItemName=@AItemName WHERE ItemModel=@cItemModel AND ItemName=@BItemName
	
	UPDATE Gps_ParamDownload_DstSubItem SET ItemName=@AItemName WHERE ItemModel=@cItemModel AND ItemName=@BItemName

end
