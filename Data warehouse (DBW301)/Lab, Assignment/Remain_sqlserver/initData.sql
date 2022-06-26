USE [OP_CarRental]
GO
/****** Object:  Table [dbo].[BookingCars]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingCars](
	[BookingDetailID] [int] NULL,
	[CarNumber] [nvarchar](100) NULL,
	[realPickupDate] [datetime] NULL,
	[realReturnDate] [datetime] NULL,
	[RentalAmount] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BookingDetails]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BookingDetails](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[BookingID] [int] NULL,
	[SubTypeID] [int] NULL,
	[Quantity] [int] NULL,
	[RentalPrice] [float] NULL,
	[Deposit] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bookings]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bookings](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[ExpectedPickupDatetime] [datetime] NULL,
	[ExpectedReturnDatetime] [datetime] NULL,
	[PickupStationID] [int] NULL,
	[ReturnStationID] [int] NULL,
	[Status] [int] NULL,
	[BookingTime] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cars]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cars](
	[CarNumber] [nvarchar](100) NOT NULL,
	[Color] [nvarchar](100) NULL,
	[StationID] [int] NULL,
	[SubTypeID] [int] NULL,
	[IsRent] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[CarNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CarTypes]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CarTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[SeatCapacity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](100) NULL,
	[password] [nvarchar](100) NULL,
	[Phone] [nvarchar](100) NULL,
	[StreetAddress] [nvarchar](100) NULL,
	[DistinctID] [int] NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Districts]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Districts](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[District] [nvarchar](100) NULL,
	[City] [nvarchar](100) NULL,
	[Country] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Individuals]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Individuals](
	[CustomerID] [int] NOT NULL,
	[FirstName] [nvarchar](100) NULL,
	[LastName] [nvarchar](100) NULL,
	[Gender] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Manufactures]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Manufactures](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[Description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Organizations]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Organizations](
	[CustomerID] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[ContactName] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Stations]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Stations](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NULL,
	[StreetAddress] [nvarchar](100) NULL,
	[DistinctID] [int] NULL,
	[Phone] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubTypes]    Script Date: 5/25/2022 4:06:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubTypes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CarTypeID] [int] NULL,
	[ManufactureID] [int] NULL,
	[Model] [nvarchar](100) NULL,
	[YearOfMake] [int] NULL,
	[RentalPrice] [float] NULL,
	[DepositAmount] [float] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[BookingCars] ([BookingDetailID], [CarNumber], [realPickupDate], [realReturnDate], [RentalAmount]) VALUES (1, N'29B1-16899', CAST(N'2022-05-19T00:10:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1000)
INSERT [dbo].[BookingCars] ([BookingDetailID], [CarNumber], [realPickupDate], [realReturnDate], [RentalAmount]) VALUES (2, N'29B1-18899', CAST(N'2022-05-19T00:11:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1400)
INSERT [dbo].[BookingCars] ([BookingDetailID], [CarNumber], [realPickupDate], [realReturnDate], [RentalAmount]) VALUES (3, N'29B2-25899', CAST(N'2022-05-18T00:12:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1680)
INSERT [dbo].[BookingCars] ([BookingDetailID], [CarNumber], [realPickupDate], [realReturnDate], [RentalAmount]) VALUES (4, N'29B2-27899', CAST(N'2022-05-18T00:14:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1800)
INSERT [dbo].[BookingCars] ([BookingDetailID], [CarNumber], [realPickupDate], [realReturnDate], [RentalAmount]) VALUES (5, N'29B3-31899', CAST(N'2022-05-20T00:20:00.000' AS DateTime), NULL, NULL)
INSERT [dbo].[BookingCars] ([BookingDetailID], [CarNumber], [realPickupDate], [realReturnDate], [RentalAmount]) VALUES (6, N'29B1-16899', CAST(N'2022-05-23T00:20:00.000' AS DateTime), NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[BookingDetails] ON 

INSERT [dbo].[BookingDetails] ([ID], [BookingID], [SubTypeID], [Quantity], [RentalPrice], [Deposit]) VALUES (1, 1, 1, 1, 500, 200)
INSERT [dbo].[BookingDetails] ([ID], [BookingID], [SubTypeID], [Quantity], [RentalPrice], [Deposit]) VALUES (2, 1, 2, 1, 520, 200)
INSERT [dbo].[BookingDetails] ([ID], [BookingID], [SubTypeID], [Quantity], [RentalPrice], [Deposit]) VALUES (3, 2, 6, 1, 520, 200)
INSERT [dbo].[BookingDetails] ([ID], [BookingID], [SubTypeID], [Quantity], [RentalPrice], [Deposit]) VALUES (4, 2, 7, 1, 500, 200)
INSERT [dbo].[BookingDetails] ([ID], [BookingID], [SubTypeID], [Quantity], [RentalPrice], [Deposit]) VALUES (5, 3, 5, 1, 550, 250)
INSERT [dbo].[BookingDetails] ([ID], [BookingID], [SubTypeID], [Quantity], [RentalPrice], [Deposit]) VALUES (6, 4, 1, 1, 500, 200)
SET IDENTITY_INSERT [dbo].[BookingDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Bookings] ON 

INSERT [dbo].[Bookings] ([ID], [CustomerID], [ExpectedPickupDatetime], [ExpectedReturnDatetime], [PickupStationID], [ReturnStationID], [Status], [BookingTime]) VALUES (1, 1, CAST(N'2022-05-19T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 1, 1, 1, 2)
INSERT [dbo].[Bookings] ([ID], [CustomerID], [ExpectedPickupDatetime], [ExpectedReturnDatetime], [PickupStationID], [ReturnStationID], [Status], [BookingTime]) VALUES (2, 2, CAST(N'2022-05-18T00:00:00.000' AS DateTime), CAST(N'2022-05-21T00:00:00.000' AS DateTime), 2, 2, 1, 3)
INSERT [dbo].[Bookings] ([ID], [CustomerID], [ExpectedPickupDatetime], [ExpectedReturnDatetime], [PickupStationID], [ReturnStationID], [Status], [BookingTime]) VALUES (3, 4, CAST(N'2022-05-20T00:00:00.000' AS DateTime), CAST(N'2022-05-25T00:00:00.000' AS DateTime), 3, NULL, 0, 5)
INSERT [dbo].[Bookings] ([ID], [CustomerID], [ExpectedPickupDatetime], [ExpectedReturnDatetime], [PickupStationID], [ReturnStationID], [Status], [BookingTime]) VALUES (4, 4, CAST(N'2022-05-23T00:00:00.000' AS DateTime), CAST(N'2022-05-26T00:00:00.000' AS DateTime), 1, NULL, 0, 3)
SET IDENTITY_INSERT [dbo].[Bookings] OFF
GO
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B1-16899', N'Red', 1, 1, 1)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B1-17899', N'White', 1, 3, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B1-18899', N'Black', 1, 2, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B2-24899', N'Black', 2, 5, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B2-25899', N'White', 2, 6, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B2-26899', N'White', 2, 4, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B2-27899', N'White', 2, 7, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B2-28899', N'Black', 2, 5, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B2-34899', N'White', 2, 2, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B3-31899', N'White', 3, 5, 1)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B3-32899', N'White', 3, 9, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B3-36899', N'Black', 3, 8, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B3-38899', N'Black', 3, 8, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B4-41899', N'White', 4, 10, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B4-42899', N'White', 4, 9, 0)
INSERT [dbo].[Cars] ([CarNumber], [Color], [StationID], [SubTypeID], [IsRent]) VALUES (N'29B4-47899', N'White', 4, 9, 0)
GO
SET IDENTITY_INSERT [dbo].[CarTypes] ON 

INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (1, N'Brio', 4)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (8, N'Camry ', 5)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (2, N'CITY', 5)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (3, N'CIVIC', 5)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (4, N'CR_V', 7)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (5, N'Sedan BMW 3 Series', 5)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (6, N'Sedan BMW 5 Series', 5)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (7, N'Sedan BMW 7  Series', 5)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (10, N'SUV Fortuner', 9)
INSERT [dbo].[CarTypes] ([ID], [Name], [SeatCapacity]) VALUES (9, N'Vios', 5)
SET IDENTITY_INSERT [dbo].[CarTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 

INSERT [dbo].[Customers] ([ID], [username], [password], [Phone], [StreetAddress], [DistinctID], [Email]) VALUES (1, N'longdt', N'123', N'012345', N'19 Thai Ha', 1, N'19longdt@gmail.com')
INSERT [dbo].[Customers] ([ID], [username], [password], [Phone], [StreetAddress], [DistinctID], [Email]) VALUES (2, N'loind', N'123', N'011111', N'69 Tran Duy Hung', 1, N'loind@gmail.com')
INSERT [dbo].[Customers] ([ID], [username], [password], [Phone], [StreetAddress], [DistinctID], [Email]) VALUES (3, N'hungkd', N'123', N'011233', N'69 Tran Duy Hung', 1, N'hungkd@gmail.com')
INSERT [dbo].[Customers] ([ID], [username], [password], [Phone], [StreetAddress], [DistinctID], [Email]) VALUES (4, N'vinhapple', N'123', N'011234', N'66 Tran Duy Hung', 1, N'vinhapple@gmail.com')
INSERT [dbo].[Customers] ([ID], [username], [password], [Phone], [StreetAddress], [DistinctID], [Email]) VALUES (5, N'tranbinhcomputer', N'123', N'023111', N'99 Tran Duy Hung', 1, N'tranbinhcomputer@gmail.com')
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
SET IDENTITY_INSERT [dbo].[Districts] ON 

INSERT [dbo].[Districts] ([ID], [District], [City], [Country]) VALUES (1, N'Nam Tu Liem', N'Ha Noi', N'Viet Nam')
INSERT [dbo].[Districts] ([ID], [District], [City], [Country]) VALUES (2, N'Bac Tu Liem', N'Ha Noi', N'Viet Nam')
INSERT [dbo].[Districts] ([ID], [District], [City], [Country]) VALUES (3, N'Tay Ho', N'Ha Noi', N'Viet Nam')
INSERT [dbo].[Districts] ([ID], [District], [City], [Country]) VALUES (4, N'Ba Dinh', N'Ha Noi', N'Viet Nam')
SET IDENTITY_INSERT [dbo].[Districts] OFF
GO
INSERT [dbo].[Individuals] ([CustomerID], [FirstName], [LastName], [Gender]) VALUES (1, N'Do', N'Tuan Long', N'Male')
INSERT [dbo].[Individuals] ([CustomerID], [FirstName], [LastName], [Gender]) VALUES (2, N'Nguyen', N'Duc Loi', N'Female')
INSERT [dbo].[Individuals] ([CustomerID], [FirstName], [LastName], [Gender]) VALUES (3, N'Khuat ', N'Dinh Hung', N'Male')
GO
SET IDENTITY_INSERT [dbo].[Manufactures] ON 

INSERT [dbo].[Manufactures] ([ID], [Name], [Description]) VALUES (1, N'Honda', N'Japanese')
INSERT [dbo].[Manufactures] ([ID], [Name], [Description]) VALUES (2, N'Toyota Motor Corporation', N'Japanese')
INSERT [dbo].[Manufactures] ([ID], [Name], [Description]) VALUES (3, N'BMW', N'Germany')
SET IDENTITY_INSERT [dbo].[Manufactures] OFF
GO
INSERT [dbo].[Organizations] ([CustomerID], [Name], [ContactName]) VALUES (4, N'Vinh Apple', N'Vinh')
INSERT [dbo].[Organizations] ([CustomerID], [Name], [ContactName]) VALUES (5, N'Tran Binh Computer', N'Binh')
GO
SET IDENTITY_INSERT [dbo].[Stations] ON 

INSERT [dbo].[Stations] ([ID], [Name], [StreetAddress], [DistinctID], [Phone], [Email]) VALUES (1, N'Nam Tu Liem Station', N'01 Thai Ha', 1, N'19009999', N'NamTuLiemStation@gmail.com')
INSERT [dbo].[Stations] ([ID], [Name], [StreetAddress], [DistinctID], [Phone], [Email]) VALUES (2, N'Bac Tu Liem Station', N'01 Minh Khai', 2, N'19008899', N'BacTuLiemStation@gmail.com')
INSERT [dbo].[Stations] ([ID], [Name], [StreetAddress], [DistinctID], [Phone], [Email]) VALUES (3, N'Tay Ho Station', N'01 Au Co', 3, N'19008888', N'TayHoStation@gmail.com')
INSERT [dbo].[Stations] ([ID], [Name], [StreetAddress], [DistinctID], [Phone], [Email]) VALUES (4, N'Ba Dinh Station', N'01 Hoang Dieu', 4, N'19006688', N'BaDinhStation@gmail.com')
SET IDENTITY_INSERT [dbo].[Stations] OFF
GO
SET IDENTITY_INSERT [dbo].[SubTypes] ON 

INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (1, 1, 1, N'G', 2021, 500, 200)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (2, 1, 1, N'RS', 2022, 520, 220)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (3, 2, 1, N'G', 2021, 520, 200)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (4, 2, 1, N'RS', 2022, 540, 240)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (5, 3, 1, N'RS', 2022, 550, 250)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (6, 4, 1, N'RS', 2022, 560, 260)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (7, 5, 2, N'Series 3', 2022, 600, 300)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (8, 6, 2, N'Series 5', 2022, 650, 350)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (9, 7, 2, N'Series 7', 2022, 700, 400)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (10, 8, 3, N'2.5 HV', 2022, 530, 230)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (11, 9, 3, N'1.5 CVT', 2022, 530, 230)
INSERT [dbo].[SubTypes] ([ID], [CarTypeID], [ManufactureID], [Model], [YearOfMake], [RentalPrice], [DepositAmount]) VALUES (12, 10, 3, N'2.4MT 4x2', 2022, 580, 280)
SET IDENTITY_INSERT [dbo].[SubTypes] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__CarTypes__D35041C7D3170A62]    Script Date: 5/25/2022 4:06:19 PM ******/
ALTER TABLE [dbo].[CarTypes] ADD UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[SeatCapacity] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[BookingCars]  WITH CHECK ADD FOREIGN KEY([BookingDetailID])
REFERENCES [dbo].[BookingDetails] ([ID])
GO
ALTER TABLE [dbo].[BookingCars]  WITH CHECK ADD FOREIGN KEY([CarNumber])
REFERENCES [dbo].[Cars] ([CarNumber])
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD FOREIGN KEY([BookingID])
REFERENCES [dbo].[Bookings] ([ID])
GO
ALTER TABLE [dbo].[BookingDetails]  WITH CHECK ADD FOREIGN KEY([SubTypeID])
REFERENCES [dbo].[SubTypes] ([ID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([PickupStationID])
REFERENCES [dbo].[Stations] ([ID])
GO
ALTER TABLE [dbo].[Bookings]  WITH CHECK ADD FOREIGN KEY([ReturnStationID])
REFERENCES [dbo].[Stations] ([ID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([StationID])
REFERENCES [dbo].[Stations] ([ID])
GO
ALTER TABLE [dbo].[Cars]  WITH CHECK ADD FOREIGN KEY([SubTypeID])
REFERENCES [dbo].[SubTypes] ([ID])
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD FOREIGN KEY([DistinctID])
REFERENCES [dbo].[Districts] ([ID])
GO
ALTER TABLE [dbo].[Individuals]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Organizations]  WITH CHECK ADD FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([ID])
GO
ALTER TABLE [dbo].[Stations]  WITH CHECK ADD FOREIGN KEY([DistinctID])
REFERENCES [dbo].[Districts] ([ID])
GO
ALTER TABLE [dbo].[SubTypes]  WITH CHECK ADD FOREIGN KEY([CarTypeID])
REFERENCES [dbo].[CarTypes] ([ID])
GO
ALTER TABLE [dbo].[SubTypes]  WITH CHECK ADD FOREIGN KEY([ManufactureID])
REFERENCES [dbo].[Manufactures] ([ID])
GO
/****** Object:  StoredProcedure [dbo].[BookingInfo]    Script Date: 5/25/2022 4:06:19 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[BookingInfo]
@bNumber int
as
begin
	select distinct b.ID, b.CustomerID, isnull(i.FirstName + i.LastName, o.Name) as CustomerName, 
		ct.Name as 'CartypeName', ct.SeatCapacity, bd.Quantity as 'bookedQuantity', b.ExpectedPickupDatetime,
		b.ExpectedReturnDatetime, s.Name as 'PickupStationName', s.StreetAddress,
		s1.Name as 'ReturnStationName', s1.StreetAddress
	from Bookings b
	join BookingDetails bd on b.id = bd.BookingID
	join Customers c on c.ID = b.CustomerID
	left join Individuals i on c.ID = i.CustomerID
	left join Organizations o on c.ID = o.CustomerID
	join Stations s on s.ID = b.PickupStationID
	join Stations s1 on s1.ID = b.ReturnStationID
	join SubTypes st on st.ID = bd.SubTypeID
	join CarTypes ct on st.CarTypeID = ct.ID
	where b.ID = @bNumber;
end
GO
