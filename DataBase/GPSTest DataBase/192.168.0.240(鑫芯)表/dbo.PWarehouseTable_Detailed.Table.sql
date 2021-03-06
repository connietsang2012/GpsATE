USE [GPSTest]
GO
/****** Object:  Table [dbo].[PWarehouseTable_Detailed]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PWarehouseTable_Detailed](
	[PurchaseReceiptID] [varchar](100) NOT NULL,
	[PurchaseNo] [varchar](80) NOT NULL,
	[SupplierName] [varchar](80) NOT NULL,
	[BatchNo] [varchar](80) NOT NULL,
	[MaterialCode] [varchar](80) NOT NULL,
	[MaterialName] [varchar](80) NOT NULL,
	[MaterialSpecifications] [varchar](80) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[note] [varchar](200) NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[StorageAddress] [varchar](255) NOT NULL,
	[UserName] [varchar](50) NULL,
 CONSTRAINT [PK_PWarehouseTable_Detailed] PRIMARY KEY CLUSTERED 
(
	[PurchaseReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
