USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_GetQCParamDownloadDifferValue]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetQCParamDownloadDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_GetQCParamDownloadDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
