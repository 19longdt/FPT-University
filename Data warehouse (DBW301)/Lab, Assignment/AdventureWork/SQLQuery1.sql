-- CREATE DATABASE	AdventureWorks_DW;

CREATE TABLE Dim_Currencies(
[Code_Op] [nvarchar](3) primary key,
[Name] [nvarchar](50) NOT NULL
);

CREATE TABLE Dim_Time(
[Date] date primary key,
[Day] int not null, 
[Month] int not null,
[Year] int not null
);

CREATE TABLE Dim_SaleTerritories(
SaleTerritoriyID_OP int primary key,
RegionName nvarchar(50) not null, 
CountryName nvarchar(50) not null, 
GroupName nvarchar(50) not null
);


CREATE TABLE Dim_Promotions(
PromotionKey int primary key identity(1,1),
DiscountPct smallmoney not null, 
[Type] nvarchar(50) not null,
MinQty int not null,
MaxQty int not null,
StartDate datetime not null,
EndDate datetime not null
);

CREATE TABLE Dim_Product(
	[ProductKey] [int] Primary key IDENTITY(1,1) NOT NULL,
	[ProductID_Op] [int],
	[Name] [nvarchar](50) NOT NULL,
	[Color] [nvarchar](15) NULL,
	[StandardCostRange] [nvarchar](50) NOT NULL,
	[ListPriceRange] [nvarchar](50) NOT NULL,
	[Size] [nvarchar](5)  NOT NULL,
	[SizeUnitMeasureName] [nvarchar](50)  NOT NULL,
	[WeightUnitMeasureName] [nvarchar](50)  NOT NULL,
	[WeightRange] [nvarchar](50)  NOT NULL,
	[ProductLine] [nchar](2)  NOT NULL,
	[Class] [nchar](2)  NOT NULL,
	[Style] [nchar](2)  NOT NULL,
	[CategoryName] [nvarchar](50)  NOT NULL,
	[SubcategoryName] [nvarchar](50) NOT NULL,
	[ModelName] [nvarchar](50)  NOT NULL,
);

CREATE TABLE Dim_Customers(
	[CustomerKey] [int] Primary key IDENTITY(1,1) NOT NULL,
	[CustomerID_Op] [int] NOT NULL,
	[Title] [nvarchar](8) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[MiddleName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[Gender] [nvarchar](10) NULL,
	[BirthDate] date NOT NULL,
	[MaritalStatus] [nvarchar](10) NULL,
	[EmailAddress]  [nvarchar](50) NOT NULL,
	[TotalChildren] int  NOT NULL,
	[NumberChildrenAtHome] int  NOT NULL,
	[Education] [nvarchar](50) NOT NULL,
	[Occupation] [nvarchar](50) NOT NULL,
	[HomeOwnerFlag] [nvarchar](10) NOT NULL,
	[NumberCarsOwned] [nvarchar](10) NOT NULL,
	[AddressLine1] [nvarchar](60) NOT NULL,
	[AddressLine2] [nvarchar](60) NULL,
	[City] [nvarchar](30) NOT NULL,
	[State] [nvarchar](50) NOT NULL,
	[PostalCode] [nvarchar](15) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[PhoneNumber] [nvarchar](25)  NOT NULL
);

CREATE TABLE Fact(
[ShipDuration] int not null,
[ShipDelay] int not null,
[Amount] money not null,
[Margin] money not null,
[TaxAmount] money  not null,
[Cost] money not null,
[Freight] money not null,
[ProductKey] int foreign key references Dim_Product(ProductKey),
[PromotionKey] int foreign key references Dim_Promotions(PromotionKey) not null,
[CustomerKey] int foreign key references Dim_Customers(CustomerKey),
[SaleTerritoriyID_OP] int foreign key references Dim_SaleTerritories(SaleTerritoriyID_OP),
[OrderDate] date foreign key references Dim_Time([Date]),
[DueDate] date foreign key references Dim_Time([Date]),
[ShipDate] date foreign key references Dim_Time([Date]),
[CurrencyCodeOp] nvarchar(3) foreign key references Dim_Currencies(Code_Op),
Primary Key ([ProductKey], [CustomerKey], [SaleTerritoriyID_OP], [CurrencyCodeOp], [OrderDate], [DueDate], [ShipDate])
);
