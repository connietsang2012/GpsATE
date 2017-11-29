USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTAdvConnFeeder]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LSMTAdvConnFeeder] ADD  CONSTRAINT [DF_LSMTAdvConnFeeder_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
