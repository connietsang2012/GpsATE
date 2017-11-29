USE [GPSTest]
GO
/****** Object:  Table [dbo].[PUsers]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PUsers](
	[UserName] [varchar](50) NOT NULL,
	[UserPassword] [varchar](100) NOT NULL,
	[systemAdimin] [bit] NOT NULL,
	[Limite] [bit] NOT NULL,
	[Department] [varchar](100) NULL,
	[AddUser] [bit] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
