USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetAVGTestTimeByTestIDAndTime]    Script Date: 11/23/2017 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.04.21
-- Description:	根据测试员和日期获取当天该机型的测试时间记录
-- 输入参数：   TesterId,dateime
-- =============================================
CREATE PROCEDURE [dbo].[GetAVGTestTimeByTestIDAndTime]
	-- Add the parameters for the stored procedure here
     @TesterId char(20),
     @begintime datetime
AS
BEGIN
	--declare @@endtime datetime
	
	--select @@beginSearchTime=CONVERT(varchar(100), DATEADD(D,-1,GETDATE()), 23); --获取当前系统查找时间
	
	select  a.testTime,totalmodel as softmodel,a.TesterId from Gps_AutoTest_Result a,Gps_VersionModel b,Gps_User c
    where (a.SoftModel<>'') and (a.SoftModel = b.Model) and (b.TotalModel is not null)
          and (a.TestTime <= @begintime+ ' 23:59:59')and (a.TestTime >= @begintime+' 00:00:00') and a.TesterId=c.UserName
          and a.TesterId=@TesterId
    order by softmodel,a.TestTime

END
GO
