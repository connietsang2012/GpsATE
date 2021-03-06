USE [GPSTest]
GO
/****** Object:  StoredProcedure [dbo].[CheckHaveResult]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckHaveResult] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftMoel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
@UpdateResult	integer output
AS
BEGIN
   	DECLARE  @SqlStr  NVARCHAR(1000)

	SET @UpdateResult=1
	
	SET @SqlStr='select * from '+@cFormName+' where SN='''+@cChipRid+'''AND Version='''+@cVersion+''''		
	EXEC(@SqlStr ) 
		    
END
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedBySNAndVersion]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestedBySNAndVersion] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cVersion	varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000) 
		
	SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+''' and Result=1' 
	EXEC(@SqlStr ) 
			    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
--2014.10.29 参数下载位检测IMEI只用SN号检测，名字不改是因为不想更新服务端
--之前还得检测版本
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedByImei]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[CheckTestedByImei] 
@cIMEI varchar(15) ,
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000) 
		
	SET  @SqlStr='select *  from  Gps_WriteImei_Result  where  [IMEI] = '''+@cIMEI+'''and Result=1' 
	EXEC(@SqlStr ) 		    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
GO
/****** Object:  StoredProcedure [dbo].[CheckTested]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTested] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000) 
		
	SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+''' and [Version]='''+@cVersion+'''and Result=1' 
	EXEC(@SqlStr ) 
			    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_Twice]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTestResult_Twice] 
@cFormName 	NVARCHAR(30),
@iImeiOrRid	integer,			--1为IMEI，0为RID
@cImei		VARCHAR(15),
@cChipRid	VARCHAR(32),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
begin
	DECLARE  @cFormNamebackup  NVARCHAR(40) 
    	DECLARE  @SqlStr  NVARCHAR(2000)

	set @cFormNamebackup = @cFormName +'_BackUp'

	if @iImeiOrRid=1
		set  @SqlStr='select *  from  ['+ @cFormName + ']  where  [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
	else
		set  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+'''' 
    	exec(@SqlStr ) 
    
	if(@@rowcount <1) 
		set @iRecordCount=0 
	else
		set @iRecordCount=1

	
	
	if @iRecordCount=1
	begin
		if @iImeiOrRid=1
		begin	
			set  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,SoftModel,Version,IMEI,Result,TesterId,Remark)'
			set  @SqlStr=@SqlStr+'	select SN,SoftModel,Version,IMEI,Result,TesterId,Remark from ['+ @cFormName+']where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			exec(@SqlStr)
			if(@@rowcount >=1)
			begin 
				set  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + '''where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
				exec(@SqlStr )
			end
			if(@@rowcount >=1)
			begin
				set  @SqlStr='delete from '+@cFormName+' where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
				exec(@SqlStr)
			end
		end
		else
		begin
			set  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,SoftModel,Version,IMEI,Result,TesterId,Remark)'
			set  @SqlStr=@SqlStr+'	select SN,SoftModel,Version,IMEI,Result,TesterId,Remark from ['+ @cFormName +'] where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			exec(@SqlStr)
			if(@@rowcount >=1)
			begin 
				set  @SqlStr='update ['+ @cFormNamebackup +'] set TesterId= ''' + @cTesterId +''' where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
				exec(@SqlStr )
			end
			if(@@rowcount >=1)
			begin
				set  @SqlStr='delete from ['+@cFormName+'] where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
				exec(@SqlStr)
			end
			
			
		end
	end
	
	if(@@rowcount <1) 
		set @iRecordCount=0 
	else
		set @iRecordCount=1	

end
GO
/****** Object:  StoredProcedure [dbo].[GetWriteImeiTestRecord_new]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetWriteImeiTestRecord]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserInformation]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetUserInformation] 
@cUserName varchar(20),
@cUserPwd varchar(20),
@cUserDes varchar (20) output,
@cUserType varchar (20) output,
@cUserTestPlan varchar(20) output,
@cResult integer output
AS 
	SET @cResult=1
	SELECT @cUserDes=UserDes,@cUserType=UserType,@cUserTestPlan=UserTestPlan
	FROM gps_user 
	WHERE username=@cUserName and userpwd=@cUserPwd
	

	IF @@rowcount<1 
	BEGIN		
		SET @cResult=0
		SET @cUserDes=''
		SET @cUserType=''
		SET @cUserTestPlan=''
	END
GO
/****** Object:  StoredProcedure [dbo].[GetTodayAVGTestTimeByTestID]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.04.21
-- Description:	根据机型获取今天该机型的测试时间记录
-- 输入参数：   TotalModel
-- =============================================
CREATE PROCEDURE  [dbo].[GetTodayAVGTestTimeByTestID]
    @TesterId char(20)
AS	
BEGIN
	declare @@beginSearchTime datetime
	
	select @@beginSearchTime=CONVERT(varchar(100), DATEADD(D,-1,GETDATE()), 23); --获取当前系统查找时间
	
	select  a.testTime,totalmodel as softmodel,a.TesterId from Gps_AutoTest_Result a,Gps_VersionModel b,Gps_User c
    where (a.SoftModel<>'') and (a.SoftModel = b.Model) and (b.TotalModel is not null)
          and (a.TestTime <= @@beginSearchTime+ ' 23:59:59')and (a.TestTime >= @@beginSearchTime+' 00:00:00') and a.TesterId=c.UserName
          and a.TesterId=@TesterId
    order by softmodel,a.TestTime

END
GO
/****** Object:  StoredProcedure [dbo].[GetTestRecord_OneDay]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTestRecord_OneDay] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     a.TesterId AS 测试员, a.passcount AS 通过数, b.failcount AS 失败数, c.test_time AS 测试时间
			FROM         (SELECT   TesterId,COUNT(*) AS passcount
                       FROM          Gps_AutoTest_Result
                       WHERE      (Result = 1) and DateDiff(dd,TestTime,getdate())=0
                       GROUP BY TesterId) AS a LEFT JOIN
            (SELECT    TesterId,COUNT(*) AS failcount
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId) AS b ON a.TesterId = b.TesterId LEFT JOIN
            (SELECT    TesterId, CONVERT(VARCHAR(8),DATEADD(ss,datediff(ss,
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime asc),
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime desc) 
										                            
										 ),'1900-01-01 00:00:00'),108) as test_time
										 
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE       DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId)AS c ON a.TesterId = c.TesterId
END
GO
/****** Object:  StoredProcedure [dbo].[GetTesterTestCount]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetTesterTestCount] 

AS
BEGIN

	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT     a.TesterId AS 测试员, a.passcount AS 通过数, b.failcount AS 失败数, c.test_time AS 测试时间
FROM         (SELECT   TesterId,COUNT(*) AS passcount
                       FROM          Gps_AutoTest_Result
                       WHERE      (Result = 1) and DateDiff(dd,TestTime,getdate())=0
                       GROUP BY TesterId) AS a INNER JOIN
            (SELECT    TesterId,COUNT(*) AS failcount
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId) AS b ON a.TesterId = b.TesterId INNER JOIN
            (SELECT    TesterId,datediff(ss,
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime asc),
										 (select top 1  testtime from Gps_AutoTest_Result
																	WHERE      (Result = 0) and DateDiff(dd,TestTime,getdate())=0
																	GROUP BY TesterId,testtime order by testtime desc) 
										                            
										 ) as test_time
										 
                            FROM          Gps_AutoTest_Result AS Gps_AutoTestSMT_Result_1
                            WHERE       DateDiff(dd,TestTime,getdate())=0
                            GROUP BY TesterId)AS c ON a.TesterId = c.TesterId
    
END
GO
/****** Object:  StoredProcedure [dbo].[GetTempRid]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetTempRid]
@cIMEI 		varchar(15),
@iRecordCount	integer output,
@cRid		varchar(32) output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE	@TempRid char(32)
	SELECT @cRid=SN FROM Gps_TestResult WHERE IMEI=@cIMEI 
			    
	IF(@@ROWCOUNT <1) 
	BEGIN
		SET @iRecordCount=0 
		SET @cRid=''
	END
		
END
GO
/****** Object:  StoredProcedure [dbo].[GetTempImei]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetSoftModelByTime]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<根据日期获得当天测试机型号>
-- =============================================
CREATE PROCEDURE [dbo].[GetSoftModelByTime] 
    @SearchTime Datetime
AS
BEGIN

	SELECT distinct b.totalmodel as softmodel from Gps_AutoTest_Result a,Gps_VersionModel b
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and (b.TotalModel is not null)
	and a.TestTime < @SearchTime+1 and a.TestTime>@SearchTime
END
GO
/****** Object:  StoredProcedure [dbo].[GetParamDownloadResult]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHistoryAVGTestTimeBySoftModel]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.04.21 上午
-- Description:	根据指定型号和日期获取历史测试时间记录
-- 输入参数：   TotalModel
-- =============================================
CREATE PROCEDURE  [dbo].[GetHistoryAVGTestTimeBySoftModel] 
    @TotalModel char(50),
    @BeginTime Datetime
	
AS
BEGIN
	select distinct a.TestTime,b.totalmodel as softmodel,a.TesterId from Gps_AutoTest_Result a,Gps_VersionModel b,Gps_User c
    where (a.SoftModel<>'') and (a.SoftModel = b.Model) and (b.TotalModel is not null) and b.totalmodel=@TotalModel
          and a.TestTime < @BeginTime and (a.TestTime >= '2014-03-08 00:00:00') and a.TesterId=c.UserName 
          and b.TotalModel=@TotalModel
  --  order by a.TesterId,a.TestTime ASC
    order by a.TestTime DESC

END
GO
/****** Object:  StoredProcedure [dbo].[GetCoupleTestResult_new]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCoupleTestResult]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <2014.04.15,,>
-- Description:	<获取白盒测试的存储过程>
-- =============================================
CREATE PROCEDURE [dbo].[GetCoupleTestResult]  
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
		select testerid,userdes,softmodel,TestTime
			from Gps_CoupleTest_Result,Gps_User
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				   Gps_CoupleTest_Result.TesterId=Gps_User.UserName 
			order by TesterId,userdes,TestTime				
		fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountQCAvgTestTimeByMonth]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.05.24
-- Description:	获取每种机型的测试用时平均时间，提供应用程序调用
-- 但须在存储过程CountAvgTestTime执行(每天凌晨1点)之后才可得到最新的数据
-- 加入一个参数：选择月数，开始时间是昨天，如果传进来3，则从时间从5.24－2.24
-- =============================================
CREATE PROCEDURE [dbo].[GetCountQCAvgTestTimeByMonth]
     @softmodel nvarchar(50),
     @months int
AS
BEGIN
	declare @beginTime datetime
	declare @endTime datetime
	select @beginTime = CONVERT(varchar(100), GETDATE(), 23);
	select @endTime=CONVERT(varchar(100), DATEADD(D,-(30*@months),GETDATE()), 23); --获取当前系统查找时间
	
SET NOCOUNT ON;	
    select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetQCDifferValue
    where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime)
    group by testerid,softmodel
	order by testerid,softmodel

select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetQCWhiteCardDifferValue
where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime)
group by testerid,softmodel
order by testerid,softmodel	
	
select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetQCImeiDifferValue
where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime)
group by testerid,softmodel
order by testerid,softmodel	


select testerid,softmodel, (AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetQCParamDownloadDifferValue
where softmodel=@softmodel and ( testtime>=@endTime and testtime<=@beginTime) and @@ROWCOUNT>50
group by testerid,softmodel
order by testerid,softmodel	
	
END
GO
/****** Object:  StoredProcedure [dbo].[GetCountAvgTestTimeByMonth]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.05.24
-- Description:	获取每种机型的测试用时平均时间，提供应用程序调用
-- 但须在存储过程CountAvgTestTime执行(每天凌晨1点)之后才可得到最新的数据
-- 加入一个参数：选择月数，开始时间是昨天，如果传进来3，则从时间从5.24－2.24
-- =============================================
CREATE PROCEDURE [dbo].[GetCountAvgTestTimeByMonth] 
     @months int
AS
BEGIN
	declare @beginTime datetime
	declare @endTime datetime
	select @beginTime = CONVERT(varchar(100), GETDATE(), 23);
	select @endTime=CONVERT(varchar(100), DATEADD(D,-(30*@months),GETDATE()), 23); --获取当前系统查找时间
	
	SET NOCOUNT ON;
	--功能位
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime  from Gps_GetDifferValue
	--select softmodel,(AVG(differvalue) ) as DiffVerySoftModelAVGTime into a  from Gps_GetDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel 
	--白卡
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetCoupleDifferValue
	--select softmodel,(AVG(differvalue) ) as CoupleVerySoftModelAVGTime into b from Gps_GetCoupleDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel
	--IMEI
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetImeiDifferValue
	--select softmodel,(AVG(differvalue) ) as ImeiVerySoftModelAVGTime into c  from  Gps_GetImeiDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel
	--参数下载
	select softmodel,(AVG(differvalue) ) as VerySoftModelAVGTime from Gps_GetParamDownloadDifferValue
	--select softmodel,(AVG(differvalue) ) as ParamVerySoftModelAVGTime into d  from Gps_GetParamDownloadDifferValue
	where testtime>=@endTime and testtime<=@beginTime
	group by softmodel
	order by softmodel
	
	--select a.softmodel, a.DiffVerySoftModelAVGTime, b.CoupleVerySoftModelAVGTime, c.ImeiVerySoftModelAVGTime, d.ParamVerySoftModelAVGTime
	--from a left join b on A.softmodel = b.softmodel
	--left join c on b.softmodel=c.softmodel
	--left join d on c.softmodel=d.softmodel
	--where a.softmodel=b.softmodel and a.softmodel=c.softmodel and a.softmodel=d.softmodel
	
	--drop table a
	--drop table b
	--drop table c
	--drop table d

END
GO
/****** Object:  StoredProcedure [dbo].[GetCountAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.03.28
-- Description:	获取每种机型的测试用时平均时间，提供应用程序调用
-- 但须在存储过程CountAvgTestTime执行(每天凌晨1点)之后才可得到最新的数据
-- =============================================
CREATE PROCEDURE [dbo].[GetCountAvgTestTime] 
AS
BEGIN
	SET NOCOUNT ON;
	select SoftModel,(AVG(DifferValue) ) as VerySoftModelAVGTime from Gps_GetCountDifferVaue
	group by SoftModel
	order by SoftModel
END
GO
/****** Object:  StoredProcedure [dbo].[GetAVGTestTimeByTestIDAndTime_new]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAVGTestTimeByTestIDAndTime]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAutoTestTestRecord_ToDayAndBefore]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetAutoTestTestRecord_ToDayAndBefore] 
	-- Add the parameters for the stored procedure here
	@dBeginTime 		Datetime
	--@dEndTime 			DateTime
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
			
	/*declare @cTesterId varchar(20)
	declare getTesterId cursor for select distinct testerid from Gps_AutoTest_Result where TestTime >= @dBeginTime and 
			   TestTime <= @dEndTime
	open getTesterId
	if not @@FETCH_STATUS=0 fetch next from getTesterId into @cTesterId
	 
	while @@FETCH_STATUS=0
	begin*/
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
		/*select testerid,userdes,softmodel,TestTime
			from Gps_AutoTest_Result,Gps_User
			where TestTime >= @dBeginTime and 
				   TestTime < @dEndTime and
				   TesterId = @cTesterId and 
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName 
			--group by TesterId,userdes,TestTime
			order by TesterId,userdes,TestTime*/
		--select distinct SoftModel from Gps_AutoTest_Result where TestTime < @dEndTime and SoftModel<>''
		
		/*select softmodel,testerid,userdes,TestTime
			from Gps_AutoTest_Result,Gps_User
			where  TestTime < @dBeginTime and 
					SoftModel<>'' and
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName
			group by softmodel,TesterId,userdes,TestTime
			order by softmodel,TesterId,TestTime */
			
		/*select softmodel,testerid,userdes,TestTime
			from Gps_AutoTest_Result,Gps_User,Gps_VersionModel
			where  TestTime >= @dBeginTime  and TestTime < @dBeginTime+1 and
					SoftModel<>'' and
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName
			group by softmodel,TesterId,userdes,TestTime
			order by TesterId,TestTime  --*/
		/*
		select Gps_VersionModel.TotalModel as softmodel,testerid,userdes,TestTime
			from Gps_AutoTest_Result,Gps_User,Gps_VersionModel
			where  TestTime >= @dBeginTime  and TestTime < @dBeginTime+1 and
					Gps_AutoTest_Result.SoftModel<>'' and
				   Gps_AutoTest_Result.TesterId=Gps_User.UserName and (Gps_VersionModel.TotalModel is not null)
			group by Gps_VersionModel.TotalModel,TesterId,userdes,TestTime
			order by Gps_AutoTest_Result.TestTime,Gps_VersionModel.TotalModel,Gps_AutoTest_Result.TesterId  --*/--备份20140403
		
		select distinct Gps_VersionModel.TotalModel as softmodel,testerid,userdes,TestTime
		from Gps_AutoTest_Result,Gps_User,Gps_VersionModel
		where (Gps_AutoTest_Result.TestTime >= @dBeginTime) and TestTime < @dBeginTime+1 and (Gps_AutoTest_Result.SoftModel<>'') and
		Gps_AutoTest_Result.TesterId=Gps_User.UserName and (Gps_VersionModel.TotalModel is not null) and
		Gps_VersionModel.Model = Gps_AutoTest_Result.SoftModel
		group by Gps_VersionModel.TotalModel,TesterId,userdes,TestTime
		order by Gps_AutoTest_Result.TesterId,Gps_AutoTest_Result.TestTime


		/*select Gps_VersionModel.TotalModel as softmodel,testerid,userdes,TestTime
			from Gps_AutoTest_Result,Gps_User,Gps_VersionModel
			where  (Gps_AutoTest_Result.TestTime >= '2014-03-09') and (Gps_AutoTest_Result.TestTime < '2014-04-02') and
					(Gps_AutoTest_Result.SoftModel<>'') and
				   (Gps_AutoTest_Result.TesterId=Gps_User.UserName) and
				   (Gps_AutoTest_Result.SoftModel =Gps_VersionModel.Model) and (Gps_VersionModel.TotalModel is not null)
			group by Gps_VersionModel.TotalModel,Gps_AutoTest_Result.TesterId,Gps_User.UserDes,Gps_AutoTest_Result.TestTime
			order by Gps_AutoTest_Result.TesterId,Gps_AutoTest_Result.TestTime,Gps_VersionModel.TotalModel   --*/
					
		/*fetch next from getTesterId into @cTesterId
		
		end
		close getTesterId
		deallocate getTesterId*/
		
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
/****** Object:  StoredProcedure [dbo].[GetAutoTestTestRecord]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_ByRid_Twice]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTestResult_ByRid_Twice] 
@cFormName 	VARCHAR(30),
@cChipRid	VARCHAR(32),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
begin
	DECLARE  @cFormNamebackup  VARCHAR(40) 
    	DECLARE  @SqlStr  NVARCHAR(2000)

	SET @iRecordCount=1
	SET @cFormNamebackup = @cFormName +'_BackUp'
	
	IF @cVersion=''
	BEGIN
		/*SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+''''
	    	EXEC(@SqlStr )	    
		IF(@@rowcount <1) SET @iRecordCount=0*/		
		IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [SN] =@cChipRid			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0 WHERE [SN] =@cChipRid	
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_SMTIQC_Result')
				UPDATE Gps_TestResult SET SMTIQCResult=0 WHERE [SN] =@cChipRid
			
			IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
		--IF @iRecordCount=1
		BEGIN
	
			SET  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,Softmodel,[Version],IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],IMEI,Result,TesterId,TestTime from ['+ @cFormName+'] where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			IF(@@rowcount <1) SET @iRecordCount=0
			SET  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + ''' where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr )
			IF(@@rowcount <1) 
				SET @iRecordCount=0	
			
			SET  @SqlStr='delete from '+@cFormName+' where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			IF(@@rowcount <1) SET @iRecordCount=0
			--Commit 


			IF @cFormName='Gps_WriteImei_Result'
				UPDATE Gps_TestResult SET [IMEI]='' WHERE [SN] =@cChipRid

			IF(@@rowcount <1) SET @iRecordCount=0
			
		END
		
	END
	ELSE
	BEGIN
	    	/*SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
	    	EXEC(@SqlStr )	    
		IF(@@rowcount <1) SET @iRecordCount=0*/	
		IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [SN] =@cChipRid			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [SN] =@cChipRid AND Version=@cVersion
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0 WHERE [SN] =@cChipRid AND Version=@cVersion
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [SN] =@cChipRid AND Version=@cVersion
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [SN] =@cChipRid AND Version=@cVersion
			    
			IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
		
		--IF @iRecordCount=1
		BEGIN
	
			SET  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,Softmodel,[Version],IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],IMEI,Result,TesterId,TestTime from ['+ @cFormName+'] where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			IF(@@rowcount <1) SET @iRecordCount=0

			SET  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + ''' where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr )
			IF(@@rowcount <1) SET @iRecordCount=0

			SET  @SqlStr='delete from '+@cFormName+' where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			IF(@@rowcount <1) SET @iRecordCount=0
			--Commit

			IF @cFormName='Gps_WriteImei_Result'
				UPDATE Gps_TestResult SET [IMEI]='' WHERE [SN] =@cChipRid AND [Version]=@cVersion
			IF(@@rowcount <1) SET @iRecordCount=0
			
		END
	END
	IF (@cFormName='Gps_ParamDownload_Result')
	BEGIN
		IF @cVersion=''
		BEGIN
			SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,TestTime from [Gps_ParamDownVersionCpd] where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
			
			SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
		ELSE
		BEGIN
		    SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,TestTime from [Gps_ParamDownVersionCpd] where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0 
			
				SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [SN] = '''+@cChipRid+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
	END
		
END
GO
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_ByImei_Twice]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[DeleteTestResult_ByImei_Twice] 
@cFormName 	VARCHAR(30),
@cImei		VARCHAR(15),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
BEGIN
	DECLARE  @cFormNamebackup  VARCHAR(40) 
    DECLARE  @SqlStr  NVARCHAR(2000)

	SET @iRecordCount=1
	SET @cFormNamebackup = @cFormName +'_BackUp'
	
	IF @cVersion=''
	BEGIN
		/*SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [IMEI] = '''+@cImei+''''
	    	EXEC(@SqlStr )	    
		IF(@@rowcount <1) SET @iRecordCount=0*/		
		IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [IMEI] =@cImei			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [IMEI] =@cImei
				
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0WHERE [IMEI] =@cImei	
			ELSE IF (@cFormName='Gps_SMTIQC_Result')
				UPDATE Gps_TestResult SET SMTIQCResult=0 WHERE [IMEI] =@cImei	
			
			IF @cFormName='Gps_WriteImei_Result'
				UPDATE Gps_TestResult SET [IMEI]='' WHERE [IMEI] =@cImei
			    
			--IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
		IF @iRecordCount=1
		BEGIN
	
			SET  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,[Version],IMEI,SoftModel,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,[Version],IMEI,SoftModel,Result,TesterId,TestTime from ['+ @cFormName+'] where [IMEI] = '''+@cImei+''''
			EXEC(@SqlStr)
			IF(@@rowcount >=1) 
			BEGIN
				SET  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + ''' where [IMEI] = '''+@cImei+''''
				EXEC(@SqlStr )
			END
			
			IF(@@rowcount >=1) 
			BEGIN
				SET  @SqlStr='delete from '+@cFormName+' where [IMEI] = '''+@cImei+''''
				EXEC(@SqlStr)
			END
			
			IF(@@rowcount <1) SET @iRecordCount=0

			
			
		END
		
	END
	ELSE
	BEGIN
	    	/*SET  @SqlStr='select *  from  ['+ @cFormName + ']  where  [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
	    	EXEC(@SqlStr )	    
		IF(@@rowcount <1) SET @iRecordCount=0*/		
		IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [IMEI] =@cImei			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0 WHERE [IMEI] =@cImei	
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [IMEI] =@cImei
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [IMEI] =@cImei
			    
			IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
		IF @iRecordCount=1
		BEGIN
	
			SET  @SqlStr='insert  into ['+ @cFormNamebackup+'] (SN,[Version],IMEI,SoftModel,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,[Version],IMEI,SoftModel,Result,TesterId,TestTime from ['+ @cFormName+'] where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)

			SET  @SqlStr='update '+ @cFormNamebackup +' set TesterId=''' + @cTesterId + ''' where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr )

			SET  @SqlStr='delete from '+@cFormName+' where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			
			IF(@@rowcount <1) SET @iRecordCount=0 

			IF @cFormName='Gps_WriteImei_Result'
				UPDATE Gps_TestResult SET [IMEI]='' WHERE [IMEI] =@cImei AND Version=@cVersion
			Commit
			
		END
		
	END
	
	IF (@cFormName='Gps_ParamDownload_Result')
	BEGIN
		IF @cVersion=''
		BEGIN
			SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,TestTime from [Gps_ParamDownVersionCpd] where [IMEI] = '''+@cImei+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
			
			SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [IMEI] = '''+@cImei+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
		ELSE
		BEGIN
		    SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionS,IMEI,Result,TesterId,TestTime from [Gps_ParamDownVersionCpd] where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0 
			
				SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [IMEI] = '''+@cImei+'''and Version = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
	END
		
END
GO
/****** Object:  StoredProcedure [dbo].[DeleOperRecord]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE [dbo].[DeleOperRecord] 
@iOperName integer,
@OperName varchar(20),
@OperTimeStart datetime,
@OperTimeEnd datetime
AS
BEGIN
  if @iOperName = 1   --1没有指定删除哪个操作用户,0指定操作用户
    Delete  from Gps_OperRecord where OperTime between @OperTimeStart and @OperTimeEnd
  else
	Delete  from Gps_OperRecord where OperName =@OperName and  OperTime between @OperTimeStart and @OperTimeEnd
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountQCWhiteCardMonthAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountQCWhiteCardMonthAvgTestTime] 
AS
BEGIN
	declare @@nowTimeCountAvgTest datetime
	declare @@allCountFromNow int
	select @@nowTimeCountAvgTest=getdate()
	declare @cTestTime datetime 
	declare @tempTesterId char(20)
	declare @tempSoftModel char(20)
	declare @temUserType char(20)
	drop table Gps_GetQCWhiteCardDifferValue
	CREATE TABLE [dbo].Gps_GetQCWhiteCardDifferValue(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,	
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL
 CONSTRAINT [PK_Gps_GetQCWhiteCardDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

	declare getTestTime cursor for 
						select distinct  a.testTime,a.TesterId,c.UserType,b.TotalModel as softmodel from Gps_CoupleTest_Result a,Gps_VersionModel b, Gps_User c
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
			insert into Gps_GetQCWhiteCardDifferValue(differvalue,testerid,testtime,usertype,softmodel) values(@iTempDifferVaue,@tempTesterId2,@TestTime2,@temUserType,@tempSoftModel1)
		end	
		end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountQCParamDownloadMonthAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountQCParamDownloadMonthAvgTestTime] 
AS
BEGIN
	declare @@nowTimeCountAvgTest datetime
	declare @@allCountFromNow int
	select @@nowTimeCountAvgTest=getdate()
	declare @cTestTime datetime 
	declare @tempTesterId char(20)
	declare @tempSoftModel char(20)
	declare @temUserType char(20)
	drop table Gps_GetQCParamDownloadDifferValue
	CREATE TABLE [dbo].Gps_GetQCParamDownloadDifferValue(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,	
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL
 CONSTRAINT [PK_Gps_GetQCParamDownloadDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

	declare getTestTime cursor for 

						select distinct  a.testTime,a.TesterId,c.UserType,b.TotalModel as softmodel from Gps_ParamDownload_Result a,Gps_VersionModel b, Gps_User c
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
			insert into Gps_GetQCParamDownloadDifferValue(differvalue,testerid,testtime,usertype,softmodel) values(@iTempDifferVaue,@tempTesterId2,@TestTime2,@temUserType,@tempSoftModel1)
		end	
		end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountQCMonthAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CountQCMonthAvgTestTime] 
AS
BEGIN
	declare @@nowTimeCountAvgTest datetime
	declare @@allCountFromNow int
	select @@nowTimeCountAvgTest=getdate()
	declare @cTestTime datetime 
	declare @tempTesterId char(20)
	declare @tempSoftModel char(20)
	declare @temUserType char(20)
	drop table Gps_GetQCDifferValue
	CREATE TABLE [dbo].Gps_GetQCDifferValue(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,	
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL
 CONSTRAINT [PK_Gps_GetQCDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]

	declare getTestTime cursor for 
						select distinct  a.testTime,a.TesterId,c.UserType,b.TotalModel as softmodel from Gps_AutoTest_Result a,Gps_VersionModel b, Gps_User c
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
			insert into Gps_GetQCDifferValue(differvalue,testerid,testtime,usertype,softmodel) values(@iTempDifferVaue,@tempTesterId2,@TestTime2,@temUserType,@tempSoftModel1)
		end	
		end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountQCImeiMonthAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CountMonthAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CountMonthAvgParamDownloadTestTime]    Script Date: 11/23/2017 11:25:00 ******/
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
Create PROCEDURE [dbo].[CountMonthAvgParamDownloadTestTime] 
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
	
	drop table Gps_GetParamDownloadDifferValue
	CREATE TABLE [dbo].Gps_GetParamDownloadDifferValue(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetParamDownloadDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
	
	declare getTestTime cursor for 
						select distinct a.testTime,b.totalmodel as softmodel,a.TesterId from Gps_CoupleTest_Result a,Gps_VersionModel b
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  TestTime < @@nowTimeCountAvgTest and (a.TestTime > '2014-03-08 00:00:01') 
			and (b.TotalModel is not null) and (a.SoftModel <> '')
	order by TesterId,TestTime		
	open getTestTime
	if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
	
	declare @TestTime1 datetime
	declare @TestTime2 datetime
	declare @iTempDifferVaue BigInt
	declare @tempSoftModel1 char(20)
	declare @tempSoftModel2 char(20)
	declare @tempTesterId1 char(20)
	declare @tempTesterId2 char(20)
	set @iTempDifferVaue = 0

	while @@FETCH_STATUS=0
	begin
		set @TestTime1 = @cTestTime
		set @tempTesterId1 = @tempTesterId
		set @tempSoftModel1 = @tempSoftModel
		fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime2 = @cTestTime
		set @tempTesterId2 =@tempTesterId
		set @tempSoftModel2 = @tempSoftModel
		
		select @iTempDifferVaue=abs(datediff(SS,@TestTime2,@TestTime1))
		--如果两台机子测试的间隔时间超过10分钟，则认为测试员没在测试 秒级 
		
		if (@iTempDifferVaue < 600)  and (not(@tempSoftModel2 <>@tempSoftModel1)) --and (not(@tempTesterId1 <> @tempTesterId2))
		begin
			
			if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
			insert into Gps_GetParamDownloadDifferValue(differvalue,softmodel,testtime) values(@iTempDifferVaue,@tempSoftModel1,@TestTime2)
		end	
	end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountMonthAvgImeiTestTime]    Script Date: 11/23/2017 11:25:00 ******/
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
Create PROCEDURE [dbo].[CountMonthAvgImeiTestTime] 
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
	
	drop table Gps_GetImeiDifferValue
	CREATE TABLE [dbo].[Gps_GetImeiDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetImeiDifferValue] PRIMARY KEY CLUSTERED 
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
						select distinct a.testTime,b.totalmodel as softmodel,a.TesterId from Gps_WriteImei_Result a,Gps_VersionModel b
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  TestTime < @@nowTimeCountAvgTest and (a.TestTime > '2014-03-08 00:00:01') 
			and (b.TotalModel is not null) and (a.SoftModel <> '')
	--where (SoftModel<>'') and  TestTime < '2014-3-27 17:30:00' --and (TestTime > '2014-3-26 10:00:00')
	order by TesterId,TestTime
	
	/* select a.testTime,b.totalmodel as softmodel,a.TesterId from [Gps_AutoTest_Result] a,Gps_VersionModel b 
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  (a.TestTime < '2014-4-02 23:59:59') and (a.TestTime > '2014-03-08 00:00:01') 
		and (b.TotalModel is not null) and (a.SoftModel <> '')
	order by a.TestTime,b.totalmodel,a.TesterId  --*/--备注2014-03-30
	
	open getTestTime
	if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
	
	declare @TestTime1 datetime
	declare @TestTime2 datetime
	declare @iTempDifferVaue BigInt
	declare @tempSoftModel1 char(20)
	declare @tempSoftModel2 char(20)
	declare @tempTesterId1 char(20)
	declare @tempTesterId2 char(20)
	set @iTempDifferVaue = 0

	while @@FETCH_STATUS=0
	begin
		--fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime1 = @cTestTime
		set @tempTesterId1 = @tempTesterId
		set @tempSoftModel1 = @tempSoftModel
		fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime2 = @cTestTime
		set @tempTesterId2 =@tempTesterId
		set @tempSoftModel2 = @tempSoftModel
		
		--select @TestTime2                               --这行是为了方便观察数据，没其它实际应用
		--select @TestTime1                               --这行是为了方便观察数据，没其它实际应用
		--select abs(datediff(s,@TestTime2,@TestTime1))   --这行是为了方便观察数据，没其它实际应用
		
		select @iTempDifferVaue=abs(datediff(SS,@TestTime2,@TestTime1))
		--如果两台机子测试的间隔时间超过10分钟，则认为测试员没在测试 秒级 
		
		if (@iTempDifferVaue < 600)  and (not(@tempSoftModel2 <>@tempSoftModel1)) --and (not(@tempTesterId1 <> @tempTesterId2))
		begin
			
			if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
			insert into Gps_GetImeiDifferValue(differvalue,softmodel,testtime) values(@iTempDifferVaue,@tempSoftModel1,@TestTime2)
		end	
		--if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
		--insert into Gps_GetCountDifferVaue(DifferValue,SoftModel) values(@iTempDifferVaue,@tempSoftModel1)
	end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountMonthAvgCoupleTestTime]    Script Date: 11/23/2017 11:25:00 ******/
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
Create PROCEDURE [dbo].[CountMonthAvgCoupleTestTime] 
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
	
	drop table Gps_GetCoupleDifferValue
	CREATE TABLE [dbo].Gps_GetCoupleDifferValue(
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetCoupleDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
	
	declare getTestTime cursor for 
						select distinct a.testTime,b.totalmodel as softmodel,a.TesterId from Gps_CoupleTest_Result a,Gps_VersionModel b
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  TestTime < @@nowTimeCountAvgTest and (a.TestTime > '2014-03-08 00:00:01') 
			and (b.TotalModel is not null) and (a.SoftModel <> '')
	order by TesterId,TestTime		
	open getTestTime
	if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
	
	declare @TestTime1 datetime
	declare @TestTime2 datetime
	declare @iTempDifferVaue BigInt
	declare @tempSoftModel1 char(20)
	declare @tempSoftModel2 char(20)
	declare @tempTesterId1 char(20)
	declare @tempTesterId2 char(20)
	set @iTempDifferVaue = 0

	while @@FETCH_STATUS=0
	begin
		set @TestTime1 = @cTestTime
		set @tempTesterId1 = @tempTesterId
		set @tempSoftModel1 = @tempSoftModel
		fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime2 = @cTestTime
		set @tempTesterId2 =@tempTesterId
		set @tempSoftModel2 = @tempSoftModel
		
		select @iTempDifferVaue=abs(datediff(SS,@TestTime2,@TestTime1))
		--如果两台机子测试的间隔时间超过10分钟，则认为测试员没在测试 秒级 
		
		if (@iTempDifferVaue < 600)  and (not(@tempSoftModel2 <>@tempSoftModel1)) --and (not(@tempTesterId1 <> @tempTesterId2))
		begin
			
			if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
			insert into Gps_GetCoupleDifferValue(differvalue,softmodel,testtime) values(@iTempDifferVaue,@tempSoftModel1,@TestTime2)
		end	
	end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CountAvgTestTime]    Script Date: 11/23/2017 11:25:00 ******/
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
-- =============================================
CREATE PROCEDURE [dbo].[CountAvgTestTime] 
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
	
	delete from Gps_GetCountDifferVaue  --插入操作前，先清空两台机子测试时间用时间隔表
	
	
	/* declare getTestTime cursor for 
						select distinct testTime,SoftModel,TesterId from [Gps_AutoTest_Result] 
	where (SoftModel<>'') and  TestTime < @@nowTimeCountAvgTest 
	--where (SoftModel<>'') and  TestTime < '2014-3-27 17:30:00' --and (TestTime > '2014-3-26 10:00:00')
	order by TestTime,SoftModel,TesterId  --*/
	
	declare getTestTime cursor for 
						select distinct a.testTime,b.totalmodel as softmodel,a.TesterId from Gps_AutoTest_Result a,Gps_VersionModel b
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  TestTime < @@nowTimeCountAvgTest and (a.TestTime > '2014-03-08 00:00:01') 
			and (b.TotalModel is not null) and (a.SoftModel <> '')
	--where (SoftModel<>'') and  TestTime < '2014-3-27 17:30:00' --and (TestTime > '2014-3-26 10:00:00')
	order by TesterId,TestTime
	
	/* select a.testTime,b.totalmodel as softmodel,a.TesterId from [Gps_AutoTest_Result] a,Gps_VersionModel b 
	where (a.SoftModel<>'') and (a.SoftModel = b.Model) and  (a.TestTime < '2014-4-02 23:59:59') and (a.TestTime > '2014-03-08 00:00:01') 
		and (b.TotalModel is not null) and (a.SoftModel <> '')
	order by a.TestTime,b.totalmodel,a.TesterId  --*/--备注2014-03-30
	
	open getTestTime
	if not @@FETCH_STATUS=0 fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
	
	declare @TestTime1 datetime
	declare @TestTime2 datetime
	declare @iTempDifferVaue BigInt
	declare @tempSoftModel1 char(20)
	declare @tempSoftModel2 char(20)
	declare @tempTesterId1 char(20)
	declare @tempTesterId2 char(20)
	set @iTempDifferVaue = 0

	while @@FETCH_STATUS=0
	begin
		--fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime1 = @cTestTime
		set @tempTesterId1 = @tempTesterId
		set @tempSoftModel1 = @tempSoftModel
		fetch next from getTestTime into @cTestTime,@tempSoftModel,@tempTesterId
		set @TestTime2 = @cTestTime
		set @tempTesterId2 =@tempTesterId
		set @tempSoftModel2 = @tempSoftModel
		
		--select @TestTime2                               --这行是为了方便观察数据，没其它实际应用
		--select @TestTime1                               --这行是为了方便观察数据，没其它实际应用
		--select abs(datediff(s,@TestTime2,@TestTime1))   --这行是为了方便观察数据，没其它实际应用
		
		select @iTempDifferVaue=abs(datediff(SS,@TestTime2,@TestTime1))
		--如果两台机子测试的间隔时间超过10分钟，则认为测试员没在测试 秒级 
		
		if (@iTempDifferVaue < 600)  and (not(@tempSoftModel2 <>@tempSoftModel1)) --and (not(@tempTesterId1 <> @tempTesterId2))
		begin
			
			if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
			insert into Gps_GetCountDifferVaue(DifferValue,SoftModel) values(@iTempDifferVaue,@tempSoftModel1)
		end	
		--if @tempSoftModel1 <> '' and  @tempSoftModel1 is not null
		--insert into Gps_GetCountDifferVaue(DifferValue,SoftModel) values(@iTempDifferVaue,@tempSoftModel1)
	end
	close getTestTime
	deallocate getTestTime
	
END
GO
/****** Object:  StoredProcedure [dbo].[CheckTestPass_WriteIMEI]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestPass_WriteIMEI]
@cChipRid		varchar(32) ,
@cSoftModel		varchar(50) ,
@cVersion		varchar(100),
@iFunctionPass integer output,
@iGPSPass integer output,
@iCouplePass integer output,
@iParamDownloadPass integer output,
@iAutoPass integer output,
@cResult integer output
AS 
	SET @cResult=1
	DECLARE @bTestFunction bit,@bTestGPS bit,@bTestCouple bit,@bTestParamDownload bit,@bTestCartonBox bit,@bTestAutoTest bit
	
	/*SELECT @SoftModel=SoftModel 
	FROM Gps_TestResult 
	WHERE	SN=@cChipRid and SoftModel=@cSoftModel and Version=@cVersion*/

	SELECT @bTestFunction=TestFunction,
		@bTestGPS=TestGPS,
		@bTestCouple=TestCouple,
		@bTestParamDownload=TestParamDownload,
		@bTestAutoTest=TestAutoTest
	FROM Gps_TestPlanSet WHERE Version=@cSoftModel

	SET @cResult=1

	SET  @iFunctionPass=0
	SET  @iGPSPass=0
	SET  @iCouplePass=0
	SET  @iParamDownloadPass=0
	SET  @iAutoPass=0
	
	SELECT @iFunctionPass=FunctionResult,
		@iGPSPass=GPSResult,
		@iCouplePass=CoupleResult,
		@iParamDownloadPass=ParamDownloadResult,
		@iAutoPass=AutoTestResult
	FROM Gps_TestResult WHERE SN=@cChipRid and SoftModel=@cSoftModel and Version=@cVersion

	IF  @bTestFunction=0 SET  @iFunctionPass=1
	IF  @bTestGPS=0 SET  @iGPSPass=1
	IF  @bTestCouple=0 SET  @iCouplePass=1
	--IF  @bTestParamDownload=0 SET  @iParamDownloadPass=1
	SET  @iParamDownloadPass=1
	IF  @bTestAutoTest=0 SET  @iAutoPass=1

	SET @cResult=@iFunctionPass & @iGPSPass & @iCouplePass  & @iParamDownloadPass & @iAutoPass
GO
/****** Object:  StoredProcedure [dbo].[CheckTestPass]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestPass]
@cIMEI varchar(15) ,
@iFunctionPass integer output,
@iGPSPass integer output,
@iCouplePass integer output,
@iWriteImeiPass integer output,
@iParamDownloadPass integer output,
@iAutoPass integer output,
@cResult integer output
AS 
	SET @cResult=1
	DECLARE @SoftModel NVARCHAR(50), @bTestFunction bit,@bTestGPS bit,@bTestCouple bit,@bTestWriteImei bit,@bTestParamDownload bit,@bTestCartonBox bit,@bTestAutoTest bit
	SELECT @SoftModel=SoftModel 
	FROM Gps_TestResult 
	WHERE	IMEI=@cIMEI and SoftModel<>'Test'

	SELECT @bTestFunction=TestFunction,
		@bTestGPS=TestGPS,
		@bTestCouple=TestCouple,
		@bTestWriteImei=TestWriteImei,
		@bTestParamDownload=TestParamDownload,
		@bTestAutoTest=TestAutoTest
		/*,
		@bTestCartonBox=TestCartonBox*/
	FROM Gps_TestPlanSet WHERE Version=@SoftModel and Version<>'Test'

	DECLARE  @SqlStr  NVARCHAR(1000)

	SET @cResult=1

	SET  @iFunctionPass=0
	SET  @iGPSPass=0
	SET  @iCouplePass=0
	SET  @iWriteImeiPass=0
	SET  @iParamDownloadPass=0
	SET  @iAutoPass=0
	
	SELECT @iFunctionPass=FunctionResult,
		@iGPSPass=GPSResult,
		@iCouplePass=CoupleResult,
		@iWriteImeiPass=WriteImeiResult,
		@iParamDownloadPass=ParamDownloadResult,
		@iAutoPass=AutoTestResult
	FROM Gps_TestResult WHERE IMEI=@cIMEI and SoftModel<>'Test'

	IF  @bTestFunction=0 SET  @iFunctionPass=1
	IF  @bTestGPS=0 SET  @iGPSPass=1
	IF  @bTestCouple=0 SET  @iCouplePass=1
	IF  @bTestWriteImei=0 SET  @iWriteImeiPass=1
	IF  @bTestParamDownload=0 SET  @iParamDownloadPass=1
	IF  @bTestAutoTest=0 SET  @iAutoPass=1

	SET @cResult=@iFunctionPass & @iGPSPass & @iCouplePass & @iWriteImeiPass & @iParamDownloadPass & @iAutoPass 

	
	
	
	/*SET @SqlStr='select * from Gps_TestResult where IMEI='''+@cIMEI+''''
	
	IF 	@bTestFunction=1 SET @SqlStr=@SqlStr+' AND FunctionResult=1'
	
	IF 	@bTestGPS=1 SET @SqlStr=@SqlStr+' AND GPSResult=1'
	
	IF 	@bTestCouple=1 SET @SqlStr=@SqlStr+' AND CoupleResult=1'
	
	IF 	@bTestWriteImei=1 SET @SqlStr=@SqlStr+' AND WriteImeiResult=1'
	
	IF 	@bTestParamDownload=1 SET @SqlStr=@SqlStr+' AND ParamDownloadResult=1'
	
	IF 	@bTestAutoTest=1 SET @SqlStr=@SqlStr+' AND AutoTestResult=1'	
	EXEC(@SqlStr ) 
	
	--SELECT * FROM Gps_TestResult 
	--WHERE IMEI=@cIMEI and  FunctionResult=@bTestFunction and GPSResult=@bTestGPS and
	--		CoupleResult=@bTestCouple and WriteImeiResult=@bTestWriteImei and ParamDownloadResult=@bTestParamDownload

	
	IF @@ROWCOUNT<1 SET @cResult=0*/
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedParamCpd]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckTestedParamCpd] 
@cChipRid	varchar(32),
@cIMEI varchar(15),
@cVersion	varchar(50) output,
@cVersionEx varchar(50) output,
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=0
	IF @cIMEI<>''---此项一开始为了返工位获得新版本，后来没有用到，暂留
	BEGIN
	   select @cVersion=Version  from  Gps_ParamDownVersionCpd   WHERE IMEI=@cIMEI --and Result=1 
		IF(@@ROWCOUNT > 0) 
		BEGIN
			SET @iRecordCount=1
			--select @cVersionEx=VersionEx
		END 
	END
	ELSE----传递Id和新版本获得旧版本，新增流程，检测是否跑过下载位
	BEGIN
		select @cVersionEx=Version  from  Gps_ParamDownVersionCpd   WHERE SN=@cChipRid AND [VersionS]=@cVersion-- 如果跑过下载位，那么读到的版本号即新版本号
		IF(@@ROWCOUNT > 0) 
		BEGIN
			SET @iRecordCount=1
			--select @cVersionEx=VersionEx
		END
	END
	
			    
	/*select *  from  Gps_CoupleTest_Result   WHERE SN=@cChipRid AND [Version]=@cVersion and Result=1
	IF(@@ROWCOUNT >0) SET @iRecordCount=@iRecordCount+1 	
	select *  from  Gps_WriteImei_Result   WHERE SN=@cChipRid AND [Version]=@cVersion and Result=1
	IF(@@ROWCOUNT >0) SET @iRecordCount=@iRecordCount+1 */	
    
END
GO
/****** Object:  StoredProcedure [dbo].[OQCParamCopy]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[OQCParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_OQC_Item WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_OQC_Item disable trigger all
		INSERT INTO Gps_OQC_Item(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_OQC_Item WHERE ItemModel=@cSrcModel
		alter table Gps_OQC_Item enable  trigger all
		
		INSERT INTO Gps_OQC_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_OQC_Item WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_OQC_SubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5
				FROM Gps_OQC_SubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
/****** Object:  StoredProcedure [dbo].[ModelTestParamCopy]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModelTestParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_AutoTestItem disable trigger all
		INSERT INTO Gps_AutoTestItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel
		alter table Gps_AutoTestItem enable  trigger all
		
		INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_AutoTestSubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5 
				FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
/****** Object:  StoredProcedure [dbo].[ModelParamDownloadCopy]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ModelParamDownloadCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_ParamDownloadItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_ParamDownloadItem disable trigger all
		INSERT INTO Gps_ParamDownloadItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_ParamDownloadItem WHERE ItemModel=@cSrcModel
		alter table Gps_ParamDownloadItem enable  trigger all
		
		INSERT INTO Gps_ParamDownload_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_ParamDownloadItem WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_ParamDownloadSubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5 
				FROM Gps_ParamDownloadSubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
/****** Object:  StoredProcedure [dbo].[InsertTOBoxCount]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[InsertTOBoxCount]
@cBoxNo 		varchar(15),
@cSN            varchar(15)
AS
BEGIN
	insert into Gps_AutoTestSMT_BoxCont(BoxNo,SN) values(@cBoxNo,@cSN)
END
GO
/****** Object:  StoredProcedure [dbo].[InsertOperRecord]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Newttl
-- Create date: 2014.1
-- Description:	Gpstest服务端操作保存到表Gps_OperRecord中
-- =============================================
CREATE PROCEDURE [dbo].[InsertOperRecord] 
	-- Add the parameters for the stored procedure here
@cOperName char(20),
@cOperContent char(250),
@cOperTime datetime,
@cOperDemo char(250)
AS
BEGIN
      INSERT INTO Gps_OperRecord(OperName,OperContent,OperTime,OperDemo)
      VALUES (@cOperName,@cOperContent,@cOperTime,@cOperDemo)
END
GO
/****** Object:  StoredProcedure [dbo].[CheckMustTest]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckMustTest]
@cSoftModel 	varchar(20) ,
@cFormName 	varchar(30),
@cResult integer output
AS 
	SET @cResult=1
	DECLARE  @bTestFunction bit,@bTestGPS bit,@bTestCouple bit,@bTestWriteImei bit,@bTestParamDownload bit,@bTestCartonBox bit,@bTestAutoTest bit

	SELECT @bTestFunction=TestFunction,
		@bTestGPS=TestGPS,
		@bTestCouple=TestCouple,
		@bTestWriteImei=TestWriteImei,
		@bTestParamDownload=TestParamDownload,
		@bTestAutoTest=TestAutoTest
	FROM Gps_TestPlanSet WHERE Version=@cSoftModel
	
	IF @cFormName='Gps_FunctionTest_Result' SET @cResult=@bTestFunction
	
	ELSE IF @cFormName='Gps_GpsTest_Result' SET @cResult=@bTestGPS

	ELSE IF @cFormName='Gps_CoupleTest_Result' SET @cResult=@bTestCouple

	ELSE IF @cFormName='Gps_WriteImei_Result' SET @cResult=@bTestWriteImei

	ELSE IF @cFormName='Gps_ParamDownload_Result' SET @cResult=@bTestParamDownload

	ELSE IF @cFormName='Gps_AutoTest_Result' SET @cResult=@bTestAutoTest

	ELSE IF @cFormName='Gps_CartonBox_Result' SET @cResult=1
	
	IF @cResult IS NULL SET @cResult=0
GO
/****** Object:  StoredProcedure [dbo].[CheckImei]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CheckImei]
@cIMEI 		varchar(15),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_WriteImei_Result WHERE IMEI=@cIMEI AND Result=1	
			    
	IF(@@ROWCOUNT <1) SET @iRecordCount=0 
END
GO
/****** Object:  StoredProcedure [dbo].[AutoTestSMTParamCopyFormAutoTest]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AutoTestSMTParamCopyFormAutoTest]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_AutoTestSMTItem disable trigger all
		INSERT INTO Gps_AutoTestSMTItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel
		alter table Gps_AutoTestSMTItem enable  trigger all
		
		INSERT INTO Gps_AutoTestSMT_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_AutoTestSMTSubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5 
				FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
/****** Object:  StoredProcedure [dbo].[AutoTestSMTParamCopy]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[AutoTestSMTParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_AutoTestSMTItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_AutoTestSMTItem disable trigger all
		INSERT INTO Gps_AutoTestSMTItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestSMTItem WHERE ItemModel=@cSrcModel
		alter table Gps_AutoTestSMTItem enable  trigger all
		
		INSERT INTO Gps_AutoTestSMT_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_AutoTestSMTItem WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_AutoTestSMTSubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,CompareValue,CompareRemark,
					Remark1,Remark2,Remark3,Remark4,Remark5 
				FROM Gps_AutoTestSMTSubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
/****** Object:  StoredProcedure [dbo].[SelectOperRecord]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[SelectOperRecord] 
@iOperName integer,
@OperName varChar(20),
@OperTimeStart datetime,
@OperTimeEnd datetime,
@cResult integer output
AS 
	SET @cResult=1
	
  if @iOperName = 1 
  begin 
	SELECT * 
	from dbo.Gps_OperRecord 
	where OperName = @OperName and OperTime between @OperTimeStart and @OperTimeEnd
  end
  else
  begin
    SELECT * 
	from dbo.Gps_OperRecord 
	where OperName like '%'+@OperName+'%' and OperTime between @OperTimeStart and @OperTimeEnd
  end

	IF @@rowcount<1 
	BEGIN		
		SET @cResult=0
	END
GO
/****** Object:  StoredProcedure [dbo].[TwiceByUpdateVersion]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TwiceByUpdateVersion]
@cSn		VARCHAR(32), 
@cImei		VARCHAR(15),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
	SET @iRecordCount=1;	
	
	INSERT INTO Gps_WriteImei_Result_Backup (SN,SoftModel,[Version],IMEI,Result,TesterId,Remark)
		SELECT SN,SoftModel,[Version],IMEI,Result,@cTesterId,Remark FROM Gps_WriteImei_Result WHERE SN=@cSn AND IMEI=@cImei AND Version=@cVersion

	DELETE Gps_WriteImei_Result WHERE SN=@cSn AND IMEI=@cImei AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_FunctionTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_GpsTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_CoupleTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_ParamDownload_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
	--IF @@ROWCOUNT<1 SET @iRecordCount=0;
	UPDATE Gps_AutoTest_Result SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion

	UPDATE Gps_TestResult SET IMEI='' WHERE SN=@cSn /*AND IMEI=@cImei*/ AND [Version]=@cVersion
GO
/****** Object:  StoredProcedure [dbo].[TestParamCopyFormAutoTest]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--从自动测试位复制测试参数到其他工位,表格式按以下规定设置
CREATE PROCEDURE [dbo].[TestParamCopyFormAutoTest]
@cFormName      varchar(50),
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	DECLARE  @SqlStr  NVARCHAR(1000)
	DECLARE  @cFormNameSub  VARCHAR(40)
	DECLARE  @cFormNameItem  VARCHAR(40)  
	SET @cFormNameSub = @cFormName +'_SubItem'--指令表
	SET @cFormNameItem = @cFormName +'_Item'--包含所有指令项表
	
	SELECT * FROM Gps_AutoTestItem WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN    			
	    SET @SqlStr='insert into '+@cFormNameItem+'(ItemModel,ItemName)'
	    SET  @SqlStr=@SqlStr+' select ItemModel='''+@cDstModel+''',ItemName from Gps_AutoTestItem where ItemModel='''+@cSrcModel+'''' 
	    EXEC(@SqlStr) 
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		SET @SqlStr='INSERT INTO '+ @cFormNameSub+'(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5)'
		SET @SqlStr=@SqlStr+'SELECT ItemModel='''+@cDstModel+''',ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,CompareValue,CompareRemark,
										Remark1,Remark2,Remark3,Remark4,Remark5 FROM Gps_AutoTestSubItem WHERE ItemModel='''+@cSrcModel+''''		
		EXEC(@SqlStr) 
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
END
GO
/****** Object:  StoredProcedure [dbo].[TestDeleteParam]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[TestDeleteParam] 
@cFormName 	VARCHAR(30),
@cChipRid	VARCHAR(32),
@cVersion	VARCHAR(50),
@cTesterId	VARCHAR(20),
@iRecordCount	integer output
AS
begin
	DECLARE  @cFormNamebackup  VARCHAR(40) 
    	DECLARE  @SqlStr  NVARCHAR(2000)

	SET @iRecordCount=1	
	IF (@iRecordCount=1)
		BEGIN
			IF (@cFormName='Gps_FunctionTest_Result' )
				UPDATE Gps_TestResult SET FunctionResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_GpsTest_Result')
				UPDATE Gps_TestResult SET GPSResult=0 WHERE [SN] =@cChipRid			
			ELSE IF (@cFormName='Gps_CoupleTest_Result')
				UPDATE Gps_TestResult SET CoupleResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_WriteImei_Result')
				UPDATE Gps_TestResult SET WriteImeiResult=0 WHERE [SN] =@cChipRid	
			ELSE IF (@cFormName='Gps_ParamDownload_Result')
				UPDATE Gps_TestResult SET ParamDownloadResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_AutoTest_Result')
				UPDATE Gps_TestResult SET AutoTestResult=0 WHERE [SN] =@cChipRid
			ELSE IF (@cFormName='Gps_SMTIQC_Result')
				UPDATE Gps_TestResult SET SMTIQCResult=0 WHERE [SN] =@cChipRid
			
			IF(@@ROWCOUNT <1) SET @iRecordCount=0 			
		END
	IF (@cFormName='Gps_ParamDownload_Result')
	BEGIN
		IF @cVersion=''
		BEGIN
			SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark from [Gps_ParamDownVersionCpd] where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
			
			SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [SN] = '''+@cChipRid+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
		ELSE
		BEGIN
		    SET  @SqlStr='insert  into [Gps_ParamDownVersionCpd_BackUp] (SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark)'
			SET  @SqlStr=@SqlStr+'	select SN,Softmodel,[Version],VersionEx,IMEI,Result,TesterId,Remark from [Gps_ParamDownVersionCpd] where [SN] = '''+@cChipRid+'''and VersionEx = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0 
			
				SET  @SqlStr='delete from Gps_ParamDownVersionCpd where [SN] = '''+@cChipRid+'''and VersionEx = '''+@cVersion+''''
			EXEC(@SqlStr)
			--IF(@@rowcount <1) SET @iRecordCount=0
		END 
	END
	
	
		
END
GO
/****** Object:  StoredProcedure [dbo].[WriteImeiParamCopy]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[WriteImeiParamCopy]
@cSrcModel 		varchar(50),
@cDstModel 		varchar(50),
@iRecordCount	integer output
AS
BEGIN
	SET @iRecordCount=1
	
	SELECT * FROM Gps_WriteImei_Item WHERE ItemModel=@cSrcModel	
			    
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		alter table Gps_WriteImei_Item disable trigger all
		INSERT INTO Gps_WriteImei_Item(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_WriteImei_Item WHERE ItemModel=@cSrcModel
		alter table Gps_WriteImei_Item enable  trigger all
		
		INSERT INTO Gps_WriteImei_SrcSubItem(ItemModel,ItemName) 
			SELECT @cDstModel,ItemName 
				FROM Gps_WriteImei_Item WHERE ItemModel=@cSrcModel
	END
	
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0 
	ELSE
	BEGIN
		
				
		INSERT INTO Gps_WriteImei_SubItem(ItemModel,ItemName,SubItemName,SendAtComm,
										AtComm,ReturnText,ReSendNum,TestTimeOut,
										Compare,Remark1,Remark2) 
			SELECT @cDstModel,ItemName,SubItemName,SendAtComm,
					AtComm,ReturnText,ReSendNum,TestTimeOut,
					Compare,Remark1,Remark2
				FROM Gps_WriteImei_SubItem WHERE ItemModel=@cSrcModel
			
	END
	IF(@@ROWCOUNT <1) 
		SET @iRecordCount=0
	--ELSE
	--BEGIN
	--	INSERT INTO Gps_AutoTest_SrcSubItem(ItemModel,ItemName) 
	--		SELECT @cDstModel,ItemName 
	--			FROM Gps_AutoTestSubItem WHERE ItemModel=@cSrcModel	
	--END 
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateUserStatus]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[UpdateUserStatus] 

AS
BEGIN
	UPDATE Gps_User SET LoginStatus=0 WHERE LoginStatus=1
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTestResultForm_DeleteImei]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateTestResultForm_DeleteImei]
@cChipRid	varchar(32),
@cIMEI		varchar(15),
@cVersion	varchar(50),
@UpdateResult	integer output
AS
begin
   	DECLARE  @SqlStr  NVARCHAR(1000)

	set @UpdateResult=0
	
	--SELECT * FROM Gps_WriteImei_Result
	--WHERE SN=@cChipRid AND IMEI=@cIMEI AND Version=@cVersion
	
	
	--删除Gps_WriteImei_Result的相关记录
	DELETE FROM Gps_WriteImei_Result
	WHERE SN=@cChipRid AND IMEI=@cIMEI AND [Version]=@cVersion

	

	SELECT * FROM Gps_TestResult
	WHERE  SN=@cChipRid AND IMEI=@cIMEI AND [Version]=@cVersion
	
	IF (@@ROWCOUNT < 1) SET @UpdateResult=1
    	
	
	IF (@UpdateResult=0)
	BEGIN
		UPDATE Gps_TestResult SET IMEI='' WHERE   SN=@cChipRid AND [Version]=@cVersion
		
		IF(@@ROWCOUNT<1)  SET @UpdateResult=1   

	END
   	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateTestResultForm]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--更新Gps_TestResult表
CREATE PROCEDURE [dbo].[UpdateTestResultForm] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
--@cRemark	varchar(50),
@UpdateResult	integer output
AS
BEGIN

	SET @UpdateResult=1

	/*检测Gps_TestResult表中是否存在此SN，若不存在则新增一条，否则不管*/
	SELECT * FROM Gps_TestResult 
		WHERE	SN=@cChipRid AND SoftModel=@cSoftModel AND [Version]=@cVersion
    	
    	IF(@@ROWCOUNT <1)
	BEGIN    	
    		INSERT INTO Gps_TestResult 
			(SN,SoftModel,[Version],[IMEI])
		VALUES(@cChipRid,@CSoftModel,@CVersion,@cIMEI)
		
		IF(@@ROWCOUNT <1) SET @UpdateResult=0 
	END


	IF (@UpdateResult=1)
	BEGIN
		IF (@cFormName='Gps_FunctionTest_Result' )
			UPDATE Gps_TestResult SET FunctionResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_GpsTest_Result')
			UPDATE Gps_TestResult SET GPSResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion			
		ELSE IF (@cFormName='Gps_CoupleTest_Result')
			UPDATE Gps_TestResult SET CoupleResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_WriteImei_Result')
			UPDATE Gps_TestResult SET WriteImeiResult=@iResult,IMEI=@cIMEI WHERE SN=@cChipRid AND [Version]=@cVersion	
		ELSE IF (@cFormName='Gps_ParamDownload_Result')
			UPDATE Gps_TestResult SET ParamDownloadResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_AutoTest_Result')
			UPDATE Gps_TestResult SET AutoTestResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_AutoTestSMT_Result')
			UPDATE Gps_TestResult SET AutoTestSMTResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		ELSE IF (@cFormName='Gps_SMTIQC_Result')
			UPDATE Gps_TestResult SET SMTIQCResult=@iResult WHERE SN=@cChipRid AND [Version]=@cVersion
		/*ELSE IF (@cFormName='Gps_CartonBox_Result')
			UPDATE Gps_TestResult SET CartonBoxResult=CONVERT(nvarchar,@iResult,101 ) WHERE SN=@cChipRid AND Version=@cVersion */
		    
		IF(@@ROWCOUNT <1) SET @UpdateResult=0 			
	END
    	
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		许志强
-- Create date: 2014.10.28
-- Description:	参数配置添加订单
-- =============================================
CREATE PROCEDURE [dbo].[UpdateOrder]
@cOrderNum 	nvarchar(50),
@cImeiStart nvarchar(30),
@cImeiEnd 	nvarchar(30),
@cItemModel nvarchar(30),
@cCount    Integer,
@cTestedCount Integer,
--@cOrderTime datetime,
@Status Integer,
@UpdateResult	integer output
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
    SET @UpdateResult=1
    DECLARE  @SqlStr  NVARCHAR(1000)
	--SET @SqlStr='SELECT * FROM Gps_ParamConfigOrder where OrderNum='''+@cOrderNum+'''AND IMEISTART=''' +@cImeiStart+'''AND IMEIEND= ''' +@cImeiEnd+''''
	SET @SqlStr='SELECT * FROM Gps_ParamConfigOrder where OrderNum='''+@cOrderNum+''''
	
	EXEC(@SqlStr)
	IF @@ROWCOUNT < 1
	BEGIN
	   --SET @SqlStr='INSERT INTO Gps_ParamConfigOrder(OrderNum,IMEISTART,IMEIEND,ItemModel,Count,TestedCount,OrderTime,Status) values('''+@cOrderNum+''','''+@cImeiStart+''','''+@cImeiEnd+''','''+@cItemModel+','+@cCount+','+@cTestedCount+','+@Status+''')' 
	   INSERT INTO Gps_ParamConfigOrder 
			(OrderNum,IMEISTART,IMEIEND,ItemModel,Count,TestedCount,Status)
		VALUES(@cOrderNum,@cImeiStart,@cImeiEnd,@cItemModel,@cCount,@cTestedCount,@Status)
		IF(@@ROWCOUNT <1) SET @UpdateResult=0 
	END
	ELSE
	BEGIN
	    --UPDATE Gps_ParamConfigOrder SET TestedCount=TestedCount+1 WHERE OrderNum=@cOrderNum AND IMEISTART=@cImeiStart AND IMEIEND=@cImeiEnd
	    --IF(@@ROWCOUNT <1) SET @UpdateResult=0 
	    SET @UpdateResult=0 
	END
	--SELECT	'Return Value' = @UpdateResult
END
GO
/****** Object:  StoredProcedure [dbo].[UpdateGpsTcData]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateGpsTcData] 
@cChipRid	varchar(32),
@cFixMode	varchar(20),
@iGpsDb0	integer,
@iGpsDb1	integer,
@iGpsDb2	integer,
@iGpsDb3	integer,
@iGpsDb4	integer,
@iGpsDb5	integer,
@iGpsDb6	integer,
@iGpsDb7	integer,
@iGpsDb8	integer,
@iGpsDb9	integer,
@iGpsDb10	integer,
@iGpsDb11	integer,
@UpdateResult	integer output
AS
BEGIN

	SELECT * FROM GPSTcData WHERE SN=@cChipRid
	
	IF(@@ROWCOUNT <1)
		INSERT GPSTcData (SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11)
		VALUES(@cChipRid,@cFixMode,@iGpsDb0,@iGpsDb1,@iGpsDb2,@iGpsDb3,@iGpsDb4,@iGpsDb5,@iGpsDb6,@iGpsDb7,@iGpsDb8,@iGpsDb9,@iGpsDb10,@iGpsDb11)
	ELSE
		UPDATE GPSTcData SET FixMode=@cFixMode,GpsDb_0=@iGpsDb0,GpsDb_1=@iGpsDb1,GpsDb_2=@iGpsDb2,GpsDb_3=@iGpsDb3,GpsDb_4=@iGpsDb4,GpsDb_5=@iGpsDb5,
			GpsDb_6=@iGpsDb6,GpsDb_7=@iGpsDb7,GpsDb_8=@iGpsDb8,GpsDb_9=@iGpsDb9,GpsDb_10=@iGpsDb10,GpsDb_11=@iGpsDb11 WHERE SN=@cChipRid 

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateGpsSMT_TcData]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[UpdateGpsSMT_TcData] 
@cChipRid	varchar(32),
@cFixMode	varchar(20),
@iGpsDb0	integer,
@iGpsDb1	integer,
@iGpsDb2	integer,
@iGpsDb3	integer,
@iGpsDb4	integer,
@iGpsDb5	integer,
@iGpsDb6	integer,
@iGpsDb7	integer,
@iGpsDb8	integer,
@iGpsDb9	integer,
@iGpsDb10	integer,
@iGpsDb11	integer,
@UpdateResult	integer output
AS
BEGIN

	SELECT * FROM GpsSMT_TcData WHERE SN=@cChipRid
	
	IF(@@ROWCOUNT <1)
		INSERT GpsSMT_TcData (SN,FixMode,GpsDb_0,GpsDb_1,GpsDb_2,GpsDb_3,GpsDb_4,GpsDb_5,GpsDb_6,GpsDb_7,GpsDb_8,GpsDb_9,GpsDb_10,GpsDb_11)
		VALUES(@cChipRid,@cFixMode,@iGpsDb0,@iGpsDb1,@iGpsDb2,@iGpsDb3,@iGpsDb4,@iGpsDb5,@iGpsDb6,@iGpsDb7,@iGpsDb8,@iGpsDb9,@iGpsDb10,@iGpsDb11)
	ELSE
		UPDATE GpsSMT_TcData SET FixMode=@cFixMode,GpsDb_0=@iGpsDb0,GpsDb_1=@iGpsDb1,GpsDb_2=@iGpsDb2,GpsDb_3=@iGpsDb3,GpsDb_4=@iGpsDb4,GpsDb_5=@iGpsDb5,
			GpsDb_6=@iGpsDb6,GpsDb_7=@iGpsDb7,GpsDb_8=@iGpsDb8,GpsDb_9=@iGpsDb9,GpsDb_10=@iGpsDb10,GpsDb_11=@iGpsDb11 WHERE SN=@cChipRid 

END
GO
/****** Object:  StoredProcedure [dbo].[UpdateForm]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[UpdateForm] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
--@cRemark	varchar(50),
@UpdateResult	integer output
AS
BEGIN

	/*更新Gps_TestResult表*/	
	EXEC  UpdateTestResultForm @cFormName,@cChipRid,@cSoftModel,@cVersion,@cIMEI,@iResult,@cTester/*,@cRemark*/,@UpdateResult output

	/*更新相对应的测试位结果表*/
	IF @UpdateResult=1
	BEGIN
		SELECT @cIMEI=IMEI FROM GPS_TestResult WHERE SN=@cChipRid
		IF(@@ROWCOUNT <1) SET @cIMEI=''
		DECLARE  @SqlStr  NVARCHAR(1000)
		/*检测测试工位表中是否存在此SN，若不存在则新增一条，否则更新内容*/
		SET @SqlStr='select * from '+@cFormName+' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
    		EXEC(@SqlStr )
    	
    		IF(@@ROWCOUNT <1)
		BEGIN	    	
	    		SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''')' 
	    		--SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId,Remark) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''','+@cRemark+','')'  
	    		EXEC(@SqlStr)
		END
		ELSE
		BEGIN	
			SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
			--SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''',Remark='''+@cRemark+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
	    		EXEC(@SqlStr)

	
		END
	END

END
GO
/****** Object:  StoredProcedure [dbo].[SMTUpdateForm]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SMTUpdateForm] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
@GpsDBValue varchar(10),
--@cRemark	varchar(50),
@UpdateResult	integer output
AS
BEGIN

	/*更新Gps_TestResult表*/	
	EXEC  UpdateTestResultForm @cFormName,@cChipRid,@cSoftModel,@cVersion,@cIMEI,@iResult,@cTester/*,@cRemark*/,@UpdateResult output

	/*更新相对应的测试位结果表*/
	IF @UpdateResult=1
	BEGIN
		SELECT @cIMEI=IMEI FROM GPS_TestResult WHERE SN=@cChipRid
		IF(@@ROWCOUNT <1) SET @cIMEI=''
				DECLARE  @SqlStr  NVARCHAR(1000)
		/*检测测试工位表中是否存在此SN，若不存在则新增一条，否则更新内容*/
		SET @SqlStr='select * from '+@cFormName+' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
    		EXEC(@SqlStr )
    	IF(@@ROWCOUNT <1)
		BEGIN	
    		IF (@cFormName='Gps_AutoTestSMT_Result')
			BEGIN	
	    		SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId,GpsDBValue) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''','''+@GpsDBValue+''')' 
	    		EXEC(@SqlStr)
	    	END
			ELSE
			BEGIN	
				SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''')' 
	    		EXEC(@SqlStr)
			END
		END
		ELSE
		BEGIN
		    IF (@cFormName='Gps_AutoTestSMT_Result')
		    BEGIN
		        SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''',GpsDBValue='''+@GpsDBValue+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
				EXEC(@SqlStr)
		    END 
		    ELSE
		    BEGIN
		        SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
				EXEC(@SqlStr)
		    END 
		END
	END
	
	select @UpdateResult 

END
GO
/****** Object:  StoredProcedure [dbo].[ParamDownUpdateForm]    Script Date: 11/23/2017 11:25:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ParamDownUpdateForm] 
@cFormName 	varchar(30),
@cChipRid	varchar(32),
@cSoftModel	varchar(20),
@cVersion	varchar(50),
@cVersionS	varchar(50),
@cIMEI		varchar(15),
@iResult	integer,
@cTester	varchar(20),
--@cRemark	varchar(50),
@UpdateResult	integer output
AS
BEGIN

	/*更新Gps_TestResult表*/	
	EXEC  UpdateTestResultForm @cFormName,@cChipRid,@cSoftModel,@cVersion,@cIMEI,@iResult,@cTester/*,@cRemark*/,@UpdateResult output

	/*更新相对应的测试位结果表*/
	IF @UpdateResult=1
	BEGIN
		SELECT @cIMEI=IMEI FROM GPS_TestResult WHERE SN=@cChipRid
		IF(@@ROWCOUNT <1) SET @cIMEI=''
		DECLARE  @SqlStr  NVARCHAR(1000)
		/*检测测试工位表中是否存在此SN，若不存在则新增一条，否则更新内容*/
		SET @SqlStr='select * from '+@cFormName+' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
    		EXEC(@SqlStr )
    	
    		IF(@@ROWCOUNT <1)
		BEGIN	    	
	    		SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@cVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''')' 
	    		--SET @SqlStr='insert into '+@cFormName+'(SN,SoftModel,Version,IMEI,Result,TesterId,Remark) values ('''+@cChipRid+''','''+@cSoftModel+''','''+@CVersion+''','''+@cIMEI+''','+CONVERT(nvarchar,@iResult,101 )+','''+@cTester+''','+@cRemark+','')'  
	    		EXEC(@SqlStr)
	    		IF(@@ROWCOUNT<1) SET @UpdateResult=0
		END
		ELSE
		BEGIN	
			SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
			--SET @SqlStr='Update  '+@cFormName+' SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',IMEI='''+@cIMEI+''',Remark='''+@cRemark+''' where SN='''+@cChipRid+'''and Version = '''+@cVersion+''''
	    		EXEC(@SqlStr)

	
		END
	END
	IF @UpdateResult=1
	BEGIN
		SET @SqlStr='select * from Gps_ParamDownVersionCpd where IMEI='''+@cIMEI +'''and SN='''+@cChipRid+''''
    		EXEC(@SqlStr )
    	IF(@@ROWCOUNT <1)
		BEGIN	
		    INSERT INTO Gps_ParamDownVersionCpd(SN,SoftModel,Version,VersionS,IMEI,Result,TesterId) values(@cChipRid,@cSoftModel,@cVersion,@cVersionS,@cIMEI,@iResult,@cTester)
		    IF(@@ROWCOUNT <1) SET @UpdateResult=0     	
		END
		ELSE
		BEGIN
		    SET @SqlStr='Update  Gps_ParamDownVersionCpd SET Result='+CONVERT(nvarchar,@iResult,101 )+',TesterId='''+ @cTester +''',Version='''+@cVersion+''',VersionS='''+@cVersionS+''' where SN='''+@cChipRid+'''and IMEI = '''+@cIMEI+''''
			EXEC(@SqlStr)
		END	
	    
	END
	
	IF @UpdateResult=0
	BEGIN
	    Update Gps_TestResult  Set ParamDownloadResult=0 where SN=@cChipRid and IMEI=@cIMEI and Version=@cVersion 
	    Delete FROM  Gps_ParamDownload_Result where SN=@cChipRid and IMEI=@cIMEI and Version=@cVersion
	END
	
END
GO
