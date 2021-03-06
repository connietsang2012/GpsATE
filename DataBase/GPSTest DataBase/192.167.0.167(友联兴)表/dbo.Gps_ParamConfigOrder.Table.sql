USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_ParamConfigOrder]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ParamConfigOrder](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[OrderNum] [nvarchar](50) NOT NULL,
	[IMEISTART] [varchar](15) NOT NULL,
	[IMEIEND] [varchar](15) NOT NULL,
	[ItemModel] [nvarchar](50) NOT NULL,
	[Count] [int] NOT NULL,
	[TestedCount] [int] NOT NULL,
	[OrderTime] [datetime] NOT NULL,
	[Status] [int] NOT NULL,
	[Remark] [nvarchar](100) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_ParamConfigOrder] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [IX_Gps_ParamConfigOrder_OR] UNIQUE NONCLUSTERED 
(
	[OrderNum] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_ParamConfigOrder] ADD  CONSTRAINT [DF_Gps_ParamConfigOrder_TestedCount]  DEFAULT ((0)) FOR [TestedCount]
GO
ALTER TABLE [dbo].[Gps_ParamConfigOrder] ADD  CONSTRAINT [DF_Gps_ParamConfigOrder_OrderTime]  DEFAULT (getdate()) FOR [OrderTime]
GO
ALTER TABLE [dbo].[Gps_ParamConfigOrder] ADD  CONSTRAINT [DF_Gps_ParamConfigOrder_Status]  DEFAULT ((0)) FOR [Status]
GO
