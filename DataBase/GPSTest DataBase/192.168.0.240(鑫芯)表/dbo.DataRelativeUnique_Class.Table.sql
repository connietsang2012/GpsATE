USE [GPSTest]
GO
/****** Object:  Table [dbo].[DataRelativeUnique_Class]    Script Date: 11/23/2017 11:48:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[DataRelativeUnique_Class](
	[ClassName] [varchar](80) NOT NULL,
	[DATA1] [varchar](50) NULL,
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
	[DATA13] [varchar](50) NULL,
	[DATA14] [varchar](50) NULL,
	[DATA15] [varchar](50) NULL,
	[NumberDATA1] [int] NULL,
	[NumberDATA2] [int] NULL,
	[NumberDATA3] [int] NULL,
	[NumberDATA4] [int] NULL,
	[NumberDATA5] [int] NULL,
	[NumberDATA6] [int] NULL,
	[NumberDATA7] [int] NULL,
	[NumberDATA8] [int] NULL,
	[NumberDATA9] [int] NULL,
	[NumberDATA10] [int] NULL,
	[NumberDATA11] [int] NULL,
	[NumberDATA12] [int] NULL,
	[NumberDATA13] [int] NULL,
	[NumberDATA14] [int] NULL,
	[NumberDATA15] [int] NULL,
 CONSTRAINT [PK_DataRelativeUnique_Class] PRIMARY KEY CLUSTERED 
(
	[ClassName] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
