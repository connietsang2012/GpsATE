USE [GPSTest]
GO
/****** Object:  Table [dbo].[PRequiredTime_Detailed]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PRequiredTime_Detailed](
	[ProductType] [varchar](20) NOT NULL,
	[RequiredTimeGUID] [varchar](80) NOT NULL,
	[RequiredTime] [float] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PRequiredTime_Detailed] PRIMARY KEY CLUSTERED 
(
	[ProductType] ASC,
	[RequiredTimeGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
