USE [GPSTest]
GO
/****** Object:  Table [dbo].[LSMTMaterialIssue]    Script Date: 11/23/2017 11:48:26 ******/
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
ALTER TABLE [dbo].[LSMTMaterialIssue] ADD  CONSTRAINT [DF_LSMTMaterialIssue_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
