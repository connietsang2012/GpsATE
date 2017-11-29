USE [GPSTest]
GO
/****** Object:  Table [dbo].[GpsTcData]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[GpsTcData](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[SN] [varchar](32) NOT NULL,
	[FixMode] [varchar](30) NOT NULL,
	[GpsDb_0] [int] NULL,
	[GpsDb_1] [int] NULL,
	[GpsDb_2] [int] NULL,
	[GpsDb_3] [int] NULL,
	[GpsDb_4] [int] NULL,
	[GpsDb_5] [int] NULL,
	[GpsDb_6] [int] NULL,
	[GpsDb_7] [int] NULL,
	[GpsDb_8] [int] NULL,
	[GpsDb_9] [int] NULL,
	[GpsDb_10] [int] NULL,
	[GpsDb_11] [int] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_GpsTcData_Result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_GpsTcData_SN] UNIQUE NONCLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
