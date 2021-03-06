USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_OQC_Item_Update]    Script Date: 11/23/2017 14:41:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		许志强
-- Create date: 2014-8-16
-- Description:	为了OQC工位
-- =============================================
CREATE TRIGGER [dbo].[Gps_OQC_Item_Update]
   ON [dbo].[Gps_OQC_Item]
 FOR  UPDATE
AS
BEGIN
DECLARE @BItemName NVARCHAR(50),@AItemName NVARCHAR(50),@cItemModel NVARCHAR(20)

	IF UPDATE(ItemName)
	BEGIN
	SELECT @BItemName=ItemName,@cItemModel=ItemModel	FROM DELETED 
		SELECT @AItemName=ItemName,@cItemModel=ItemModel	FROM INSERTED

		UPDATE Gps_OQC_SubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
		UPDATE Gps_OQC_DstSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
		UPDATE Gps_OQC_SrcSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
	end
	
	
END
