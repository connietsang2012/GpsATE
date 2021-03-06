USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTCarOrder]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LSMTCarOrder] ADD  CONSTRAINT [DF_LSMTCarOrder_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
