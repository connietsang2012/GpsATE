USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_User]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_User](
	[UserId] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[UserName] [varchar](20) NOT NULL,
	[UserDes] [varchar](20) NOT NULL,
	[UserPwd] [varchar](20) NOT NULL,
	[UserType] [varchar](20) NOT NULL,
	[UserTestPlan] [varchar](20) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
	[LoginTime] [datetime] NOT NULL,
	[LoginStatus] [int] NOT NULL,
	[InService] [bit] NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY],
 CONSTRAINT [UN_User] UNIQUE NONCLUSTERED 
(
	[UserName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_User] ADD  CONSTRAINT [DF_Gps_User_LoginTime]  DEFAULT (getdate()) FOR [LoginTime]
GO
ALTER TABLE [dbo].[Gps_User] ADD  CONSTRAINT [DF_Gps_User_LoginStatus]  DEFAULT ((0)) FOR [LoginStatus]
GO
ALTER TABLE [dbo].[Gps_User] ADD  CONSTRAINT [DF_Gps_User_InService]  DEFAULT ((1)) FOR [InService]
GO
