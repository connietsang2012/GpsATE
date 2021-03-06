USE [GPSTest]
GO
/****** Object:  Table [dbo].[PurchaseReceipt]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PurchaseReceipt](
	[PurchaseReceiptID] [varchar](100) NOT NULL,
	[PurchaseNo] [varchar](80) NOT NULL,
	[SupplierName] [varchar](80) NOT NULL,
	[BatchNo] [varchar](80) NOT NULL,
	[MaterialCode] [varchar](80) NOT NULL,
	[MaterialName] [varchar](80) NOT NULL,
	[MaterialSpecifications] [varchar](80) NOT NULL,
	[ProductQuantity] [int] NOT NULL,
	[ProductQuantity1] [int] NOT NULL,
	[CheckAudit] [varchar](50) NOT NULL,
	[CheckQualified] [varchar](50) NOT NULL,
	[CheckSpecialMining] [varchar](50) NOT NULL,
	[note] [varchar](8000) NULL,
	[ScanningTime] [datetime] NOT NULL,
	[UpdateTime] [datetime] NOT NULL,
	[UpdateTime1] [datetime] NOT NULL,
	[UserName] [varchar](50) NOT NULL,
	[CheckAuditUserName] [varchar](50) NULL,
	[CheckQualifiedUserName] [varchar](50) NULL,
	[CheckSpecialMiningUserName] [varchar](50) NULL,
	[CheckNumber] [int] NOT NULL,
	[classType] [varchar](80) NULL,
	[ProblemDescription] [varchar](255) NULL,
	[OrderState] [int] NULL,
	[QualifiedTime1] [datetime] NULL,
	[QualifiedTime2] [datetime] NULL,
	[QualifiedRate] [float] NULL,
	[FinancialEntry] [varchar](50) NULL,
	[FinancialEntryName] [varchar](50) NULL,
	[FinancialEntryTime] [datetime] NULL,
	[WhetherQualified] [bit] NULL,
	[SpecialCompletion] [bit] NULL,
	[ChooseNumber] [int] NULL,
	[NotChooseNumber] [int] NULL,
	[ChooseTime1] [datetime] NULL,
	[ChooseTime2] [datetime] NULL,
	[ChooseName] [varchar](50) NULL,
	[Storage] [varchar](20) NULL,
	[ReturnGoods] [varchar](20) NULL,
	[AttributionResponsibility] [varchar](50) NULL,
	[Presentation8D] [varchar](50) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PurchaseReceipt] PRIMARY KEY CLUSTERED 
(
	[PurchaseReceiptID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_CheckNumber]  DEFAULT ((0)) FOR [CheckNumber]
GO
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_WhetherQualified]  DEFAULT ((0)) FOR [WhetherQualified]
GO
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_SpecialCompletion]  DEFAULT ((0)) FOR [SpecialCompletion]
GO
ALTER TABLE [dbo].[PurchaseReceipt] ADD  CONSTRAINT [DF_PurchaseReceipt_ChooseNumber]  DEFAULT ((0)) FOR [ChooseNumber]
GO
