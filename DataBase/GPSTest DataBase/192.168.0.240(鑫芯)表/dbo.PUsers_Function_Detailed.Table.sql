USE [GPSTest]
GO
/****** Object:  Table [dbo].[PUsers_Function_Detailed]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUsers_Function_Detailed](
	[UserName] [varchar](50) NOT NULL,
	[FunctionName] [varchar](50) NOT NULL,
	[FunctionJurisdiction] [bit] NOT NULL,
	[FunctionGUID] [varchar](100) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PUsers_Function_Detailed_1] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC,
	[FunctionName] ASC,
	[FunctionGUID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
