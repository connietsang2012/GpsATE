USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_WriteImei_Item_Delete]    Script Date: 11/23/2017 14:48:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Gps_WriteImei_Item_Delete] 
   ON  [dbo].[Gps_WriteImei_Item] 
    INSTEAD OF  DELETE
AS 
BEGIN
	declare @ItemModel NVARCHAR(30),@ItemName NVARCHAR(50)
	select @ItemModel=ItemModel,@ItemName=ItemName FROM DELETED
	if EXISTS (Select * from Gps_WriteImei_SubItem where ItemModel=@ItemModel and ItemName=@ItemName)
	begin
	    delete Gps_WriteImei_SubItem where ItemModel=@ItemModel AND ItemName=@ItemName
	end
	if EXISTS (Select * from Gps_WriteImei_DstSubItem where ItemModel=@ItemModel and ItemName=@ItemName)
	begin
	    delete Gps_WriteImei_DstSubItem where ItemModel=@ItemModel AND ItemName=@ItemName
	end
	if EXISTS (Select * from Gps_WriteImei_SrcSubItem where ItemModel=@ItemModel and ItemName=@ItemName)
	begin
	    delete Gps_WriteImei_SrcSubItem where ItemModel=@ItemModel AND ItemName=@ItemName
	end
	
	
	DELETE Gps_WriteImei_Item  WHERE ItemModel=@ItemModel AND ItemName=@ItemName

END
