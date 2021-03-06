USE [GPSTest]
GO
/****** Object:  Table [dbo].[Gps_ManuOrderParam]    Script Date: 12/25/2017 16:39:36 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Gps_ManuOrderParam](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[ZhiDan] [varchar](50) NOT NULL,
	[SoftModel] [varchar](50) NOT NULL,
	[SN1] [varchar](50) NOT NULL,
	[SN2] [varchar](50) NOT NULL,
	[SN3] [varchar](50) NULL,
	[BoxNo1] [varchar](50) NOT NULL,
	[BoxNo2] [varchar](50) NOT NULL,
	[ProductDate] [varchar](50) NOT NULL,
	[Color] [varchar](50) NOT NULL,
	[Weight] [varchar](50) NOT NULL,
	[Qty] [varchar](50) NOT NULL,
	[ProductNo] [varchar](50) NOT NULL,
	[Version] [varchar](50) NOT NULL,
	[IMEIStart] [varchar](50) NOT NULL,
	[IMEIEnd] [varchar](50) NOT NULL,
	[SIMStart] [varchar](50) NULL,
	[SIMEnd] [varchar](50) NULL,
	[IMEIRel] [int] NOT NULL,
	[TACInfo] [varchar](50) NOT NULL,
	[CompanyName] [varchar](50) NULL,
	[Remark1] [varchar](50) NULL,
	[Remark2] [varchar](50) NULL,
	[Remark3] [varchar](50) NULL,
	[Remark4] [varchar](50) NULL,
	[Remark5] [varchar](50) NULL,
	[Status] [int] NOT NULL,
	[_MASK_FROM_V2] [timestamp] NOT NULL,
 CONSTRAINT [PK_ManuOrderParam] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Gps_ManuOrderParam] ADD  CONSTRAINT [DF_Gps_ManuOrderParam_Status]  DEFAULT ((0)) FOR [Status]
GO
SET IDENTITY_INSERT [dbo].[Gps_ManuOrderParam] ON
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (3, N'CPX01711012B1', N'GT740', N'HZXXR49', N'03003', N'', N'YLXR', N'00151', N'2017.12.1', N'黑色', N'___________KG', N'20PCS', N'K-GT740099040ZXBZ03', N'NT74_10_A1D_R0_V07', N'86812018486372', N'86812018489371', N'1064770153000', N'1064770189999', 1, N'868120', NULL, N'备注：标准版', NULL, N'', NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (4, N'CPX01711030C1', N'G17', N'HZXXR50', N'01229', N'', N'YLXR', N'01001', N'2017.12.08', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040PXDZ03', N'NT33_20_A1D_D23_R0_V08', N'86812018615237', N'86812018837505', N'1064762970000', N'1064877869999', 1, N'868120', NULL, N'备注：9200', NULL, N'', NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (5, N'CPX01711012C2', N'GT740', N'HZXXR51', N'04554', N'', N'YLXR', N'00228', N'2017.12.18', N'黑色', N'___________KG', N'20PCS', N'K-GT740099040ZXBZ03', N'NT74_10_A1D_R0_V07', N'86812018673238', N'86812018678237', N'1064770194000', N'1064770198999', 1, N'868120', NULL, N'备注：标准版', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (6, N'CPX01712011B1', N'G17', N'HZXXR51', N'00001', NULL, N'YLXR', N'00240', N'2017.12.21', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040PXDZ01', N'NT33_20_A1D_D23_R0_V08', N'86812018817505', N'86812018827504', NULL, NULL, 0, N'868120', NULL, N'备注：9200', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (7, N'CPX01712011B1-1', N'G17', N'HZXXR51', N'00001', NULL, N'YLXR', N'00001', N'2017.12.18', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040PXDZ01', N'NT33_20_A1D_D23_R0_V08', N'86812018817505', N'86812018827504', NULL, NULL, 0, N'868120', NULL, N'备注：9200', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (8, N'CPX01712011B1-2', N'G17', N'HZXXR51', N'00001', NULL, N'YLXR', N'00101', N'2017.12.21', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040PXDZ01', N'NT33_20_A1D_D23_R0_V08', N'86812018817505', N'86812018827504', NULL, NULL, 0, N'868120', NULL, N'备注：9200', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (9, N'CPX01712010A3', N'A7', N'HZXXR52', N'01975', NULL, N'YLXR', N'00094', N'2017.12.25', N'黑色', N'___________KG', N'20PCS', N'K-GT740099040WKDZ01', N'NT74_10_A1D_R0_V07', N'86812018814505', N'86812018817504', N'1064770202000', N'1064770204999', 1, N'868120', NULL, N'备注：山东悟空电子', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (10, N'CPX01711031D1', N'GV25', N'HZXXR51', N'00001', NULL, N'YLXR', N'00001', N'2017.12.25', N'黑色', N'__________GK', N'20PCS', N'K-GV250099040PXDZ02', N'NT33_20_A1D_D23_R0_V08', N'78000002019112', N'78000002019612', NULL, NULL, 0, N'780000', NULL, N'备注：偏向', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (11, N'CPX01710012B1', N'GV25', N'HZXXR51', N'00001', NULL, N'YLXR', N'00001', N'2017.12.18.', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040ZXBB01', N'NT33_20_A1D_D23_R0_V08', N'86812018494272', N'86812018499271', NULL, NULL, 0, N'868120', NULL, N'备注：标准版（无防水版）', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (12, N'CPX01711025B1', N'GT200', N'HZXXR51', N'00001', NULL, N'YLXR', N'00001', N'2017.12.19', N'黑色', N'__________KG', N'20PCS', N'K-GT200099040ZXBB01', N'NT32S_11_A1D_D23_R0_V06_TQ', N'86812018755705', N'86812018760704', NULL, NULL, 0, N'868120', NULL, N'备注：标准版', NULL, NULL, NULL, NULL, 0)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (13, N'CPX01711026D1', N'GT220', N'HZXXR51', N'04362', NULL, N'YLXR', N'00217', N'2017.12.19', N'黑色', N'___________KG', N'20PCS', N'K-GT220090040ZXBB01', N'NT32_10_A1D_D23_R0_V07', N'86812018730201', N'86812018737800', NULL, NULL, 0, N'868120', NULL, N'备注：标准版', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (14, N'CPX01708034F3', N'TQ740', N'HZXXR51', N'02001', NULL, N'YLXR', N'00101', N'2017.12.21', N'黑色', N'__________KG', N'20PCS', N'K-GT740099040TQDZ01', N'NT74_10_A1D_R0_V07', N'86812018765705', N'86812018767704', N'1064770200000', N'1064770201999', 1, N'868120', NULL, N'备注：浙江途强科技有限公司', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (15, N'CPX01712011B2', N'GV25', N'HZXXR51', N'02919', NULL, N'YLXR', N'00146', N'2017.12.23', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040ACBB03', N'NT33_20_A1D_D23_R0_V08', N'86812018828505', N'86812018836504', N'1064770720000', N'1064770725999', 1, N'868120', NULL, N'备注：成都爱车保', NULL, NULL, NULL, NULL, 1)
INSERT [dbo].[Gps_ManuOrderParam] ([Id], [ZhiDan], [SoftModel], [SN1], [SN2], [SN3], [BoxNo1], [BoxNo2], [ProductDate], [Color], [Weight], [Qty], [ProductNo], [Version], [IMEIStart], [IMEIEnd], [SIMStart], [SIMEnd], [IMEIRel], [TACInfo], [CompanyName], [Remark1], [Remark2], [Remark3], [Remark4], [Remark5], [Status]) VALUES (16, N'CPX01712011B2-1', N'GV25', N'HZXXR51', N'00001', NULL, N'YLXR', N'00001', N'2017.12.23', N'黑色', N'___________KG', N'20PCS', N'K-GV250099040ACBB03', N'NT33_20_A1D_D23_R0_V08', N'86812018828505', N'86812018836504', N'1064770720000', N'1064770725999', 1, N'868120', NULL, N'备注：成都爱车保', NULL, NULL, NULL, NULL, 0)
SET IDENTITY_INSERT [dbo].[Gps_ManuOrderParam] OFF
