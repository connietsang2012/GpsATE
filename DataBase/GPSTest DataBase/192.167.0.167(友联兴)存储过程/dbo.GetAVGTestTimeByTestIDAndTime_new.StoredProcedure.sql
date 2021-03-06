USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetAVGTestTimeByTestIDAndTime_new]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.04.21
-- Description:	根据日期获取当天该机型功能位的测试时间记录
-- 输入参数：   TesterId,dateime
-- =============================================
CREATE PROCEDURE [dbo].[GetAVGTestTimeByTestIDAndTime_new]
	-- Add the parameters for the stored procedure here
     @begintime datetime,
     @endtime datetime
AS
BEGIN
	declare @cTesterId varchar(20)
	declare getTesterId cursor for select distinct testerid from Gps_AutoTest_Result where TestTime >= @BeginTime and 
			   TestTime <= @EndTime
	open getTesterId
	if not @@FETCH_STATUS=0 fetch next from getTesterId into @cTesterId
	 
	while @@FETCH_STATUS=0
	begin
		select testerid,userdes,c.TotalModel as softmodel,TestTime
			from Gps_AutoTest_Result a,Gps_User b,Gps_VersionModel c
			where 
			(a.SoftModel<>'') and (a.SoftModel = c.Model) and (c.TotalModel is not null) and
			TestTime >= @BeginTime and 
				   TestTime < @EndTime and
				   TesterId = @cTesterId and 
				  a.TesterId=b.UserName and
				    (UserType='QC' OR UserType='GPStest')
				    and InService='true'
			group by TesterId,TotalModel,UserDes,TestTime	  
			order by softmodel,a.TestTime			
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
	
	

END
GO
