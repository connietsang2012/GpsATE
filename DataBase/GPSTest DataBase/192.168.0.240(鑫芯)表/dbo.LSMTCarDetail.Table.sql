USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTCarDetail]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LSMTCarDetail] ADD  CONSTRAINT [DF_LSMTCarDetail_DoorState]  DEFAULT ('IDLE') FOR [DoorState]
GO
ALTER TABLE [dbo].[LSMTCarDetail] ADD  CONSTRAINT [DF_LSMTCarDetail_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
