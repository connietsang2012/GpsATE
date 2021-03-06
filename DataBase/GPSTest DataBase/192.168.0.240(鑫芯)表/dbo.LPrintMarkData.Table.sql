USE [GPSTest]
GO
/****** Object:  Table [dbo].[LPrintMarkData]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LPrintMarkData] ADD  CONSTRAINT [DF_LPrintMarkData_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
