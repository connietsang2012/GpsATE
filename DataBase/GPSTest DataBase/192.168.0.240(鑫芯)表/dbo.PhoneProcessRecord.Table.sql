USE [GPSTest]
GO
/****** Object:  Table [dbo].[PhoneProcessRecord]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PhoneProcessRecord](
	[SN] [varchar](50) NOT NULL,
	[IMEI] [varchar](50) NULL,
	[Process1] [nvarchar](50) NULL,
	[Process2] [nvarchar](50) NULL,
	[Process3] [nvarchar](50) NULL,
	[Process4] [nvarchar](50) NULL,
	[Process5] [nvarchar](50) NULL,
	[Process6] [nvarchar](50) NULL,
	[Process7] [nvarchar](50) NULL,
	[Process8] [nvarchar](50) NULL,
	[Process9] [nvarchar](50) NULL,
	[Process10] [nvarchar](50) NULL,
	[Process11] [nvarchar](50) NULL,
	[Process12] [nvarchar](50) NULL,
	[TestTime] [datetime] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PhoneProcessRecord] PRIMARY KEY CLUSTERED 
(
	[SN] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process1]  DEFAULT ((0)) FOR [Process1]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process2]  DEFAULT ((0)) FOR [Process2]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process3]  DEFAULT ((0)) FOR [Process3]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process4]  DEFAULT ((0)) FOR [Process4]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process5]  DEFAULT ((0)) FOR [Process5]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process6]  DEFAULT ((0)) FOR [Process6]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process7]  DEFAULT ((0)) FOR [Process7]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process8]  DEFAULT ((0)) FOR [Process8]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process9]  DEFAULT ((0)) FOR [Process9]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process10]  DEFAULT ((0)) FOR [Process10]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process11]  DEFAULT ((0)) FOR [Process11]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_Process12]  DEFAULT ((0)) FOR [Process12]
GO
ALTER TABLE [dbo].[PhoneProcessRecord] ADD  CONSTRAINT [DF_PhoneProcessRecord_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
