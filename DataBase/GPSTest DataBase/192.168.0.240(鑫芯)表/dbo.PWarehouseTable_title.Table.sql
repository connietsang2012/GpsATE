USE [GPSTest]
GO
/****** Object:  Table [dbo].[PWarehouseTable_title]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWarehouseTable_title](
	[ID] [varchar](80) NOT NULL,
	[WarehouseName] [varchar](100) NOT NULL,
	[FID] [varchar](80) NOT NULL,
 CONSTRAINT [PK_PWarehouseTable_title] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
