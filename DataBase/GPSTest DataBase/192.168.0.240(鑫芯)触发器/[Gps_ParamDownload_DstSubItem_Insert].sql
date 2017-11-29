USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_ParamDownload_DstSubItem_Insert]    Script Date: 11/23/2017 14:41:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--鍒涘缓Gps_ParamDownload_DstSubItem鎻掑叆瑙﹀彂鍣?Gps_ParamDownload_DstSubItem_Insert)
CREATE TRIGGER [dbo].[Gps_ParamDownload_DstSubItem_Insert] ON [dbo].[Gps_ParamDownload_DstSubItem] 
FOR INSERT 
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(50),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM Gps_ParamDownload_DstSubItem
	
	--灏嗚澧炲姞鐨勭洰鏍囨祴璇曢」浠庢簮娴嬭瘯椤逛腑鍒犻櫎.
	DELETE Gps_ParamDownload_SrcSubItem 
	WHERE @ItemModel=ItemModel AND @ItemName=ItemName
END
