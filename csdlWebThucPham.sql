create database [dbMarkets]
USE [dbMarkets]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[AccountID] [int] IDENTITY(1,1) NOT NULL,
	[Phone] [varchar](12) NULL,
	[Email] [nvarchar](50) NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](10) NULL,
	[Active] [bit] NOT NULL,
	[FullName] [nvarchar](150) NULL,
	[RoleID] [int] NULL,
	[LastLogin] [datetime] NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_Accounts] PRIMARY KEY CLUSTERED 
(
	[AccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Attributes]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Attributes](
	[AttributeID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Attributes] PRIMARY KEY CLUSTERED 
(
	[AttributeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AttributesPrices]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AttributesPrices](
	[AttributesPriceID] [int] IDENTITY(1,1) NOT NULL,
	[AttributeID] [int] NULL,
	[ProductID] [int] NULL,
	[Price] [int] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_AttributesPrices] PRIMARY KEY CLUSTERED 
(
	[AttributesPriceID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CatID] [int] IDENTITY(1,1) NOT NULL,
	[CatName] [nvarchar](250) NULL,
	[Description] [nvarchar](max) NULL,
	[ParentID] [int] NULL,
	[Levels] [int] NULL,
	[Ordering] [int] NULL,
	[Published] [bit] NOT NULL,
	[Thumb] [nvarchar](250) NULL,
	[Title] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Cover] [nvarchar](255) NULL,
	[SchemaMarkup] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[CatID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customers]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customers](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](255) NULL,
	[Birthday] [datetime] NULL,
	[Avatar] [nvarchar](255) NULL,
	[Address] [nvarchar](255) NULL,
	[Email] [nchar](150) NULL,
	[Phone] [varchar](12) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Password] [nvarchar](50) NULL,
	[Salt] [nchar](8) NULL,
	[LastLogin] [datetime] NULL,
	[Active] [bit] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locations]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locations](
	[LocationID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Parent] [int] NULL,
	[Levels] [int] NULL,
	[Slug] [nvarchar](100) NULL,
	[NameWithType] [nvarchar](100) NULL,
	[Type] [nvarchar](10) NULL,
 CONSTRAINT [PK_Location] PRIMARY KEY CLUSTERED 
(
	[LocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[ProductID] [int] NULL,
	[OrderNumber] [int] NULL,
	[Amount] [int] NULL,
	[Discount] [int] NULL,
	[TotalMoney] [int] NULL,
	[CreateDate] [datetime] NULL,
	[Price] [int] NULL,
 CONSTRAINT [PK_OrderDetails] PRIMARY KEY CLUSTERED 
(
	[OrderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NULL,
	[OrderDate] [datetime] NULL,
	[ShipDate] [datetime] NULL,
	[TransactStatusID] [int] NOT NULL,
	[Deleted] [bit] NOT NULL,
	[Paid] [bit] NOT NULL,
	[PaymentDate] [datetime] NULL,
	[TotalMoney] [int] NOT NULL,
	[PaymentID] [int] NULL,
	[Note] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[LocationID] [int] NULL,
	[District] [int] NULL,
	[Ward] [int] NULL,
 CONSTRAINT [PK_Orders] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pages]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pages](
	[PageID] [int] IDENTITY(1,1) NOT NULL,
	[PageName] [nvarchar](250) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](250) NULL,
	[Published] [bit] NOT NULL,
	[Title] [nvarchar](250) NULL,
	[MetaDesc] [nvarchar](250) NULL,
	[MetaKey] [nvarchar](250) NULL,
	[Alias] [nvarchar](250) NULL,
	[CreatedDate] [datetime] NULL,
	[Ordering] [int] NULL,
 CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED 
(
	[PageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Products]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](255) NOT NULL,
	[ShortDesc] [nvarchar](255) NULL,
	[Description] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[Price] [int] NULL,
	[Discount] [int] NULL,
	[Thumb] [nvarchar](255) NULL,
	[Video] [nvarchar](255) NULL,
	[DateCreated] [datetime] NULL,
	[DateModified] [datetime] NULL,
	[BestSellers] [bit] NOT NULL,
	[HomeFlag] [bit] NOT NULL,
	[Active] [bit] NOT NULL,
	[Tags] [nvarchar](max) NULL,
	[Title] [nvarchar](255) NULL,
	[Alias] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[MetaKey] [nvarchar](255) NULL,
	[UnitsInStock] [int] NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[QuangCaos]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[QuangCaos](
	[QuangCaoID] [int] IDENTITY(1,1) NOT NULL,
	[SubTitle] [nvarchar](150) NULL,
	[Title] [nvarchar](150) NULL,
	[ImageBG] [nvarchar](250) NULL,
	[ImageProduct] [nvarchar](250) NULL,
	[UrlLink] [nvarchar](250) NULL,
	[Active] [bit] NOT NULL,
	[CreateDate] [datetime] NULL,
 CONSTRAINT [PK_QuangCaos] PRIMARY KEY CLUSTERED 
(
	[QuangCaoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NULL,
	[Description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shippers]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shippers](
	[ShipperID] [int] IDENTITY(1,1) NOT NULL,
	[ShipperName] [nvarchar](150) NULL,
	[Phone] [nchar](10) NULL,
	[Company] [nvarchar](150) NULL,
	[ShipDate] [datetime] NULL,
 CONSTRAINT [PK_Shippers] PRIMARY KEY CLUSTERED 
(
	[ShipperID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TinDangs]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TinDangs](
	[PostID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](255) NULL,
	[SContents] [nvarchar](255) NULL,
	[Contents] [nvarchar](max) NULL,
	[Thumb] [nvarchar](255) NULL,
	[Published] [bit] NOT NULL,
	[Alias] [nvarchar](255) NULL,
	[CreatedDate] [datetime] NULL,
	[Author] [nvarchar](255) NULL,
	[AccountID] [int] NULL,
	[Tags] [nvarchar](max) NULL,
	[CatID] [int] NULL,
	[isHot] [bit] NOT NULL,
	[isNewfeed] [bit] NOT NULL,
	[MetaKey] [nvarchar](255) NULL,
	[MetaDesc] [nvarchar](255) NULL,
	[Views] [int] NULL,
 CONSTRAINT [PK_tblTinTucs] PRIMARY KEY CLUSTERED 
(
	[PostID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TransactStatus]    Script Date: 5/29/2023 3:30:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TransactStatus](
	[TransactStatusID] [int] IDENTITY(1,1) NOT NULL,
	[Status] [nvarchar](50) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_TransactStatus] PRIMARY KEY CLUSTERED 
(
	[TransactStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (1, N'123456789', N'alinh@gmail.com', N'673044188cbf1751fa924cd84c16357c', N'h~ev:     ', 1, N'Nguyễn Ánh Linh', 2, CAST(N'2023-05-06T08:59:14.717' AS DateTime), CAST(N'2023-04-29T23:00:20.773' AS DateTime))
GO
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (2, N'123465798', N'avui@gmail.com', N'ffd7264992b5f1c7b1a323ef1a8286e8', N'tw1(0     ', 1, N'Nguyễn Anh Vui', 1, NULL, CAST(N'2023-04-30T00:35:06.730' AS DateTime))
GO
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (3, N'123456789', N'nkhoi855@gmail.com', N'fcc07f919577514a61fe6cfc703a4657', N'w:5@+     ', 1, N'Nguyễn Bá Khôi', 1, CAST(N'2023-05-29T15:22:29.823' AS DateTime), CAST(N'2023-04-30T18:36:33.367' AS DateTime))
GO
INSERT [dbo].[Accounts] ([AccountID], [Phone], [Email], [Password], [Salt], [Active], [FullName], [RoleID], [LastLogin], [CreateDate]) VALUES (4, N'123456789', N't1@gmail.com', N'aed9a1f872a71042fdeded83b56adfff', N'zce+y     ', 1, N't1', 2, CAST(N'2023-05-04T23:08:07.833' AS DateTime), CAST(N'2023-05-04T23:06:46.283' AS DateTime))
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (1, N'Rau Củ', N'<h1><u>Rau Củ</u></h1>', NULL, NULL, 1, 1, N'rau-cu.jpg', N'Rau Củ', N'rau-cu', N'Rau Củ', N'Rau Củ', NULL, N'Rau Củ')
GO
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (5, N'Trái Cây', N'<p>Trái Cây<br></p>', NULL, NULL, 1, 1, N'trai-cay.jpg', N'Trái Cây', N'trai-cay', N'Trái Cây', N'Trái Cây', NULL, N'Trái Cây')
GO
INSERT [dbo].[Categories] ([CatID], [CatName], [Description], [ParentID], [Levels], [Ordering], [Published], [Thumb], [Title], [Alias], [MetaDesc], [MetaKey], [Cover], [SchemaMarkup]) VALUES (6, N'Thịt', NULL, NULL, NULL, 1, 1, N'thit.jpg', NULL, N'thit', NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Customers] ON 
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (1, N'Nguyễn Bá khôi', NULL, NULL, N'phùng xá, thạch thất, hà nội', N'a@gmail.com                                                                                                                                           ', N'0368454462', 1, 66, 76, CAST(N'2023-04-21T21:31:38.900' AS DateTime), N'5cf05e95fd01ec4632000b791cba0772', N'myda]   ', NULL, 1)
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (2, N'Nguyễn Bá Khôi', NULL, NULL, N'nhà số 2', N'nkhoi855@gmail.com                                                                                                                                    ', N'0368454462', 1, 66, 76, CAST(N'2023-04-22T15:37:58.373' AS DateTime), N'7a9b90b1159cdb0c0e502675d72dc5ae', N'jwa07   ', NULL, 1)
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (3, N'Nguyễn Ánh Linh', NULL, NULL, NULL, N'alinh@gmail.com                                                                                                                                       ', N'123456789', NULL, NULL, NULL, CAST(N'2023-04-29T23:00:20.773' AS DateTime), N'673044188cbf1751fa924cd84c16357c', N'h~ev:   ', NULL, 1)
GO
INSERT [dbo].[Customers] ([CustomerID], [FullName], [Birthday], [Avatar], [Address], [Email], [Phone], [LocationID], [District], [Ward], [CreateDate], [Password], [Salt], [LastLogin], [Active]) VALUES (6, N'nguyen thi van anh', NULL, NULL, NULL, N'va@gmail.com                                                                                                                                          ', N'123456789', NULL, NULL, NULL, CAST(N'2023-05-04T23:20:43.193' AS DateTime), N'7f166f6863b035e6001550c11bd9c7e6', N'znio3   ', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Customers] OFF
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (1, N'	
An Giang', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (2, N'	
Bà Rịa-Vũng Tàu', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (3, N'Bạc Liêu

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (4, N'Bắc Kạn

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (5, N'Bắc Giang

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (6, N'Bắc Ninh

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (7, N'Bến Tre

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (8, N'Bình Dương

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (9, N'Bình Định

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (10, N'Bình Phước

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (11, N'Bình Thuận

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (12, N'Cà Mau

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (13, N'Cao Bằng

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (14, N'Cần Thơ (TP)

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (15, N'Đà Nẵng (TP)

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (16, N'Đắk Lắk

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (17, N'Đắk Nông

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (18, N'Điện Biên

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (19, N'Đồng Nai

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (20, N'Đồng Tháp

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (21, N'Gia Lai

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (22, N'Hà Giang

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (23, N'Hà Nam

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (24, N'Hà Nội (TP)

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (25, N'Hà Tây

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (26, N'Hà Tĩnh

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (27, N'Hải Dương

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (28, N'Hải Phòng (TP)

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (29, N'Hòa Bình

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (30, N'Hồ Chí Minh (TP)

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (31, N'Hậu Giang

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (32, N'Hưng Yên

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (33, N'Khánh Hòa

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (34, N'Kiên Giang

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (35, N'Kon Tum

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (36, N'Lai Châu

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (37, N'Lào Cai

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (38, N'Lạng Sơn

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (39, N'Lâm Đồng

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (40, N'Long An

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (41, N'Nam Định

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (42, N'Nghệ An

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (43, N'Ninh Bình

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (44, N'Ninh Thuận

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (45, N'Phú Thọ

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (46, N'Phú Yên

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (47, N'Quảng Bình

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (49, N'Quảng Nam

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (50, N'Quảng Ngãi

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (51, N'Quảng Ninh

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (52, N'Quảng Trị

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (53, N'Sóc Trăng

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (54, N'Sơn La

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (55, N'Tây Ninh

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (56, N'Thái Bình

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (57, N'Thái Nguyên

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (58, N'Thanh Hóa

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (59, N'Thừa Thiên - Huế

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (60, N'Tiền Giang

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (61, N'Trà Vinh

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (62, N'Tuyên Quang

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (63, N'Vĩnh Long

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (64, N'Vĩnh Phúc

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (65, N'Yên Bái

', NULL, 1, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (66, N'TP Long Xuyên', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (67, N'Thị Xã Châu Đốc
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (68, N'Huyện An Phú
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (69, N'Huyện Tân Châu
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (70, N'Huyện Phú Tân
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (71, N'Huyện Châu Phú
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (72, N'Huyện Tịnh Biên
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (73, N'Huyện Tri Tôn
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (74, N'Huyện Chợ Mới
', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (75, N'Huyện Châu Thành.

', 1, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (76, N'Phường Mỹ Bình
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (77, N'Phường Mỹ Hòa
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (78, N'Phường Mỹ Long
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (79, N'Phường Mỹ Phước
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (80, N'Phường Mỹ Quý
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (81, N'Phường Mỹ Thạnh
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (82, N'Phường Mỹ Thới
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (83, N'Phường Mỹ Xuyên
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (84, N'Phường Đông Xuyên
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (85, N'Phường Bình Đức
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (86, N'Phường Bình Khánh
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (87, N'Phường Đông Thắng
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (88, N'Phường Đông Thanh
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (89, N'Phường Thạch An
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (90, N'Phường Định Hiệp
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (91, N'Phường Định Hòa
', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (92, N'Phường Định Bình.



', 66, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (93, N'Châu phú A', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (94, N'Châu phú B', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (95, N'Núi sam', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (96, N'Vĩnh mỹ', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (97, N'Vĩnh Ngươn', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (98, N'Vĩnh Tế', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (99, N'Vĩnh Châu', 67, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (100, N'Đa Phước', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (101, N'Khánh An', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (102, N'Khánh Bình', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (103, N'Nhơn Hội', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (104, N'Phú Hội', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (105, N'Phú Hữu', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (106, N'Phước Hưng', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (107, N'Quốc Thái', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (108, N'Vĩnh Hậu', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (109, N'Vĩnh Hội Đông', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (110, N'Vĩnh Lộc', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (111, N'Vĩnh Trường', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (112, N'thị trấn An Phú', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (113, N'thị trấn Long Bình', 68, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (114, N'Long Thạnh', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (115, N'Long Hưng', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (116, N'Long Châu', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (117, N'Long Sơn', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (118, N'Long Phú', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (119, N'Phú Lộc', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (120, N'Vĩnh Xương', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (121, N'Vĩnh Hoà', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (122, N'Tân Thạnh', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (123, N'Tân An', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (124, N'Long An', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (125, N'Châu Phong', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (126, N'Phú Vĩnh', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (127, N'Lê Chánh', 69, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (128, N'Chợ Vàm', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (129, N'Phú Mỹ', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (130, N'Bình Thạnh Đông', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (131, N'Phú Hiệp', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (132, N'Hiệp Xương', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (133, N'Tân Hòa', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (134, N'Hòa Lạc', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (135, N'Phú Hưng', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (136, N'Long Sơn', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (137, N'Phú An', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (138, N'Phú Lâm', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (139, N'Phú Bình', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (140, N'Phú Thọ', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (141, N'Phú Thành', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (142, N'Phú Thạnh', 70, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (143, N'Cái Dầu ', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (144, N'Bình Mỹ', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (145, N'Bình Thủy', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (146, N'Bình Long', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (147, N'Bình Chánh', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (148, N'Bình Phú', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (149, N'Vĩnh Thạnh Trung', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (150, N'Mỹ Phú', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (151, N'Mỹ Đức', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (152, N'Khánh Hòa', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (153, N'Thạnh Mỹ Tây', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (154, N'Ô Long Vĩ', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (155, N'Đào Hữu Cảnh', 71, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (156, N'Chi Lăng', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (157, N'An Cư', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (158, N'An Hảo', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (159, N'An Nông', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (160, N'An Phú', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (161, N'Nhơn Hưng', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (162, N'Tân Lập', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (163, N'Tân Lợi', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (164, N'Thới Sơn', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (165, N'Thới Thuận', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (166, N'Vĩnh Trung', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (167, N'Xuân Tô', 72, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (168, N'Núi Tô', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (169, N'Tân Cương', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (170, N'Tân Tuyến', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (171, N'Cô Tô', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (172, N'An Phước', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (173, N'An Ninh', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (174, N'An Lạc', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (175, N'An Thành', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (176, N'Ba Chúc', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (177, N'Lạc Quới', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (178, N'Vĩnh Gia', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (179, N'An Lập', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (180, N'thị trấn Tri Tôn', 73, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (181, N'Chợ Mới ', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (182, N'An Thạnh Trung', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (183, N'Bình Phước Xuân', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (184, N'Hòa Bình', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (185, N'Hội An', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (186, N'Kiến An', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (187, N'Long Điền', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (188, N'Long Kiến', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (189, N'Mỹ Hiệp', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (190, N'Mỹ Hội Đông', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (191, N'Mỹ Luông', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (192, N'Nhơn Mỹ', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (193, N'Tấn Mỹ', 74, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (194, N'An Hòa', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (195, N' Bình Hòa', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (196, N'Cần Đăng', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (197, N'An Châu', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (198, N'Hòa Bình Thạnh', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (199, N'Tân Phú', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (200, N'Vĩnh An', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (201, N'Vĩnh Bình', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (202, N'Vĩnh Hanh', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (203, N'Vĩnh Lợi', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (204, N'Vĩnh Nhuận', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (205, N'Vĩnh Thành', 75, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (206, N'Đan Phượng', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (207, N'Gia Lâm', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (208, N'Đông Anh', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (209, N'Chương Mỹ', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (210, N'Hoài Đức', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (211, N'Ba Vì', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (212, N'Mỹ Đức', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (213, N'Phúc Thọ', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (214, N'Thạch Thất', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (215, N'Quốc Oai', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (216, N'Thanh Trì', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (217, N'Thường Tín', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (218, N'Thanh Oai', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (219, N'Phú Xuyên', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (220, N'Mê Linh', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (221, N'Sóc Sơn', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (222, N'Ứng Hòa', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (223, N'Sơn Tây', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (224, N'Phùng', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (225, N'Đan Phượng', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (226, N'Đồng Tháp', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (227, N'Hạ Mỗ', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (228, N'Hồng Hà', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (229, N'Liên Hà', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (230, N'Liên Hồng', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (231, N'Liên Trung', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (232, N'Phương Đình', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (233, N' Song Phượng', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (234, N'Tân Hội', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (235, N'Tân Lập', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (236, N'Thọ An', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (237, N'Thọ Xuân', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (238, N'Thượng Mỗ', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (239, N'Trung Châu', 206, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (240, N'Ba Đình', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (241, N'Hoàn Kiếm', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (242, N'Tây Hồ', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (243, N'Long Biên', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (244, N'Cầu Giấy', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (245, N'Đống Đa', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (246, N'Hai Bà Trưng', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (247, N'Hoàng Mai', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (248, N'Thanh Xuân', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (249, N'Hà Đông', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (250, N'Bắc Từ Liêm', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (251, N'Nam Từ Liêm', 24, 2, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (252, N'Cống Vị', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (253, N'Điện Biên', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (254, N'Đội Cấn', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (255, N'Giảng Võ', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (256, N'Kim Mã', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (257, N'Liễu Giai', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (258, N'Ngọc Hà', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (259, N'Ngọc Khánh', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (260, N'Nguyễn Trung Trực', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (261, N'Phúc Xá', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (262, N'Quán Thánh', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (263, N'Thành Công', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (264, N'Trúc Bạch', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (265, N'Vĩnh Phúc.', 240, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (266, N'Chương Dương Độ', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (267, N'Cửa Đông', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (268, N'Cửa Nam', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (269, N'Đồng Xuân', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (270, N'Hàng Bạc', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (271, N'Hàng Bài', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (272, N'Hàng Bồ', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (273, N'Hàng Bông', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (274, N'Hàng Buồm', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (275, N'Hàng Đào', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (276, N'Hàng Gai', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (277, N'Hàng Mã', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (278, N'Hàng Trống', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (279, N'Lý Thái Tổ', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (280, N'Phan Chu Trinh', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (281, N'Phúc Tân', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (282, N'Trần Hưng Đạo', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (283, N'Tràng Tiền', 241, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (284, N'Bưởi', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (285, N'Thụy Khuê', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (286, N'Yên Phụ', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (287, N'Tứ Liên', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (288, N'Nhật Tân', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (289, N'Quảng An', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (290, N'Xuân La', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (291, N' Phú Thượng', 242, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (292, N'Bồ Đề', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (293, N'Gia Thụy', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (294, N'Cự Khối', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (295, N'Đức Giang', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (296, N'Giang Biên', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (297, N'Long Biên', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (298, N'Ngọc Lâm', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (299, N'Ngọc Thụy', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (300, N'Phúc Đồng', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (301, N'Phúc Lợi', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (302, N'Sài Đồng', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (303, N'Thạch Bàn', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (304, N'Thượng Thanh', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (305, N'Việt Hưng', 243, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (306, N'Nghĩa Đô', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (307, N'Quan Hoa', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (308, N'Dịch Vọng', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (309, N'Dịch Vọng Hậu', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (310, N'Trung Hòa', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (311, N'Nghĩa Tân', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (312, N'Mai Dịch', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (313, N'Yên Hòa', 244, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (314, N'Văn Miếu', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (315, N'Quốc Tử Giám', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (316, N'Hàng Bột', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (317, N'Nam Đồng', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (318, N'Trung Liệt', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (319, N'Khâm Thiên', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (320, N'Phương Liên', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (321, N'Phương Mai', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (322, N'Khương Thượng,', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (323, N'Ngã Tư Sở', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (324, N'Láng Thượng', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (325, N'Cát Linh', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (326, N'Văn Chương', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (327, N'Ô Chợ Dừa', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (328, N' Quang Trung', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (329, N'Thổ Quan', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (330, N'Trung Phụng', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (331, N'Kim Liên', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (332, N'Trung Tự', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (333, N'Thịnh Quang', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (334, N' Láng Hạ', 245, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (335, N'Nguyễn Du', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (336, N'Bùi Thị Xuân', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (337, N'Ngô Thì Nhậm', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (338, N'Đồng Nhân', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (339, N'Bạch Đằng', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (340, N'Thanh Nhàn', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (341, N'Bách Khoa', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (342, N'Vĩnh Tuy', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (343, N'Trương Định', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (344, N'Lê Đại Hành', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (345, N'Phố Huế', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (346, N'Phạm Đình Hổ', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (347, N'Đống Mác', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (348, N'Thanh Lương', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (349, N'Cầu Dền', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (350, N'Bạch Mai', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (351, N'Quỳnh Mai', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (352, N'Minh Khai', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (353, N'Đồng Tâm', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (354, N'Quỳnh Lôi', 246, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (355, N'Định Công', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (356, N'Đại Kim', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (357, N'Giáp Bát', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (358, N'Hoàng Liệt', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (359, N'Hoàng Văn Thụ', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (360, N'Lĩnh Nam', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (361, N' Mai Động', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (362, N'Tân Mai', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (363, N'Thanh Trì', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (364, N'Thịnh Liệt', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (365, N'Trần Phú', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (366, N'Tương Mai', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (367, N'Vĩnh Hưng', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (368, N'Yên Sở', 247, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (369, N'Hạ Đình', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (370, N'Kim Giang', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (371, N'Khương Đình', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (372, N'Khương Mai', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (373, N'Khương Trung', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (374, N'Nhân Chính', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (375, N'Phương Liệt', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (376, N'Thanh Xuân Bắc', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (377, N'Thanh Xuân Nam', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (378, N'Thanh Xuân Trung', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (379, N'Thượng Đình', 248, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (380, N'Quang Trung', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (381, N'Nguyễn Trãi', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (382, N'Hà Cầu', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (383, N'Vạn Phúc', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (384, N'Phúc La', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (385, N'Yết Kiêu', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (386, N'Mộ Lao', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (387, N'Văn Quán', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (388, N'La Khê', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (389, N'Phú La', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (390, N'Kiến Hưng', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (391, N'Yên Nghĩa', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (392, N'Phú Lương', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (393, N'Phú Lãm', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (394, N'Dương Nội', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (395, N'Biên Giang', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (396, N'Đồng Mai', 249, 3, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (397, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (398, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (399, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Locations] ([LocationID], [Name], [Parent], [Levels], [Slug], [NameWithType], [Type]) VALUES (400, NULL, NULL, NULL, NULL, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (1, 1, 1, NULL, 1, NULL, 30000, NULL, 30000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (2, 1, 14, NULL, 1, NULL, 30000, NULL, 30000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (3, 2, 1, NULL, 1, NULL, 30000, CAST(N'2023-04-27T21:53:51.810' AS DateTime), 30000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (4, 3, 2, NULL, 2, NULL, 80000, CAST(N'2023-04-29T14:54:50.153' AS DateTime), 35000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (5, 3, 5, NULL, 1, NULL, 80000, CAST(N'2023-04-29T14:54:50.170' AS DateTime), 5000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (6, 3, 7, NULL, 1, NULL, 80000, CAST(N'2023-04-29T14:54:50.170' AS DateTime), 5000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (7, 4, 4, NULL, 4, NULL, 50000, CAST(N'2023-04-29T14:57:01.730' AS DateTime), 10000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (8, 4, 3, NULL, 1, NULL, 50000, CAST(N'2023-04-29T14:57:01.730' AS DateTime), 10000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (14, 15, 1, NULL, 1, NULL, 30000, CAST(N'2023-04-30T20:00:06.840' AS DateTime), 30000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (15, 16, 1, NULL, 1, NULL, 30000, CAST(N'2023-04-30T20:24:21.870' AS DateTime), 30000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (16, 17, 1, NULL, 2, NULL, 95000, CAST(N'2023-05-01T13:09:32.470' AS DateTime), 30000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (17, 17, 2, NULL, 1, NULL, 95000, CAST(N'2023-05-01T13:09:33.983' AS DateTime), 35000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (18, 18, 3, NULL, 1, NULL, 10000, CAST(N'2023-05-03T21:09:07.890' AS DateTime), 10000)
GO
INSERT [dbo].[OrderDetails] ([OrderDetailID], [OrderID], [ProductID], [OrderNumber], [Amount], [Discount], [TotalMoney], [CreateDate], [Price]) VALUES (19, 18, 4, NULL, 1, NULL, 10000, CAST(N'2023-05-03T21:09:07.913' AS DateTime), 10000)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (1, 1, CAST(N'2023-04-20T00:00:00.000' AS DateTime), NULL, 1, 0, 0, CAST(N'2023-04-25T21:01:38.560' AS DateTime), 60000, NULL, NULL, NULL, NULL, NULL, NULL)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (2, 2, CAST(N'2023-04-27T21:53:51.660' AS DateTime), NULL, 2, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (3, 2, CAST(N'2023-04-29T14:54:50.067' AS DateTime), NULL, 1, 0, 0, NULL, 80000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (4, 2, CAST(N'2023-04-29T14:57:01.727' AS DateTime), NULL, 1, 0, 0, NULL, 50000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (5, 2, CAST(N'2023-04-30T17:56:50.210' AS DateTime), NULL, 1, 0, 0, NULL, 95000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (6, 2, CAST(N'2023-04-30T18:04:09.573' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (7, 2, CAST(N'2023-04-30T18:12:26.003' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (8, 2, CAST(N'2023-04-30T18:21:45.540' AS DateTime), NULL, 1, 0, 0, NULL, 35000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (9, 2, CAST(N'2023-04-30T18:26:25.243' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (10, 2, CAST(N'2023-04-30T19:21:31.050' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (11, 2, CAST(N'2023-04-30T19:28:36.233' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (12, 2, CAST(N'2023-04-30T19:29:38.730' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (13, 2, CAST(N'2023-04-30T19:39:52.987' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (14, 2, CAST(N'2023-04-30T19:53:46.150' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (15, 2, CAST(N'2023-04-30T20:00:04.570' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (16, 2, CAST(N'2023-04-30T20:24:19.510' AS DateTime), NULL, 1, 0, 0, NULL, 30000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (17, 1, CAST(N'2023-05-01T13:09:25.980' AS DateTime), NULL, 1, 0, 0, NULL, 95000, NULL, NULL, N'phùng xá, thạch thất, hà nội', 0, 0, 0)
GO
INSERT [dbo].[Orders] ([OrderID], [CustomerID], [OrderDate], [ShipDate], [TransactStatusID], [Deleted], [Paid], [PaymentDate], [TotalMoney], [PaymentID], [Note], [Address], [LocationID], [District], [Ward]) VALUES (18, 2, CAST(N'2023-05-03T21:09:07.777' AS DateTime), NULL, 1, 0, 0, NULL, 20000, NULL, NULL, N'nhà số 2', 0, 0, 0)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Pages] ON 
GO
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (1, N'Hướng dẫn mua hàng 2023', N'<p>Bước 1: di chuột vào sản phẩm sau đó click vào hình giỏ hàng</p><p>Bước 2: chọn số lượng sản phẩm, sau đó click mua hàng, sản phẩm sẽ được đưa vào trong giỏ hàng<br>Bước 3: sau khi chọn hết sản phẩm cần mua , click vào giỏ hàng và ấn thanh toán</p><p>Bước 4: nhập địa chỉ và chọn các thông tin : tỉnh thành , quận huyện , phường xã</p><p>Bước 5: click xác nhận mua hàng đơn hàng của bạn sẽ được tạo</p><p>Chúc bạn thành công</p>', N'huong-dan-mua-hang-2023.jpg', 1, N'Hướng dẫn mua hàng', N'Hướng dẫn mua hàng', N'Hướng dẫn mua hàng', N'huong-dan-mua-hang-2023', NULL, 1)
GO
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (3, N'Hướng dẫn thanh toán', NULL, N'huong-dan-thanh-toan.jpg', 0, NULL, NULL, NULL, N'huong-dan-thanh-toan', NULL, 2)
GO
INSERT [dbo].[Pages] ([PageID], [PageName], [Contents], [Thumb], [Published], [Title], [MetaDesc], [MetaKey], [Alias], [CreatedDate], [Ordering]) VALUES (4, N'Giới thiệu cửa hàng', N'<p>Của hàng được chứng nhận an toàn thực phẩm từ ABC</p><p>Đảm bảo chất lượng cho từng mặt hàng<br>Cam kết hoàn tiền 100% và bồi thường đối với sản phẩm chất lượng kém</p>', N'gioi-thieu-cua-hang.jpg', 1, N'Giới thiệu', N'Giới thiệu', N'Giới thiệu', N'gioi-thieu-cua-hang', NULL, 1)
GO
SET IDENTITY_INSERT [dbo].[Pages] OFF
GO
SET IDENTITY_INSERT [dbo].[Products] ON 
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (1, N'Chanh Dây', N'Chanh Dây', N'Chanh Dây', 5, 30000, NULL, N'chanh-day.png', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-25T20:57:53.183' AS DateTime), 1, 1, 1, N'Chanh dây', N'Chanh dây', N'chanh-day', NULL, NULL, 97)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (2, N'Bí Đỏ', N'Bí Đỏ', NULL, 1, 35000, NULL, N'bi-do.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T22:16:37.390' AS DateTime), 1, 1, 1, NULL, NULL, N'bi-do', NULL, NULL, 99)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (3, N'Cà Rốt', N'Cà rốt là một thành phần quan trọng trong chế độ ăn uống.', N'Cà rốt là một thành phần quan trọng trong chế độ ăn uống. Hàm lượng đường cao của nó làm cho nó một vị ngọt lành mạnh có thể được tiêu thụ ngay cả khi bị tiểu đường. Carotene, có trong tất cả các loại rau này, không có ngoại lệ, giúp cải thiện thị lực. Và thành phần vitamin tuyệt vời làm cho rau củ trở thành một loại thuốc không thể thiếu trong thời kỳ bị bệnh hồi xuân, hay bất kỳ loại suy kiệt nào của cơ thể. Hàm lượng chất xơ cao làm cho rau không thể thiếu trong việc ngăn ngừa các rối loạn tiêu hóa khác nhau. Ngay cả trẻ nhỏ chỉ cần nhấm nháp cà rốt để kích thích mọc răng cũng vô cùng có lợi.', 1, 10000, NULL, N'ca-rot.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T22:18:44.020' AS DateTime), 0, 1, 1, NULL, NULL, N'ca-rot', NULL, NULL, 99)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (4, N'Cà Chua', N'Cà chua, thuộc họ Cà, là một loại rau quả làm thực phẩm', N'Cà chua (danh pháp hai phần: Solanum lycopersicum), thuộc họ Cà (Solanaceae), là một loại rau quả làm thực phẩm. Quả ban đầu có màu xanh, chín ngả màu từ vàng đến đỏ. Cà chua có vị hơi chua và là một loại thực phẩm bổ dưỡng, tốt cho cơ thể, giàu vitamin C và A, đặc biệt là giàu lycopene tốt cho sức khỏe.', 1, 10000, 20, N'ca-chua.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T22:16:56.457' AS DateTime), 1, 1, 1, NULL, NULL, N'ca-chua', NULL, NULL, 99)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (5, N'Chanh', N'Chanh là loại quả tròn, thường có màu xanh tươi, có vị chua và mọng nước. Loại quả này là nguồn vitamin vô cùng mạnh mẽ', N'Chanh là loại quả tròn, thường có màu xanh tươi, có vị chua và mọng nước. Loại quả này là nguồn vitamin vô cùng mạnh mẽ, đặc biệt chứa hàm lượng lớn vitamin C, chất chống oxy hóa và các chất dinh dưỡng khác. Chanh bao gồm rất nhiều loại, phổ biến như chanh ta, chanh không hạt, chanh Thái, chanh giấy.', 1, 5000, NULL, N'chanh.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T22:19:05.107' AS DateTime), 0, 1, 1, NULL, NULL, N'chanh', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (7, N'Khổ Qua', N'Khổ qua là cây bản địa của vùng nhiệt đới nhưng không rõ có nguồn gốc ở nước nào.', N'Mướp đắng hay Khổ qua (tên Hán-Việt thông dụng ở miền Nam, khổ 苦: đắng, qua 瓜: gọi chung các loại bầu, bí, mướp, dưa; danh pháp hai phần: Momordica charantia) là một cây leo mọc ở vùng nhiệt đới và cận nhiệt đới thuộc họ Bầu bí, có quả ăn được, thuộc loại đắng nhất trong các loại rau quả.', 1, 5000, NULL, N'kho-qua.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:42:33.367' AS DateTime), 0, 1, 1, NULL, NULL, N'kho-qua', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (8, N'Khoai Lang', N'khoai lang là một nguồn cung cấp rau ăn củ quan trọng, được sử dụng trong vai trò của cả rau lẫn lương thực', N'Khoai lang (danh pháp hai phần: Ipomoea batatas) là một loài cây nông nghiệp với các rễ củ lớn, chứa nhiều tinh bột, có vị ngọt, được gọi là củ khoai lang và nó là một nguồn cung cấp rau ăn củ quan trọng, được sử dụng trong vai trò của cả rau lẫn lương thực. Các lá non và thân non cũng được sử dụng như một loại rau.', 1, 15000, NULL, N'khoai-lang.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:43:22.413' AS DateTime), 0, 1, 1, NULL, NULL, N'khoai-lang', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (9, N'Dưa Leo', N'Nước chiếm đến 90% thành phần trong một trái dưa leo. Bên cạnh đó, các vitamin và khoáng tố trong dưa leo cũng mang lại những lợi ích sức khỏe mà không phải bất cứ loại củ quả hay trái cây nào cũng có', N'Dưa leo (dưa chuột) là một loại cây trồng phổ biến ở nhiều nước. Là loại rau ăn quả thương mại quan trọng. Dưa chuột thuộc họ bầu bí, thân dây leo và được sử dụng trong bữa ăn của các gia đình như một loại rau ăn mát và giòn. Dưa chuột có nguồn gốc từ Nam Á, hiện tại đã phát triển trên hầu hết các châu lục: Trung Quốc, Nga, Nhật Bản, Mỹ, Hà Lan, Thổ Nhĩ Kỳ, Ba Lan, Ai Cập và Tây Ban Nha... Có nhiều giống dưa chuột khác nhau được giao dịch trên toàn cầu.', 5, 20000, 15, N'dua-leo.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T22:17:17.203' AS DateTime), 1, 1, 1, NULL, NULL, N'dua-leo', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (11, N'Cải Thảo', N'Ở nhiều nền ẩm thực trên thế giới, có thể bắt gặp cải thảo trong các món ăn, được chế biến đa dạng và công phụ như cải muối, luộc, cuộn thịt, sốt, salad… Đặc biệt, nổi tiếng nhất là món kim chi', N'Theo một số tài liệu, cải thảo có nguồn gốc từ miền bắc và Đông Bắc của Trung Quốc. Hiện tại, loài này phân bố rải rác khắp khu vực trái đất như Hàn Quốc, Nhật Bản, châu Âu… Ở Việt Nam, cây được trồng nhiều ở miền Bắc và Đà Lạt.  Thời vụ thích hợp để trồng vào tháng 8 đến tháng 10 ở miền Bắc. Còn ở miền Nam là khoảng tháng 7 đến tháng 4 năm sau. Thuộc nhóm cây ưa khí hậu mát lạnh, thời gian sinh trưởng ngắn, năng suất cao và phẩm chất tốt.', 1, 40000, NULL, N'cai-thao.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:51:17.220' AS DateTime), 0, 1, 1, N'Cải Thảo', N'Cải Thảo', N'cai-thao', N'Cải Thảo', N'Cải Thảo', 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (12, N'Khoai Tây', N'là loại củ tốt cho sức khỏe', N'Khoai tây (danh pháp hai phần: Solanum tuberosum), thuộc họ Cà (Solanaceae). Khoai tây là loài cây nông nghiệp ngắn ngày, trồng lấy củ chứa tinh bột. Chúng là loại cây trồng lấy củ rộng rãi nhất thế giới và là loại cây trồng phổ biến thứ tư về mặt sản lượng tươi – xếp sau lúa, lúa mì và ngô.', 1, 15000, NULL, N'khoai-tay.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:52:44.880' AS DateTime), 0, 1, 1, NULL, NULL, N'khoai-tay', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (13, N'Ớt Sừng', N'ớt sừng cây còn giúp cơ thể tăng cường hoạt động trao đổi chất, chúng sẽ tạo cho chúng ta cảm giác no lâu,...', N'Ớt sừng có rễ trụ, nhưng khi cấy rễ phân nhánh mạnh và cây phát triển thành rễ chùm, phân bố trong vùng đất cày là chính. Khi cây già phần gốc thân chính hóa gỗ, dọc theo chiều dài thân có 4-5 cạnh. Thân có lông hoặc không lông, cây cao 35-65 cm, có giống cao 125-135 cm.', 1, 10000, NULL, N'ot-sung.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T22:19:54.307' AS DateTime), 0, 1, 1, NULL, NULL, N'ot-sung', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (14, N'Bắp Mỹ', N'làm tăng vị ngon ngọt cho món ăn', N'Trái Bắp Mỹ có hình dạng thon dài, đầu trái hơi nhọn, có màu vàng óng rất đẹp. Có lá (Vỏ) bao quanh trái, màu vỏ vàng nhạt và có những sợi (râu) bắp màu nâu đồng bao quanh trái sau lớp vỏ. Đặc trưng của trái Bắp Mỹ rất ngọt khi ăn sống thử, có mùi thơm, bóp vài hạt bắp thấy nước màu trắng đục.', 1, 30000, NULL, N'bap-my.png', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:54:52.567' AS DateTime), 0, 1, 1, NULL, NULL, N'bap-my', NULL, NULL, 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (16, N'Su Su', N'su su là thực phẩm giàu folate, chất xơ, chất đồng, chất kẽm và vitamin B', N'Su su hay su le trong phương ngữ miền Trung Việt Nam (danh pháp hai phần: Sechium edule) là một loại cây lấy quả ăn, thuộc họ Bầu bí, cùng với dưa hấu, dưa chuột và bí. Cây này có lá rộng, thân cây dây leo trên mặt đất hoặc trên giàn.', 1, 10000, NULL, N'su-su.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:55:56.883' AS DateTime), 0, 1, 1, N'Su Su', N'Su Su', N'su-su', N'Su Su', N'Su Su', 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (17, N'Hành Lá', N'tăng mùi hương cho món ăn', N'Hành lá hay hành xanh, hành non là tên gọi chung của các loài thuộc chi Hành. Tất cả hành lá đều có lá rỗng màu xanh (giống hành tây), nhưng lại thiếu một thân hành (củ hành) phát triển hoàn chỉnh. Chúng được trồng bởi hương vị thơm dịu hơn so với hầu hết hành tây và được ăn sống hoặc nấu chín như một loại rau.', 1, 10000, NULL, N'hanh-la.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:56:59.530' AS DateTime), 0, 1, 1, N'Hành Lá', N'Hành Lá', N'hanh-la', N'Hành Lá', N'Hành Lá', 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (19, N'Mướp Hương', N'có thể được dùng để chữa bệnh', N'Mướp hương là cây thân thảo, thuộc dạng dây leo. Thần dài, nhỏ, hình tiết diện đa giác, màu xanh lục nhạt, có năm đường gân chạy dọc. Bên ngoài thân có nhiều lông trắng mọc rải rác. Dọc theo thân phát triển nhiều tua cuốn bám vào thân cây khác, bụi rậm hay giàn được người dân dựng sẵn để phát triển. ', 1, 20000, NULL, N'muop-huong.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:58:11.470' AS DateTime), 0, 1, 1, N'Mướp Hương', N'Mướp Hương', N'muop-huong', N'Mướp Hương', N'Mướp Hương', 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (20, N'Cà Tím', N'cà tím', N'Cây cà tím là loại cây thân thảo, cùng họ (Solanaceae) với cà chua, khoai tây, hồ tiêu và có tên khoa học là Solaum melongena L. Thân cây phát triển với chiều cao trung bình từ 50 - 150cm và thường có gai nhỏ. Lá cà tím lớn, phiến lá rộng và mặt dưới lá được bao phủ lông tơ.', 1, 20000, NULL, N'ca-tim.png', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:58:46.183' AS DateTime), 0, 1, 1, N'Cà Tím', N'Cà Tím', N'ca-tim', N'Cà Tím', N'Cà Tím', 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (23, N'Bắp Cải', N'Bắp cải', N'Bắp cải hay cải bắp là loại rau có nhiều lớp lá dày cuộn quanh cuống. Tùy vào từng loại bắp cải khác nhau mà lá của nó sẽ cuộn chặt hoặc rời nhau; lá nhẵn, phẳng hoặc có nhiều nếp gấp và hơi cong. Lớp lá ngoài của bắp cải thường có màu xanh lá đậm hơn những lá ở bên trong.', 1, 15000, NULL, N'bap-cai.jpg', NULL, CAST(N'2023-04-01T00:00:00.000' AS DateTime), CAST(N'2023-04-20T14:59:19.077' AS DateTime), 0, 1, 1, N'Bắp cải', N'Bắp cải', N'bap-cai', N'Bắp cải', N'Bắp cải', 100)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (24, N'Cam', N'Cam', N'Cam', 5, 35000, 10, N'cam.jpg', NULL, CAST(N'2023-04-17T14:55:55.080' AS DateTime), CAST(N'2023-04-17T14:55:55.077' AS DateTime), 0, 1, 1, N'Cam', N'Cam', N'cam', N'Cam', N'Cam', 60)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (26, N'Nhãn', N'Nhãn', N'Nhãn', 5, 20000, 5, N'Nhan.jpg', NULL, CAST(N'2023-04-17T14:55:55.080' AS DateTime), CAST(N'2023-04-17T14:55:55.077' AS DateTime), 0, 1, 1, N'Nhãn', N'Nhãn', N'nhan', N'Nhãn', N'Nhãn', 50)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (27, N'Táo', N'Táo', N'Táo', 5, 45000, 5, N'tao.jpg', NULL, CAST(N'2023-04-17T16:54:29.093' AS DateTime), CAST(N'2023-04-17T16:54:29.093' AS DateTime), 0, 1, 1, N'Táo', N'Táo', N'tao', N'Táo', N'Táo', 60)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (29, N'Doi', N'Doi', N'test', 5, 25000, 12, N'doi.jpg', NULL, CAST(N'2023-04-19T15:44:56.000' AS DateTime), CAST(N'2023-05-03T23:19:03.273' AS DateTime), 0, 1, 1, N'test', N'test', N'doi', N'test', N'test', 50)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (30, N'Táo', N'táo', NULL, 5, 60000, 6, N'tao.jpg', NULL, CAST(N'2023-04-20T22:19:38.843' AS DateTime), CAST(N'2023-04-20T22:19:38.843' AS DateTime), 0, 1, 1, NULL, NULL, N'tao', NULL, NULL, 56)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (31, N'Ba Chỉ Heo', N'Ba chỉ heo', N'Ba chỉ heo', 6, 150000, 5, N'ba-chi-heo.png', NULL, CAST(N'2023-05-04T21:54:14.570' AS DateTime), CAST(N'2023-05-04T21:54:14.570' AS DateTime), 0, 1, 1, N'Ba chỉ heo', N'Ba chỉ heo', N'ba-chi-heo', N'Ba chỉ heo', N'Ba chỉ heo', 50)
GO
INSERT [dbo].[Products] ([ProductID], [ProductName], [ShortDesc], [Description], [CatID], [Price], [Discount], [Thumb], [Video], [DateCreated], [DateModified], [BestSellers], [HomeFlag], [Active], [Tags], [Title], [Alias], [MetaDesc], [MetaKey], [UnitsInStock]) VALUES (32, N'Ba Chỉ Bò', N'Ba chỉ bò', N'Ba chỉ bò', 6, 170000, 5, N'ba-chi-bo.jpg', NULL, CAST(N'2023-05-04T21:55:13.000' AS DateTime), CAST(N'2023-05-04T21:55:48.907' AS DateTime), 0, 1, 1, N'Ba chỉ bò', N'Ba chỉ bò', N'ba-chi-bo', N'Ba chỉ bò', N'Ba chỉ bò', 50)
GO
SET IDENTITY_INSERT [dbo].[Products] OFF
GO
SET IDENTITY_INSERT [dbo].[Roles] ON 
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (1, N'Admin', N'Quản trị viên')
GO
INSERT [dbo].[Roles] ([RoleID], [RoleName], [Description]) VALUES (2, N'User', N'Nhân viên kỹ thuật')
GO
SET IDENTITY_INSERT [dbo].[Roles] OFF
GO
SET IDENTITY_INSERT [dbo].[TinDangs] ON 
GO
INSERT [dbo].[TinDangs] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (1, N'Bộ GD-ĐT lên tiếng vụ nữ sinh trường chuyên tự tử', NULL, N'<p style="text-rendering: geometricprecision; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; text-size-adjust: 100%; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; max-width: 100%; font-family: Tahoma, Arial, sans-serif;">"Ngay sau khi nắm được thông tin, chúng tôi đã kịp thời trao đổi với Trường THPT chuyên ĐH Vinh, Trường Đại học Vinh và Sở GD-ĐT, yêu cầu sớm điều tra, làm rõ sự việc.</p><p style="text-rendering: geometricprecision; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; text-size-adjust: 100%; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; max-width: 100%; font-family: Tahoma, Arial, sans-serif;">Cùng với đó, trước mắt các đơn vị liên quan cần ổn định tinh thần học tập của học sinh, tránh những diễn biến tiêu cực tâm lý các em"- ông Trần Văn Đạt, Quyền Vụ trưởng Vụ Giáo dục Chính trị và Công tác Học sinh sinh viên, Bộ GD-ĐT cho biết.</p><p style="text-rendering: geometricprecision; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; text-size-adjust: 100%; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; max-width: 100%; font-family: Tahoma, Arial, sans-serif;">Sự việc vẫn tiếp tục gây tranh cãi mặc dù ngày 17-4, trường Đại học Vinh đã trao đổi với báo chí và xác nhận em N.T.Y.N là học sinh lớp 10 trường THPT chuyên Đại học Vinh đã tử vong tại nhà riêng vào tối 15-4.</p><p style="text-rendering: geometricprecision; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; text-size-adjust: 100%; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; max-width: 100%; font-family: Tahoma, Arial, sans-serif;">"Sau sự việc, nhà trường đã cử đại diện của ban giám hiệu cùng các thầy, cô giáo đến chia buồn, thăm hỏi gia đình, tiếp nhận thông tin ban đầu.</p><p style="text-rendering: geometricprecision; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; text-size-adjust: 100%; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; max-width: 100%; font-family: Tahoma, Arial, sans-serif;">Chúng tôi đang khẩn trương làm việc với giáo viên chủ nhiệm và học sinh trong lớp để xác minh các nội dung liên quan một cách chính xác, khách quan nhất", Nguyễn Hồng Soa - Trưởng phòng công tác chính trị học sinh, sinh viên, Trường Đại học Vinh cho biết.</p><p style="text-rendering: geometricprecision; margin-right: 0px; margin-bottom: 1em; margin-left: 0px; padding: 0px; border: 0px; outline: 0px; font-size: 15px; vertical-align: baseline; background: 0px 0px; text-size-adjust: 100%; line-height: 18px; color: rgb(0, 0, 0); text-align: justify; max-width: 100%; font-family: Tahoma, Arial, sans-serif;">Ông Phạm Xuân Chung - Hiệu trưởng Trường THPT chuyên Đại học Vinh cũng lên tiếng về việc trường này đang xác minh những thông tin trên mạng xã hội đăng, làm rõ các mối quan hệ của em N. và bạn bè trong trường, lớp.</p>', N'bo-gd-dt-len-tieng-vu-nu-sinh-truong-chuyen-tu-tu.png', 1, N'bo-gd-dt-len-tieng-vu-nu-sinh-truong-chuyen-tu-tu', CAST(N'2023-04-18T23:44:10.000' AS DateTime), NULL, NULL, NULL, NULL, 1, 1, N'Bộ GD-ĐT lên tiếng vụ nữ sinh trường chuyên tự tử nghi do bạo lực học đường', N'Bộ GD-ĐT lên tiếng vụ nữ sinh trường chuyên tự tử nghi do bạo lực học đường', NULL)
GO
INSERT [dbo].[TinDangs] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (2, N'Khách bay tăng vọt, Nội Bài khuyến cáo hành khách dịp lễ 30-4', NULL, N'<p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Dự kiến ngày cao nhất,&nbsp;<a href="https://nld.com.vn/noi-bai.html" title="Nội Bài" target="_blank" style="margin: 0px; padding: 0px; border: 0px; vertical-align: baseline; color: rgb(0, 90, 137); display: inline-block;">Nội Bài</a>&nbsp;sẽ phục vụ khoảng 96 ngàn lượt khách (trong đó 28 ngàn lượt khách quốc tế, 68 ngàn lượt khách quốc nội) và 580 lượt chuyến bay (trong đó 205 lượt chuyến bay quốc tế, 375 lượt chuyến bay quốc nội).</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Mức sản lượng hành khách đợt cao điểm 30-4 năm nay tăng hơn 20% so với dịp lễ 30-4 năm 2022 tuy nhiên vẫn chưa vượt qua cao điểm hè năm ngoái.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">"Nguyên nhân chủ yếu là do sản lượng bay quốc tế tại Nội Bài dần phục hồi, đạt khoảng 80% so với đỉnh cao trước dịch COVID-19, trong khi sản lượng bay nội địa vẫn duy trì ở mức ổn định"- lãnh đạo sân bay Nội Bài cho biết.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Đại diện sân bay Nội Bài lưu ý hành khách khi đi máy bay dịp cao điểm cần hạn chế người thân đón, tiễn.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Kiểm tra kỹ tình trạng giấy tờ tùy thân đảm bảo còn đủ thời hạn sử dụng, đặc biệt lưu ý những hành khách đi cùng trẻ em từ 14 tuổi trở lên (đủ tuổi làm CMND/CCCD) nếu chưa kịp làm CMND/CCCD hoặc những khách có CMND/CCCD bị mất, hết hạn sử dụng hoặc bị mờ, không được chấp nhận thì cần đến cơ quan Công an nơi cư trú để làm giấy xác nhận nhân thân theo mẫu hiện hành để tránh việc bị từ chối thực hiện chuyến bay khi giấy tờ tùy thân không đủ điều kiện.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Chủ động lên sớm trước giờ bay (có mặt trước giờ bay 2 tiếng đối với chuyến bay nội địa, 3 tiếng đối với chuyến bay quốc tế) để tránh nguy cơ chậm chuyến do ách tắc giao thông trên đường di chuyển đến sân bay hoặc ùn ứ cục bộ tại nhà ga trong một số khung giờ "vàng".</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Khuyến khích hành khách làm thủ tục web check-in hoặc tự làm check-in tại các kiosk của hãng hàng không tại nhà ga.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Hành khách đi theo đoàn chú ý khi làm thủ tục web check-in cần tách riêng mỗi khách 1 thẻ, không nên để chung trên 1 thiết bị điện thoại vì sẽ mất nhiều thời gian cho việc kiểm tra an ninh. Lưu ý, các thành viên của đoàn làm thủ tục check-in xong cần xếp hàng vào kiểm tra an ninh và các thủ tục khác, tránh chờ đợi nhau gây ùn ứ cục bộ và chậm chuyến bay.</p><div id="dablewidget_6XggQDXN" data-widget_id="6XggQDXN" style="margin: 0px; padding: 7px 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 1.4; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(0, 0, 0); height: 0px; overflow: hidden;"><iframe width="100%" height="0" title="추천 아이템" frameborder="0" scrolling="no" name="dableframe-0.655918445424913" src="https://api.dable.io/widgets/id/6XggQDXN/users/46803005.1665050165106?from=https%3A%2F%2Fnld.com.vn%2Fthoi-su%2Fkhach-bay-tang-vot-noi-bai-khuyen-cao-hanh-khach-dip-le-30-4-20230419123018079.htm&amp;url=https%3A%2F%2Fnld.com.vn%2Fthoi-su%2Fkhach-bay-tang-vot-noi-bai-khuyen-cao-hanh-khach-dip-le-30-4-20230419123018079.htm&amp;ref=https%3A%2F%2Fbaomoi.com%2Fkhach-bay-tang-vot-noi-bai-khuyen-cao-hanh-khach-dip-le-30-4%2Fr%2F45597453.epi&amp;cid=46803005.1665050165106&amp;uid=46803005.1665050165106&amp;site=nld.com.vn&amp;gdpr=0&amp;service_id=7627&amp;service_type=news&amp;country=VN&amp;client_id=3888&amp;randomStr=1899f065-5282-4bf8-b1a0-515c030b8723&amp;id=dablewidget_6XggQDXN&amp;category1=Th%E1%BB%9Di%20s%E1%BB%B1%20trong%20n%C6%B0%E1%BB%9Bc&amp;author=D%C6%B0%C6%A1ng%20Ng%E1%BB%8Dc&amp;ad_params=%7B%7D&amp;item_id=20230419123018079&amp;item_pub_date=2023-04-19T12%3A59%3A02%2B07%3A00&amp;pixel_ratio=1.25&amp;ua=Mozilla%2F5.0%20(Windows%20NT%2010.0%3B%20Win64%3B%20x64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F112.0.5615.86%20Safari%2F537.36&amp;client_width=520&amp;network=non-wifi&amp;lang=vi&amp;is_top_win=1&amp;top_win_accessible=1&amp;is_lazyload=0" style="margin: 0px; padding: 0px; vertical-align: baseline;"></iframe></div><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Hành khách là người cao tuổi, phụ nữ có thai, có trẻ dưới 2 tuổi đi cùng là đối tượng ưu tiên (nhưng không bao gồm cả đoàn người đi cùng) chủ động xếp hàng vào các vị trí lối ưu tiên/lối vào dành cho những hành khách cần trợ giúp.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Hành khách lưu ý đọc kỹ các quy định về hành lý, các vật phẩm nguy hiểm cấm/hạn chế mang vào khu vực hạn chế, mang lên máy bay (tại Quyết định số 1541/QĐ-CHK ngày 14-9-2021).</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Khuyến khích hành khách download và sử dụng ứng dụng iNIA trên điện thoại di động thông minh để theo dõi các thông tin về chuyến bay, giờ bay, ngày bay, quầy thủ tục, cửa khởi hành hoặc bất cứ sự thay đổi nào của chuyến bay.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Khuyến khích hành khách trải nghiệm các phương tiện vận tải công cộng. Hành khách nối chuyến lưu ý sân bay Nội Bài bố trí xe nối chuyến miễn phí giữa 2 nhà ga quốc nội và quốc tế, tần suất 15 phút/1 chuyến vào khung giờ ban ngày, 30 phút/1 chuyến vào khung giờ ban đêm, vị trí đón khách tại cánh A, tầng 1 - Nhà ga hành khách T1, và cột số 11-12 Nhà ga hành khách T2.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Tăng cường các biện pháp phòng chống dịch COVID-19, tuân thủ khuyến cáo 2K (khẩu trang, khử khuẩn) của Bộ Y tế, đặc biệt tại các khu vực công cộng.</p><p style="margin-right: 0px; margin-bottom: 13px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 16px; line-height: 25px; font-family: Arial, Helvetica, sans-serif; vertical-align: baseline; color: rgb(37, 37, 37);">Khi cần hỗ trợ, hành khách có thể gọi đến hotline của Nội Bài tại số tổng đài 1900636535, hotline nhận phản ánh về chất lượng dịch vụ tại số điện thoại 0389166566, website: http://noibaiairport.vn/, hoặc nhân viên trực tại các quầy Thông tin, nhân viên An ninh hàng không hoặc các nhân viên mặc đồng phục đeo thẻ của các cơ quan, đơn vị hoạt động tại Cảng.</p>', N'khach-bay-tang-vot-noi-bai-khuyen-cao-hanh-khach-dip-le-30-4.jpg', 1, N'khach-bay-tang-vot-noi-bai-khuyen-cao-hanh-khach-dip-le-30-4', CAST(N'2023-04-19T16:07:15.647' AS DateTime), NULL, NULL, NULL, NULL, 1, 1, N'Khách bay tăng vọt, Nội Bài khuyến cáo hành khách dịp lễ 30-4', N'Khách bay tăng vọt, Nội Bài khuyến cáo hành khách dịp lễ 30-4', NULL)
GO
INSERT [dbo].[TinDangs] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (3, N'Bí quyết bảo quản chanh tươi cả tháng không hỏng', NULL, N'<div class="entry-summary xxx" style="margin: 0px; padding: 10px 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 700; font-stretch: inherit; font-size: 16.5px; line-height: inherit; font-family: -apple-system, BlinkMacSystemFont, &quot;Segoe UI&quot;, Roboto, &quot;Helvetica Neue&quot;, Arial, &quot;Noto Sans&quot;, sans-serif, &quot;Apple Color Emoji&quot;, &quot;Segoe UI Emoji&quot;, &quot;Segoe UI Symbol&quot;, &quot;Noto Color Emoji&quot;; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46); text-align: justify;"><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Ở nhiệt độ phòng, chanh chỉ có thể giữ được độ tươi ngon nhiều nhất là một tuần. Sau thời gian đó, chanh sẽ dần mất đi độ ẩm và bắt đầu xuất hiện các mảng mềm, hư hỏng. Các lỗ nhỏ ở ngoài vỏ chanh cho phép hơi ẩm thoát ra và khiến chúng bị khô, mất đi mùi vị vốn có.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Để bảo quản chanh đúng cách và giữ được độ tươi ngon lâu, bạn cần lưu ý một số điều sau đây:</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Đầu tiên, bạn nên chọn trái chanh có kích thước nhỏ, νỏ mỏng, qυan trọng là chanh phải già, như νậγ mới có nhiềυ nước νà nước cốt chanh sẽ thơm hơn. Trước khi cất giữ chanh, hãy rửa sạch với nước để loại bỏ những tạp chất và bụi bẩn bám bên ngoài, sau đó để cho khô hoàn toàn hoặc dùng khăn giấy lau khô.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Dưới đây là một số mẹo bảo quản chanh để giữ chúng tươi lâu hơn mà bạn có thể áp dụng.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Cách tốt nhất để bảo quản chanh là để trong tủ lạnh. Tuy nhiên, việc cất giữ thế nào để được lâu thì cũng phải biết cách.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Bạn có thể đặt chanh ở trên kệ bên cửa tủ lạnh, việc này giúp giữ được độ tươi ngon trong một tuần hoặc hơn. Tuy nhiên, nếu muốn chanh để được lâu hơn, hãy lau sạch rồi cho chúng vào hộp kín hoặc túi zip (cho chanh vào túi và loại bỏ hết không khí trong túi, khóa chặt). Điều này sẽ giúp chanh không bị khô và tươi trong gần một tháng.</p><p style="margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; border: 0px; font-variant-numeric: inherit; font-variant-east-asian: inherit; font-variant-alternates: inherit; font-weight: 400; font-stretch: inherit; font-size: 15px; line-height: 21px; font-optical-sizing: inherit; font-kerning: inherit; font-feature-settings: inherit; font-variation-settings: inherit; vertical-align: baseline; color: rgb(51, 48, 46);">Nếu muốn bảo quản nửa quả chanh, hãy dùng màng bọc thực phẩm bọc phần đầu tiếp xúc lại hoặc cho vào hộp kín rồi đặt vào tủ lạnh. Tuy nhiên, chanh vẫn ngon nhất trong vòng 2-3 ngày kể từ ngày cắt.<br></p></div>', N'bi-quyet-bao-quan-chanh-tuoi-ca-thang-khong-hong.jpg', 1, N'bi-quyet-bao-quan-chanh-tuoi-ca-thang-khong-hong', CAST(N'2023-04-19T16:10:09.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, N'Bí quyết bảo quản chanh tươi cả tháng không hỏng', N'Bí quyết bảo quản chanh tươi cả tháng không hỏng', NULL)
GO
INSERT [dbo].[TinDangs] ([PostID], [Title], [SContents], [Contents], [Thumb], [Published], [Alias], [CreatedDate], [Author], [AccountID], [Tags], [CatID], [isHot], [isNewfeed], [MetaKey], [MetaDesc], [Views]) VALUES (4, N'Cách ăn trái cây có lợi nhất đối với người bệnh đái tháo đường', NULL, N'<p><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 17px;">Nhược điểm lớn nhất của trái cây đối với người bệnh đái tháo đường chính là ở cách lựa chọn trái cây, cách ăn trái cây và kiểm soát khẩu phần.</span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 17px;">Trái cây có chứa carbohydrate, carbohydrate bị phân hủy trong quá trình tiêu hóa và biến thành đường (glucose). Loại carbohydrate chính trong trái cây là một loại đường tự nhiên có tên là fructose. Ăn quá nhiều đường fructose có thể có tác dụng tương tự như ăn quá nhiều đường ăn.</span></p><p><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 17px;">Trong trường hợp bệnh nhân mắc bệnh thận liên quan đến bệnh đái tháo đường cần ăn kiêng hạn chế kali thì ăn nhiều trái cây họ cam quýt, chuối, mơ và một số loại dưa có thể dẫn đến dư thừa kali.</span></p><h2 id="2-nguyen-tac-an-trai-cay-doi-voi-nguoi-benh-dai-thao-duong" style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;">Nguyên tắc ăn trái cây đối với người bệnh đái tháo đường</b></h2><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 17px; line-height: 23.8px; font-family: Arial; word-break: break-word; color: rgb(51, 51, 51);">Theo ThS.BS Nguyễn Thu Yên, chuyên gia Nội tiết - Đái tháo đường, trái cây chứa nhiều loại vitamin và khoáng chất quan trọng cho người bệnh đái tháo đường. Vì vậy trong bữa ăn nhẹ hay muốn ăn vặt, người bệnh nên chọn trái cây thay vì các món khác như khoai tây chiên hay các loại bánh.</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 17px; line-height: 23.8px; font-family: Arial; word-break: break-word; color: rgb(51, 51, 51);">Nguyên tắc ăn trái cây cho người bệnh đái tháo đường là chọn loại trái cây phù hợp (chứa ít glucose, giàu chất xơ và vitamin).</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 17px; line-height: 23.8px; font-family: Arial; word-break: break-word; color: rgb(51, 51, 51);">Người bệnh đái tháo đường nên ăn trái cây tươi vừa chín tới, ăn đa dạng nhiều loại trái cây và nên ăn cả trái thay vì ép nước uống.</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 17px; line-height: 23.8px; font-family: Arial; word-break: break-word; color: rgb(51, 51, 51);"><span style="margin: 0px; padding: 0px;">Xác định lượng trái cây trong mỗi lần ăn cũng là vấn đề rất quan trọng. Theo khuyến cáo, lượng trái cây người bệnh nên ăn trong mỗi lần là 15g; mỗi ngày nên ăn 2-3 suất trái cây…</span></p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-stretch: normal; font-size: 17px; line-height: 23.8px; font-family: Arial; word-break: break-word; color: rgb(51, 51, 51);"><span style="margin: 0px; padding: 0px;"></span></p><h2 id="3-mot-so-meo-chon-trai-cay-tot-cho-nguoi-benh-dai-thao-duong" style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;">Một số mẹo chọn trái cây tốt cho người bệnh đái tháo đường</b></h2><h3 id="chon-trai-cay-co-chi-so-duong-huyet-thap" style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;">Chọn trái cây có&nbsp;<a class="seo-suggest-link" href="https://suckhoedoisong.vn/10-loai-thuc-pham-co-chi-so-duong-huyet-thap-cho-che-do-an-uong-lanh-manh-169230110220620898.htm" target="_blank" title="10 loại thực phẩm có chỉ số đường huyết thấp cho chế độ ăn uống lành mạnh" style="margin: 0px; padding: 0px; color: -webkit-link;">chỉ số đường huyết</a>&nbsp;thấp</b></h3><h2 id="3-mot-so-meo-chon-trai-cay-tot-cho-nguoi-benh-dai-thao-duong" style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;"><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Chỉ số đường huyết là phép đo lượng thức ăn nhất định sẽ ảnh hưởng đến lượng đường trong máu. Người bệnh đái tháo đường nên ăn trái cây có chỉ số đường huyết thấp (GI bằng 55 hoặc ít hơn) giúp đường huyết tăng một cách chầm chậm. Hạn chế ăn trái cây có chỉ số đường huyết cao (GI bằng 70 trở lên) khi ăn vào đường tăng nhanh.</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Những trái cây có chỉ số đường huyết thấp nên lựa chọn là: ổi, bưởi, cam, táo, lê, thanh long, bơ… Hạn chế trái cây có chỉ số đường huyết cao như: nhãn, vải, mít, sầu riêng…</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Ngoài ra cần lưu ý, trái cây càng chín thì chỉ số đường huyết càng cao. Điều này có nghĩa là trái cây chín sẽ làm tăng lượng đường trong máu của bạn nhiều hơn.</p></b></h2><h3 id="chon-trai-cay-sam-mau" style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;">Chọn trái cây sẫm màu</b></h3><h2 style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;"><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Những trái cây có màu sẫm hơn như màu đỏ đậm, tím và xanh lam…thường giàu chất chống oxy hóa. Chất chống oxy hóa là các hợp chất có nguồn gốc từ thực vật có tác dụng chống lại các gốc tự do, các hóa chất có thể gây hại cho tế bào.</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Những sắc tố sẫm màu này đến từ một hợp chất gọi là anthocyanin, nó có thể giúp chống lại các bệnh mạn tính.</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Theo nghiên cứu, chất chống oxy hóa trong trái cây có thể giúp ngăn ngừa chứng viêm, một vấn đề chính trong các bệnh mạn tính như bệnh đái tháo đường type 2. Nghiên cứu cũng cho thấy, ăn nhiều trái cây và rau quả làm giảm các dấu hiệu viêm nhiễm và cải thiện phản ứng miễn dịch của cơ thể đối với bệnh tật.</p></b></h2><h3 id="nen-chon-cac-loai-qua-mong" style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;">Nên chọn các loại quả mọng</h3><h2 style="margin: 13.4px 0px; padding: 0px; line-height: 1.2; font-size: 17px; color: rgb(51, 51, 51); font-family: Arial;"><b style="margin: 0px; padding: 0px;"><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Các loại quả mọng như dâu tây, việt quất và mâm xôi có thể mang lại những lợi ích sức khỏe đặc biệt quý giá cho những người mắc bệnh đái tháo đường vì chúng rất giàu vitamin C, axit folic, chất xơ và chất phytochemical&nbsp;<a class="seo-suggest-link" href="https://suckhoedoisong.vn/nhung-loi-ich-bat-ngo-cua-che-do-an-giau-thuc-pham-chong-viem-doi-voi-suc-khoe-169230327192752154.htm" target="_blank" title="Những lợi ích bất ngờ của chế độ ăn giàu thực phẩm chống viêm đối với sức khỏe" style="margin: 0px; padding: 0px; color: -webkit-link;">chống viêm</a>.</p><p style="margin: 13.4px 0px; padding: 0px; font-variant-numeric: normal; font-variant-east-asian: normal; font-variant-alternates: normal; font-kerning: auto; font-optical-sizing: auto; font-feature-settings: normal; font-variation-settings: normal; font-weight: 400; font-stretch: normal; line-height: 23.8px; word-break: break-word; color: rgb(51, 51, 51);">Các nghiên cứu đã chỉ ra rằng, chế độ ăn nhiều quả mọng có liên quan đến việc giảm nguy cơ mắc bệnh đái tháo đường type 2. Các loại quả mọng có thể giúp chuyển hóa glucose và điều chỉnh trọng lượng cơ thể.</p></b></h2><p><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 17px;"><br></span><span style="color: rgb(51, 51, 51); font-family: Arial; font-size: 17px;"><br></span><br></p>', N'cach-an-trai-cay-co-loi-nhat-doi-voi-nguoi-benh-dai-thao-duong.jpg', 1, N'cach-an-trai-cay-co-loi-nhat-doi-voi-nguoi-benh-dai-thao-duong', CAST(N'2023-04-19T16:12:33.000' AS DateTime), NULL, NULL, NULL, NULL, 0, 1, N'Cách ăn trái cây có lợi nhất đối với người bệnh đái tháo đường', N'Cách ăn trái cây có lợi nhất đối với người bệnh đái tháo đường', NULL)
GO
SET IDENTITY_INSERT [dbo].[TinDangs] OFF
GO
SET IDENTITY_INSERT [dbo].[TransactStatus] ON 
GO
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (1, N'Chờ lấy hàng', N'Đã xác nhận và đang soạn hàng')
GO
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (2, N'Chờ xác nhận', N'Đang được người bán xác nhận với người mua')
GO
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (3, N'Đang giao', N'Đơn hàng đang được giao tới người mua')
GO
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (4, N'Đã giao thành công', N'Đơn hàng đã tới tay người mua')
GO
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (5, N'Đã hủy', N'Đơn hàng đã được hủy')
GO
INSERT [dbo].[TransactStatus] ([TransactStatusID], [Status], [Description]) VALUES (6, N'Trả hàng', N'Đã trả hàng thành công')
GO
SET IDENTITY_INSERT [dbo].[TransactStatus] OFF
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD  CONSTRAINT [FK_Accounts_Roles] FOREIGN KEY([RoleID])
REFERENCES [dbo].[Roles] ([RoleID])
GO
ALTER TABLE [dbo].[Accounts] CHECK CONSTRAINT [FK_Accounts_Roles]
GO
ALTER TABLE [dbo].[AttributesPrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributesPrices_Attributes] FOREIGN KEY([AttributeID])
REFERENCES [dbo].[Attributes] ([AttributeID])
GO
ALTER TABLE [dbo].[AttributesPrices] CHECK CONSTRAINT [FK_AttributesPrices_Attributes]
GO
ALTER TABLE [dbo].[AttributesPrices]  WITH CHECK ADD  CONSTRAINT [FK_AttributesPrices_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[AttributesPrices] CHECK CONSTRAINT [FK_AttributesPrices_Products]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Locations] FOREIGN KEY([LocationID])
REFERENCES [dbo].[Locations] ([LocationID])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Locations]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Orders] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Orders]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Products] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Products] ([ProductID])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Products]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_Customers] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customers] ([CustomerID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_Customers]
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD  CONSTRAINT [FK_Orders_TransactStatus] FOREIGN KEY([TransactStatusID])
REFERENCES [dbo].[TransactStatus] ([TransactStatusID])
GO
ALTER TABLE [dbo].[Orders] CHECK CONSTRAINT [FK_Orders_TransactStatus]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Categories] FOREIGN KEY([CatID])
REFERENCES [dbo].[Categories] ([CatID])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Categories]
GO
