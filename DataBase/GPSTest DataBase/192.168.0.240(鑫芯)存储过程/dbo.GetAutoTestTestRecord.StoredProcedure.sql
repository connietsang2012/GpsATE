USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetAutoTestTestRecord]    Script Date: 11/23/2017 11:35:45 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAutoTestTestRecord] 
	-- Add the parameters for the stored procedure here
	@dBeginTime 		Datetime,
	@dEndTime 			DateTime
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
    -- Insert statements for procedure here
    --convert(varchar,CONVERT(varchar, testtime,111)+RIGHT('0'+convert(varchar(2),datepart(hh,testtime)),2)+Right((convert(varchar(2),datepart(MINUTE,testtime))/10)*10,2),120)
    /*select TesterId,CONVERT(varchar, testtime,111) as report_date,
		RIGHT('0'+convert(varchar(2),datepart(hh,testtime)),2) as hour,
		Right((convert(varchar(2),datepart(MINUTE,testtime))/10)*10,2) as minute,*/
	/*select distinct softmodel
		from Gps_AutoTest_Result
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime*/
			
	declare @cTesterId varchar(20)
	declare getTesterId cursor for select distinct testerid from Gps_AutoTest_Result where TestTime >= @dBeginTime and 
			   TestTime <= @dEndTime
	open getTesterId
	if not @@FETCH_STATUS=0 fetch next from getTesterId into @cTesterId
	 
	while @@FETCH_STATUS=0
	begin
			--fetch next from getTesterId into @cTesterId
			/*select testerid,userdes,convert(varchar,CONVERT(varchar, testtime,111)+' '+RIGHT('0'+convert(varchar(2),datepart(hh,testtime)),2)+':'+Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2),120) as time,
			convert(varchar,TestTime,111) as date,
			right('0'+convert(varchar(2),datepart(hh,TestTime)),2) as hour,
			Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2) as minute,
			COUNT(*) as total
			from Gps_AutoTest_Result,Gps_User
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and TesterId=@cTesterId and
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName
			group by TesterId,userdes,convert(varchar,TestTime,111),right('0'+convert(varchar(2),datepart(hh,TestTime)),2),Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2)
			order by TesterId,userdes,convert(varchar,TestTime,111),right('0'+convert(varchar(2),datepart(hh,TestTime)),2),Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2)*/
		select testerid,userdes,softmodel,TestTime,UserType
			from Gps_AutoTest_Result,Gps_User
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName and
				    (UserType='QC' OR UserType='GPStest')
				    
			group by TesterId,userdes,softmodel,TestTime,UserType
			order by TesterId,userdes,TestTime
		--select distinct SoftModel from Gps_AutoTest_Result where TestTime < @dEndTime and SoftModel<>''
			
		/*select softmodel,testerid,userdes,TestTime
			from Gps_AutoTest_Result,Gps_User
			where  TestTime >= @dBeginTime  and TestTime <= @dEndTime and
					SoftModel<>'' and
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName
			group by softmodel,TesterId,userdes,TestTime
			order by TesterId,TestTime*/
				
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
		
		/*select '平均值''平均值',convert(varchar,CONVERT(varchar, testtime,111)+' '+RIGHT('0'+convert(varchar(2),datepart(hh,testtime)),2)+':'+Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2),120) as time,
			convert(varchar,TestTime,111) as date,
			right('0'+convert(varchar(2),datepart(hh,TestTime)),2) as hour,
			Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2) as minute,
			COUNT(*)/count(DISTINCT testerid)  as total
			from Gps_AutoTest_Result
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime 
			group by convert(varchar,TestTime,111),right('0'+convert(varchar(2),datepart(hh,TestTime)),2),Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2)
			order by convert(varchar,TestTime,111),right('0'+convert(varchar(2),datepart(hh,TestTime)),2),Right((convert(varchar(2),datepart(MINUTE,testtime))/30)*30,2)*/
		

END
GO
