USE [GPSTest]
GO
/****** Object:  Trigger [dbo].[Gps_OQC_Item_Insert]    Script Date: 11/23/2017 14:41:12 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE TRIGGER [dbo].[Gps_OQC_Item_Insert]
   ON [dbo].[Gps_OQC_Item]
  FOR INSERT
AS 
BEGIN
	declare @ItemModel NVARCHAR(30), @ItemName NVARCHAR(50)
	insert into Gps_OQC_SrcSubItem(ItemModel,ItemName)
    select ItemModel,ItemName
    FROM inserted
END
