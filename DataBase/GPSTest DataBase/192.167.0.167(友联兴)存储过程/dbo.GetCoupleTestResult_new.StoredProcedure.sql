USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetCoupleTestResult_new]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <2014.04.15,,>
-- Description:	<获取白盒测试的存储过程>
-- =============================================
CREATE PROCEDURE [dbo].[GetCoupleTestResult_new]  
	-- Add the parameters for the stored procedure here
	@dBeginTime 		Datetime,
	@dEndTime 			DateTime
AS
BEGIN
	declare @cTesterId varchar(20)
	declare getTesterId cursor for select distinct testerid from Gps_CoupleTest_Result where TestTime >= @dBeginTime and 
			   TestTime <= @dEndTime
	open getTesterId
	if not @@FETCH_STATUS=0 fetch next from getTesterId into @cTesterId
	 
	while @@FETCH_STATUS=0
	begin
		select testerid,userdes,c.TotalModel as softmodel,TestTime
			from Gps_CoupleTest_Result a,Gps_User b,Gps_VersionModel c
			where 
			(a.SoftModel<>'') and (a.SoftModel = c.Model) and (c.TotalModel is not null) and
			TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				  a.TesterId=b.UserName and
				    (UserType='QC' OR UserType='GPStest')
			group by TesterId,TotalModel,UserDes,TestTime		  
			order by softmodel,a.TestTime			
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
END
GO
