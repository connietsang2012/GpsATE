USE [master]
GO
/****** Object:  Database [GPSTest]    Script Date: 11/15/2017 18:34:22 ******/
CREATE DATABASE [GPSTest] ON  PRIMARY 
( NAME = N'GPSTest', FILENAME = N'D:\GPSTest_DataBase\GPSTest.mdf' , SIZE = 49239808KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
 LOG ON 
( NAME = N'GPSTest_log', FILENAME = N'D:\GPSTest_DataBase\GPSTest_log.LDF' , SIZE = 8184KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10240KB )
GO
ALTER DATABASE [GPSTest] SET COMPATIBILITY_LEVEL = 100
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [GPSTest].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [GPSTest] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [GPSTest] SET ANSI_NULLS OFF
GO
ALTER DATABASE [GPSTest] SET ANSI_PADDING OFF
GO
ALTER DATABASE [GPSTest] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [GPSTest] SET ARITHABORT OFF
GO
ALTER DATABASE [GPSTest] SET AUTO_CLOSE OFF
GO
ALTER DATABASE [GPSTest] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [GPSTest] SET AUTO_SHRINK ON
GO
ALTER DATABASE [GPSTest] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [GPSTest] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [GPSTest] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [GPSTest] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [GPSTest] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [GPSTest] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [GPSTest] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [GPSTest] SET  DISABLE_BROKER
GO
ALTER DATABASE [GPSTest] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [GPSTest] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [GPSTest] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [GPSTest] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [GPSTest] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [GPSTest] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [GPSTest] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [GPSTest] SET  READ_WRITE
GO
ALTER DATABASE [GPSTest] SET RECOVERY SIMPLE
GO
ALTER DATABASE [GPSTest] SET  MULTI_USER
GO
ALTER DATABASE [GPSTest] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [GPSTest] SET DB_CHAINING OFF
GO
EXEC sys.sp_db_vardecimal_storage_format N'GPSTest', N'ON'
GO
USE [GPSTest]
GO
/****** Object:  User [szjimi]    Script Date: 11/15/2017 18:34:22 ******/
CREATE USER [szjimi] FOR LOGIN [szjimi] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [satest1]    Script Date: 11/15/2017 18:34:22 ******/
CREATE USER [satest1] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [onlyself]    Script Date: 11/15/2017 18:34:22 ******/
CREATE USER [onlyself] FOR LOGIN [onlyself] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  Role [sa2_client]    Script Date: 11/15/2017 18:34:23 ******/
CREATE ROLE [sa2_client] AUTHORIZATION [dbo]
GO
/****** Object:  Table [dbo].[Gps_VersionModel]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_VersionModel](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Version] [varchar](100) NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[bReadRID] [bit] NOT NULL,
	[TotalModel] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsVersionModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_1d9fb2cee8b34b7ab3386e0081b0761d] ON [dbo].[Gps_VersionModel] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_UserType]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_UserType](
	[TypeId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TypeName] [varchar](20) NOT NULL,
	[TypeDes] [varchar](20) NOT NULL,
	[TestAutoTestSMT] [bit] NOT NULL,
	[TestSMTOQC] [bit] NOT NULL,
	[TestCouple] [bit] NOT NULL,
	[TestParamDownload] [bit] NOT NULL,
	[TestAutoTest] [bit] NOT NULL,
	[TestWriteImei] [bit] NOT NULL,
	[TestTwice] [bit] NOT NULL,
	[TestIncomCheck] [bit] NOT NULL,
	[TestReadBackRom] [bit] NOT NULL,
	[TestCartonBox] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED 
(
	[TypeId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TypeName] UNIQUE NONCLUSTERED 
(
	[TypeName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_8f33caa1fc924c3595854a3d87869518] ON [dbo].[Gps_UserType] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_User]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_User](
	[UserId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[UserDes] [varchar](20) NOT NULL,
	[UserPwd] [varchar](20) NOT NULL,
	[UserType] [varchar](20) NOT NULL,
	[UserTestPlan] [varchar](20) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginStatus] [int] NOT NULL,
	[InService] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_User] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_a4f3262b38de4cf7a4dbff4f7172ccd2] ON [dbo].[Gps_User] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestWrong]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestWrong](
	[WrongId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[WrongName] [varchar](20) NOT NULL,
	[WrongDes] [varchar](100) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestWrong] PRIMARY KEY CLUSTERED 
(
	[WrongId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TestWrong] UNIQUE NONCLUSTERED 
(
	[WrongName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_26090be40e6041ee93a9ddc78cec411d] ON [dbo].[Gps_TestWrong] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestResult2]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestResult2](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result]  AS (((([FunctionResult]&[GPSResult])&[CoupleResult])&[WriteImeiResult])&[ParamDownloadResult]),
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestResult2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TestResult2] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_329835e76e2848e88b75a54c2448351b] ON [dbo].[Gps_TestResult2] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestResult_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestResult_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result]  AS (((([FunctionResult]&[GPSResult])&[CoupleResult])&[WriteImeiResult])&[ParamDownloadResult]),
	[AutoTestSMTResult] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestResult_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_38bb647efa3b4d5995985bb3d332f606] ON [dbo].[Gps_TestResult_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestResult]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestResult](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result]  AS (((([FunctionResult]&[GPSResult])&[CoupleResult])&[WriteImeiResult])&[ParamDownloadResult]),
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestResult] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_52eb10c275f842708a1729426240d778] ON [dbo].[Gps_TestResult] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [IMEILimit] ON [dbo].[Gps_TestResult] 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SN_IMEI_SM_VERSION] ON [dbo].[Gps_TestResult] 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC,
	[Version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestPlanSet]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestPlanSet](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[TestFunction] [bit] NOT NULL,
	[TestGPS] [bit] NOT NULL,
	[TestCouple] [bit] NOT NULL,
	[TestWriteImei] [bit] NOT NULL,
	[TestParamDownload] [bit] NOT NULL,
	[TestCartonBox] [bit] NOT NULL,
	[TestAutoTest] [bit] NOT NULL,
	[TestAutoTestSMT] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestPlanSet] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_2e52cd859e1c4476b305a76b937b14e1] ON [dbo].[Gps_TestPlanSet] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestPlan]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestPlan](
	[TestPlanId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[TestPlanName] [varchar](20) NOT NULL,
	[TestPlanDes] [varchar](20) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestPlan] PRIMARY KEY CLUSTERED 
(
	[TestPlanId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TestPlan] UNIQUE NONCLUSTERED 
(
	[TestPlanName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_21fd06674046479aa1c1635c419642bb] ON [dbo].[Gps_TestPlan] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestParamter]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestParamter](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[CoupleTestTestTime] [int] NULL,
	[ParamDownloadTestTime] [int] NULL,
	[AutoTestTestTime] [int] NULL,
	[WriteImeiTestTime] [int] NULL,
	[TwiceTestTime] [int] NULL,
	[GPSNumbers] [int] NULL,
	[GPSDb] [int] NULL,
	[EPOLatitude] [varchar](20) NULL,
	[EPOLongitude] [varchar](20) NULL,
	[EPOAltitude] [varchar](20) NULL,
	[CheckTestTime] [int] NULL,
	[CheckTestAtCommand] [varchar](50) NULL,
	[CheckTestAtReturn] [varchar](50) NULL,
	[CheckTestAtTimeOut] [int] NULL,
	[CheckTestAllowTestCount] [int] NULL,
	[SMT_AutoTestTestTime] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
	[Percentage] [int] NULL,
 CONSTRAINT [PK_TestParamter] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_f87b887aa6a34d4aba76444e6a8d05da] ON [dbo].[Gps_TestParamter] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestFail_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestFail_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[TestPlan] [varchar](20) NOT NULL,
	[TestWrong] [varchar](20) NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestFail_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_6d585fe95ffe4518aa7c8b6bdf31c9fb] ON [dbo].[Gps_TestFail_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TestFail]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TestFail](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[TestPlan] [varchar](20) NOT NULL,
	[TestWrong] [varchar](20) NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TestFail] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TestFail] UNIQUE NONCLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_1df6c83cc85947cbac17a8e8ca96920a] ON [dbo].[Gps_TestFail] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_TempImei]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_TempImei](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DT] [datetime] NOT NULL,
	[CharNo] [varchar](15) NOT NULL,
	[CharSN] [varchar](32) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_TempImei] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TempImei] UNIQUE NONCLUSTERED 
(
	[CharNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_TempSN] UNIQUE NONCLUSTERED 
(
	[CharSN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_1ab031d1c4df4439bc2022106c420db5] ON [dbo].[Gps_TempImei] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GpsTcData]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GpsTcData](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[FixMode] [varchar](30) NOT NULL,
	[GpsDb_0] [int] NULL,
	[GpsDb_1] [int] NULL,
	[GpsDb_2] [int] NULL,
	[GpsDb_3] [int] NULL,
	[GpsDb_4] [int] NULL,
	[GpsDb_5] [int] NULL,
	[GpsDb_6] [int] NULL,
	[GpsDb_7] [int] NULL,
	[GpsDb_8] [int] NULL,
	[GpsDb_9] [int] NULL,
	[GpsDb_10] [int] NULL,
	[GpsDb_11] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsTcData_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_GpsTcData_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_96ad5514bcef419cb88f9ac706ad3c64] ON [dbo].[GpsTcData] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GpsSMT_TcData]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GpsSMT_TcData](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[FixMode] [varchar](30) NOT NULL,
	[GpsDb_0] [int] NULL,
	[GpsDb_1] [int] NULL,
	[GpsDb_2] [int] NULL,
	[GpsDb_3] [int] NULL,
	[GpsDb_4] [int] NULL,
	[GpsDb_5] [int] NULL,
	[GpsDb_6] [int] NULL,
	[GpsDb_7] [int] NULL,
	[GpsDb_8] [int] NULL,
	[GpsDb_9] [int] NULL,
	[GpsDb_10] [int] NULL,
	[GpsDb_11] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_c4ff37e57afe4d34850c4e01bcb57837] ON [dbo].[GpsSMT_TcData] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_WriteImei_SubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_WriteImei_SubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[SubItemName] [varchar](50) NOT NULL,
	[SendAtComm] [bit] NOT NULL,
	[AtComm] [varchar](100) NOT NULL,
	[ReturnText] [varchar](100) NOT NULL,
	[ReSendNum] [int] NOT NULL,
	[TestTimeOut] [int] NOT NULL,
	[Compare] [bit] NULL,
	[CompareValue] [varchar](100) NULL,
	[CompareRemark] [varchar](200) NULL,
	[Remark1] [nchar](10) NULL,
	[Remark2] [nchar](10) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_WriteImei_SubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_40814e54812e441c9ec96da0a448af30] ON [dbo].[Gps_WriteImei_SubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_WriteImei_SrcSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_WriteImei_SrcSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_WriteImei_SrcItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_4216dd826b454c9f9edb74d12fe3ef55] ON [dbo].[Gps_WriteImei_SrcSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_WriteImei_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_WriteImei_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_WriteImei_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_66496915d03d451c910321bd56e24aec] ON [dbo].[Gps_WriteImei_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LUserAccount]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LUserAccount](
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UserType] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_33a827d522ec4000bb0bcb1a3fd26963] ON [dbo].[LUserAccount] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LTestLogMessage]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LTestLogMessage](
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](50) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](30) NOT NULL,
	[ErrorMessage1] [nvarchar](max) NULL,
	[CategoryNum1] [varchar](128) NULL,
	[ErrorMessage2] [nvarchar](max) NULL,
	[CategoryNum2] [varchar](128) NULL,
	[ErrorMessage3] [nvarchar](max) NULL,
	[CategoryNum3] [varchar](128) NULL,
	[ErrorMessage4] [nvarchar](max) NULL,
	[CategoryNum4] [varchar](128) NULL,
	[Computer] [varchar](100) NULL,
	[Computer2] [varchar](100) NULL,
	[Computer3] [varchar](100) NULL,
	[Computer4] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_b0e2a514e2f648a4a40e8dc86293d4a8] ON [dbo].[LTestLogMessage] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [SNVersionModel] ON [dbo].[LTestLogMessage] 
(
	[SN] ASC,
	[SoftModel] ASC,
	[Version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTUserAccount]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTUserAccount](
	[Name] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[UserType] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_a0d7b16f23b44742ac7b0fa5abfb6c52] ON [dbo].[LSMTUserAccount] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTRunLog]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTRunLog](
	[ZhiDan] [varchar](max) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[LoginID] [varchar](128) NOT NULL,
	[Operator] [varchar](50) NOT NULL,
	[Message1] [varchar](max) NOT NULL,
	[Category1] [varchar](128) NOT NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTOrderLine]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTOrderLine](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[StateSign] [varchar](50) NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LSMTOrderLine] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC,
	[LineNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_479b18a929364029892637fe4b7ee5e9] ON [dbo].[LSMTOrderLine] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTMaterialPos]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTMaterialPos](
	[MaterialNumber] [varchar](50) NOT NULL,
	[MaterialName] [varchar](50) NOT NULL,
	[MaterialModel] [varchar](max) NULL,
	[StoreHouse] [varchar](50) NULL,
	[Region] [varchar](50) NULL,
	[Row] [varchar](50) NULL,
	[Layer] [varchar](50) NULL,
	[SerialNumber] [varchar](50) NULL,
	[RecordTime] [datetime] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE NONCLUSTERED INDEX [MN] ON [dbo].[LSMTMaterialPos] 
(
	[MaterialNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [NAME] ON [dbo].[LSMTMaterialPos] 
(
	[MaterialName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTMaterialPick]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTMaterialPick](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[Setting5] [varchar](max) NULL,
	[Setting6] [varchar](256) NULL,
	[Setting7] [varchar](256) NULL,
	[Setting8] [varchar](256) NULL,
	[Setting9] [varchar](256) NULL,
	[Setting10] [varchar](256) NULL,
	[Setting11] [varchar](256) NULL,
	[Setting12] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_6be3220e278e4a5abb587ed4a529ca2c] ON [dbo].[LSMTMaterialPick] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Setting3Index] ON [dbo].[LSMTMaterialPick] 
(
	[Setting3] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [Setting4Index] ON [dbo].[LSMTMaterialPick] 
(
	[Setting4] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTMaterialIssue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTMaterialIssue](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[Setting5] [varchar](256) NULL,
	[Setting6] [varchar](256) NULL,
	[Setting7] [varchar](256) NULL,
	[Setting8] [varchar](256) NULL,
	[Setting9] [varchar](256) NULL,
	[Setting10] [varchar](256) NULL,
	[Setting11] [varchar](256) NULL,
	[Setting12] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_081e5c4b435a4b6da0f65de6fb015409] ON [dbo].[LSMTMaterialIssue] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTFeedState]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTFeedState](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[LoginID] [varchar](128) NOT NULL,
	[Operator] [varchar](50) NOT NULL,
	[MaterialNumber] [varchar](50) NOT NULL,
	[MaterialStation] [varchar](50) NOT NULL,
	[MaterialTime] [varchar](50) NOT NULL,
	[MaterialCount] [varchar](50) NOT NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTCompleteBom]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTCompleteBom](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[Setting5] [varchar](256) NULL,
	[Setting6] [varchar](256) NULL,
	[Setting7] [varchar](256) NULL,
	[Setting8] [varchar](256) NULL,
	[Setting9] [varchar](256) NULL,
	[Setting10] [varchar](256) NULL,
	[Setting11] [varchar](256) NULL,
	[Setting12] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTCarOrder]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTCarOrder](
	[CarNumber] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](max) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTCarDetail]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTCarDetail](
	[CarNumber] [varchar](50) NOT NULL,
	[DoorNumber] [varchar](50) NOT NULL,
	[DoorType] [varchar](50) NOT NULL,
	[DoorState] [varchar](50) NOT NULL,
	[MaterialNumber] [varchar](50) NULL,
	[ZhiDan] [varchar](100) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_27498f2736074163969facebfbf5fc44] ON [dbo].[LSMTCarDetail] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [ONLYCarNumber_DoorType] ON [dbo].[LSMTCarDetail] 
(
	[CarNumber] ASC,
	[DoorNumber] ASC,
	[DoorType] ASC,
	[DoorState] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LSMTBomAll]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTBomAll](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[StateSign] [varchar](50) NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LSMTBomAll] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC,
	[LineNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTAdvConnFeederDiff]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTAdvConnFeederDiff](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[StationCount] [varchar](256) NOT NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LSMTAdvConnFeederDiff] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC,
	[LineNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTAdvConnFeeder]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTAdvConnFeeder](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[StationCount] [varchar](256) NOT NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LSMTAdvConnFeeder] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC,
	[LineNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LSMTAdvConnDetail]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LSMTAdvConnDetail](
	[ZhiDan] [varchar](100) NOT NULL,
	[LineNum] [varchar](50) NOT NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[Setting5] [varchar](256) NULL,
	[Setting6] [varchar](256) NULL,
	[Setting7] [varchar](256) NULL,
	[Setting8] [varchar](256) NULL,
	[Setting9] [varchar](256) NULL,
	[Setting10] [varchar](256) NULL,
	[Setting11] [varchar](256) NULL,
	[Setting12] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LPrintMarkData]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LPrintMarkData](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LPrintMarkData] PRIMARY KEY CLUSTERED 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_171c49e2f5cc48ff9c180222b0dcdff4] ON [dbo].[LPrintMarkData] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LOrderMessage]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOrderMessage](
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](50) NOT NULL,
	[StateSign] [varchar](50) NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[Setting5] [varchar](256) NULL,
	[Setting6] [varchar](256) NULL,
	[Setting7] [varchar](256) NULL,
	[Setting8] [varchar](256) NULL,
	[Setting9] [varchar](256) NULL,
	[Setting10] [varchar](256) NULL,
	[Setting11] [varchar](256) NULL,
	[Setting12] [varchar](256) NULL,
	[Setting13] [varchar](256) NULL,
	[Setting14] [varchar](256) NULL,
	[Setting15] [varchar](256) NULL,
	[Setting16] [varchar](256) NULL,
	[Setting17] [varchar](256) NULL,
	[Setting18] [varchar](256) NULL,
	[Setting19] [varchar](256) NULL,
	[Setting20] [varchar](256) NULL,
	[Setting21] [varchar](256) NULL,
	[Setting22] [varchar](256) NULL,
	[Setting23] [varchar](256) NULL,
	[Setting24] [varchar](256) NULL,
	[Setting25] [varchar](256) NULL,
	[Setting26] [varchar](256) NULL,
	[Setting27] [varchar](256) NULL,
	[Setting28] [varchar](256) NULL,
	[Setting29] [varchar](256) NULL,
	[Setting30] [varchar](256) NULL,
	[Setting31] [varchar](256) NULL,
	[Setting32] [varchar](256) NULL,
	[Setting33] [varchar](256) NULL,
	[Setting34] [varchar](256) NULL,
	[Setting35] [varchar](256) NULL,
	[Setting36] [varchar](256) NULL,
	[Setting37] [varchar](256) NULL,
	[Setting38] [varchar](256) NULL,
	[Setting39] [varchar](256) NULL,
	[Setting40] [varchar](256) NULL,
	[Setting41] [varchar](256) NULL,
	[Setting42] [varchar](256) NULL,
	[Setting43] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LOrderMessage] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_cad90626cc5f41e6a520d5ac1f4fe833] ON [dbo].[LOrderMessage] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_SrcSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_SrcSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SoftModel] [varchar](50) NOT NULL,
	[ParentId] [int] NOT NULL,
	[SubTestItemId] [int] NOT NULL,
	[SubTestItemName] [varchar](50) NOT NULL,
	[SubTestItemDes] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_SrcSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_25577db2c2c24668925b1b83b10fb39f] ON [dbo].[Gps_SrcSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_SMTIQC_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_SMTIQC_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_SMTIQC_Backup_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_SMTIQC_Result_Backup_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_58973724ee3644a3a5513dbc3ba9163e] ON [dbo].[Gps_SMTIQC_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_SMTIQC_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_SMTIQC_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_SMTIQC_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_SMTIQC_Result_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_fe3fe94a68994f47b6e95eb6859981f4] ON [dbo].[Gps_SMTIQC_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_Set]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_Set](
	[SetId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[SnPro] [varchar](4) NOT NULL,
	[SnDate] [varchar](4) NOT NULL,
	[SnBegin] [varchar](6) NOT NULL,
	[SnEnd] [varchar](6) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Set] PRIMARY KEY CLUSTERED 
(
	[SetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_f2888cbdce674e16abcceb7356538e1f] ON [dbo].[Gps_Set] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownVersionCpd_BackUp]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownVersionCpd_BackUp](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[VersionS] [varchar](50) NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamDownVersionCpd_BackUp] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_6c8b95f7d62946aaa089c037a9bf3e5f] ON [dbo].[Gps_ParamDownVersionCpd_BackUp] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownVersionCpd]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownVersionCpd](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[VersionS] [varchar](50) NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamDownUpdate_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_46bcdd6b4f174f439e2876026216dadb] ON [dbo].[Gps_ParamDownVersionCpd] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [SNIMEI_Gps_ParamDownUpdate_Backup] ON [dbo].[Gps_ParamDownVersionCpd] 
(
	[SN] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownloadSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownloadSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[SubItemName] [varchar](50) NOT NULL,
	[SendAtComm] [bit] NOT NULL,
	[AtComm] [varchar](100) NOT NULL,
	[ReturnText] [varchar](100) NOT NULL,
	[ReSendNum] [int] NOT NULL,
	[TestTimeOut] [int] NOT NULL,
	[Compare] [bit] NOT NULL,
	[CompareValue] [varchar](100) NULL,
	[CompareRemark] [varchar](200) NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamDownloadSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_fd0f54997f0b4ca78e88d369f319f353] ON [dbo].[Gps_ParamDownloadSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_BoxCont]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_BoxCont](
	[Id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BoxNo] [varchar](200) NOT NULL,
	[SN] [varchar](200) NOT NULL,
	[Version] [varchar](200) NULL,
	[TestTime] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_AutoTestSMT_BoxCont] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_b6a72ccc7fd140f887f3de6a9add85a4] ON [dbo].[Gps_AutoTestSMT_BoxCont] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownload_SrcSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownload_SrcSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParamDownloadSrcSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_3088484d51044caeaa70ee0498861454] ON [dbo].[Gps_ParamDownload_SrcSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownload_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownload_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParamDownload_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_37e0d2f7833f4654ac827993b24fd390] ON [dbo].[Gps_ParamDownload_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownload_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownload_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParamDownload_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_ParamDownload_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_77dde29675e64d87b4e701e024c9a753] ON [dbo].[Gps_ParamDownload_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamConfigOrder]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamConfigOrder](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OrderNum] [nvarchar](50) NOT NULL,
	[IMEISTART] [varchar](15) NOT NULL,
	[IMEIEND] [varchar](15) NOT NULL,
	[ItemModel] [nvarchar](50) NOT NULL,
	[Count] [int] NOT NULL,
	[TestedCount] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamConfigOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Gps_ParamConfigOrder_OR] UNIQUE NONCLUSTERED 
(
	[OrderNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_8f167303e5d5486ea1fadc008b21cd6a] ON [dbo].[Gps_ParamConfigOrder] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_OQC_SubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_OQC_SubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[SubItemName] [varchar](50) NOT NULL,
	[SendAtComm] [bit] NOT NULL,
	[AtComm] [varchar](100) NOT NULL,
	[ReturnText] [varchar](100) NOT NULL,
	[ReSendNum] [int] NOT NULL,
	[TestTimeOut] [int] NOT NULL,
	[Compare] [bit] NULL,
	[CompareValue] [varchar](100) NULL,
	[CompareRemark] [varchar](200) NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_OQCSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_ebd556ac144d49a381718c03cd9788d8] ON [dbo].[Gps_OQC_SubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_OQC_SrcSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_OQC_SrcSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](30) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_OQC_SrcSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_ea6696692aad48efa77c6f50ec6b62b5] ON [dbo].[Gps_OQC_SrcSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_CoupleTest_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CoupleTest_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CoupleTest_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_d44fdc62b9a1406f8c929967c5296cb8] ON [dbo].[Gps_CoupleTest_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_CoupleTest_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CoupleTest_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[ZhiDan] [varchar](100) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[Computer] [varchar](100) NULL,
	[TestSetting] [varchar](max) NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CoupleTest_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_CoupleTest_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_ebc7e265e1564b748b17ebe3f2e2f972] ON [dbo].[Gps_CoupleTest_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IMEIONLY] ON [dbo].[Gps_CoupleTest_Result] 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime_Result] ON [dbo].[Gps_CoupleTest_Result] 
(
	[ZhiDan] ASC,
	[TestTime] ASC,
	[Result] ASC
)
INCLUDE ( [SoftModel],
[Computer]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime_SoftModel] ON [dbo].[Gps_CoupleTest_Result] 
(
	[TestTime] ASC,
	[ZhiDan] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_CartonBoxTen_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CartonBoxTen_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](15) NOT NULL,
	[Color] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[TACInfo] [varchar](200) NULL,
	[OtherInfo] [varchar](200) NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_CartonBoxTwenty_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Gps_CartonBoxTwenty_Result] UNIQUE NONCLUSTERED 
(
	[BoxNo] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_f0b0fd21eea94331a8d8da1a151e8c22] ON [dbo].[Gps_CartonBoxTen_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_CartonBox_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CartonBox_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CartonBox_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_d932ac3ea833467286b4617a221b07f4] ON [dbo].[Gps_CartonBox_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_CartonBox_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CartonBox_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CartonBox_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_CartonBox_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_25ee81c5662c42569de3050963540604] ON [dbo].[Gps_CartonBox_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[SubItemName] [varchar](50) NOT NULL,
	[SendAtComm] [bit] NOT NULL,
	[AtComm] [varchar](100) NOT NULL,
	[ReturnText] [varchar](100) NOT NULL,
	[ReSendNum] [int] NOT NULL,
	[TestTimeOut] [int] NOT NULL,
	[Compare] [bit] NOT NULL,
	[CompareValue] [varchar](100) NULL,
	[CompareRemark] [varchar](200) NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_AutoTestSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_529d45ad7470408993f62c1edc0bc85d] ON [dbo].[Gps_AutoTestSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMTSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMTSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[SubItemName] [varchar](50) NOT NULL,
	[SendAtComm] [bit] NOT NULL,
	[AtComm] [varchar](100) NOT NULL,
	[ReturnText] [varchar](100) NOT NULL,
	[ReSendNum] [int] NOT NULL,
	[TestTimeOut] [int] NOT NULL,
	[Compare] [bit] NOT NULL,
	[CompareValue] [varchar](100) NULL,
	[CompareRemark] [varchar](200) NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_AutoTestSMTSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_bae4e051168f40ea9ec8869eadd0e711] ON [dbo].[Gps_AutoTestSMTSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_SrcSubItem]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_SrcSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSMTSrcSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_429e7639fdb0408487b35b6a7602c86f] ON [dbo].[Gps_AutoTestSMT_SrcSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[GpsDBValue] [int] NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSMT_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_150dc5b4250a4e1c9abd7f4970ce3199] ON [dbo].[Gps_AutoTestSMT_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[GpsDBValue] [varchar](10) NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSMT_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_AutoTestSMT_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_856cba2a149d4a098fc5e045db9d0f13] ON [dbo].[Gps_AutoTestSMT_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_Model]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_Model](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Model] [varchar](20) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsAutoTestSMTModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_GpsAutoTestSMTModel_Model] UNIQUE NONCLUSTERED 
(
	[Model] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_200c0d212a004cf8a4480b43de8144e9] ON [dbo].[Gps_AutoTestSMT_Model] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_OperRecord]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_OperRecord](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OperName] [varchar](20) NULL,
	[OperContent] [varchar](3000) NULL,
	[OperTime] [datetime] NULL,
	[OperDemo] [varchar](250) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_48ef52430b2649c0b0aec8fb93ea4ed3] ON [dbo].[Gps_OperRecord] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GpsTest_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_GpsTest_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsTest_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_24bea0fcedb5497d84f3afe6b7ae0136] ON [dbo].[Gps_GpsTest_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GpsTest_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_GpsTest_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsTest_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_GpsTest_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_c54bcef092464313ac7851ce841bf59e] ON [dbo].[Gps_GpsTest_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetQCWhiteCardDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetQCWhiteCardDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gps_GetQCWhiteCardDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetQCParamDownloadDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetQCParamDownloadDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gps_GetQCParamDownloadDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetQCImeiDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetQCImeiDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gps_GetQCImeiDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetQCDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetQCDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gps_GetQCDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetParamDownloadDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetParamDownloadDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetParamDownloadDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetImeiDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
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
GO
/****** Object:  Table [dbo].[Gps_GetDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetCoupleDifferValue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetCoupleDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetCoupleDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_GetCountDifferVaue]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_GetCountDifferVaue](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DifferValue] [bigint] NULL,
	[SoftModel] [varchar](20) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_GetCountDifferVaue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_9bb10d6d13424772b13bae90a66e6867] ON [dbo].[Gps_GetCountDifferVaue] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gps_GetCountDifferVaue', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'两台机子测试时间用时间隔(毫秒级)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gps_GetCountDifferVaue', @level2type=N'COLUMN',@level2name=N'DifferValue'
GO
/****** Object:  Table [dbo].[Gps_FunctionTest_Result_Backup]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_FunctionTest_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_FunctionTest_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_b92802e649d44bfbb29a9d6de759fe77] ON [dbo].[Gps_FunctionTest_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_FunctionTest_Result]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_FunctionTest_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_FunctionTest_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_FunctionTest_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_57bb392cf03d4d1bb38a089d285a62c7] ON [dbo].[Gps_FunctionTest_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTest_CheckResult]    Script Date: 11/15/2017 18:34:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_CheckResult](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CheckAutoTest_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_CheckAutoTest_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_06aa9ffadcc64541bbedcb03012335d7] ON [dbo].[Gps_AutoTest_CheckResult] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_Twice]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  Table [dbo].[DataRelativeUnique_Class]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataRelativeUnique_Class](
	[ClassName] [varchar](80) NOT NULL,
	[DATA1] [varchar](50) NULL,
	[DATA2] [varchar](50) NULL,
	[DATA3] [varchar](50) NULL,
	[DATA4] [varchar](50) NULL,
	[DATA5] [varchar](50) NULL,
	[DATA6] [varchar](50) NULL,
	[DATA7] [varchar](50) NULL,
	[DATA8] [varchar](50) NULL,
	[DATA9] [varchar](50) NULL,
	[DATA10] [varchar](50) NULL,
	[DATA11] [varchar](50) NULL,
	[DATA12] [varchar](50) NULL,
	[DATA13] [varchar](50) NULL,
	[DATA14] [varchar](50) NULL,
	[DATA15] [varchar](50) NULL,
	[NumberDATA1] [int] NULL,
	[NumberDATA2] [int] NULL,
	[NumberDATA3] [int] NULL,
	[NumberDATA4] [int] NULL,
	[NumberDATA5] [int] NULL,
	[NumberDATA6] [int] NULL,
	[NumberDATA7] [int] NULL,
	[NumberDATA8] [int] NULL,
	[NumberDATA9] [int] NULL,
	[NumberDATA10] [int] NULL,
	[NumberDATA11] [int] NULL,
	[NumberDATA12] [int] NULL,
	[NumberDATA13] [int] NULL,
	[NumberDATA14] [int] NULL,
	[NumberDATA15] [int] NULL,
 CONSTRAINT [PK_DataRelativeUnique_Class] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[DataRelativeUnique]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataRelativeUnique](
	[DATA1] [varchar](50) NOT NULL,
	[DATA2] [varchar](50) NULL,
	[DATA3] [varchar](50) NULL,
	[DATA4] [varchar](50) NULL,
	[DATA5] [varchar](50) NULL,
	[DATA6] [varchar](50) NULL,
	[DATA7] [varchar](50) NULL,
	[DATA8] [varchar](50) NULL,
	[DATA9] [varchar](50) NULL,
	[DATA10] [varchar](50) NULL,
	[DATA11] [varchar](50) NULL,
	[DATA12] [varchar](50) NULL,
	[ZhiDan] [varchar](50) NULL,
	[TestTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DataRelativeUnique] PRIMARY KEY CLUSTERED 
(
	[DATA1] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA10] ON [dbo].[DataRelativeUnique] 
(
	[DATA10] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA11] ON [dbo].[DataRelativeUnique] 
(
	[DATA11] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA12] ON [dbo].[DataRelativeUnique] 
(
	[DATA12] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA2] ON [dbo].[DataRelativeUnique] 
(
	[DATA2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA3] ON [dbo].[DataRelativeUnique] 
(
	[DATA3] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA4] ON [dbo].[DataRelativeUnique] 
(
	[DATA4] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA5] ON [dbo].[DataRelativeUnique] 
(
	[DATA5] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA6] ON [dbo].[DataRelativeUnique] 
(
	[DATA6] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA7] ON [dbo].[DataRelativeUnique] 
(
	[DATA7] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA8] ON [dbo].[DataRelativeUnique] 
(
	[DATA8] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [DATA9] ON [dbo].[DataRelativeUnique] 
(
	[DATA9] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DataRelativeSheet]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataRelativeSheet](
	[SN] [varchar](50) NULL,
	[IMEI1] [varchar](50) NOT NULL,
	[IMEI2] [varchar](50) NULL,
	[IMEI3] [varchar](50) NULL,
	[IMEI4] [varchar](50) NULL,
	[IMEI5] [varchar](50) NULL,
	[IMEI6] [varchar](50) NULL,
	[IMEI7] [varchar](50) NULL,
	[IMEI8] [varchar](50) NULL,
	[IMEI9] [varchar](50) NULL,
	[IMEI10] [varchar](50) NULL,
	[IMEI11] [varchar](50) NULL,
	[IMEI12] [varchar](50) NULL,
	[ZhiDan] [varchar](50) NULL,
	[TestTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_DataRelativeSheet] PRIMARY KEY CLUSTERED 
(
	[IMEI1] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_270f2046f3de418aa68bce34fe0e48a7] ON [dbo].[DataRelativeSheet] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [SNLimit] ON [dbo].[DataRelativeSheet] 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[80]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[80](
	[IMEI] [nvarchar](255) NULL,
	[SN] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[4600]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[4600](
	[SN] [nvarchar](255) NULL,
	[IMEI1] [nvarchar](255) NULL,
	[Zhidan] [nvarchar](255) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_a071df1a91a647179589e7eeb3ef6e85] ON [dbo].[4600] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTest_SrcSubItem]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_SrcSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSrcSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_76f1997d7f5b4a4587ea5590e15b1382] ON [dbo].[Gps_AutoTest_SrcSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTest_Result2]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_Result2](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[ZhiDan] [varchar](100) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[Computer] [varchar](100) NULL,
	[TestSetting] [varchar](max) NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTest_Result2] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_AutoTest_SN2] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_cd6d5a3e86f144ed9a407d1bb5a6634f] ON [dbo].[Gps_AutoTest_Result2] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime_Result] ON [dbo].[Gps_AutoTest_Result2] 
(
	[ZhiDan] ASC,
	[TestTime] ASC,
	[Result] ASC
)
INCLUDE ( [SoftModel],
[Computer]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime_SoftModel] ON [dbo].[Gps_AutoTest_Result2] 
(
	[TestTime] ASC,
	[ZhiDan] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTest_Result_Backup]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_Result_Backup](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTest_Result_Backup] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_d05451effc9b47249fa2a954362414c6] ON [dbo].[Gps_AutoTest_Result_Backup] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTest_Result]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](15) NULL,
	[ZhiDan] [varchar](100) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[Computer] [varchar](100) NULL,
	[TestSetting] [varchar](max) NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTest_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_AutoTest_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC,
	[IMEI] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_06d630d3e1c14a0baed63c0b46ef0d83] ON [dbo].[Gps_AutoTest_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime_Result] ON [dbo].[Gps_AutoTest_Result] 
(
	[ZhiDan] ASC,
	[TestTime] ASC,
	[Result] ASC
)
INCLUDE ( [SoftModel],
[Computer]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime_SoftModel] ON [dbo].[Gps_AutoTest_Result] 
(
	[TestTime] ASC,
	[ZhiDan] ASC,
	[SoftModel] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTest_Model]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_Model](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Model] [varchar](20) NOT NULL,
	[bReadRID] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsAutoTestModel] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_GpsAutoTestModel_Model] UNIQUE NONCLUSTERED 
(
	[Model] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_235da96ae8e74e4f9af0ebc6333ee45b] ON [dbo].[Gps_AutoTest_Model] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CheckHaveResult]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  Table [dbo].[CartonTEMP]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonTEMP](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BoxNo] [varchar](50) NULL,
	[IMEI] [varchar](50) NULL,
	[ZhiDan] [varchar](100) NULL,
	[SoftModel] [varchar](20) NULL,
	[Version] [varchar](150) NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[TACInfo] [varchar](200) NULL,
	[CompanyName] [varchar](200) NULL,
	[TesterId] [varchar](20) NULL,
	[TestTime] [datetime] NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[Computer] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_fb3778517f744f9cafb687365141df83] ON [dbo].[CartonTEMP] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CartonBoxQB200_10_MK1_V04_20170823Station3]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxQB200_10_MK1_V04_20170823Station3](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartonBoxNT74_10_A1D_D23_R0_V05Station3]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxNT74_10_A1D_D23_R0_V05Station3](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartonBoxNT22_10_A1D_D23_R0_V02_BBStation3]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxNT22_10_A1D_D23_R0_V02_BBStation3](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartonBoxNT22_10_A1D_D23_R0_V02_BBStation2]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxNT22_10_A1D_D23_R0_V02_BBStation2](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartonBoxGT360_10_A1A_D23_R0_V12Station0]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxGT360_10_A1A_D23_R0_V12Station0](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CartonBoxET210_10_61DA1_B4_R0_V23Station0]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CartonBoxET210_10_61DA1_B4_R0_V23Station0](
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[Remark3] [varchar](200) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  StoredProcedure [dbo].[CheckTestedBySNAndVersion]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckTestedByImei]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckTested]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  Table [dbo].[ClassType_table]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ClassType_table](
	[classType] [varchar](80) NOT NULL,
 CONSTRAINT [PK_ClassType_table] PRIMARY KEY CLUSTERED 
(
	[classType] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8681201835329986812018354648]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8681201835329986812018354648](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8681201835194986812018353298]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8681201835194986812018353298](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8681201831474986812018315748]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8681201831474986812018315748](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8681201826798786812018268054]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8681201826798786812018268054](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8681201815641786812018156498]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8681201815641786812018156498](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8681201808402986812018084088]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8681201808402986812018084088](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8636660108800186366601089000]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8636660108800186366601089000](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8636660108700186366601088000]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8636660108700186366601088000](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[tempdataLPrintMark8623660102460186236601027600]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tempdataLPrintMark8623660102460186236601027600](
	[IMEI] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NULL,
	[Version] [varchar](50) NULL,
	[ZhiDan] [varchar](30) NULL,
	[Computer] [varchar](100) NULL,
	[TestTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Tb_Command]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Tb_Command](
	[Command] [varchar](100) NOT NULL,
	[SQLstring] [varchar](8000) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Tb_Command] PRIMARY KEY CLUSTERED 
(
	[Command] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_357f8cdc96c54d0d8ad9e4e523bd7bdc] ON [dbo].[Tb_Command] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PAbnormalInput]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PAbnormalInput](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SchoolPersonnel] [varchar](20) NOT NULL,
	[CompanyName] [varchar](80) NOT NULL,
	[LineOf] [varchar](80) NOT NULL,
	[WorkStation] [varchar](50) NOT NULL,
	[ProblemDescription] [varchar](200) NOT NULL,
	[ExceptionTypes] [varchar](80) NULL,
	[Node1] [varchar](200) NULL,
	[UpdateTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PAbnormalInput] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_3a6519e07d5f4afdba1d115545c3e7d8] ON [dbo].[PAbnormalInput] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sheet2]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet2](
	[SN] [nvarchar](255) NULL,
	[IMEI1] [nvarchar](255) NULL,
	[ZHIDAN] [nvarchar](255) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_b38c91e3e6fe416896d8e59cd2672ee2] ON [dbo].[Sheet2] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sheet1]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Sheet1](
	[IMEI1] [nvarchar](255) NULL,
	[ZHIDAN] [nvarchar](255) NULL,
	[SN] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Sharing_Bikes_Machine_onfiguration]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Sharing_Bikes_Machine_onfiguration](
	[ZhiDan] [varchar](50) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
 CONSTRAINT [PK_Sharing_Bikes_Machine_onfiguration] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC,
	[Version] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shared_bike_locks_Command]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shared_bike_locks_Command](
	[Command] [varchar](100) NOT NULL,
	[SQLstring] [varchar](8000) NOT NULL,
 CONSTRAINT [PK_Shared_bike_locks_Command] PRIMARY KEY CLUSTERED 
(
	[Command] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Shared_bike_locks_BicycleLockCache]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Shared_bike_locks_BicycleLockCache](
	[SN] [varchar](80) NOT NULL,
	[IMEI] [varchar](80) NOT NULL,
	[ID] [varchar](80) NULL,
	[Version] [varchar](150) NULL,
	[Uploaded] [bit] NOT NULL,
	[updateTime] [datetime] NULL,
	[BTVersion] [varchar](150) NULL,
 CONSTRAINT [PK_Shared_bike_locks_BicycleLockCache] PRIMARY KEY CLUSTERED 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PWorkSchedule]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWorkSchedule](
	[CompanyName] [varchar](50) NOT NULL,
	[MorningOnWorkTime] [varchar](50) NOT NULL,
	[MorningUnderWorkTime] [varchar](50) NOT NULL,
	[AfternoonOnWorkTime] [varchar](50) NOT NULL,
	[AfternoonUnderWorkTime] [varchar](50) NOT NULL,
	[NightOnWorkTime] [varchar](50) NOT NULL,
	[UpdateTime] [datetime] NULL,
	[Flag] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PWorkSchedule] PRIMARY KEY CLUSTERED 
(
	[CompanyName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_57efd8f19cba4af1acea9529465b1645] ON [dbo].[PWorkSchedule] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PWarehouseTable_title]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWarehouseTable_title](
	[ID] [varchar](80) NOT NULL,
	[WarehouseName] [varchar](100) NOT NULL,
	[FID] [varchar](80) NOT NULL,
 CONSTRAINT [PK_PWarehouseTable_title] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PWarehouseTable_ReturnGoods]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWarehouseTable_ReturnGoods](
	[PurchaseReceiptID] [varchar](100) NOT NULL,
	[PurchaseNo] [varchar](80) NOT NULL,
	[SupplierName] [varchar](80) NOT NULL,
	[BatchNo] [varchar](80) NOT NULL,
	[MaterialCode] [varchar](80) NOT NULL,
	[MaterialName] [varchar](80) NOT NULL,
	[MaterialSpecifications] [varchar](80) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[note] [varchar](200) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_PWarehouseTable_ReturnGoods] PRIMARY KEY CLUSTERED 
(
	[PurchaseReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PWarehouseTable_PickingOut]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWarehouseTable_PickingOut](
	[PurchaseReceiptID] [varchar](100) NOT NULL,
	[PurchaseNo] [varchar](80) NOT NULL,
	[SupplierName] [varchar](80) NOT NULL,
	[BatchNo] [varchar](80) NOT NULL,
	[MaterialCode] [varchar](80) NOT NULL,
	[MaterialName] [varchar](80) NOT NULL,
	[MaterialSpecifications] [varchar](80) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[note] [varchar](200) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[StorageAddress] [varchar](255) NULL,
	[UserName] [varchar](50) NOT NULL,
 CONSTRAINT [PK_PWarehouseTable_PickingOut] PRIMARY KEY CLUSTERED 
(
	[PurchaseReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PWarehouseTable_Detailed]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWarehouseTable_Detailed](
	[PurchaseReceiptID] [varchar](100) NOT NULL,
	[PurchaseNo] [varchar](80) NOT NULL,
	[SupplierName] [varchar](80) NOT NULL,
	[BatchNo] [varchar](80) NOT NULL,
	[MaterialCode] [varchar](80) NOT NULL,
	[MaterialName] [varchar](80) NOT NULL,
	[MaterialSpecifications] [varchar](80) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[note] [varchar](200) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[StorageAddress] [varchar](255) NOT NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_PWarehouseTable_Detailed] PRIMARY KEY CLUSTERED 
(
	[PurchaseReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PUsers_Function_Detailed]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUsers_Function_Detailed](
	[UserName] [varchar](50) NOT NULL,
	[FunctionName] [varchar](50) NOT NULL,
	[FunctionJurisdiction] [bit] NOT NULL,
	[FunctionGUID] [varchar](100) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PUsers_Function_Detailed_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[FunctionName] ASC,
	[FunctionGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_4987810c5fd34056948b9b8e658584dc] ON [dbo].[PUsers_Function_Detailed] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUsers_Function]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUsers_Function](
	[UserName] [varchar](50) NOT NULL,
	[FunctionName] [varchar](50) NOT NULL,
	[FunctionJurisdiction] [bit] NOT NULL,
	[FunctionGUID] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PUsers_Function_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[FunctionName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_422fa5f111804bfb9b21f59c9494d68e] ON [dbo].[PUsers_Function] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PUsers]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUsers](
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](100) NOT NULL,
	[systemAdimin] [bit] NOT NULL,
	[Limite] [bit] NOT NULL,
	[Department] [varchar](100) NULL,
	[AddUser] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_aa1fad0a06b64d9d824fccb345bc82f9] ON [dbo].[PUsers] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseReceipt]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseReceipt](
	[PurchaseReceiptID] [varchar](100) NOT NULL,
	[PurchaseNo] [varchar](80) NOT NULL,
	[SupplierName] [varchar](80) NOT NULL,
	[BatchNo] [varchar](80) NOT NULL,
	[MaterialCode] [varchar](80) NOT NULL,
	[MaterialName] [varchar](80) NOT NULL,
	[MaterialSpecifications] [varchar](80) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[ProductQuantity1] [int] NOT NULL,
	[CheckAudit] [varchar](50) NOT NULL,
	[CheckQualified] [varchar](50) NOT NULL,
	[CheckSpecialMining] [varchar](50) NOT NULL,
	[note] [varchar](8000) NULL,
	[ScanningTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[UpdateTime1] [datetime] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[CheckAuditUserName] [varchar](50) NULL,
	[CheckQualifiedUserName] [varchar](50) NULL,
	[CheckSpecialMiningUserName] [varchar](50) NULL,
	[CheckNumber] [int] NOT NULL,
	[classType] [varchar](80) NULL,
	[ProblemDescription] [varchar](255) NULL,
	[OrderState] [int] NULL,
	[QualifiedTime1] [datetime] NULL,
	[QualifiedTime2] [datetime] NULL,
	[QualifiedRate] [float] NULL,
	[FinancialEntry] [varchar](50) NULL,
	[FinancialEntryName] [varchar](50) NULL,
	[FinancialEntryTime] [datetime] NULL,
	[WhetherQualified] [bit] NULL,
	[SpecialCompletion] [bit] NULL,
	[ChooseNumber] [int] NULL,
	[NotChooseNumber] [int] NULL,
	[ChooseTime1] [datetime] NULL,
	[ChooseTime2] [datetime] NULL,
	[ChooseName] [varchar](50) NULL,
	[Storage] [varchar](20) NULL,
	[ReturnGoods] [varchar](20) NULL,
	[AttributionResponsibility] [varchar](50) NULL,
	[Presentation8D] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PurchaseReceipt] PRIMARY KEY CLUSTERED 
(
	[PurchaseReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_2b99019ffbba4912944d62664b54f22b] ON [dbo].[PurchaseReceipt] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PTypesWork]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PTypesWork](
	[TypesWork] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PTypesWork] PRIMARY KEY CLUSTERED 
(
	[TypesWork] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_63bc28f606b54f66a8443a969862c2e7] ON [dbo].[PTypesWork] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PStaffResume]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PStaffResume](
	[Name] [varchar](20) NOT NULL,
	[WorkNumber] [varchar](50) NOT NULL,
	[Gender] [varchar](4) NOT NULL,
	[Age] [varchar](6) NOT NULL,
	[WorkTypes] [varchar](80) NOT NULL,
	[Levels] [varchar](50) NOT NULL,
	[FactoryTime] [datetime] NOT NULL,
	[CompanyName] [varchar](120) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PStaffResume] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[WorkNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_d21f86b5eb354cb0b1ec3116be9d01ec] ON [dbo].[PStaffResume] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSet_New_title]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSet_New_title](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductClass] [varchar](100) NOT NULL,
	[UpdataTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductSet_New_title] PRIMARY KEY CLUSTERED 
(
	[ProductClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_2b6b4de576da4b338e855cd6200b8b3c] ON [dbo].[ProductSet_New_title] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductSet_New]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSet_New](
	[ProductClass] [varchar](100) NOT NULL,
	[Stations] [varchar](50) NOT NULL,
	[EfficiencyQuantity] [varchar](100) NULL,
	[TheNumberOf] [varchar](100) NULL,
	[UpdataTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductSet_New] PRIMARY KEY CLUSTERED 
(
	[ProductClass] ASC,
	[Stations] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_87be0738c34e44c59350495fda5374d4] ON [dbo].[ProductSet_New] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionType]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionType](
	[ProductType] [varchar](20) NOT NULL,
	[Command] [varchar](50) NULL,
	[Command1] [varchar](50) NULL,
	[Command2] [varchar](50) NULL,
	[OnWorkTimeType] [varchar](50) NULL,
	[Command3] [varchar](50) NULL,
	[OnWorkTimeTypeNight] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_a4288a237c42473c87fbd46e30a56d5b] ON [dbo].[ProductionType] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionLinePC_title]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionLinePC_title](
	[LineName] [varchar](80) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductionLinePC_title] PRIMARY KEY CLUSTERED 
(
	[LineName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_64d076217e0c46a5b0fc13e680ec68e3] ON [dbo].[ProductionLinePC_title] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionLinePC]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionLinePC](
	[Pcname] [varchar](100) NOT NULL,
	[ProductType] [varchar](20) NOT NULL,
	[LineName] [varchar](80) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductionLinePC] PRIMARY KEY NONCLUSTERED 
(
	[Pcname] ASC,
	[ProductType] ASC,
	[LineName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_bbe7fb64831f42d18dd1f7e6dba596ba] ON [dbo].[ProductionLinePC] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductionEfficiencySummary]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionEfficiencySummary](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductionClass] [varchar](20) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](100) NULL,
	[ProductClass] [varchar](80) NULL,
	[Hours] [int] NULL,
	[actualHours] [int] NULL,
	[Ratio] [float] NULL,
	[sumHours] [float] NULL,
	[sum] [int] NULL,
	[FailureRate] [float] NULL,
	[FailureNuber] [int] NULL,
	[UpdateTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_b898f1ee8e234189b94cdf8b3b002f7e] ON [dbo].[ProductionEfficiencySummary] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PRequiredTime_Detailed]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRequiredTime_Detailed](
	[ProductType] [varchar](20) NOT NULL,
	[RequiredTimeGUID] [varchar](80) NOT NULL,
	[RequiredTime] [float] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PRequiredTime_Detailed] PRIMARY KEY CLUSTERED 
(
	[ProductType] ASC,
	[RequiredTimeGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_f21b267f0c6249a4958a8fd4e1018b19] ON [dbo].[PRequiredTime_Detailed] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PMCplan_table]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PMCplan_table](
	[CorporateName] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[TotalOrder] [int] NOT NULL,
	[RequiredTimeGUID] [varchar](80) NOT NULL,
	[CustomerName] [varchar](80) NOT NULL,
	[ShippingDate] [datetime] NOT NULL,
	[Remarks] [varchar](200) NULL,
	[CreationTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PMCplan_table] PRIMARY KEY CLUSTERED 
(
	[CorporateName] ASC,
	[ZhiDan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_97f2e1310e004713acff1a147941d574] ON [dbo].[PMCplan_table] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PhoneProcessRecord]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhoneProcessRecord](
	[SN] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[Process1] [nvarchar](50) NULL,
	[Process2] [nvarchar](50) NULL,
	[Process3] [nvarchar](50) NULL,
	[Process4] [nvarchar](50) NULL,
	[Process5] [nvarchar](50) NULL,
	[Process6] [nvarchar](50) NULL,
	[Process7] [nvarchar](50) NULL,
	[Process8] [nvarchar](50) NULL,
	[Process9] [nvarchar](50) NULL,
	[Process10] [nvarchar](50) NULL,
	[Process11] [nvarchar](50) NULL,
	[Process12] [nvarchar](50) NULL,
	[TestTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PhoneProcessRecord] PRIMARY KEY CLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_68b4d62e37a241fc961b9a0b1d0df77c] ON [dbo].[PhoneProcessRecord] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PFunctionMenu]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PFunctionMenu](
	[ID] [varchar](50) NOT NULL,
	[FunctionName] [varchar](50) NOT NULL,
	[FID] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PFunctionMenu] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_ebe86ebc7a624f40bc87fc1b63b47df7] ON [dbo].[PFunctionMenu] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PExceptionTypes]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PExceptionTypes](
	[ExceptionTypes] [varchar](80) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PExceptionTypes] PRIMARY KEY CLUSTERED 
(
	[ExceptionTypes] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_686b445b200a41999184fb5e31809dc7] ON [dbo].[PExceptionTypes] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TimeAttendance_Employee_File]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_Employee_File](
	[JobNumber] [varchar](50) NOT NULL,
	[ChineseName] [varchar](80) NULL,
	[Gender] [varchar](50) NULL,
	[Education] [varchar](50) NULL,
	[Post] [varchar](50) NULL,
	[EmployeeCategory] [varchar](50) NULL,
	[EntryDate] [datetime] NULL,
	[DepartmentNo] [varchar](50) NULL,
	[DepartmentName] [varchar](80) NULL,
	[GroupNo] [varchar](50) NULL,
	[GroupName] [varchar](80) NULL,
	[Line_No] [varchar](50) NULL,
	[LineName] [varchar](80) NULL,
	[IDNumber] [varchar](80) NULL,
	[IssuingAuthority] [varchar](255) NULL,
	[DateOfIssue] [datetime] NULL,
	[IDTermOfValidity] [varchar](50) NULL,
	[BirthDay] [datetime] NULL,
	[PlaceOrigin] [varchar](50) NOT NULL,
	[Nation] [varchar](50) NULL,
	[HomeAddress] [varchar](255) NULL,
	[AttendanceData] [datetime] NULL,
	[AttendanceRegulations] [varchar](50) NULL,
	[CompletionData] [datetime] NULL,
	[ProbationPeriod] [bit] NULL,
	[SalaryCategory] [varchar](50) NULL,
	[Introducer] [varchar](50) NULL,
	[PositionsGrade] [varchar](50) NULL,
	[Rank] [varchar](50) NULL,
	[LogicalCardNumber] [varchar](50) NULL,
	[PhysicalCardNumber] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[EmergencyContact] [varchar](50) NULL,
	[EmergencyContactPhone] [varchar](50) NULL,
	[EmErgencyContactAddress] [varchar](255) NULL,
	[PaymentMode] [varchar](50) NULL,
	[Height] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[LeftEyeVision] [varchar](50) NULL,
	[RightEyeVision] [varchar](50) NULL,
	[note] [varchar](255) NULL,
	[ContractNumber] [varchar](50) NULL,
	[ContractSigning] [datetime] NULL,
	[ExpirationContract] [datetime] NULL,
	[IDCardPeriod] [datetime] NULL,
	[Job] [bit] NULL,
	[leaveDate] [datetime] NULL,
	[TurnoverType] [varchar](50) NULL,
	[ReasonsForLeaving] [varchar](255) NULL,
	[Blacklist] [bit] NULL,
	[married] [bit] NULL,
	[FreeCard] [bit] NULL,
	[OvertimeApplication] [bit] NULL,
	[createddate] [datetime] NULL,
	[FilingMan] [varchar](50) NULL,
	[modificationDate] [datetime] NULL,
	[Modifier] [varchar](50) NULL,
	[workType] [varchar](50) NULL,
	[workGrade] [varchar](50) NULL,
	[Photo] [bit] NULL,
	[MinimalSector] [varchar](50) NULL,
 CONSTRAINT [PK_TimeAttendance_Employee_File] PRIMARY KEY CLUSTERED 
(
	[JobNumber] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeAttendance_Department]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_Department](
	[DepartmentNo] [varchar](50) NOT NULL,
	[DepartmentName] [varchar](80) NOT NULL,
	[ParentDepartmentNo] [varchar](50) NULL,
	[ParentDepartmentName] [varchar](80) NULL,
	[NumberOfStaff] [int] NULL,
	[InTheNumberOfStaff] [int] NULL,
	[ExceedNumberOfStaff] [int] NULL,
	[note] [varchar](255) NULL,
 CONSTRAINT [PK_TimeAttendance_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentNo] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeAttendance_BasicShiftSchedule]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_BasicShiftSchedule](
	[BasicNo] [varchar](50) NOT NULL,
	[BasicName] [varchar](80) NOT NULL,
	[GoToWork1] [datetime] NULL,
	[GoFfoWork1] [datetime] NULL,
	[GoToWork2] [datetime] NULL,
	[GoFfoWork2] [datetime] NULL,
	[GoToWork3] [datetime] NULL,
	[GoFfoWork3] [datetime] NULL,
	[GoToWork4] [datetime] NULL,
	[GoFfoWork4] [datetime] NULL,
	[PushBackMinutes1] [int] NULL,
	[MinutesAheadOfTime1] [int] NULL,
	[OvertimeAfterPush1] [bit] NULL,
	[PositiveShiftHours1] [int] NULL,
	[OvertimeHours1] [int] NULL,
	[MinutesLate1] [int] NULL,
	[LeaveEarlyMinutes1] [int] NULL,
	[AdvanceOvertime1] [bit] NULL,
	[MinutesDeducted1] [int] NULL,
	[SupplyMinutes1] [int] NULL,
	[PushBackMinutes2] [int] NULL,
	[MinutesAheadOfTime2] [int] NULL,
	[OvertimeAfterPush2] [bit] NULL,
	[PositiveShiftHours2] [int] NULL,
	[OvertimeHours2] [int] NULL,
	[MinutesLate2] [int] NULL,
	[LeaveEarlyMinutes2] [int] NULL,
	[AdvanceOvertime2] [bit] NULL,
	[MinutesDeducted2] [int] NULL,
	[SupplyMinutes2] [int] NULL,
	[PushBackMinutes3] [int] NULL,
	[MinutesAheadOfTime3] [int] NULL,
	[OvertimeAfterPush3] [bit] NULL,
	[PositiveShiftHours3] [int] NULL,
	[OvertimeHours3] [int] NULL,
	[MinutesLate3] [int] NULL,
	[LeaveEarlyMinutes3] [int] NULL,
	[AdvanceOvertime3] [bit] NULL,
	[MinutesDeducted3] [int] NULL,
	[SupplyMinutes3] [int] NULL,
	[PushBackMinutes4] [int] NULL,
	[MinutesAheadOfTime4] [int] NULL,
	[OvertimeAfterPush4] [bit] NULL,
	[PositiveShiftHours4] [int] NULL,
	[OvertimeHours4] [int] NULL,
	[MinutesLate4] [int] NULL,
	[LeaveEarlyMinutes4] [int] NULL,
	[AdvanceOvertime4] [bit] NULL,
	[MinutesDeducted4] [int] NULL,
	[SupplyMinutes4] [int] NULL,
	[PositiveShiftHours] [int] NULL,
	[OvertimeHours] [int] NULL,
	[LateDeduction] [int] NULL,
	[LeaveEarlyToDeduct] [int] NULL,
	[note] [varchar](255) NULL,
	[createdDate] [datetime] NULL,
	[FilingMan] [varchar](50) NULL,
	[NightShift] [bit] NULL,
	[IntelligentShift] [bit] NULL,
	[AutomaticOvertime] [bit] NULL,
	[GoToWork1AndGoFfoWork2] [int] NULL,
	[GoToWork2AndGoFfoWork3] [int] NULL,
	[GoToWork3AndGoFfoWork4] [int] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeAttendance_AttendanceSchedule]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_AttendanceSchedule](
	[JobNumber] [varchar](50) NOT NULL,
	[Name] [varchar](80) NULL,
	[AttendanceTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[MachineID] [varchar](50) NULL,
	[MachinePosition] [varchar](50) NULL,
 CONSTRAINT [PK_TimeAttendance_AttendanceSchedule] PRIMARY KEY CLUSTERED 
(
	[JobNumber] ASC,
	[AttendanceTime] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeAttendance_AttendanceInformation_machine]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_AttendanceInformation_machine](
	[MachineID] [varchar](50) NOT NULL,
	[ComInterface] [varchar](50) NULL,
	[BaudRate] [varchar](50) NULL,
	[IPAddress] [varchar](50) NULL,
	[MachinePosition] [varchar](80) NULL,
	[MachineUse] [varchar](50) NULL,
 CONSTRAINT [PK_TimeAttendance_AttendanceInformation_machine] PRIMARY KEY CLUSTERED 
(
	[MachineID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TimeAttendance_AttendanceInformation]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TimeAttendance_AttendanceInformation](
	[UserID] [varchar](80) NOT NULL,
	[UserName] [varchar](80) NULL,
	[iMachineNumber] [int] NULL,
	[InputDate] [datetime] NULL,
	[workDates] [datetime] NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultQB200_10_MK1_V04_20170823Station3]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultQB200_10_MK1_V04_20170823Station3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result] [int] NULL,
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultNT74_10_A1D_D23_R0_V05Station3]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultNT74_10_A1D_D23_R0_V05Station3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result] [int] NULL,
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultNT22_10_A1D_D23_R0_V02_BBStation3]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultNT22_10_A1D_D23_R0_V02_BBStation3](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result] [int] NULL,
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultNT22_10_A1D_D23_R0_V02_BBStation2]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultNT22_10_A1D_D23_R0_V02_BBStation2](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result] [int] NULL,
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultGT360_10_A1A_D23_R0_V12Station0]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultGT360_10_A1A_D23_R0_V12Station0](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result] [int] NULL,
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestResultET210_10_61DA1_B4_R0_V23Station0]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultET210_10_61DA1_B4_R0_V23Station0](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SN] [varchar](100) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[FunctionResult] [int] NULL,
	[GPSResult] [int] NULL,
	[CoupleResult] [int] NULL,
	[WriteImeiResult] [int] NULL,
	[ParamDownloadResult] [int] NULL,
	[AutoTestResult] [int] NULL,
	[Result] [int] NULL,
	[AutoTestSMTResult] [int] NULL,
	[SMTIQCResult] [int] NULL,
	[OtherTestSign] [nvarchar](max) NULL,
	[ZhiDan] [varchar](50) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TestRec]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestRec](
	[testerid] [varchar](50) NULL,
	[softmodel] [varchar](50) NULL,
	[AVG] [int] NULL,
	[month] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_825dc74f027b43ae9fe60f206d682c28] ON [dbo].[TestRec] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PCapacityConfiguration]    Script Date: 11/15/2017 18:34:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PCapacityConfiguration](
	[ZhiDan] [varchar](80) NOT NULL,
	[ProductClass] [varchar](100) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PCapacityConfiguration] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_71d1bfc2a6a247d49d4880db842299c3] ON [dbo].[PCapacityConfiguration] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[TestDeleteParam]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateUserStatus]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTestResultForm]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateOrder]    Script Date: 11/15/2017 18:34:56 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateGpsTcData]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateGpsSMT_TcData]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  Table [dbo].[PEncodingSetting]    Script Date: 11/15/2017 18:34:57 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PEncodingSetting](
	[BarcodeEncoding] [varchar](100) NOT NULL,
	[ProblemDescription] [varchar](200) NOT NULL,
	[ES_ExceptionTypes] [varchar](80) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PEncodingSetting] PRIMARY KEY CLUSTERED 
(
	[BarcodeEncoding] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_0081b83d5d58415bbacc009acff56408] ON [dbo].[PEncodingSetting] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[SelectOperRecord]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetUserInformation]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTodayAVGTestTimeByTestID]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTestRecord_OneDay]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTesterTestCount]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTempRid]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetTempImei]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetSoftModelByTime]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetParamDownloadResult]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetHistoryAVGTestTimeBySoftModel]    Script Date: 11/15/2017 18:34:57 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCoupleTestResult_new]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCoupleTestResult]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCountQCAvgTestTimeByMonth]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCountAvgTestTimeByMonth]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetCountAvgTestTime]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAVGTestTimeByTestIDAndTime_new]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAVGTestTimeByTestIDAndTime]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAutoTestTestRecord_ToDayAndBefore]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[GetAutoTestTestRecord]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckTestPass_WriteIMEI]    Script Date: 11/15/2017 18:34:58 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckTestPass]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckTestedParamCpd]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckMustTest]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  Table [dbo].[Gps_AutoTest_DstSubItem]    Script Date: 11/15/2017 18:34:59 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTest_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestDstSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_267a631c665043f9a43796dbeb23f15a] ON [dbo].[Gps_AutoTest_DstSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[CountMonthAvgCoupleTestTime]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CountAvgTestTime]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CountQCWhiteCardMonthAvgTestTime]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CountQCParamDownloadMonthAvgTestTime]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CountQCMonthAvgTestTime]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_ByRid_Twice]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleteTestResult_ByImei_Twice]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[DeleOperRecord]    Script Date: 11/15/2017 18:34:59 ******/
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
/****** Object:  StoredProcedure [dbo].[CountMonthAvgTestTime]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CountMonthAvgParamDownloadTestTime]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  Table [dbo].[Gps_DstSubItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SoftModel] [varchar](50) NOT NULL,
	[ParentId] [int] NOT NULL,
	[SubTestItemId] [int] NOT NULL,
	[SubTestItemName] [varchar](50) NOT NULL,
	[SubTestItemDes] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_DstSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_cca95fe2a46e4b4d9a7974b6feb90d0b] ON [dbo].[Gps_DstSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMT_DstSubItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMT_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSMTDstSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_a5203afe3888426d8831fc41ac4056d7] ON [dbo].[Gps_AutoTestSMT_DstSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_CartonBoxTwenty_Result]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_CartonBoxTwenty_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[BoxNo] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](150) NOT NULL,
	[ProductCode] [varchar](100) NULL,
	[Color] [varchar](50) NULL,
	[Qty] [varchar](50) NULL,
	[Weight] [varchar](50) NULL,
	[Date] [varchar](50) NULL,
	[TACInfo] [varchar](200) NULL,
	[CompanyName] [varchar](200) NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark1] [varchar](200) NULL,
	[Remark2] [varchar](200) NULL,
	[Remark3] [varchar](200) NULL,
	[Remark4] [varchar](200) NULL,
	[Remark5] [varchar](200) NULL,
	[Computer] [varchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_CartonBox20_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_CartonBox20_SN] UNIQUE NONCLUSTERED 
(
	[BoxNo] ASC,
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_763a56a347ac45c0838094596d5190c2] ON [dbo].[Gps_CartonBoxTwenty_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IMEIONLY] ON [dbo].[Gps_CartonBoxTwenty_Result] 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
CREATE NONCLUSTERED INDEX [index_ZhiDan_TestTime] ON [dbo].[Gps_CartonBoxTwenty_Result] 
(
	[ZhiDan] ASC,
	[TestTime] ASC
)
INCLUDE ( [SoftModel],
[Computer]) WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownload_DstSubItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownload_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParamDownloadDstSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_f653d717e2484d2094004fbdddb8591c] ON [dbo].[Gps_ParamDownload_DstSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_WriteImei_DstSubItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_WriteImei_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_WriteImei_DstItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_453ef644aad546a8bdf713fb3effc5c8] ON [dbo].[Gps_WriteImei_DstSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_OQC_DstSubItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_OQC_DstSubItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](30) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_OQC_DstSubItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_e5c341b525914d0283c4b6c90fac3243] ON [dbo].[Gps_OQC_DstSubItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[InsertTOBoxCount]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[InsertOperRecord]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  Table [dbo].[Gps_WriteImei_Result]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_WriteImei_Result](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[IMEI] [varchar](15) NOT NULL,
	[SoftModel] [varchar](20) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[Result] [int] NOT NULL,
	[TesterId] [varchar](20) NOT NULL,
	[TestTime] [datetime] NOT NULL,
	[Remark] [varchar](200) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_WriteImei_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_WriteImei_IMEI] UNIQUE NONCLUSTERED 
(
	[IMEI] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_1fad1e59e2d94521b8868626b0caf516] ON [dbo].[Gps_WriteImei_Result] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_WriteImei_Item]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_WriteImei_Item](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_WriteImei_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_f3e67116e0f24640a7f6c066498827ac] ON [dbo].[Gps_WriteImei_Item] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_GpsAutoTestItem_ItemMode_ItemName] UNIQUE NONCLUSTERED 
(
	[ItemModel] ASC,
	[ItemName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_d87d67e2f4844c04a5668a56fe6dee15] ON [dbo].[Gps_AutoTestItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_ParamDownloadItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamDownloadItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ParamDownloadItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UQ_GpsParamDownloadItem_ItemMode_ItemName] UNIQUE NONCLUSTERED 
(
	[ItemModel] ASC,
	[ItemName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_b0dcb4f321cc43a3b040960bbfd12010] ON [dbo].[Gps_ParamDownloadItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_SubTestItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_SubTestItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ParentId] [int] NOT NULL,
	[SubTestItemName] [varchar](50) NOT NULL,
	[SubTestItemDes] [varchar](50) NOT NULL,
	[Remark] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_SubTestItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_befefb46866349b29170fdcd5c70a3f2] ON [dbo].[Gps_SubTestItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_OQC_Item]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_OQC_Item](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_OQC_Item] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_e5e482f978424285ac8e5fb8a4bc913f] ON [dbo].[Gps_OQC_Item] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Gps_AutoTestSMTItem]    Script Date: 11/15/2017 18:35:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_AutoTestSMTItem](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ItemModel] [varchar](20) NOT NULL,
	[ItemName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_AutoTestSMTItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
CREATE UNIQUE NONCLUSTERED INDEX [IDX_354795887bb34215bd0ec8e6d5523b4b] ON [dbo].[Gps_AutoTestSMTItem] 
(
	[_MASK_FROM_V2] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[GetWriteImeiTestRecord_new]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[GetWriteImeiTestRecord]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CountMonthAvgImeiTestTime]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CountQCImeiMonthAvgTestTime]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[CheckImei]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[SMTUpdateForm]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateForm]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[TwiceByUpdateVersion]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[UpdateTestResultForm_DeleteImei]    Script Date: 11/15/2017 18:35:00 ******/
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
/****** Object:  StoredProcedure [dbo].[ParamDownUpdateForm]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[WriteImeiParamCopy]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[TestParamCopyFormAutoTest]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[OQCParamCopy]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[ModelTestParamCopy]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[ModelParamDownloadCopy]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[AutoTestSMTParamCopyFormAutoTest]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  StoredProcedure [dbo].[AutoTestSMTParamCopy]    Script Date: 11/15/2017 18:35:01 ******/
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
/****** Object:  Default [DF__Gps_Versi__bRead__72F0F4D3]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_VersionModel] ADD  CONSTRAINT [DF__Gps_Versi__bRead__72F0F4D3]  DEFAULT ((0)) FOR [bReadRID]
GO
/****** Object:  Default [DF_Gps_UserType_TestAutoTestSMT]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestAutoTestSMT]  DEFAULT ((1)) FOR [TestAutoTestSMT]
GO
/****** Object:  Default [DF_Gps_UserType_TestFunction]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestFunction]  DEFAULT ((1)) FOR [TestSMTOQC]
GO
/****** Object:  Default [DF_Gps_UserType_TestCouple]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestCouple]  DEFAULT ((1)) FOR [TestCouple]
GO
/****** Object:  Default [DF_Gps_UserType_TestParamDownload]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestParamDownload]  DEFAULT ((1)) FOR [TestParamDownload]
GO
/****** Object:  Default [DF_Gps_UserType_TestAutoTest]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestAutoTest]  DEFAULT ((1)) FOR [TestAutoTest]
GO
/****** Object:  Default [DF_Gps_UserType_TestWriteImei]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestWriteImei]  DEFAULT ((1)) FOR [TestWriteImei]
GO
/****** Object:  Default [DF_Gps_UserType_TestTwice]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestTwice]  DEFAULT ((1)) FOR [TestTwice]
GO
/****** Object:  Default [DF_Gps_UserType_TestIncomCheck]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestIncomCheck]  DEFAULT ((1)) FOR [TestIncomCheck]
GO
/****** Object:  Default [DF_Gps_UserType_TestGPS]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestGPS]  DEFAULT ((1)) FOR [TestReadBackRom]
GO
/****** Object:  Default [DF_Gps_UserType_TestCartonBox]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_UserType] ADD  CONSTRAINT [DF_Gps_UserType_TestCartonBox]  DEFAULT ((1)) FOR [TestCartonBox]
GO
/****** Object:  Default [DF_Gps_User_LoginTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_User] ADD  CONSTRAINT [DF_Gps_User_LoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO
/****** Object:  Default [DF_Gps_User_LoginStatus]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_User] ADD  CONSTRAINT [DF_Gps_User_LoginStatus]  DEFAULT ((0)) FOR [LoginStatus]
GO
/****** Object:  Default [DF_Gps_User_InService]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_User] ADD  CONSTRAINT [DF_Gps_User_InService]  DEFAULT ((1)) FOR [InService]
GO
/****** Object:  Default [DF__Gps_TestR__Funct__49D47310]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [FunctionResult]
GO
/****** Object:  Default [DF__Gps_TestR__GPSRe__4AC89749]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [GPSResult]
GO
/****** Object:  Default [DF__Gps_TestR__Coupl__4BBCBB82]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [CoupleResult]
GO
/****** Object:  Default [DF__Gps_TestR__Write__4CB0DFBB]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [WriteImeiResult]
GO
/****** Object:  Default [DF__Gps_TestR__Param__4DA503F4]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  DEFAULT ((0)) FOR [ParamDownloadResult]
GO
/****** Object:  Default [2DF__Gps_TestR__AutoT__581D0306]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  CONSTRAINT [2DF__Gps_TestR__AutoT__581D0306]  DEFAULT ((0)) FOR [AutoTestResult]
GO
/****** Object:  Default [2DF_Gps_TestResult_AutoTestResult1]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2] ADD  CONSTRAINT [2DF_Gps_TestResult_AutoTestResult1]  DEFAULT ((0)) FOR [AutoTestSMTResult]
GO
/****** Object:  Default [DF__Gps_TestR__Funct__541767F8]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [FunctionResult]
GO
/****** Object:  Default [DF__Gps_TestR__GPSRe__550B8C31]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [GPSResult]
GO
/****** Object:  Default [DF__Gps_TestR__Coupl__55FFB06A]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [CoupleResult]
GO
/****** Object:  Default [DF__Gps_TestR__Write__56F3D4A3]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [WriteImeiResult]
GO
/****** Object:  Default [DF__Gps_TestR__Param__57E7F8DC]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [ParamDownloadResult]
GO
/****** Object:  Default [DF__Gps_TestR__AutoT__58DC1D15]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  DEFAULT ((0)) FOR [AutoTestResult]
GO
/****** Object:  Default [DF_Gps_TestResult_Backup_AutoTestResult1]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup] ADD  CONSTRAINT [DF_Gps_TestResult_Backup_AutoTestResult1]  DEFAULT ((0)) FOR [AutoTestSMTResult]
GO
/****** Object:  Default [DF__Gps_TestR__Funct__53584DE9]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Funct__53584DE9]  DEFAULT ((0)) FOR [FunctionResult]
GO
/****** Object:  Default [DF__Gps_TestR__GPSRe__544C7222]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__GPSRe__544C7222]  DEFAULT ((0)) FOR [GPSResult]
GO
/****** Object:  Default [DF__Gps_TestR__Coupl__5540965B]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Coupl__5540965B]  DEFAULT ((0)) FOR [CoupleResult]
GO
/****** Object:  Default [DF__Gps_TestR__Write__5634BA94]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Write__5634BA94]  DEFAULT ((0)) FOR [WriteImeiResult]
GO
/****** Object:  Default [DF__Gps_TestR__Param__5728DECD]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__Param__5728DECD]  DEFAULT ((0)) FOR [ParamDownloadResult]
GO
/****** Object:  Default [DF__Gps_TestR__AutoT__581D0306]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF__Gps_TestR__AutoT__581D0306]  DEFAULT ((0)) FOR [AutoTestResult]
GO
/****** Object:  Default [DF_Gps_TestResult_AutoTestResult1]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF_Gps_TestResult_AutoTestResult1]  DEFAULT ((0)) FOR [AutoTestSMTResult]
GO
/****** Object:  Default [DF_Gps_TestResult_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult] ADD  CONSTRAINT [DF_Gps_TestResult_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF__Gps_TestP__TestF__12149A71]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestFunction]
GO
/****** Object:  Default [DF__Gps_TestP__TestG__1308BEAA]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestGPS]
GO
/****** Object:  Default [DF__Gps_TestP__TestC__13FCE2E3]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestCouple]
GO
/****** Object:  Default [DF__Gps_TestP__TestW__14F1071C]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestWriteImei]
GO
/****** Object:  Default [DF__Gps_TestP__TestP__15E52B55]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestParamDownload]
GO
/****** Object:  Default [DF__Gps_TestP__TestC__16D94F8E]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestCartonBox]
GO
/****** Object:  Default [DF__Gps_TestP__TestA__17CD73C7]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  DEFAULT ((1)) FOR [TestAutoTest]
GO
/****** Object:  Default [DF_Gps_TestPlanSet_TestAutoTest1]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet] ADD  CONSTRAINT [DF_Gps_TestPlanSet_TestAutoTest1]  DEFAULT ((1)) FOR [TestAutoTestSMT]
GO
/****** Object:  Default [DF__Gps_TestF__TestT__03C67B1A]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestFail_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_TestF__TestT__0AA882D3]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestFail] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Write__Resul__729BEF18]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_WriteImei_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Write__TestT__73901351]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_WriteImei_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_LTestLogMessage_TestTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LTestLogMessage] ADD  CONSTRAINT [DF_LTestLogMessage_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_LSMTRunLog_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTRunLog] ADD  CONSTRAINT [DF_LSMTRunLog_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTOrderLine_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTOrderLine] ADD  CONSTRAINT [DF_LSMTOrderLine_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTMaterialPos_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTMaterialPos] ADD  CONSTRAINT [DF_LSMTMaterialPos_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTMaterialPick_Setting3]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTMaterialPick] ADD  CONSTRAINT [DF_LSMTMaterialPick_Setting3]  DEFAULT ((0)) FOR [Setting3]
GO
/****** Object:  Default [DF_LSMTMaterialPick_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTMaterialPick] ADD  CONSTRAINT [DF_LSMTMaterialPick_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTMaterialIssue_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTMaterialIssue] ADD  CONSTRAINT [DF_LSMTMaterialIssue_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTFeedState_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTFeedState] ADD  CONSTRAINT [DF_LSMTFeedState_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTCompleteBom_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTCompleteBom] ADD  CONSTRAINT [DF_LSMTCompleteBom_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTCarOrder_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTCarOrder] ADD  CONSTRAINT [DF_LSMTCarOrder_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTCarDetail_DoorState]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTCarDetail] ADD  CONSTRAINT [DF_LSMTCarDetail_DoorState]  DEFAULT ('IDLE') FOR [DoorState]
GO
/****** Object:  Default [DF_LSMTCarDetail_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTCarDetail] ADD  CONSTRAINT [DF_LSMTCarDetail_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTBomAll_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTBomAll] ADD  CONSTRAINT [DF_LSMTBomAll_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTAdvConnFeederDiff_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTAdvConnFeederDiff] ADD  CONSTRAINT [DF_LSMTAdvConnFeederDiff_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTAdvConnFeeder_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTAdvConnFeeder] ADD  CONSTRAINT [DF_LSMTAdvConnFeeder_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LSMTAdvConnDetail_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LSMTAdvConnDetail] ADD  CONSTRAINT [DF_LSMTAdvConnDetail_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF_LPrintMarkData_TestTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LPrintMarkData] ADD  CONSTRAINT [DF_LPrintMarkData_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_LOrderMessage_RecordTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[LOrderMessage] ADD  CONSTRAINT [DF_LOrderMessage_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
/****** Object:  Default [DF__Gps_SMTIQ__Resul__050FA50E]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_SMTIQC_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_SMTIQ__TestT__0603C947]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_SMTIQC_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_SMTIQ__Resul__7B863AD4]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_SMTIQC_Result] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_SMTIQ__TestT__7C7A5F0D]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_SMTIQC_Result] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_Gps_ParamDownVersionCpd_BackUp_Result]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownVersionCpd_BackUp] ADD  CONSTRAINT [DF_Gps_ParamDownVersionCpd_BackUp_Result]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF_Gps_ParamDownVersionCpd_BackUp_TestTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownVersionCpd_BackUp] ADD  CONSTRAINT [DF_Gps_ParamDownVersionCpd_BackUp_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_Gps_ParamDownUpdate_Backup_Result]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownVersionCpd] ADD  CONSTRAINT [DF_Gps_ParamDownUpdate_Backup_Result]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF_Gps_ParamDownUpdate_Backup_TestTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownVersionCpd] ADD  CONSTRAINT [DF_Gps_ParamDownUpdate_Backup_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Param__SendA__0DD9F539]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((1)) FOR [SendAtComm]
GO
/****** Object:  Default [DF__Gps_Param__ReSen__0ECE1972]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((3)) FOR [ReSendNum]
GO
/****** Object:  Default [DF__Gps_Param__TestT__0FC23DAB]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((3)) FOR [TestTimeOut]
GO
/****** Object:  Default [DF__Gps_Param__Compa__10B661E4]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] ADD  DEFAULT ((0)) FOR [Compare]
GO
/****** Object:  Default [DF__Gps_Param__Resul__7854C86E]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownload_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Param__TestT__7948ECA7]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownload_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Param__Resul__7D4E87B5]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownload_Result] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Param__TestT__7E42ABEE]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownload_Result] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_Gps_ParamConfigOrder_TestedCount]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamConfigOrder] ADD  CONSTRAINT [DF_Gps_ParamConfigOrder_TestedCount]  DEFAULT ((0)) FOR [TestedCount]
GO
/****** Object:  Default [DF_Gps_ParamConfigOrder_OrderTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamConfigOrder] ADD  CONSTRAINT [DF_Gps_ParamConfigOrder_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
/****** Object:  Default [DF_Gps_ParamConfigOrder_Status]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamConfigOrder] ADD  CONSTRAINT [DF_Gps_ParamConfigOrder_Status]  DEFAULT ((0)) FOR [Status]
GO
/****** Object:  Default [DF_Gps_OQC_SubItem_Compare]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_OQC_SubItem] ADD  CONSTRAINT [DF_Gps_OQC_SubItem_Compare]  DEFAULT ((0)) FOR [Compare]
GO
/****** Object:  Default [DF_Gps_CoupleTest_Result_Backup_IMEI]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CoupleTest_Result_Backup] ADD  CONSTRAINT [DF_Gps_CoupleTest_Result_Backup_IMEI]  DEFAULT (str(round(rand()*(10000000000.),(0)),(15),(0))) FOR [IMEI]
GO
/****** Object:  Default [DF__Gps_Coupl__Resul__6CE315C2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CoupleTest_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Coupl__TestT__6DD739FB]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CoupleTest_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_Gps_CoupleTest_Result_IMEI]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CoupleTest_Result] ADD  CONSTRAINT [DF_Gps_CoupleTest_Result_IMEI]  DEFAULT (str(round(rand()*(10000000000.),(0)),(15),(0))) FOR [IMEI]
GO
/****** Object:  Default [DF__Gps_Coupl__Resul__6F00685E]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CoupleTest_Result] ADD  CONSTRAINT [DF__Gps_Coupl__Resul__6F00685E]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Coupl__TestT__6FF48C97]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CoupleTest_Result] ADD  CONSTRAINT [DF__Gps_Coupl__TestT__6FF48C97]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_Gps_CartonBoxTwenty_Result_TestTime]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CartonBoxTen_Result] ADD  CONSTRAINT [DF_Gps_CartonBoxTwenty_Result_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Carto__Resul__7E0DA1C4]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CartonBox_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Carto__TestT__7F01C5FD]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CartonBox_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Carto__Resul__03FB8544]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CartonBox_Result] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Carto__TestT__04EFA97D]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_CartonBox_Result] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__SendA__16A44564]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSubItem] ADD  DEFAULT ((1)) FOR [SendAtComm]
GO
/****** Object:  Default [DF__Gps_AutoT__ReSen__1798699D]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSubItem] ADD  DEFAULT ((3)) FOR [ReSendNum]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__188C8DD6]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSubItem] ADD  DEFAULT ((3)) FOR [TestTimeOut]
GO
/****** Object:  Default [DF__Gps_AutoT__Compa__1980B20F]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSubItem] ADD  DEFAULT ((0)) FOR [Compare]
GO
/****** Object:  Default [DF__Gps_AutoT__SendA__51900108]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem] ADD  DEFAULT ((1)) FOR [SendAtComm]
GO
/****** Object:  Default [DF__Gps_AutoT__ReSen__52842541]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem] ADD  DEFAULT ((3)) FOR [ReSendNum]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__5378497A]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem] ADD  DEFAULT ((3)) FOR [TestTimeOut]
GO
/****** Object:  Default [DF__Gps_AutoT__Compa__546C6DB3]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem] ADD  DEFAULT ((0)) FOR [Compare]
GO
/****** Object:  Default [DF__Gps_AutoT__Resul__34F3C25A]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMT_Result_Backup] ADD  CONSTRAINT [DF__Gps_AutoT__Resul__34F3C25A]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__35E7E693]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMT_Result_Backup] ADD  CONSTRAINT [DF__Gps_AutoT__TestT__35E7E693]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__Resul__3E7D2C94]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMT_Result] ADD  CONSTRAINT [DF__Gps_AutoT__Resul__3E7D2C94]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__3F7150CD]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMT_Result] ADD  CONSTRAINT [DF__Gps_AutoT__TestT__3F7150CD]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_GpsTe__Resul__672A3C6C]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_GpsTest_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_GpsTe__TestT__681E60A5]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_GpsTest_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_GpsTe__Resul__68536ACF]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_GpsTest_Result] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_GpsTe__TestT__69478F08]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_GpsTest_Result] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Funct__Resul__61716316]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_FunctionTest_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Funct__TestT__6265874F]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_FunctionTest_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Funct__Resul__61A66D40]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_FunctionTest_Result] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Funct__TestT__629A9179]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_FunctionTest_Result] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__Resul__55D59338]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTest_CheckResult] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__56C9B771]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTest_CheckResult] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA1]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA1]  DEFAULT (newid()) FOR [DATA1]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA2]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA2]  DEFAULT (newid()) FOR [DATA2]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA3]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA3]  DEFAULT (newid()) FOR [DATA3]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA4]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA4]  DEFAULT (newid()) FOR [DATA4]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA5]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA5]  DEFAULT (newid()) FOR [DATA5]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA6]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA6]  DEFAULT (newid()) FOR [DATA6]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA7]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA7]  DEFAULT (newid()) FOR [DATA7]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA8]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA8]  DEFAULT (newid()) FOR [DATA8]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA9]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA9]  DEFAULT (newid()) FOR [DATA9]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA10]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA10]  DEFAULT (newid()) FOR [DATA10]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA11]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA11]  DEFAULT (newid()) FOR [DATA11]
GO
/****** Object:  Default [DF_DataRelativeUnique_DATA12]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA12]  DEFAULT (newid()) FOR [DATA12]
GO
/****** Object:  Default [DF_DataRelativeUnique_TestTime]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF_DataRelativeSheet_TestTime]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[DataRelativeSheet] ADD  CONSTRAINT [DF_DataRelativeSheet_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__Resul__3F56E49D]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Result2] ADD  CONSTRAINT [DF__Gps_AutoT__Resul__3F56E49D]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__404B08D6]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Result2] ADD  CONSTRAINT [DF__Gps_AutoT__TestT__404B08D6]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__Resul__0A7378A9]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Result_Backup] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__0B679CE2]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Result_Backup] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__Resul__1249A49B]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Result] ADD  CONSTRAINT [DF__Gps_AutoT__Resul__1249A49B]  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_AutoT__TestT__133DC8D4]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Result] ADD  CONSTRAINT [DF__Gps_AutoT__TestT__133DC8D4]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_AutoT__bRead__71FCD09A]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[Gps_AutoTest_Model] ADD  DEFAULT ((0)) FOR [bReadRID]
GO
/****** Object:  Default [DF_PWorkSchedule_Flag]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PWorkSchedule] ADD  CONSTRAINT [DF_PWorkSchedule_Flag]  DEFAULT ((0)) FOR [Flag]
GO
/****** Object:  Default [DF_PurchaseReceipt_CheckNumber]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_CheckNumber]  DEFAULT ((0)) FOR [CheckNumber]
GO
/****** Object:  Default [DF_PurchaseReceipt_WhetherQualified]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_WhetherQualified]  DEFAULT ((0)) FOR [WhetherQualified]
GO
/****** Object:  Default [DF_PurchaseReceipt_SpecialCompletion]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_SpecialCompletion]  DEFAULT ((0)) FOR [SpecialCompletion]
GO
/****** Object:  Default [DF_PurchaseReceipt_ChooseNumber]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_ChooseNumber]  DEFAULT ((0)) FOR [ChooseNumber]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process1]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process1]  DEFAULT ((0)) FOR [Process1]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process2]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process2]  DEFAULT ((0)) FOR [Process2]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process3]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process3]  DEFAULT ((0)) FOR [Process3]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process4]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process4]  DEFAULT ((0)) FOR [Process4]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process5]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process5]  DEFAULT ((0)) FOR [Process5]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process6]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process6]  DEFAULT ((0)) FOR [Process6]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process7]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process7]  DEFAULT ((0)) FOR [Process7]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process8]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process8]  DEFAULT ((0)) FOR [Process8]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process9]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process9]  DEFAULT ((0)) FOR [Process9]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process10]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process10]  DEFAULT ((0)) FOR [Process10]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process11]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process11]  DEFAULT ((0)) FOR [Process11]
GO
/****** Object:  Default [DF_PhoneProcessRecord_Process12]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process12]  DEFAULT ((0)) FOR [Process12]
GO
/****** Object:  Default [DF_PhoneProcessRecord_TestTime]    Script Date: 11/15/2017 18:34:56 ******/
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Carto__TestT__2D1D9668]    Script Date: 11/15/2017 18:35:00 ******/
ALTER TABLE [dbo].[Gps_CartonBoxTwenty_Result] ADD  CONSTRAINT [DF__Gps_Carto__TestT__2D1D9668]  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Default [DF__Gps_Write__Resul__76A18A26]    Script Date: 11/15/2017 18:35:00 ******/
ALTER TABLE [dbo].[Gps_WriteImei_Result] ADD  DEFAULT ((0)) FOR [Result]
GO
/****** Object:  Default [DF__Gps_Write__TestT__7795AE5F]    Script Date: 11/15/2017 18:35:00 ******/
ALTER TABLE [dbo].[Gps_WriteImei_Result] ADD  DEFAULT (getdate()) FOR [TestTime]
GO
/****** Object:  Check [chk_AutoTestResult2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestResult2] CHECK  (([AutoTestResult]=(1) OR [AutoTestResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_AutoTestResult2]
GO
/****** Object:  Check [chk_CoupleResult2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_CoupleResult2] CHECK  (([CoupleResult]=(1) OR [CoupleResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_CoupleResult2]
GO
/****** Object:  Check [chk_FunctionResult2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_FunctionResult2] CHECK  (([FunctionResult]=(1) OR [FunctionResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_FunctionResult2]
GO
/****** Object:  Check [chk_GPSResult2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_GPSResult2] CHECK  (([GPSResult]=(1) OR [GPSResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_GPSResult2]
GO
/****** Object:  Check [chk_ParamDownloadResut2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadResut2] CHECK  (([ParamDownloadResult]=(1) OR [ParamDownloadResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_ParamDownloadResut2]
GO
/****** Object:  Check [chk_WriteImeiResult2]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult2]  WITH CHECK ADD  CONSTRAINT [chk_WriteImeiResult2] CHECK  (([WriteImeiResult]=(1) OR [WriteImeiResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult2] CHECK CONSTRAINT [chk_WriteImeiResult2]
GO
/****** Object:  Check [chk_AutoTestResult_Backup]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestResult_Backup] CHECK  (([AutoTestResult]=(1) OR [AutoTestResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_AutoTestResult_Backup]
GO
/****** Object:  Check [chk_CoupleResult_Backup]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_CoupleResult_Backup] CHECK  (([CoupleResult]=(1) OR [CoupleResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_CoupleResult_Backup]
GO
/****** Object:  Check [chk_FunctionResult_Backup]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_FunctionResult_Backup] CHECK  (([FunctionResult]=(1) OR [FunctionResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_FunctionResult_Backup]
GO
/****** Object:  Check [chk_GPSResult_Backup]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_GPSResult_Backup] CHECK  (([GPSResult]=(1) OR [GPSResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_GPSResult_Backup]
GO
/****** Object:  Check [chk_ParamDownloadResut_Backup]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadResut_Backup] CHECK  (([ParamDownloadResult]=(1) OR [ParamDownloadResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_ParamDownloadResut_Backup]
GO
/****** Object:  Check [chk_WriteImeiResult_Backup]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult_Backup]  WITH CHECK ADD  CONSTRAINT [chk_WriteImeiResult_Backup] CHECK  (([WriteImeiResult]=(1) OR [WriteImeiResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult_Backup] CHECK CONSTRAINT [chk_WriteImeiResult_Backup]
GO
/****** Object:  Check [chk_AutoTestResult]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestResult] CHECK  (([AutoTestResult]=(1) OR [AutoTestResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_AutoTestResult]
GO
/****** Object:  Check [chk_CoupleResult]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_CoupleResult] CHECK  (([CoupleResult]=(1) OR [CoupleResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_CoupleResult]
GO
/****** Object:  Check [chk_FunctionResult]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_FunctionResult] CHECK  (([FunctionResult]=(1) OR [FunctionResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_FunctionResult]
GO
/****** Object:  Check [chk_GPSResult]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_GPSResult] CHECK  (([GPSResult]=(1) OR [GPSResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_GPSResult]
GO
/****** Object:  Check [chk_ParamDownloadResut]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadResut] CHECK  (([ParamDownloadResult]=(1) OR [ParamDownloadResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_ParamDownloadResut]
GO
/****** Object:  Check [chk_WriteImeiResult]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestResult]  WITH CHECK ADD  CONSTRAINT [chk_WriteImeiResult] CHECK  (([WriteImeiResult]=(1) OR [WriteImeiResult]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestResult] CHECK CONSTRAINT [chk_WriteImeiResult]
GO
/****** Object:  Check [chk_TestPlanSetTestAutoTest]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestAutoTest] CHECK  (([TestCartonBox]=(1) OR [TestCartonBox]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestAutoTest]
GO
/****** Object:  Check [chk_TestPlanSetTestCartonBox]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestCartonBox] CHECK  (([TestCartonBox]=(1) OR [TestCartonBox]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestCartonBox]
GO
/****** Object:  Check [chk_TestPlanSetTestCouple]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestCouple] CHECK  (([TestCouple]=(1) OR [TestCouple]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestCouple]
GO
/****** Object:  Check [chk_TestPlanSetTestFunction]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestFunction] CHECK  (([TestFunction]=(1) OR [TestFunction]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestFunction]
GO
/****** Object:  Check [chk_TestPlanSetTestGPS]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestGPS] CHECK  (([TestGPS]=(1) OR [TestGPS]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestGPS]
GO
/****** Object:  Check [chk_TestPlanSetTestParamDownload]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestParamDownload] CHECK  (([TestParamDownload]=(1) OR [TestParamDownload]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestParamDownload]
GO
/****** Object:  Check [chk_TestPlanSetTestWriteImei]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_TestPlanSet]  WITH CHECK ADD  CONSTRAINT [chk_TestPlanSetTestWriteImei] CHECK  (([TestWriteImei]=(1) OR [TestWriteImei]=(0)))
GO
ALTER TABLE [dbo].[Gps_TestPlanSet] CHECK CONSTRAINT [chk_TestPlanSetTestWriteImei]
GO
/****** Object:  Check [chk_ParamDownloadSubItemCompare]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadSubItemCompare] CHECK  (([Compare]=(1) OR [Compare]=(0)))
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] CHECK CONSTRAINT [chk_ParamDownloadSubItemCompare]
GO
/****** Object:  Check [chk_ParamDownloadSubItemSendAtComm]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem]  WITH CHECK ADD  CONSTRAINT [chk_ParamDownloadSubItemSendAtComm] CHECK  (([SendAtComm]=(1) OR [SendAtComm]=(0)))
GO
ALTER TABLE [dbo].[Gps_ParamDownloadSubItem] CHECK CONSTRAINT [chk_ParamDownloadSubItemSendAtComm]
GO
/****** Object:  Check [chk_AutoTestSubItemCompare]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSubItem]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestSubItemCompare] CHECK  (([Compare]=(1) OR [Compare]=(0)))
GO
ALTER TABLE [dbo].[Gps_AutoTestSubItem] CHECK CONSTRAINT [chk_AutoTestSubItemCompare]
GO
/****** Object:  Check [chk_AutoTestSubItemSendAtComm]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSubItem]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestSubItemSendAtComm] CHECK  (([SendAtComm]=(1) OR [SendAtComm]=(0)))
GO
ALTER TABLE [dbo].[Gps_AutoTestSubItem] CHECK CONSTRAINT [chk_AutoTestSubItemSendAtComm]
GO
/****** Object:  Check [chk_AutoTestSMTSubItemCompare]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestSMTSubItemCompare] CHECK  (([Compare]=(1) OR [Compare]=(0)))
GO
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem] CHECK CONSTRAINT [chk_AutoTestSMTSubItemCompare]
GO
/****** Object:  Check [chk_AutoTestSMTSubItemSendAtComm]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem]  WITH CHECK ADD  CONSTRAINT [chk_AutoTestSMTSubItemSendAtComm] CHECK  (([SendAtComm]=(1) OR [SendAtComm]=(0)))
GO
ALTER TABLE [dbo].[Gps_AutoTestSMTSubItem] CHECK CONSTRAINT [chk_AutoTestSMTSubItemSendAtComm]
GO
/****** Object:  ForeignKey [FK_Gps_OQC_SubItem_Gps_OQC_SubItem]    Script Date: 11/15/2017 18:34:29 ******/
ALTER TABLE [dbo].[Gps_OQC_SubItem]  WITH CHECK ADD  CONSTRAINT [FK_Gps_OQC_SubItem_Gps_OQC_SubItem] FOREIGN KEY([Id])
REFERENCES [dbo].[Gps_OQC_SubItem] ([Id])
GO
ALTER TABLE [dbo].[Gps_OQC_SubItem] CHECK CONSTRAINT [FK_Gps_OQC_SubItem_Gps_OQC_SubItem]
GO
/****** Object:  ForeignKey [FK_PExceptionTypes_PEncodingSetting]    Script Date: 11/15/2017 18:34:57 ******/
ALTER TABLE [dbo].[PEncodingSetting]  WITH CHECK ADD  CONSTRAINT [FK_PExceptionTypes_PEncodingSetting] FOREIGN KEY([ES_ExceptionTypes])
REFERENCES [dbo].[PExceptionTypes] ([ExceptionTypes])
GO
ALTER TABLE [dbo].[PEncodingSetting] CHECK CONSTRAINT [FK_PExceptionTypes_PEncodingSetting]
GO
/****** Object:  ForeignKey [FK_CartonBox20_TESTERID]    Script Date: 11/15/2017 18:35:00 ******/
ALTER TABLE [dbo].[Gps_CartonBoxTwenty_Result]  WITH CHECK ADD  CONSTRAINT [FK_CartonBox20_TESTERID] FOREIGN KEY([TesterId])
REFERENCES [dbo].[Gps_User] ([UserName])
GO
ALTER TABLE [dbo].[Gps_CartonBoxTwenty_Result] CHECK CONSTRAINT [FK_CartonBox20_TESTERID]
GO
