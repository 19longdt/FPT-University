USE [Quiz]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 21/06/2021 20:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Username] [nvarchar](20) NULL,
	[Password] [nvarchar](20) NULL,
	[Type] [int] NULL,
	[Mail] [nvarchar](max) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[History]    Script Date: 21/06/2021 20:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[History](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Score] [float] NULL,
	[Status] [int] NULL,
	[Date] [nvarchar](20) NULL,
	[IdUser] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Quiz]    Script Date: 21/06/2021 20:35:41 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Quiz](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Question] [nvarchar](max) NULL,
	[Answer] [nvarchar](max) NULL,
	[Option1] [nvarchar](max) NULL,
	[Option2] [nvarchar](max) NULL,
	[Option3] [nvarchar](max) NULL,
	[Option4] [nvarchar](max) NULL,
	[DateCreated] [nvarchar](20) NULL,
	[idAccount] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (1, N'longdt', N'123', 0, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (2, N'duongtb', N'123', 1, N'	DuongTB@fe.edu.vn')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (3, N'longdt', N'123', 0, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (7, N'anhlongdz', N'123', 1, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (8, N'student', N'123', 0, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (9, N'te', N'123', 1, N'longdt@@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (10, N'teacher', N'123', 1, N'thayduong@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (11, N'tea', N'123', 1, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (12, N'aa', N'12345678', 0, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (13, N'tee', N'12345678', 1, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (14, N'saa', N'12345678', 0, N'19longdt.fptu@gmail.com')
INSERT [dbo].[Account] ([ID], [Username], [Password], [Type], [Mail]) VALUES (15, N'thay', N'12345678', 1, N'19longdt.fptu@gmail.com')
SET IDENTITY_INSERT [dbo].[Account] OFF
SET IDENTITY_INSERT [dbo].[History] ON 

INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (1, 6.67, 1, N'2021-05-16', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (2, 9, 1, N'2021-05-16', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (3, 13.33, 1, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (4, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (5, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (6, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (7, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (8, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (9, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (10, 3.33, 0, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (11, 10, 1, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (12, 10, 1, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (13, 6.67, 1, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (14, 6, 1, N'2021-05-17', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (15, 6, 1, N'2021-05-18', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (16, 3.33, 0, N'2021-05-18', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (17, 3.33, 0, N'2021-05-18', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (18, 4, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (19, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (20, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (21, 8, 1, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (22, 4, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (23, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (24, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (25, 4, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (26, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (27, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (28, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (29, 4, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (30, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (31, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (32, 2, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (33, 3.33, 0, N'2021-05-21', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (34, 2, 0, N'2021-05-23', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (35, 0, 0, N'2021-05-23', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (36, 2, 0, N'2021-05-23', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (37, 4, 0, N'2021-05-23', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (38, 2, 0, N'2021-05-23', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (39, 10, 1, N'2021-05-23', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (40, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (41, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (42, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (43, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (44, 0, 0, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (45, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (46, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (47, 10, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (48, 10, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (49, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (50, 0, 0, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (51, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (52, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (53, 10, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (54, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (55, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (56, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (57, 5, 0, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (58, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (59, 0, 0, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (60, 5, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (61, 5, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (62, 8, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (63, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (64, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (65, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (66, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (67, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (68, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (69, 5, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (70, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (71, 5, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (72, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (73, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (74, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (75, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (76, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (77, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (78, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (79, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (80, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (81, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (82, 3.33, 0, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (83, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (84, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (85, 5, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (86, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (87, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (88, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (89, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (90, 3.33, 0, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (91, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (92, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (93, 10, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (94, 5, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (95, 5, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (96, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (97, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (98, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (99, 10, 1, N'2021-05-24', 1)
GO
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (100, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (101, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (102, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (103, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (104, 10, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (105, 10, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (106, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (107, 10, 1, N'2021-05-24', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (108, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (109, 3.33, 0, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (110, 6.67, 1, N'2021-05-24', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (111, 10, 1, N'2021-05-25', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (112, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (113, 5, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (114, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (115, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (116, 6.67, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (117, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (118, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (119, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (120, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (121, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (122, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (123, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (124, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (125, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (126, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (127, 3.33, 0, N'2021-05-25', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (128, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (129, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (130, 6.67, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (131, 5, 0, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (132, 10, 1, N'2021-05-25', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (133, 10, 1, N'2021-05-25', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (134, 10, 1, N'2021-05-26', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (135, 10, 1, N'2021-05-26', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (136, 10, 1, N'2021-05-26', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (137, 5, 0, N'2021-05-26', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (138, 0, 0, N'2021-05-27', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (139, 6.67, 1, N'2021-05-27', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (140, 6.67, 1, N'2021-05-28', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (141, 10, 1, N'2021-05-31', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (142, 0, 0, N'2021-05-31', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (143, 0, 0, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (144, 0, 0, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (145, 0, 0, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (146, 0, 0, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (147, 10, 1, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (148, 8, 1, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (149, 0, 0, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (150, 6, 1, N'2021-06-02', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (151, 3.33, 0, N'2021-06-02', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (152, 6, 1, N'2021-06-02', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (153, 8, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (154, 4, 0, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (155, 4, 0, N'2021-06-03', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (156, 4, 0, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (157, 4, 0, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (158, 6, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (159, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (160, 5, 0, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (161, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (162, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (163, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (164, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (165, 6, 1, N'2021-06-03', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (166, 8, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (167, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (168, 6, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (169, 6.67, 1, N'2021-06-03', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (170, 8, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (171, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (172, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (173, 10, 1, N'2021-06-03', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (174, 12, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (175, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (176, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (177, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (178, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (179, 10, 1, N'2021-06-04', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (180, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (181, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (182, 0, 0, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (183, 10, 1, N'2021-06-04', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (184, 12, 1, N'2021-06-06', 12)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (185, 10, 1, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (186, 0, 0, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (187, 0, 0, N'2021-06-06', 1)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (188, 0, 0, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (189, 0, 0, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (190, 0, 0, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (191, 10, 1, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (192, 0, 0, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (193, 6, 1, N'2021-06-06', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (194, 10, 1, N'2021-06-07', 13)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (195, 4, 0, N'2021-06-07', 14)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (196, 10, 1, N'2021-06-07', 2)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (197, 10, 1, N'2021-06-07', 15)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (198, 6, 1, N'2021-06-07', 15)
INSERT [dbo].[History] ([ID], [Score], [Status], [Date], [IdUser]) VALUES (199, 8, 1, N'2021-06-15', 1)
GO
SET IDENTITY_INSERT [dbo].[History] OFF
SET IDENTITY_INSERT [dbo].[Quiz] ON 

INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (1, N'Which package contains the Random class?', N'java.util package', N'java.util package', N'java.lang package', N'java.awt package', N'java.io.package', N'15/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (2, N'What do you mean by nameless objects?', N'An object that has no reference.', N'An object created by using the new keyword.', N'An object of a superclass created in the subclass.', N'An object without having any name but having a reference.', N'An object that has no reference.', N'15/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (3, N'An interface with no fields or methods is known as a ______.', N'Marker Interface', N'Marker Interface', N'Abstract Interface', N'CharSequence Interface', N'Runnable Interface', N'15/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (4, N'Which of the following is a reserved keyword in Java?', N'strictfp', N'strictfp', N'object', N'main', N'system', N'15/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (5, N'What is the use of \w in regex?', N'Used for a word character', N'Used for a whitespace character', N'Used for a non-whitespace character', N'Used for a word character', N'Used for a non-word character', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (6, N'Which of the given methods are of Object class?', N'notify(), notifyAll(), and wait()', N'wait( long msecs ), interrupt(), and notifyAll()', N'notify(), notifyAll(), and wait()', N'sleep( long msecs ), wait(), and notify()', N'notify(), wait( long msecs ), and synchronized()', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (7, N'Which of the following is a mutable class in java?', N'java.lang.StringBuilder', N'java.lang.Byte', N'java.lang.String', N'java.lang.Short', N'java.lang.StringBuilder', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (8, N'What is the default encoding for an OutputStreamWriter?', N'Default encoding of the host platform', N'UTF-8', N'Default encoding of the host platform', N'UTF-12', N'None of the above', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (9, N'Which option is false about the final keyword?', N'A final class cannot extend other classes.', N'A final method cannot be overridden in its subclasses.', N'A final class cannot be extended.', N'A final class cannot extend other classes.', N'A final method can be inherited.', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (10, N'Which of the following creates a List of 3 visible items and multiple selections abled?', N'new List(3, true)', N'new List(false, 3)', N'new List(3, true)', N'new List(true, 3)', N'new List(3, false)', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (11, N'What does the expression float a = 35 / 0 return?', N'Infinity', N'0', N'Not a Number', N'Infinity', N'Run time exception', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (12, N'Which of the following is a valid declaration of a char?', N'char ch = ''\utea'';', N'char ch = ''\utea'';', N'char ca = ''tea'';', N'char cr = \u0223;', N'char cc = ''\itea'';', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (13, N'_____ is used to find and fix bugs in the Java programs.', N'JDB', N'JVM', N'JRE', N'JDK', N'JDB', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (14, N'The \u0021 article referred to as a', N'Unicode escape sequence', N'Octal escape', N'Hexadecimal', N'Line feed', N'Unicode escape sequence', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (15, N'Which of the following is not a Java features?', N'Use of pointers', N'Dynamic', N'Architecture Neutral', N'Use of pointers', N'Object-oriented', N'16/05/2021', 2)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (17, N'Which of the following uses structure?', N'All of the mentioned', N'Array of structures', N'Linked Lists', N'Binary Tree', N'All of the mentioned', N'26-05-2021', 4)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (18, N'What is the correct syntax to declare a function foo() which receives an array of structure in function?', N'void foo(struct *var);', N'void foo(struct *var);', N'void foo(struct *var[]);', N'void foo(struct var);', N'none of the mentioned', N'26-05-2021', 4)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (19, N'Which of these methods must be made static?', N'main()', N'main()', N'delete()', N'run()', N'finalize()', N'28-05-2021', 4)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (23, N'Which of the following option leads to the portability and security of Java?', N'Bytecode is executed by JVM', N'Bytecode is executed by JVM', N'The applet makes the Java code secure and portable', N'Use of exception handling', N'Dynamic binding between objects', N'06-06-2021', 4)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (28, N'How many threads can be executed at a time?', N'Multiple threads', N'Only one thread', N'Multiple threads', N'Only main (main() method) thread', N'Two threads', N'07-06-2021', 13)
INSERT [dbo].[Quiz] ([ID], [Question], [Answer], [Option1], [Option2], [Option3], [Option4], [DateCreated], [idAccount]) VALUES (29, N'Which of the following is a valid long literal?', N'0xnf029L', N'ABH8097', N'L990023', N'904423', N'0xnf029L', N'07-06-2021', 15)
SET IDENTITY_INSERT [dbo].[Quiz] OFF
ALTER TABLE [dbo].[History]  WITH CHECK ADD FOREIGN KEY([IdUser])
REFERENCES [dbo].[Account] ([ID])
GO
