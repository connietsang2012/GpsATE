USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[InsertTOBoxCount]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertTOBoxCount]
@cBoxNo 		varchar(15),
@cSN            varchar(15)
AS
BEGIN
	insert into Gps_AutoTestSMT_BoxCont(BoxNo,SN) values(@cBoxNo,@cSN)
END
GO
