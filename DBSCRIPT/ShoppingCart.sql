USE [master]
GO
/****** Object:  Database [ShoppingCart]    Script Date: 9/23/2020 5:34:44 PM ******/
CREATE DATABASE [ShoppingCart]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShoppingCart', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.JAYSERVER\MSSQL\DATA\ShoppingCart.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ShoppingCart_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.JAYSERVER\MSSQL\DATA\ShoppingCart_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ShoppingCart] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShoppingCart].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShoppingCart] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShoppingCart] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShoppingCart] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShoppingCart] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShoppingCart] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShoppingCart] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShoppingCart] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ShoppingCart] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShoppingCart] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShoppingCart] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShoppingCart] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShoppingCart] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShoppingCart] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShoppingCart] SET RECOVERY FULL 
GO
ALTER DATABASE [ShoppingCart] SET  MULTI_USER 
GO
ALTER DATABASE [ShoppingCart] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShoppingCart] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShoppingCart] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShoppingCart] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ShoppingCart] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShoppingCart', N'ON'
GO
USE [ShoppingCart]
GO
/****** Object:  Table [dbo].[BrandMaster]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BrandMaster](
	[BrandId] [int] IDENTITY(1,1) NOT NULL,
	[BrandName] [nvarchar](100) NULL,
 CONSTRAINT [PK_BrandMaster] PRIMARY KEY CLUSTERED 
(
	[BrandId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CategoryMaster]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CategoryMaster](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[CategoryName] [varchar](max) NULL,
	[CategoryDescription] [varchar](max) NULL,
	[CategoryType] [smallint] NULL,
	[ParentId] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CategoryMaster_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_CategoryMaster_IsDeleted]  DEFAULT ((0)),
	[CreatedBy] [bit] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[CategoryImage] [varchar](max) NULL,
 CONSTRAINT [PK__Category__19093A0BCEF4F802] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CustomerCart]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CustomerCart](
	[CartId] [bigint] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NULL,
	[CustomerId] [bigint] NULL,
	[Quantity] [smallint] NULL,
 CONSTRAINT [PK_CustomerCart] PRIMARY KEY CLUSTERED 
(
	[CartId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CustomerMaster]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CustomerMaster](
	[CustomerId] [bigint] IDENTITY(1,1) NOT NULL,
	[LoginUserName] [varchar](250) NULL,
	[LoginPassword] [varchar](250) NULL,
	[FirstName] [varchar](250) NULL,
	[LastName] [varchar](250) NULL,
	[Address1] [varchar](500) NULL,
	[Address2] [varchar](500) NULL,
	[CityId] [int] NULL,
	[StateId] [int] NULL,
	[CountryId] [int] NULL,
	[PinCode] [varchar](20) NULL,
	[ContactEmail] [varchar](250) NULL,
	[ContactMobile] [varchar](20) NULL,
	[WalletBalance] [decimal](18, 2) NULL,
	[NoOfMinChat] [decimal](18, 2) NULL,
	[NoOfMinCall] [decimal](18, 2) NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_CustomerMaster_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_CustomerMaster_IsDeleted]  DEFAULT ((0)),
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
	[CustomerGuId] [uniqueidentifier] NULL,
	[SocialAppId] [nvarchar](250) NULL,
	[SocialAppType] [nvarchar](50) NULL,
 CONSTRAINT [PK__Customer__A4AE64D822266527] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductColor]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductColor](
	[ProductColorId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NULL,
	[ColorName] [nvarchar](100) NULL,
 CONSTRAINT [PK_ProductColor] PRIMARY KEY CLUSTERED 
(
	[ProductColorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductImage]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductImage](
	[ProductImageId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NULL,
	[ProductImageURL] [nvarchar](500) NULL,
 CONSTRAINT [PK_ProductImage] PRIMARY KEY CLUSTERED 
(
	[ProductImageId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ProductMaster]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ProductMaster](
	[ProductId] [bigint] IDENTITY(1,1) NOT NULL,
	[CategoryId] [int] NULL,
	[SupplierId] [int] NULL,
	[ProductName] [varchar](255) NULL,
	[ProductCode] [varchar](255) NULL,
	[ProductDescription] [varchar](max) NULL,
	[ProductImage] [varchar](max) NULL,
	[ProductPrice] [decimal](18, 2) NULL,
	[AvailableQuantity] [int] NULL,
	[UoM] [varchar](255) NULL,
	[Discount] [decimal](18, 2) NULL,
	[Ranking] [decimal](18, 1) NULL,
	[UnitOnStock] [int] NULL,
	[UnitOnOrder] [int] NULL,
	[IsActive] [bit] NOT NULL CONSTRAINT [DF_ProductMaster_IsActive]  DEFAULT ((1)),
	[IsDeleted] [bit] NOT NULL CONSTRAINT [DF_ProductMaster_IsDeleted]  DEFAULT ((0)),
	[CreatedBy] [bigint] NULL,
	[CreatedDate] [datetime] NULL,
	[ModifiedBy] [bigint] NULL,
	[ModifiedDate] [datetime] NULL,
 CONSTRAINT [PK_ProductMaster] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ProductSize]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductSize](
	[ProductSizeId] [int] IDENTITY(1,1) NOT NULL,
	[ProductId] [bigint] NULL,
	[SizeName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductSize] PRIMARY KEY CLUSTERED 
(
	[ProductSizeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[BrandMaster] ON 

GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (1, N'Samsung')
GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (2, N'Motorolla')
GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (3, N'Nokia')
GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (4, N'Apple')
GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (5, N'Polo')
GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (6, N'Arrow')
GO
INSERT [dbo].[BrandMaster] ([BrandId], [BrandName]) VALUES (7, N'Luis')
GO
SET IDENTITY_INSERT [dbo].[BrandMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] ON 

GO
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryType], [ParentId], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CategoryImage]) VALUES (1, N'Electronics', N'', 10, NULL, 1, 0, NULL, NULL, NULL, NULL, N'http://gauravthakkar07-001-site1.atempurl.com/Attachments/Category/20200411032555279.png')
GO
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryType], [ParentId], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CategoryImage]) VALUES (2, N'Home Appliance', N'', 10, NULL, 1, 0, NULL, NULL, NULL, NULL, N'http://gauravthakkar07-001-site1.atempurl.com/Attachments/Category/20200411005849406.png')
GO
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryType], [ParentId], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CategoryImage]) VALUES (3, N'Women''s Fashion', N'', 10, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryType], [ParentId], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CategoryImage]) VALUES (4, N'Men''s Fashion', N'', 10, NULL, 1, 0, NULL, NULL, NULL, NULL, N'http://gauravthakkar07-001-site1.atempurl.com/Attachments/Category/20200411032434510.png')
GO
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryType], [ParentId], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CategoryImage]) VALUES (5, N'Kid Fashion', N'', 10, NULL, 1, 1, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[CategoryMaster] ([CategoryId], [CategoryName], [CategoryDescription], [CategoryType], [ParentId], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CategoryImage]) VALUES (6, N'Accessories', N'', 10, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CategoryMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[CustomerMaster] ON 

GO
INSERT [dbo].[CustomerMaster] ([CustomerId], [LoginUserName], [LoginPassword], [FirstName], [LastName], [Address1], [Address2], [CityId], [StateId], [CountryId], [PinCode], [ContactEmail], [ContactMobile], [WalletBalance], [NoOfMinChat], [NoOfMinCall], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate], [CustomerGuId], [SocialAppId], [SocialAppType]) VALUES (10085, N'test@test.com', N'VGVzdEAxMjM0', N'dharmesh', N'gohel', NULL, NULL, NULL, NULL, NULL, NULL, N'test@test.com', N'9898444456', NULL, NULL, NULL, 1, 0, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[CustomerMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductColor] ON 

GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorName]) VALUES (1, 1, N'White')
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorName]) VALUES (2, 1, N'Black')
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorName]) VALUES (3, 2, N'White')
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorName]) VALUES (4, 2, N'Black')
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorName]) VALUES (5, 3, N'White')
GO
INSERT [dbo].[ProductColor] ([ProductColorId], [ProductId], [ColorName]) VALUES (6, 3, N'Black')
GO
SET IDENTITY_INSERT [dbo].[ProductColor] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductMaster] ON 

GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (12, 1, 2, N'Product1', N'PP1', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product1.jpg', CAST(500.00 AS Decimal(18, 2)), 5, N'Kg', CAST(10.00 AS Decimal(18, 2)), CAST(5.0 AS Decimal(18, 1)), 2, 2, 0, 1, 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (14, 1, 2, N'Product2', N'jiji', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product2.jpg', CAST(550.00 AS Decimal(18, 2)), 8, N'989', CAST(50.00 AS Decimal(18, 2)), CAST(89.0 AS Decimal(18, 1)), 88, 9, 1, 0, 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (15, 1, 2, N'Product3', N'PROD1', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product3.jpg', CAST(450.00 AS Decimal(18, 2)), 50, N'Piece', CAST(0.00 AS Decimal(18, 2)), CAST(1.0 AS Decimal(18, 1)), 3, 3, 1, 0, 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (16, 2, 2, N'Product4', N'VV', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product4.jpg', CAST(550.00 AS Decimal(18, 2)), 989, N'898', CAST(98.00 AS Decimal(18, 2)), CAST(989.0 AS Decimal(18, 1)), 8989, 89, 0, 1, 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (17, 2, 2, N'Product5', N'JJ', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product5.jpg', CAST(400.00 AS Decimal(18, 2)), 89, N'89', CAST(8.00 AS Decimal(18, 2)), CAST(89.0 AS Decimal(18, 1)), 9090, 90, 1, 0, 2, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (18, 3, 1, N'Product6', N'77', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product1.jpg', CAST(700.00 AS Decimal(18, 2)), 55, N'55', CAST(5.00 AS Decimal(18, 2)), CAST(55.0 AS Decimal(18, 1)), 55, 55, 1, 0, 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (19, 3, 1, N'Product7', N'88', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product3.jpg', CAST(700.00 AS Decimal(18, 2)), 5, N'69', CAST(5.00 AS Decimal(18, 2)), CAST(55.0 AS Decimal(18, 1)), 55, 55, 1, 0, 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (20, 4, 2, N'Product8', N'88', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product4.jpg', CAST(700.00 AS Decimal(18, 2)), 55, N'555', CAST(55.00 AS Decimal(18, 2)), CAST(55.0 AS Decimal(18, 1)), 555, 55, 1, 0, 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (21, 4, 1, N'Product9', N'8', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product5.jpg', CAST(700.00 AS Decimal(18, 2)), 55, N'66', CAST(55.00 AS Decimal(18, 2)), CAST(6.0 AS Decimal(18, 1)), 6, 6, 1, 0, 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
INSERT [dbo].[ProductMaster] ([ProductId], [CategoryId], [SupplierId], [ProductName], [ProductCode], [ProductDescription], [ProductImage], [ProductPrice], [AvailableQuantity], [UoM], [Discount], [Ranking], [UnitOnStock], [UnitOnOrder], [IsActive], [IsDeleted], [CreatedBy], [CreatedDate], [ModifiedBy], [ModifiedDate]) VALUES (22, 5, 1, N'Product10', N'K95CM5NUW3WE', N'Li Europan lingues es membres del sam familie. Lor separat existentie es un myth. Por scientie, musica, sport etc, litot Europa usa li sam vocabular. Li lingues differe solmen in li grammatica, li pronunciation e li plu commun vocabules. Omnicos directe al desirabilite de un nov lingua franca: On refusa continuar payar custosi traductores. At solmen va esser necessi far uniform grammatica, pronunciation e plu sommun paroles', N'http://localhost:4200/Attachments/Product/product5.jpg', CAST(700.00 AS Decimal(18, 2)), 40, N'KG', CAST(20.00 AS Decimal(18, 2)), CAST(4.5 AS Decimal(18, 1)), 30, 20, 1, 0, 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime), 1, CAST(N'2020-09-23 00:00:00.000' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[ProductMaster] OFF
GO
SET IDENTITY_INSERT [dbo].[ProductSize] ON 

GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeName]) VALUES (1, 1, N'6 INCH')
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeName]) VALUES (2, 2, N'6 INCH')
GO
INSERT [dbo].[ProductSize] ([ProductSizeId], [ProductId], [SizeName]) VALUES (3, 3, N'6 INCH')
GO
SET IDENTITY_INSERT [dbo].[ProductSize] OFF
GO
ALTER TABLE [dbo].[ProductImage]  WITH CHECK ADD  CONSTRAINT [FK_ProductImage_ProductMaster] FOREIGN KEY([ProductId])
REFERENCES [dbo].[ProductMaster] ([ProductId])
GO
ALTER TABLE [dbo].[ProductImage] CHECK CONSTRAINT [FK_ProductImage_ProductMaster]
GO
/****** Object:  StoredProcedure [dbo].[GetBrandList]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetBrandList]
AS

SELECT * FROM BrandMaster

GO
/****** Object:  StoredProcedure [dbo].[GetCategoryByCategoryType]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetCategoryByCategoryType] 
@CategoryType int
AS
BEGIN
	select * from CategoryMaster where CategoryType = @CategoryType AND IsActive = 1

END



GO
/****** Object:  StoredProcedure [dbo].[GetCategoryById]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,11-Mar-2020>
-- Description:	<Description,,Get Categor By Id>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoryById]
@CategoryId INT
AS
BEGIN
	SELECT * FROM CategoryMaster WHERE CategoryId=@CategoryId
END





GO
/****** Object:  StoredProcedure [dbo].[GetCategoryList]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,11-Mar-2020>
-- Description:	<Description,,Get Category List>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoryList] 
	
AS
BEGIN

	SELECT * FROM CategoryMaster WHERE IsDeleted = 0 order by CategoryId desc
END






GO
/****** Object:  StoredProcedure [dbo].[GetCategoryListForCustomer]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,11-Mar-2020>
-- Description:	<Description,,Get Category List>
-- =============================================
CREATE PROCEDURE [dbo].[GetCategoryListForCustomer] 
	
AS
BEGIN

	SELECT * FROM CategoryMaster WHERE IsDeleted = 0 AND IsActive = 1 
END






GO
/****** Object:  StoredProcedure [dbo].[GetColorList]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetColorList]
AS

SELECT Distinct ColorName  FROM ProductColor

GO
/****** Object:  StoredProcedure [dbo].[GetCustomerById]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,23-Sept-2020>
-- Description:	<Description,,Get Customer By Id>
-- =============================================
Create PROCEDURE [dbo].[GetCustomerById]
@CustomerId INT
AS
BEGIN
	SELECT * FROM CustomerMaster WHERE CustomerId=@CustomerId
END




GO
/****** Object:  StoredProcedure [dbo].[GetProductByCategory]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[GetProductByCategory] 
@CategoryId int
AS
BEGIN

	select * from ProductMaster pm where pm.CategoryId = @CategoryId AND IsActive = 1
END





GO
/****** Object:  StoredProcedure [dbo].[GetProductById]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,11-Mar-2020>
-- Description:	<Description,,Get Product By Id>
-- =============================================
Create PROCEDURE [dbo].[GetProductById]
@ProductId INT
AS
BEGIN
	SELECT * FROM ProductMaster WHERE ProductId=@ProductId
END





GO
/****** Object:  StoredProcedure [dbo].[GetProductList]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,11-Mar-2020>
-- Description:	<Description,,Get Product List>
-- =============================================
CREATE PROCEDURE [dbo].[GetProductList] 
	
AS
BEGIN

	SELECT pm.*,
	sm.SupplierName,
	cm.CategoryName
	FROM ProductMaster as pm 
	left join SupplierMaster as sm on sm.SupplierId = pm.SupplierId
	left join CategoryMaster as cm on cm.CategoryId = pm.CategoryId
	WHERE pm.IsDeleted = 0 order by ProductId desc
	
END







GO
/****** Object:  StoredProcedure [dbo].[GetShoppingCart]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[GetShoppingCart]
@CustomerId bigint

AS

SELECT CustomerID, Cart.ProductID, Prd.ProductName, Quantity 
FROM CustomerCart Cart INNER JOIN ProductMaster Prd ON Cart.ProductId=Prd.ProductId


GO
/****** Object:  StoredProcedure [dbo].[GetSizeList]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[GetSizeList]
AS

SELECT Distinct SizeName  FROM ProductSize

GO
/****** Object:  StoredProcedure [dbo].[RemoveShoppingItem]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[RemoveShoppingItem]
@CartId bigint

AS

DELETE FROM CustomerCart WHERE CartId=@CartId 

GO
/****** Object:  StoredProcedure [dbo].[SaveCustomer]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Dharmesh Gohel>
-- Create date: <Create Date,,11-Mar-2020>
-- Description:	<Description,,Save Customer>
-- =============================================
CREATE PROCEDURE [dbo].[SaveCustomer]
@CustomerId INT,
@LoginUserName nvarchar(100),
@LoginPassword nvarchar(100),
@FirstName nvarchar(50),
@LastName nvarchar(50),
@Address1 nvarchar(250),
@Address2 nvarchar(250),
@CityId INT,
@StateId INT,
@CountryId INT,
@PinCode nvarchar(15),
@ContactEmail varchar(250),
@ContactMobile varchar(20),
@WalletBalance decimal(18,2),
@NoOfMinChat decimal(18,2),
@NoOfMinCall decimal(18,2),
@IsActive bit,
@IsDeleted bit,
@ModifiedBy int,
@ModifiedDate datetime,
@CreatedBy nvarchar(10),
@CreatedDate datetime

AS
BEGIN


		
IF (@CustomerId>0)

     BEGIN
	 UPDATE CustomerMaster SET 
			FirstName=@FirstName,
			LastName=@LastName,
			Address1=@Address1,
			Address2=@Address2,
			CityId=@CityId,
			StateId=@StateId,
			CountryId=@CountryId,
			PinCode=@PinCode,
			ContactEmail=@ContactEmail,
			ContactMobile=@ContactMobile,
			WalletBalance=@WalletBalance,
			NoOfMinChat=@NoOfMinChat,
			NoOfMinCall=@NoOfMinCall,
			IsDeleted=@IsDeleted,
			IsActive=@IsActive
			
			 
	WHERE CustomerId=@CustomerId

	 Select CONVERT(bit, 0) AS IsExist,CONVERT(bit, 0) AS IsNewCreated,@CustomerId AS 'Id'
 END

	ELSE
		BEGIN




		IF EXISTS (select * from CustomerMaster where LoginUserName = @LoginUserName)
		BEGIN

			Select CONVERT(bit, 1) AS IsExist,CONVERT(bit, 0) AS IsNewCreated,CONVERT(INT,0) AS 'Id'
	
		END
		ELSE IF ((@ContactMobile<>'' Or @ContactMobile<>NULL) AND EXISTS (select * from CustomerMaster where ContactMobile = @ContactMobile))
		BEGIN

			Select CONVERT(bit, 1) AS IsExist,CONVERT(bit, 0) AS IsNewCreated,CONVERT(INT,0) AS 'Id'
	
		END
		ELSE
		BEGIN
			
				INSERT INTO CustomerMaster

			Values(		
			@LoginUserName
			,@LoginPassword
			,@FirstName
			,@LastName
			,@Address1
			,@Address2
			,@CityId
			,@StateId
			,@CountryId
			,@PinCode
			,@ContactEmail
			,@ContactMobile
			,@WalletBalance
			,@NoOfMinChat
			,@NoOfMinCall
			,@IsActive
			,@IsDeleted
			,@CreatedBy
			,GetDate()
			,@ModifiedBy
			,GetDate()	
			,NEWID(),'',''
			)

				Select CONVERT(bit, 0) AS IsExist,CONVERT(bit, 1) AS IsNewCreated,Scope_Identity() AS 'Id'

		END



		



		END
	
END
	





GO
/****** Object:  StoredProcedure [dbo].[SaveShoppingItem]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[SaveShoppingItem]
@CustomerId bigint,
@ProductId bigint,
@Quantity smallint
AS

INSERT INTO CustomerCart Values(@ProductId,@CustomerId,@Quantity)

GO
/****** Object:  StoredProcedure [dbo].[UpdateShoppingItem]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[UpdateShoppingItem]
@CartId bigint,
@Quantity int
AS

Update CustomerCart SET Quantity=@Quantity WHERE CartId=@CartId

GO
/****** Object:  StoredProcedure [dbo].[ValidateUser]    Script Date: 9/23/2020 5:34:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Kushal Shah>
-- Create date: <Create Date,,23-3-2020>
-- Description:	<Description,,ValidateUser>
-- =============================================
CREATE PROCEDURE [dbo].[ValidateUser]
	-- Add the parameters for the stored procedure here
	@UserName varchar(70),
	@Password varchar(300),
	@CASES varchar(50)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
		IF @CASES = 'CUSTOMER'
	BEGIN
		SELECT (CASE WHEN EXISTS (
		select * from Customermaster cm where 
		cm.LoginUserName = @UserName AND cm.LoginPassword = @Password AND cm.IsActive = 1 and cm.IsDeleted = 0)
		THEN CAST(1 AS BIT)
		ELSE CAST(0 AS BIT)
		END) AS 'IsExist',
		(
			select cm.CustomerId  from Customermaster cm where 
			cm.LoginUserName = @UserName AND cm.LoginPassword = @Password
		) AS 'Id'
	END
	ELSE IF @CASES = 'ASTROLOGER'
	BEGIN
		

		SELECT (CASE WHEN EXISTS (
		select * from AstrologerMaster am where 
		am.LoginUserName = @UserName AND am.LoginPassword = @Password AND am.IsActive = 1 and am.IsDeleted = 0)
		THEN CAST(1 AS BIT)
		ELSE CAST(0 AS BIT)
		END) AS 'IsExist',
		(
			select am.AstrologerId  from AstrologerMaster am where 
			am.LoginUserName = @UserName AND am.LoginPassword = @Password
		) AS 'Id'

	END
	ELSE
	BEGIN
		SELECT (CASE WHEN EXISTS (
		select * from Usermaster um where 
		um.UserName = @UserName AND um.Password = @Password and um.IsDeleted = 0)
		THEN CAST(1 AS BIT)
		ELSE CAST(0 AS BIT)
		END) AS 'IsExist',
		(select um.UserId from Usermaster um where 
		um.UserName = @UserName AND um.Password = @Password AND um.IsActive = 1)  AS 'Id'
		
	END

END




GO
USE [master]
GO
ALTER DATABASE [ShoppingCart] SET  READ_WRITE 
GO
