USE [StudentRequestAdmin]
GO
/****** Object:  Table [dbo].[Department]    Script Date: 02/07/2021 17:29:13 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Department](
	[id] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Request]    Script Date: 02/07/2021 17:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Request](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[requestToDid] [int] NOT NULL,
	[studentID] [nvarchar](10) NULL,
	[dateCreated] [datetime] NOT NULL,
	[title] [nvarchar](300) NULL,
	[content] [nvarchar](200) NULL,
	[status] [int] NULL,
	[clodeDate] [datetime] NULL,
	[solvedBy] [nvarchar](100) NULL,
	[attachFile] [nvarchar](200) NULL,
	[solution] [nvarchar](200) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 02/07/2021 17:29:14 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [nvarchar](10) NOT NULL,
	[username] [nvarchar](20) NOT NULL,
	[password] [nvarchar](20) NOT NULL,
	[fullName] [nvarchar](100) NOT NULL,
	[shortName] [nvarchar](50) NULL,
	[Role] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Department] ([id], [name]) VALUES (1, N'Academy department')
INSERT [dbo].[Department] ([id], [name]) VALUES (2, N'Development Department')
SET IDENTITY_INSERT [dbo].[Request] ON 

INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (23, 1, N'HE1', CAST(N'2021-06-29T00:00:00.000' AS DateTime), N'Check result PE', N'ninoinjakjshdashjkdjhas', 1, CAST(N'2021-06-30T22:03:13.057' AS DateTime), N'admin', NULL, N'School agrees to your request!!!')
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (25, 2, N'HE1', CAST(N'2021-06-29T00:00:00.000' AS DateTime), N'Check result FE', N'please check cho em', 2, CAST(N'2021-07-01T11:18:58.053' AS DateTime), N'admin', N'b.txt', N'School agrees to your request!!!')
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (26, 2, N'HE2', CAST(N'2021-06-27T00:00:00.000' AS DateTime), N'Check result FE', N'please check cho em', 2, CAST(N'2021-07-01T00:45:47.293' AS DateTime), N'admin', N'delbsnf-a64370c9-2ab7-41d6-95f4-987d66950394.gif', N'School agrees to your request!!!')
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (27, 1, N'HE3', CAST(N'2021-06-28T00:00:00.000' AS DateTime), N'Check result FE', N'please check cho em', 1, CAST(N'2021-07-01T12:05:28.827' AS DateTime), N'admin', N'Plan - LongdtHE141276.rar', N'School agrees to your request!!!')
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (28, 1, N'HE3', CAST(N'2021-06-26T00:00:00.000' AS DateTime), N'Check result FE', N'please check cho em', 1, CAST(N'2021-07-01T12:10:27.863' AS DateTime), N'admin', N'Team2_HE141276_DoTuanLong.xlsx', N'School agrees to your request!!!
After check, your score : 9.0')
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (31, 2, N'HE1', CAST(N'2021-07-01T00:00:00.000' AS DateTime), N'Check result PE Sum2021', N'please check lai diem PE cho em', NULL, NULL, NULL, N'b.txt', NULL)
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (32, 1, N'HE2', CAST(N'2021-06-30T00:00:00.000' AS DateTime), N'Check result PE Sum2021', N'please check lai diem PE cho em', NULL, NULL, NULL, N'b.txt', NULL)
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (33, 2, N'HE3', CAST(N'2021-07-02T00:00:00.000' AS DateTime), N'Check result FE Sum2021', N'please check my FE exam Sum2021', 1, CAST(N'2021-07-02T17:25:15.997' AS DateTime), N'admin', N'data.txt', N'School agrees to your request!!!')
INSERT [dbo].[Request] ([id], [requestToDid], [studentID], [dateCreated], [title], [content], [status], [clodeDate], [solvedBy], [attachFile], [solution]) VALUES (34, 1, N'HE1', CAST(N'2021-07-02T00:00:00.000' AS DateTime), N'Check result FE Sum2021', N'please check my FE exam Sum2021', 2, CAST(N'2021-07-02T17:25:24.083' AS DateTime), N'admin', N'b.txt', N'School agrees to your request!!!')
SET IDENTITY_INSERT [dbo].[Request] OFF
INSERT [dbo].[User] ([UserID], [username], [password], [fullName], [shortName], [Role]) VALUES (N'admin', N'admin', N'123', N'admin', N'admin', 1)
INSERT [dbo].[User] ([UserID], [username], [password], [fullName], [shortName], [Role]) VALUES (N'HE1', N'longdt', N'123', N'Do Tuan Long', N'longdt', 0)
INSERT [dbo].[User] ([UserID], [username], [password], [fullName], [shortName], [Role]) VALUES (N'HE2', N'loind', N'123', N'Nguyen Duc Loi', N'loind', 0)
INSERT [dbo].[User] ([UserID], [username], [password], [fullName], [shortName], [Role]) VALUES (N'HE3', N'vinhtt', N'123', N'Tran the Vinh', N'vinhtt', 0)
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([requestToDid])
REFERENCES [dbo].[Department] ([id])
GO
ALTER TABLE [dbo].[Request]  WITH CHECK ADD FOREIGN KEY([studentID])
REFERENCES [dbo].[User] ([UserID])
GO
