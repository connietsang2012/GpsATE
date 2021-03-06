USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_GetCountDifferVaue]    Script Date: 11/23/2017 11:46:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_GetCountDifferVaue](
	[id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[DifferValue] [bigint] NULL,
	[SoftModel] [varchar](20) NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_Gps_GetCountDifferVaue] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'ID号' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gps_GetCountDifferVaue', @level2type=N'COLUMN',@level2name=N'id'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'两台机子测试时间用时间隔(毫秒级)' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'Gps_GetCountDifferVaue', @level2type=N'COLUMN',@level2name=N'DifferValue'
GO
