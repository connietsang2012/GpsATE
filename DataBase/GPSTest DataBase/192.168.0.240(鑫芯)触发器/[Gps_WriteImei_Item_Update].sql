USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_WriteImei_Item_Update]    Script Date: 11/23/2017 14:49:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Gps_WriteImei_Item_Update]
   ON  [dbo].[Gps_WriteImei_Item]
  FOR  UPDATE
AS
BEGIN
DECLARE @BItemName NVARCHAR(50),@AItemName NVARCHAR(50),@cItemModel NVARCHAR(20)

	IF UPDATE(ItemName)
	BEGIN
	SELECT @BItemName=ItemName,@cItemModel=ItemModel	FROM DELETED 
		SELECT @AItemName=ItemName,@cItemModel=ItemModel	FROM INSERTED

		UPDATE Gps_WriteImei_SubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
		UPDATE Gps_WriteImei_DstSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
		UPDATE Gps_WriteImei_SrcSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
	end
	
	
END
