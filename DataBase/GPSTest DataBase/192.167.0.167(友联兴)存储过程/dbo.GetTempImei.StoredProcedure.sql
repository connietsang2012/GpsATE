USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetTempImei]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTempImei] 
@cTempImei	varchar(15) output,
@cRid	varchar(32) output
AS
BEGIN
	DECLARE	@x1 int,@y1 char(8)
	SELECT @x1= COUNT(CharNo) from Gps_TempImei where CAST(DT as date)=CAST(GETDATE() as date)
	IF(@x1=0)
	BEGIN
		SELECT @y1=convert(char(8),getdate(),112)
		SET @cTempImei='00'+@y1+'00001'
		SET @cRid=CAST('0000000000000000000'+@y1+'00001' as varchar(32))
		
		INSERT Gps_TempImei(CharNo,DT,CharSN) values('00'+@y1+'00001',GETDATE(),@cRid)
		IF @@ROWCOUNT<1 
		BEGIN
			SET @cTempImei=''
			SET @cRid=''
		END
	END
	ELSE
	BEGIN
		SET @cTempImei='00'+cast((select MAX(CAST( SUBSTRING(charno,3,13) as bigint))+1 from Gps_TempImei where CAST(DT as date)=CAST(GETDATE() as date))as varchar(15))
		SET @cRid='00000000000000000'+CAST(@cTempImei as varchar(15))
		INSERT Gps_TempImei(CharNo,DT,CharSN) values('00'+cast((select MAX(CAST( SUBSTRING(charno,3,13) as bigint))+1 from Gps_TempImei where CAST(DT as date)=CAST(GETDATE() as date))as varchar(15))
					,GETDATE(),@cRid)
		IF @@ROWCOUNT<1 
		BEGIN
			SET @cTempImei=''
			SET @cRid=''
		END		
	END
END
GO
