USE [GPSTest]
GO
/****** Object:  Table [dbo].[ProductionEfficiencySummary]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionEfficiencySummary](
	[ID] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductionClass] [varchar](20) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](100) NULL,
	[ProductClass] [varchar](80) NULL,
	[Hours] [int] NULL,
	[actualHours] [int] NULL,
	[Ratio] [float] NULL,
	[sumHours] [float] NULL,
	[sum] [int] NULL,
	[FailureRate] [float] NULL,
	[FailureNuber] [int] NULL,
	[UpdateTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
