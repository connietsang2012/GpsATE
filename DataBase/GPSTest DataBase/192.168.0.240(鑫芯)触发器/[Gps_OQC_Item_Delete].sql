USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_OQC_Item_Delete]    Script Date: 11/23/2017 14:40:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		许志强
-- Create date: 2014-8-16
-- Description:	为了OQC工位
-- =============================================
CREATE TRIGGER [dbo].[Gps_OQC_Item_Delete]
   ON [dbo].[Gps_OQC_Item]
  INSTEAD OF  DELETE
AS 
BEGIN
	declare @ItemModel NVARCHAR(30),@ItemName NVARCHAR(50)
	select @ItemModel=ItemModel,@ItemName=ItemName FROM DELETED
	if EXISTS (Select * from Gps_OQC_SubItem where ItemModel=@ItemModel and ItemName=@ItemName)
	begin
	    delete Gps_OQC_SubItem where ItemModel=@ItemModel AND ItemName=@ItemName
	end
	
	if EXISTS (Select * from Gps_OQC_DstSubItem where ItemModel=@ItemModel and ItemName=@ItemName)
	begin
	    delete Gps_OQC_DstSubItem where ItemModel=@ItemModel AND ItemName=@ItemName
	end
	
	if EXISTS (Select * from Gps_OQC_SrcSubItem where ItemModel=@ItemModel and ItemName=@ItemName)
	begin
	    delete Gps_OQC_SrcSubItem where ItemModel=@ItemModel AND ItemName=@ItemName
	end
	
	
	DELETE Gps_OQC_Item WHERE ItemModel=@ItemModel AND ItemName=@ItemName
END
