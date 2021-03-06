USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CountQCImeiMonthAvgTestTime]    Script Date: 11/23/2017 11:36:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountQCImeiMonthAvgTestTime] 
AS
BEGIN
	declare @@nowTimeCountAvgTest datetime
	declare @@allCountFromNow int
	select @@nowTimeCountAvgTest=getdate()
	declare @cTestTime datetime 
	declare @tempTesterId char(20)
	declare @tempSoftModel char(20)
	declare @temUserType char(20)
	drop table Gps_GetQCImeiDifferValue
	CREATE TABLE [dbo].Gps_GetQCImeiDifferValue(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,	
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL
 CONSTRAINT [PK_Gps_GetQCImeiDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

	declare getTestTime cursor for 

						select distinct  a.testTime,a.TesterId,c.UserType,b.TotalModel as softmodel from Gps_WriteImei_Result a,Gps_VersionModel b, Gps_User c
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  TestTime < @@nowTimeCountAvgTest and (a.TestTime > '2014-03-08 00:00:01') 
			and (b.TotalModel is not null) and (a.SoftModel <> '') and a.TesterId = c.UserName and (c.UserType='QC' or c.UserType='GPStest')
	order by TesterId,TestTime	
	open getTestTime
	if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempTesterId,@temUserType,@tempSoftModel
	declare @TestTime1 datetime
	declare @TestTime2 datetime
	declare @iTempDifferVaue BigInt
	declare @tempSoftModel1 char(20)
	declare @tempSoftModel2 char(20)
	declare @tempTesterId1 char(20)
	declare @tempTesterId2 char(20)
	declare @temUserType2 char(20)
	set @iTempDifferVaue = 0
	while @@FETCH_STATUS=0
	begin 		
		set @TestTime1 = @cTestTime
		set @tempTesterId1 = @tempTesterId
		set @tempSoftModel1 = @tempSoftModel		
		fetch next from getTestTime into @cTestTime,@tempTesterId,@temUserType,@tempSoftModel
		set @TestTime2 = @cTestTime
		set @tempTesterId2 =@tempTesterId
		set @tempSoftModel2 = @tempSoftModel
		set @temUserType2 = @temUserType
		select @iTempDifferVaue=abs(datediff(SS,@TestTime2,@TestTime1))		
		if (@iTempDifferVaue < 600) and (not(@tempTesterId1 <> @tempTesterId2)) and (not(@tempSoftModel2 <>@tempSoftModel1)) 
		begin
			insert into Gps_GetQCImeiDifferValue(differvalue,testerid,testtime,usertype,softmodel) values(@iTempDifferVaue,@tempTesterId2,@TestTime2,@temUserType,@tempSoftModel1)
		end	
		end
	close getTestTime
	deallocate getTestTime
	
END
GO
