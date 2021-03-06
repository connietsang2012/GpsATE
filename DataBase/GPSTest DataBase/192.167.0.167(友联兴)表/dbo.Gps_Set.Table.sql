USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_Set]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_Set](
	[SetId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[Model] [varchar](50) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[SnPro] [varchar](4) NOT NULL,
	[SnDate] [varchar](4) NOT NULL,
	[SnBegin] [varchar](6) NOT NULL,
	[SnEnd] [varchar](6) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Set] PRIMARY KEY CLUSTERED 
(
	[SetId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
