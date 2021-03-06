USE [GPSTest]
GO
/****** Object:  Table [dbo].[LTestLogMessage]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LTestLogMessage] ADD  CONSTRAINT [DF_LTestLogMessage_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
