USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[GetWriteImeiTestRecord]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetWriteImeiTestRecord] 
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
		select testerid,userdes,softmodel,TestTime
			from Gps_WriteImei_Result,Gps_User
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				   Gps_WriteImei_Result.TesterId=Gps_User.UserName and
				    (UserType='QC' OR UserType='GPStest')
			order by TesterId,userdes,TestTime				
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
END
GO
