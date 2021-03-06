USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_WriteImei_DstSubItem_Insert]    Script Date: 11/23/2017 14:48:31 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Gps_WriteImei_DstSubItem_Insert]
   ON  [dbo].[Gps_WriteImei_DstSubItem]
  FOR INSERT--, UPDATE, DELETE 
AS
BEGIN
	DECLARE @ItemModel NVARCHAR(50),@ItemName NVARCHAR(50)

	SELECT @ItemModel=ItemModel,@ItemName=ItemName
	FROM Gps_WriteImei_DstSubItem

	DELETE Gps_WriteImei_SrcSubItem WHERE @ItemModel=ItemModel AND @ItemName=ItemName
END
