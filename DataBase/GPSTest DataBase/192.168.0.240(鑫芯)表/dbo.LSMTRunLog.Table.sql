USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTRunLog]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LSMTRunLog] ADD  CONSTRAINT [DF_LSMTRunLog_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
