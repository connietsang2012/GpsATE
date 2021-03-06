USE [GPSTest]
GO
/****** Object:  Table [dbo].[ProductionLinePC]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductionLinePC](
	[Pcname] [varchar](100) NOT NULL,
	[ProductType] [varchar](20) NOT NULL,
	[LineName] [varchar](80) NOT NULL,
	[CompanyName] [varchar](50) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductionLinePC] PRIMARY KEY NONCLUSTERED 
(
	[Pcname] ASC,
	[ProductType] ASC,
	[LineName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
