USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[InsertOperRecord]    Script Date: 11/23/2017 11:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.1
-- Description:	Gpstest服务端操作保存到表Gps_OperRecord中
-- =============================================
CREATE PROCEDURE [dbo].[InsertOperRecord] 
	-- Add the parameters for the stored procedure here
@cOperName char(20),
@cOperContent char(250),
@cOperTime datetime,
@cOperDemo char(250)
AS
BEGIN
      INSERT INTO Gps_OperRecord(OperName,OperContent,OperTime,OperDemo)
      VALUES (@cOperName,@cOperContent,@cOperTime,@cOperDemo)
END
GO
