USE [GPSTest]
GO
/****** Object:  Table [dbo].[DataRelativeUnique]    Script Date: 11/23/2017 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataRelativeUnique](
	[DATA1] [varchar](50) NOT NULL,
	[DATA2] [varchar](50) NULL,
	[DATA3] [varchar](50) NULL,
	[DATA4] [varchar](50) NULL,
	[DATA5] [varchar](50) NULL,
	[DATA6] [varchar](50) NULL,
	[DATA7] [varchar](50) NULL,
	[DATA8] [varchar](50) NULL,
	[DATA9] [varchar](50) NULL,
	[DATA10] [varchar](50) NULL,
	[DATA11] [varchar](50) NULL,
	[DATA12] [varchar](50) NULL,
	[ZhiDan] [varchar](50) NULL,
	[TestTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DataRelativeUnique] PRIMARY KEY CLUSTERED 
(
	[DATA1] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA1]  DEFAULT (newid()) FOR [DATA1]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA2]  DEFAULT (newid()) FOR [DATA2]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA3]  DEFAULT (newid()) FOR [DATA3]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA4]  DEFAULT (newid()) FOR [DATA4]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA5]  DEFAULT (newid()) FOR [DATA5]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA6]  DEFAULT (newid()) FOR [DATA6]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA7]  DEFAULT (newid()) FOR [DATA7]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA8]  DEFAULT (newid()) FOR [DATA8]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA9]  DEFAULT (newid()) FOR [DATA9]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA10]  DEFAULT (newid()) FOR [DATA10]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA11]  DEFAULT (newid()) FOR [DATA11]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_DATA12]  DEFAULT (newid()) FOR [DATA12]
GO
ALTER TABLE [dbo].[DataRelativeUnique] ADD  CONSTRAINT [DF_DataRelativeUnique_TestTime]  DEFAULT (getdate()) FOR [TestTime]
GO
