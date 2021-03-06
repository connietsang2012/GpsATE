USE [GPSTest]
GO
/****** Object:  Table [dbo].[ProductSet_New_title]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductSet_New_title](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ProductClass] [varchar](100) NOT NULL,
	[UpdataTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ProductSet_New_title] PRIMARY KEY CLUSTERED 
(
	[ProductClass] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
