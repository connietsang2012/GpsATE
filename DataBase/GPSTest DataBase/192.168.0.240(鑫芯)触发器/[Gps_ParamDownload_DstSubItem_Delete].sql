USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_ParamDownload_DstSubItem_Delete]    Script Date: 11/23/2017 14:41:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--鍒涘缓Gps_ParamDownload_DstSubItem鍒犻櫎瑙﹀彂鍣?Gps_ParamDownload_DstSubItem_Delete)
CREATE TRIGGER [dbo].[Gps_ParamDownload_DstSubItem_Delete] ON [dbo].[Gps_ParamDownload_DstSubItem] 
FOR DELETE  
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM DELETED
	
	--灏嗚鍒犻櫎鐨勭洰鏍囨祴璇曢」娣诲姞鑷虫簮娴嬭瘯椤逛腑.
	INSERT Gps_ParamDownload_SrcSubItem(ItemModel,ItemName) 
	VALUES(@ItemModel,@ItemName)
END
