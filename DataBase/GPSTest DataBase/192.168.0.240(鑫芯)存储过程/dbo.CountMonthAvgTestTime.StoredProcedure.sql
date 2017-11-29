USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CountMonthAvgTestTime]    Script Date: 11/23/2017 11:35:44 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.03.28
-- Description:	获取两台机子测试的间隔用时，并存储到临时表Gps_GetCountDifferVaue中，在获取前，先清空临时表Gps_GetCountDifferVaue，
-- 然后从查询到的时间计算，如果是不同机型和间隔时间超过10分钟，则不计算，最后插入到临时表Gps_GetCountDifferVaue中,
-- 本存储过程无输入参数和输出参数，可直接调用，每天得到的平均时间可能有所差别
-- 本存储过程在每天凌晨1点时执行，50万行数据的计算耗时大约在1分3秒左右
-- 各个机型按1，2，3, 4, 5...个月计算平均值起始时间为昨天，如2-23----5-23这是两个月
-- =============================================
CREATE PROCEDURE [dbo].[CountMonthAvgTestTime] 
	--@avgTestTime float output
AS
BEGIN
	declare @@nowTimeCountAvgTest datetime
	declare @@allCountFromNow int
	select @@nowTimeCountAvgTest=getdate()
	--select @@allCountFromNow=COUNT(*) from [GPSTest].[dbo].[Gps_AutoTest_Result] where (SoftModel<>'') and  TestTime < @@nowTimeCountAvgTest
	--SELECT [TestTime] from [GPSTest].[dbo].[Gps_AutoTest_Result] where (SoftModel<>'') and  TestTime < @@nowTimeCountAvgTest
	--order by SoftModel,TesterId,TestTime
	declare @cTestTime datetime 
	declare @tempTesterId char(20)
	declare @tempSoftModel char(20)
	--declare @temUserType char(20)
	--delete from Gps_GetDifferValue  --插入操作前，先清空两台机子测试时间用时间隔表
	drop table Gps_GetDifferValue
	CREATE TABLE [dbo].[Gps_GetDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL
	--[usertype] [nvarchar](50) NULL
 CONSTRAINT [PK_Gps_GetDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

	
	/* declare getTestTime cursor for 
						select distinct testTime,SoftModel,TesterId from [Gps_AutoTest_Result] 
	where (SoftModel<>'') and  TestTime < @@nowTimeCountAvgTest 
	--where (SoftModel<>'') and  TestTime < '2014-3-27 17:30:00' --and (TestTime > '2014-3-26 10:00:00')
	order by TestTime,SoftModel,TesterId  --*/
	
	declare getTestTime cursor for 
						select distinct  a.testTime,b.totalmodel as softmodel,a.TesterId from Gps_AutoTest_Result a,Gps_VersionModel b, Gps_User c
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  TestTime < @@nowTimeCountAvgTest and (a.TestTime > '2014-03-08 00:00:01') 
			and (b.TotalModel is not null) and (a.SoftModel <> '') 
	--where (SoftModel<>'') and  TestTime < '2014-3-27 17:30:00' --and (TestTime > '2014-3-26 10:00:00')
	order by TesterId,TestTime
	
	/* select a.testTime,b.totalmodel as softmodel,a.TesterId from [Gps_AutoTest_Result] a,Gps_VersionModel b 
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  (a.TestTime < '2014-4-02 23:59:59') and (a.TestTime > '2014-03-08 00:00:01') 
		and (b.TotalModel is not null) and (a.SoftModel <> '')
	order by a.TestTime,b.totalmodel,a.TesterId  --*/--备注2014-03-30
	
	open getTestTime
	--if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId,@temUserType
	if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
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
		--fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime1 = @cTestTime
		set @tempTesterId1 = @tempTesterId
		set @tempSoftModel1 = @tempSoftModel
		
		--fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId,@temUserType
		fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime2 = @cTestTime
		set @tempTesterId2 =@tempTesterId
		set @tempSoftModel2 = @tempSoftModel
		--set @temUserType2 = @temUserType
		--select @TestTime2                               --这行是为了方便观察数据，没其它实际应用
		--select @TestTime1                               --这行是为了方便观察数据，没其它实际应用
		--select abs(datediff(s,@TestTime2,@TestTime1))   --这行是为了方便观察数据，没其它实际应用
		
		select @iTempDifferVaue=abs(datediff(SS,@TestTime2,@TestTime1))
		--如果两台机子测试的间隔时间超过10分钟，则认为测试员没在测试 秒级 
		
		if (@iTempDifferVaue < 600)  and (not(@tempSoftModel2 <>@tempSoftModel1)) --and (not(@tempTesterId1 <> @tempTesterId2))
		begin
			
			if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
			insert into Gps_GetDifferValue(differvalue,softmodel,testtime) values(@iTempDifferVaue,@tempSoftModel1,@TestTime2)
		end	
		--if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
		--insert into Gps_GetCountDifferVaue(DifferValue,SoftModel) values(@iTempDifferVaue,@tempSoftModel1)
	end
	close getTestTime
	deallocate getTestTime
	
END
GO
