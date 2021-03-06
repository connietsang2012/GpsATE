USE [GPSTest]
GO
/****** Object:  Table [dbo].[PEncodingSetting]    Script Date: 11/23/2017 11:48:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PEncodingSetting](
	[BarcodeEncoding] [varchar](100) NOT NULL,
	[ProblemDescription] [varchar](200) NOT NULL,
	[ES_ExceptionTypes] [varchar](80) NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_PEncodingSetting] PRIMARY KEY CLUSTERED 
(
	[BarcodeEncoding] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[PEncodingSetting]  WITH CHECK ADD  CONSTRAINT [FK_PExceptionTypes_PEncodingSetting] FOREIGN KEY([ES_ExceptionTypes])
REFERENCES [dbo].[PExceptionTypes] ([ExceptionTypes])
GO
ALTER TABLE [dbo].[PEncodingSetting] CHECK CONSTRAINT [FK_PExceptionTypes_PEncodingSetting]
GO
