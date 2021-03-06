USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_WriteImei_Item_Insert]    Script Date: 11/23/2017 14:48:53 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE TRIGGER [dbo].[Gps_WriteImei_Item_Insert]
   ON  [dbo].[Gps_WriteImei_Item] 
   FOR INSERT
AS 
BEGIN
	declare @ItemModel NVARCHAR(30), @ItemName NVARCHAR(50)
	insert into Gps_WriteImei_SrcSubItem(ItemModel,ItemName)
    select ItemModel,ItemName
    FROM inserted
END
