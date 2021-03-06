USE [GPSTest]
GO
/****** Object:  Table [dbo].[LOrderMessage]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LOrderMessage](
	[ZhiDan] [varchar](100) NOT NULL,
	[SoftModel] [varchar](50) NOT NULL,
	[StateSign] [varchar](50) NULL,
	[Setting0] [varchar](256) NULL,
	[Setting1] [varchar](256) NULL,
	[Setting2] [varchar](256) NULL,
	[Setting3] [varchar](256) NULL,
	[Setting4] [varchar](256) NULL,
	[Setting5] [varchar](256) NULL,
	[Setting6] [varchar](256) NULL,
	[Setting7] [varchar](256) NULL,
	[Setting8] [varchar](256) NULL,
	[Setting9] [varchar](256) NULL,
	[Setting10] [varchar](256) NULL,
	[Setting11] [varchar](256) NULL,
	[Setting12] [varchar](256) NULL,
	[Setting13] [varchar](256) NULL,
	[Setting14] [varchar](256) NULL,
	[Setting15] [varchar](256) NULL,
	[Setting16] [varchar](256) NULL,
	[Setting17] [varchar](256) NULL,
	[Setting18] [varchar](256) NULL,
	[Setting19] [varchar](256) NULL,
	[Setting20] [varchar](256) NULL,
	[Setting21] [varchar](256) NULL,
	[Setting22] [varchar](256) NULL,
	[Setting23] [varchar](256) NULL,
	[Setting24] [varchar](256) NULL,
	[Setting25] [varchar](256) NULL,
	[Setting26] [varchar](256) NULL,
	[Setting27] [varchar](256) NULL,
	[Setting28] [varchar](256) NULL,
	[Setting29] [varchar](256) NULL,
	[Setting30] [varchar](256) NULL,
	[Setting31] [varchar](256) NULL,
	[Setting32] [varchar](256) NULL,
	[Setting33] [varchar](256) NULL,
	[Setting34] [varchar](256) NULL,
	[Setting35] [varchar](256) NULL,
	[Setting36] [varchar](256) NULL,
	[Setting37] [varchar](256) NULL,
	[Setting38] [varchar](256) NULL,
	[Setting39] [varchar](256) NULL,
	[Setting40] [varchar](256) NULL,
	[Setting41] [varchar](256) NULL,
	[Setting42] [varchar](256) NULL,
	[Setting43] [varchar](256) NULL,
	[RecordTime] [datetime] NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_LOrderMessage] PRIMARY KEY CLUSTERED 
(
	[ZhiDan] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[LOrderMessage] ADD  CONSTRAINT [DF_LOrderMessage_RecordTime]  DEFAULT (getdate()) FOR [RecordTime]
GO
