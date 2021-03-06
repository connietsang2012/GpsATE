USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTFeedState]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LSMTFeedState] ADD  CONSTRAINT [DF_LSMTFeedState_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
