USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_GetImeiDifferValue]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Gps_GetImeiDifferValue](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[differvalue] [int] NULL,
	[softmodel] [nvarchar](50) NULL,
	[testtime] [datetime] NULL,
 CONSTRAINT [PK_Gps_GetImeiDifferValue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
