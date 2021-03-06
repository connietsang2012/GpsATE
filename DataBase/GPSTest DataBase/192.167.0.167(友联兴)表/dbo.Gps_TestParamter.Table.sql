USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_TestParamter]    Script Date: 11/23/2017 11:46:50 ******/
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
