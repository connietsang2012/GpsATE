USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetWriteImeiTestRecord_new]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWriteImeiTestRecord_new] 
	-- Add the parameters for the stored procedure here
	@dBeginTime 		Datetime,
	@dEndTime 			DateTime
AS
BEGIN
	declare @cTesterId varchar(20)
	declare getTesterId cursor for select distinct testerid from Gps_WriteImei_Result where TestTime >= @dBeginTime and 
			   TestTime <= @dEndTime
	open getTesterId
	if not @@FETCH_STATUS=0 fetch next from getTesterId into @cTesterId
	 
	while @@FETCH_STATUS=0
	begin
		select testerid,userdes,Gps_VersionModel.TotalModel as softmodel,TestTime
			from Gps_WriteImei_Result,Gps_User,Gps_VersionModel
			where (Gps_WriteImei_Result.SoftModel<>'') and (Gps_WriteImei_Result.SoftModel = Gps_VersionModel.Model) and (Gps_VersionModel.TotalModel is not null) and
			TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				   Gps_WriteImei_Result.TesterId=Gps_User.UserName and
				   Gps_WriteImei_Result.SoftModel=Gps_VersionModel.Model and
				    (UserType='QC' OR UserType='GPStest')
			group by TesterId,TotalModel,UserDes,TestTime	    
			order by softmodel,testerid,TestTime				
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
END
GO
