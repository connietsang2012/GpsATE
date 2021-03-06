USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_WriteImei_DstSubItem_delete]    Script Date: 11/23/2017 14:48:10 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Gps_WriteImei_DstSubItem_delete]
   ON  [dbo].[Gps_WriteImei_DstSubItem]
   FOR DELETE  
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(20),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM DELETED

	INSERT Gps_WriteImei_SrcSubItem(ItemModel,ItemName) 
	VALUES(@ItemModel,@ItemName)
END
