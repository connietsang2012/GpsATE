USE [GPSTest]
GO
/****** Object:  Table [dbo].[TestResultNT32S_11_A1D_D23_R0_V06_TQStation0]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TestResultNT32S_11_A1D_D23_R0_V06_TQStation0](
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
