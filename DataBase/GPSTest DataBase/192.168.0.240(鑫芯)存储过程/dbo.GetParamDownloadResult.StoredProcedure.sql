USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetParamDownloadResult]    Script Date: 11/23/2017 11:35:46 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <2014.04.16,,>
-- Description:	<获取软件下载位的产能的存储过程>
-- =============================================
CREATE PROCEDURE [dbo].[GetParamDownloadResult]  
	-- Add the parameters for the stored procedure here
	@dBeginTime 		Datetime,
	@dEndTime 			DateTime
AS
BEGIN
	declare @cTesterId varchar(20)
	declare getTesterId cursor for select distinct testerid from Gps_ParamDownload_Result where TestTime >= @dBeginTime and 
			   TestTime <= @dEndTime
	open getTesterId
	if not @@FETCH_STATUS=0 fetch next from getTesterId into @cTesterId
	 
	while @@FETCH_STATUS=0
	begin
		select testerid,userdes,Gps_VersionModel.TotalModel as softmodel,TestTime
			from Gps_ParamDownload_Result,Gps_User,Gps_VersionModel
			where (Gps_ParamDownload_Result.SoftModel<>'') and (Gps_ParamDownload_Result.SoftModel = Gps_VersionModel.Model) and (Gps_VersionModel.TotalModel is not null) and
			TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				   Gps_ParamDownload_Result.TesterId=Gps_User.UserName and
				    Gps_ParamDownload_Result.SoftModel=Gps_VersionModel.Model and
				    (UserType='QC' OR UserType='GPStest')
		    group by TesterId,TotalModel,UserDes,TestTime
			order by softmodel,testerid,TestTime				
				
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
END
GO
