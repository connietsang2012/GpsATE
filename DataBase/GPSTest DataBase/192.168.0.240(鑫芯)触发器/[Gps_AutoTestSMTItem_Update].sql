USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_AutoTestSMTItem_Update]    Script Date: 11/23/2017 14:38:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_AutoTestSMTItem_Update] ON [dbo].[Gps_AutoTestSMTItem] 
FOR  UPDATE--INSERT, UPDATE,
--FOR DELETE  
AS
BEGIN
	DECLARE @BItemName NVARCHAR(50),@AItemName NVARCHAR(50),@cItemModel NVARCHAR(20)

	IF UPDATE(ItemName)
	BEGIN
		SELECT @BItemName=ItemName,@cItemModel=ItemModel	FROM DELETED 
		SELECT @AItemName=ItemName,@cItemModel=ItemModel	FROM INSERTED

		UPDATE Gps_AutoTestSMTSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
		UPDATE Gps_AutoTestSMT_SrcSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
		UPDATE Gps_AutoTestSMT_DstSubItem SET ItemName=@AItemName WHERE (ItemModel=@cItemModel) AND (ItemName=@BItemName)
		
	END
end
