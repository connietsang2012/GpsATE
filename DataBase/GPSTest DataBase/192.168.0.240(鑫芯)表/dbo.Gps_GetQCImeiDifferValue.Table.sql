USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_GetQCImeiDifferValue]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetQCImeiDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[testerid] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
	[usertype] [nvarchar](50) NULL,
	[softmodel] [nvarchar](50) NULL,
 CONSTRAINT [PK_Gps_GetQCImeiDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
