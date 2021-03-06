USE [GPSTest]
GO
/****** Object:  Table [dbo].[PMCplan_table]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PMCplan_table](
	[CorporateName] [varchar](50) NOT NULL,
	[ZhiDan] [varchar](100) NOT NULL,
	[TotalOrder] [int] NOT NULL,
	[RequiredTimeGUID] [varchar](80) NOT NULL,
	[CustomerName] [varchar](80) NOT NULL,
	[ShippingDate] [datetime] NOT NULL,
	[Remarks] [varchar](200) NULL,
	[CreationTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PMCplan_table] PRIMARY KEY CLUSTERED 
(
	[CorporateName] ASC,
	[ZhiDan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
