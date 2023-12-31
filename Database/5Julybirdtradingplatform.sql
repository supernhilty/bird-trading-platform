USE [master]
GO
/****** Object:  Database [BirdPlatform]    Script Date: 7/5/2023 9:19:42 AM ******/
CREATE DATABASE [BirdPlatform]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BirdPlatform', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BirdPlatform.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BirdPlatform_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\BirdPlatform_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [BirdPlatform] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BirdPlatform].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BirdPlatform] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BirdPlatform] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BirdPlatform] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BirdPlatform] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BirdPlatform] SET ARITHABORT OFF 
GO
ALTER DATABASE [BirdPlatform] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BirdPlatform] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BirdPlatform] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BirdPlatform] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BirdPlatform] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BirdPlatform] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BirdPlatform] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BirdPlatform] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BirdPlatform] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BirdPlatform] SET  DISABLE_BROKER 
GO
ALTER DATABASE [BirdPlatform] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BirdPlatform] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BirdPlatform] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BirdPlatform] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BirdPlatform] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BirdPlatform] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [BirdPlatform] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BirdPlatform] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [BirdPlatform] SET  MULTI_USER 
GO
ALTER DATABASE [BirdPlatform] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BirdPlatform] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BirdPlatform] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BirdPlatform] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BirdPlatform] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [BirdPlatform] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [BirdPlatform] SET QUERY_STORE = OFF
GO
USE [BirdPlatform]
GO
/****** Object:  Table [dbo].[Feedback]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Feedback](
	[feedbackID] [int] IDENTITY(1,1) NOT NULL,
	[img] [text] NULL,
	[star] [int] NOT NULL,
	[detail] [ntext] NULL,
	[productID] [int] NULL,
	[accID] [int] NOT NULL,
	[publishedDate] [date] NULL,
	[orderDetailID] [int] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[feedbackID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[ProductRate]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[ProductRate] ()
RETURNS TABLE
AS
RETURN
    select productID, sum(star)/count(productID) as star 
	from [Feedback] 
	group by productID
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[customerID] [int] IDENTITY(1,1) NOT NULL,
	[phoneNumber] [nchar](10) NOT NULL,
	[point] [nchar](10) NULL,
	[accountID] [int] NOT NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[customerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[orderID] [int] IDENTITY(1,1) NOT NULL,
	[orderDate] [date] NOT NULL,
	[total] [float] NOT NULL,
	[paymentID] [int] NULL,
	[customerID] [int] NOT NULL,
	[addressShipID] [int] NULL,
	[shipDate] [datetime] NULL,
	[status] [varchar](20) NOT NULL,
	[shopID] [int] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[accountID] [int] IDENTITY(1,1) NOT NULL,
	[username] [nvarchar](34) NOT NULL,
	[email] [varchar](100) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[role] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[regisDate] [date] NULL,
	[avatar] [text] NULL,
 CONSTRAINT [PK_Account_1] PRIMARY KEY CLUSTERED 
(
	[accountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[orderHistory]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[orderHistory] (
    @accountID INT
)
RETURNS TABLE
AS
RETURN
    select * from [Order] 
where customerID = (select customerID from [customer] left join [account] on [customer].accountID=@accountID)
GO
/****** Object:  Table [dbo].[OrderDetail]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetail](
	[orderDetailID] [int] IDENTITY(1,1) NOT NULL,
	[quantity] [int] NOT NULL,
	[price] [float] NOT NULL,
	[productID] [int] NOT NULL,
	[orderID] [int] NOT NULL,
 CONSTRAINT [PK_OrderDetail] PRIMARY KEY CLUSTERED 
(
	[orderDetailID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[orderHistoryQuantity]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[orderHistoryQuantity] ()
RETURNS TABLE
AS
RETURN
    select sum(quantity) as totalQuantity, orderID, quantity from [OrderDetail] group by orderID,quantity;
GO
/****** Object:  Table [dbo].[Product]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[productID] [int] IDENTITY(1,1) NOT NULL,
	[productName] [nvarchar](100) NOT NULL,
	[priceIn] [float] NOT NULL,
	[type] [nvarchar](50) NULL,
	[category] [nvarchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[description] [text] NULL,
	[status] [varchar](50) NOT NULL,
	[img] [varchar](200) NULL,
	[rating] [float] NULL,
	[shopID] [int] NULL,
	[priceOut] [float] NOT NULL,
	[pSale] [float] NULL,
	[dateIn] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[productID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  UserDefinedFunction [dbo].[orderHistoryFirstProduct]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE FUNCTION [dbo].[orderHistoryFirstProduct] ()
RETURNS TABLE
AS
RETURN
    select top 1 orderID, [Product].productName as firstProductName from [OrderDetail] left join [Product] on [OrderDetail].productID=[Product].productID order by [Product].productID
GO
/****** Object:  Table [dbo].[Address]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Address](
	[addressID] [int] IDENTITY(1,1) NOT NULL,
	[detail] [nvarchar](50) NULL,
	[district] [nvarchar](50) NULL,
	[province] [nvarchar](50) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[addressID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AddressShipment]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AddressShipment](
	[addressShipID] [int] IDENTITY(1,1) NOT NULL,
	[phoneShipment] [varchar](20) NOT NULL,
	[detail] [text] NULL,
	[district] [varchar](50) NOT NULL,
	[province] [varchar](50) NOT NULL,
	[customerID] [int] NOT NULL,
 CONSTRAINT [PK_AddressShipment] PRIMARY KEY CLUSTERED 
(
	[addressShipID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FeedbackResponse]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FeedbackResponse](
	[feedbackResID] [int] NOT NULL,
	[feedbackID] [int] NOT NULL,
	[detail] [text] NOT NULL,
 CONSTRAINT [PK_FeedbackResponse] PRIMARY KEY CLUSTERED 
(
	[feedbackResID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Payment]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Payment](
	[paymentID] [int] IDENTITY(1,1) NOT NULL,
	[paymentName] [varchar](50) NOT NULL,
	[payment_redirect] [bit] NOT NULL,
	[paymentImg] [text] NULL,
 CONSTRAINT [PK_Payment] PRIMARY KEY CLUSTERED 
(
	[paymentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ResetPass]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ResetPass](
	[gmail] [nvarchar](20) NOT NULL,
	[code] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_ResetPass] PRIMARY KEY CLUSTERED 
(
	[gmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[role] [int] IDENTITY(1,1) NOT NULL,
	[roleName] [varchar](10) NOT NULL,
 CONSTRAINT [PK_Role] PRIMARY KEY CLUSTERED 
(
	[role] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Shop]    Script Date: 7/5/2023 9:19:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shop](
	[shopID] [int] IDENTITY(1,1) NOT NULL,
	[shopName] [nvarchar](34) NOT NULL,
	[rate] [float] NULL,
	[contact] [ntext] NOT NULL,
	[accountID] [int] NULL,
	[addressID] [int] NOT NULL,
	[view] [int] NULL,
 CONSTRAINT [PK_Shop] PRIMARY KEY CLUSTERED 
(
	[shopID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (2, N'bird', N's', N'1', 1, 0, CAST(N'2022-12-05' AS Date), N'https://thumbs.dreamstime.com/z/playful-toucan-25287988.jpg')
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (3, N'pconyer0', N'jquantrill0@shop-pro.jp', N'a8ZVnyB', 2, 0, CAST(N'2022-11-30' AS Date), N'https://thumbs.dreamstime.com/z/playful-toucan-25287988.jpg')
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (4, N'mtankus1', N'dashard1@vk.com', N'7FcuGuErwCR3', 2, 0, CAST(N'2023-02-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (5, N'aprettyjohn2', N'lbambury2@shop-pro.jp', N'EJxpsvJnCqIF', 2, 0, CAST(N'2023-02-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (6, N'jpatis3', N'dgaye3@wordpress.org', N'gljIOS', 2, 0, CAST(N'2022-11-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (7, N'jkerwood4', N'cmisson4@discovery.com', N'COnYQqM', 2, 0, CAST(N'2022-10-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (8, N'test', N'pbutland5@mac.com', N'1234', 4, 0, CAST(N'2023-03-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (9, N'hmarven6', N'bhamel6@dion.ne.jp', N'yDkIvU', 4, 0, CAST(N'2022-12-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (10, N'egelsthorpe7', N'vtargetter7@goodreads.com', N'9y9Zqq8INh4', 4, 0, CAST(N'2022-08-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (11, N'larbor8', N'cmcgonagle8@youtube.com', N'1atwdYotoK', 4, 0, CAST(N'2022-10-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (12, N'ewilles9', N'bfandrich9@privacy.gov.au', N'rVGdLjAb', 4, 0, CAST(N'2023-03-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (13, N'celderfielda', N'hgarawaya@ow.ly', N'vsnnkSOi2', 4, 0, CAST(N'2023-02-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (14, N'srevansb', N'ndackb@blogs.com', N'iopWNC8thD4', 2, 0, CAST(N'2022-06-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (15, N'dbattersc', N'nspurriarc@cbsnews.com', N'5SbEPqQ', 2, 0, CAST(N'2023-02-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (16, N'mvidelerd', N'wfowldsd@odnoklassniki.ru', N'JRpDF6Z5j', 2, 0, CAST(N'2022-11-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (17, N'smanoellie', N'eliddyarde@blogs.com', N'dTC7KCd', 2, 0, CAST(N'2023-01-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (18, N'alogesf', N'ctribef@nbcnews.com', N'UkUdc6', 2, 0, CAST(N'2022-09-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (19, N'ralekseicikg', N'wveldeg@newsvine.com', N'TTldrYfuOxi', 2, 0, CAST(N'2022-12-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (20, N'flaydelh', N'vfalconbridgeh@abc.net.au', N'9zevTy', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (21, N'eflecknoei', N'jmushrowi@patch.com', N'uisklDioPd', 2, 0, CAST(N'2022-12-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (22, N'wfidoj', N'vtiptaftj@fotki.com', N'b5XFVtxNS', 2, 0, CAST(N'2022-10-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (23, N'fprestidgek', N'fbissikerk@nsw.gov.au', N'zPMVhhP', 2, 0, CAST(N'2023-01-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (24, N'kchennellsl', N'lsherruml@360.cn', N'9w25mnJJCQe6', 2, 0, CAST(N'2023-04-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (25, N'blockneym', N'colahym@foxnews.com', N'ZL0WaGJJAGJ', 2, 0, CAST(N'2022-07-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (26, N'npratleyn', N'mpoltonen@typepad.com', N'QxqBnFGEP6', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (27, N'jparriso', N'tnaccio@npr.org', N'bH8ReaTop', 2, 0, CAST(N'2022-06-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (28, N'feddowesp', N'bfrenzelp@miibeian.gov.cn', N'mP83pZ', 2, 0, CAST(N'2022-11-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (29, N'sselveyq', N'jstonierq@wunderground.com', N'QsDfeBx', 2, 0, CAST(N'2023-05-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (30, N'mscaner', N'magusr@blogger.com', N'n4Mc2qzU6uA', 2, 0, CAST(N'2022-09-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (31, N'egarreds', N'dcanhams@blinklist.com', N'QSB5473c0fbb', 2, 0, CAST(N'2023-06-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (32, N'jbattistat', N'marchbuttt@edublogs.org', N'Nn7XndKE', 2, 0, CAST(N'2023-05-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (33, N'kasplenu', N'ldeluceu@ow.ly', N'7n66vWrovY', 2, 0, CAST(N'2022-10-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (34, N'sschimkev', N'cmactrustramv@shutterfly.com', N'tokbP91hOB', 2, 0, CAST(N'2023-01-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (35, N'amcknielyw', N'duphamw@wikia.com', N'6u7jXKqixvt', 2, 0, CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (36, N'dchurmx', N'sdurtnallx@ed.gov', N'EEyIuCmrFM', 2, 0, CAST(N'2023-04-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (37, N'tcarretty', N'bturbefieldy@godaddy.com', N'F4CPDGoPpcOa', 2, 0, CAST(N'2022-12-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (38, N'fsijmonsz', N'dbarendtsenz@sitemeter.com', N'xJ64Xt1STjdr', 2, 0, CAST(N'2022-11-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (39, N'slortzing10', N'lbabalola10@wordpress.com', N'e09qAbFu', 2, 0, CAST(N'2022-12-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (40, N'wlinnell11', N'scircuit11@yandex.ru', N'tEMEu7CDvItJ', 2, 0, CAST(N'2023-05-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (41, N'pblamire12', N'strime12@feedburner.com', N'MUJhAzI', 2, 0, CAST(N'2023-04-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (42, N'mspivey13', N'eiveans13@tinypic.com', N'JBxnQyt1N', 2, 0, CAST(N'2023-05-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (43, N'kdavey14', N'caitchison14@sphinn.com', N'gU3mdT3bxCev', 2, 0, CAST(N'2022-07-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (44, N'dlillow15', N'ddrissell15@meetup.com', N'kTabihky', 2, 0, CAST(N'2022-10-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (45, N'jlecount16', N'stomaskov16@theglobeandmail.com', N'FrZzSe3', 2, 0, CAST(N'2022-10-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (46, N'bkeyhoe17', N'jjelley17@over-blog.com', N'GxYAEOIy', 2, 0, CAST(N'2023-04-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (47, N'gheatley18', N'kwerlock18@addtoany.com', N'YErdYK', 2, 0, CAST(N'2023-06-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (48, N'hwardhough19', N'charlin19@ask.com', N'4OiJWMBIW', 2, 0, CAST(N'2023-01-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (49, N'barguile1a', N'rgrob1a@cnbc.com', N'qfrhGezlxk', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (50, N'mwein1b', N'hnozzolinii1b@yelp.com', N'rG0U9Fkb', 2, 0, CAST(N'2023-02-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (51, N'dpeete1c', N'nartharg1c@123-reg.co.uk', N'VP5w6ANN', 2, 0, CAST(N'2022-11-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (52, N'anovkovic1d', N'kaust1d@paypal.com', N'NpW2cYq', 2, 0, CAST(N'2023-04-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (53, N'jbrolan1e', N'mpawels1e@state.gov', N'RMeNWYogdXVv', 2, 0, CAST(N'2022-06-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (54, N'agillbe1f', N'tbunclark1f@ted.com', N'weMXgrjD', 2, 0, CAST(N'2022-10-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (55, N'emelling1g', N'nwigg1g@abc.net.au', N'KfObg1U0Q8i', 2, 0, CAST(N'2023-05-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (56, N'twoodwin1h', N'astoneman1h@miitbeian.gov.cn', N'HlNvVs', 2, 0, CAST(N'2023-06-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (57, N'vcuppleditch1i', N'nmcilwaine1i@bing.com', N'60blz6', 2, 0, CAST(N'2022-11-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (58, N'myve1j', N'wbartram1j@stanford.edu', N'ury0wxR3z0', 2, 0, CAST(N'2023-01-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (59, N'eloton1k', N'frosenfield1k@nhs.uk', N'DA6VkSHFXdSc', 2, 0, CAST(N'2022-10-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (60, N'rmatevushev1l', N'rblaver1l@1688.com', N'LhjeUVJ', 2, 0, CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (61, N'cmurty1m', N'gmartini1m@japanpost.jp', N'FA0dUs', 2, 0, CAST(N'2022-07-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (62, N'tmallaby1n', N'hskermer1n@stanford.edu', N'8Ea19LUcIN', 2, 0, CAST(N'2022-12-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (63, N'dchuter1o', N'kdumsday1o@nasa.gov', N'yGmpwQKsHaP3', 2, 0, CAST(N'2022-12-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (64, N'gundrill1p', N'jlarkcum1p@sakura.ne.jp', N'oaKZLNo', 2, 0, CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (65, N'sfarres1q', N'cparsley1q@dion.ne.jp', N'DT5ef9nQJ', 2, 0, CAST(N'2022-10-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (66, N'pgwinnett1r', N'whuleatt1r@typepad.com', N'Q4js4uL68g', 2, 0, CAST(N'2022-09-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (67, N'ndaldry1s', N'rsarjant1s@biblegateway.com', N'1CgD0TpJ', 2, 0, CAST(N'2022-06-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (68, N'aeliez1t', N'arayhill1t@narod.ru', N'DNyKENL5apr0', 2, 0, CAST(N'2023-02-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (69, N'rhrihorovich1u', N'sadam1u@google.pl', N'H3XHXyp', 2, 0, CAST(N'2022-11-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (70, N'abernetti1v', N'schristian1v@mozilla.com', N'ffmbsim', 2, 0, CAST(N'2023-01-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (71, N'bzamora1w', N'ckewley1w@parallels.com', N'EOJrhR', 2, 0, CAST(N'2023-05-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (72, N'nambroix1x', N'klisciandri1x@illinois.edu', N'radNoYrF', 2, 0, CAST(N'2022-12-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (73, N'vsimonitto1y', N'abrill1y@exblog.jp', N'XV4mYE3', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (74, N'sbernardinelli1z', N'ghugh1z@ted.com', N'B7MEb70f', 2, 0, CAST(N'2022-12-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (75, N'bbathowe20', N'clennie20@webs.com', N'2qPneXk7dQl', 2, 0, CAST(N'2022-07-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (76, N'roakeshott21', N'tskipper21@slate.com', N'ZFmrcn63h8yx', 2, 0, CAST(N'2023-05-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (77, N'cnabarro22', N'vmizen22@reverbnation.com', N'ai94Gl', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (78, N'apauleit23', N'erenton23@narod.ru', N'CIiGtb', 2, 0, CAST(N'2023-02-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (79, N'msarchwell24', N'akeitley24@people.com.cn', N'HEawBNDOQ', 2, 0, CAST(N'2023-04-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (80, N'cjarrett25', N'kgorges25@jiathis.com', N'RwgJS8zDqP', 2, 0, CAST(N'2022-09-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (81, N'cbeament26', N'sredington26@tumblr.com', N'KCw0ijc3FkT', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (82, N'mzahor27', N'bbiagini27@flickr.com', N'jXHXSLAF3', 2, 0, CAST(N'2022-11-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (83, N'ecarreck28', N'pdjorvic28@elpais.com', N'fYOaMxn', 2, 0, CAST(N'2022-11-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (84, N'cvaen29', N'spilmer29@google.co.uk', N'ZQNtAeWym', 2, 0, CAST(N'2022-06-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (85, N'bdovidian2a', N'ehessel2a@nationalgeographic.com', N'DoTNOT', 2, 0, CAST(N'2022-07-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (86, N'wpuleque2b', N'iparlatt2b@berkeley.edu', N'vfYz4FZVb1cb', 2, 0, CAST(N'2023-06-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (87, N'sgrisdale2c', N'mragg2c@sfgate.com', N'ktjvvgDTrL', 2, 0, CAST(N'2023-03-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (88, N'nyelden2d', N'tstockow2d@amazonaws.com', N'X7ztO5bZGXUm', 2, 0, CAST(N'2022-09-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (89, N'ggabbot2e', N'bilbert2e@ucoz.com', N'KYiyHf', 2, 0, CAST(N'2023-05-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (90, N'pbresland2f', N'woade2f@loc.gov', N'WKGXWqBF', 2, 0, CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (91, N'eduffell2g', N'tmityukov2g@symantec.com', N'taKwWo', 2, 0, CAST(N'2022-10-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (92, N'edaunay2h', N'hbreitler2h@shinystat.com', N'9S9MsuyW', 2, 0, CAST(N'2022-12-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (93, N'vconnealy2i', N'jmerchant2i@comcast.net', N'e1ilbl', 2, 0, CAST(N'2023-05-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (94, N'smarjoram2j', N'ccoppo2j@economist.com', N'qBymxfe3', 2, 0, CAST(N'2023-05-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (95, N'jbarwell2k', N'aarlow2k@nba.com', N'IR9K9gFKdUcM', 2, 0, CAST(N'2023-01-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (96, N'cgritskov2l', N'mattawell2l@toplist.cz', N'F8lXN0kS5jf', 2, 0, CAST(N'2023-05-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (97, N'vbanane2m', N'hmichal2m@nydailynews.com', N'dmAacy', 2, 0, CAST(N'2022-11-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (98, N'dcoldbath2n', N'pvettore2n@homestead.com', N'DYXFUGeQeu', 2, 0, CAST(N'2022-11-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (99, N'ladamovicz2o', N'lgergler2o@about.com', N'QgXHtrXEdk', 2, 0, CAST(N'2023-04-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (100, N'ysimonsen2p', N'ktoffanelli2p@dot.gov', N'6PLy2wJpoL', 2, 0, CAST(N'2022-08-08' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (101, N'mspridgen2q', N'kgeikie2q@hud.gov', N'Kmd0cyyGvus', 2, 0, CAST(N'2022-08-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (102, N'shumbell2r', N'prappa2r@theatlantic.com', N'xZRg3IHh', 2, 0, CAST(N'2022-09-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (103, N'fstonestreet2s', N'jbernucci2s@hud.gov', N'fTKX2Swj9', 2, 0, CAST(N'2023-04-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (104, N'jpistol2t', N'dollin2t@4shared.com', N'TnRzfrnxp', 2, 0, CAST(N'2022-11-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (105, N'dmilmith2u', N'dbaudesson2u@biglobe.ne.jp', N'bckZqMHLL8j8', 2, 0, CAST(N'2022-07-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (106, N'ealfonsetti2v', N'kivachyov2v@nytimes.com', N'eo7Z7F', 2, 0, CAST(N'2023-03-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (107, N'echatenier2w', N'sdureden2w@toplist.cz', N'R6ISycTFP', 2, 0, CAST(N'2022-10-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (108, N'wstinchcombe2x', N'mcraddock2x@google.com.au', N'An5bNcLmdxNQ', 2, 0, CAST(N'2022-06-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (109, N'rnano2y', N'cjelleman2y@indiegogo.com', N'4UTWGU7', 2, 0, CAST(N'2022-09-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (110, N'gbalmadier2z', N'cshimmans2z@technorati.com', N'QdSibnea', 2, 0, CAST(N'2023-05-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (111, N'liacobini30', N'jsquibbes30@ebay.co.uk', N'xab4E4NIr', 2, 0, CAST(N'2022-11-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (112, N'ftalbot31', N'emcfarlan31@amazonaws.com', N'oPOg2gGQKw', 2, 0, CAST(N'2022-08-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (113, N'tmacdearmid32', N'vboylund32@e-recht24.de', N'yOniFSvo7', 2, 0, CAST(N'2023-02-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (114, N'kcalway33', N'vhirschmann33@goo.gl', N'VE0TpHk9qZ9', 2, 0, CAST(N'2022-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (115, N'bpavese34', N'achoake34@opensource.org', N'bsuj5GLX', 2, 0, CAST(N'2022-09-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (116, N'ndee35', N'rlankford35@ft.com', N'RfwxLuRONC', 2, 0, CAST(N'2023-02-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (117, N'cmcmanus36', N'mwofenden36@discovery.com', N'qyw3HyWY', 2, 0, CAST(N'2022-09-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (118, N'roverel37', N'vwillett37@epa.gov', N'wHLqbx0', 2, 0, CAST(N'2022-10-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (119, N'gmcparlin38', N'dforsyth38@ebay.com', N'aIq4jpx', 2, 0, CAST(N'2023-04-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (120, N'dsimmonds39', N'dhadeke39@weebly.com', N'OlWYlzTkA', 2, 0, CAST(N'2022-11-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (121, N'jmatokhnin3a', N'amckellar3a@ihg.com', N'MsDjq3lc', 2, 0, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (122, N'sbirtchnell3b', N'ehaibel3b@about.me', N'p3wiv2DIxMs', 2, 0, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (123, N'spurkis3c', N'scallacher3c@fda.gov', N'DYT40Iw', 2, 0, CAST(N'2022-09-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (124, N'ckikke3d', N'jcapeling3d@netvibes.com', N'4YH5Gw', 2, 0, CAST(N'2022-10-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (125, N'stotaro3e', N'mlaidel3e@nba.com', N'WYZLfEGiX', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (126, N'mricket3f', N'aminall3f@abc.net.au', N'ZU51cXdCM', 2, 0, CAST(N'2022-08-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (127, N'aklass3g', N'fbutter3g@dion.ne.jp', N'RIsdVCHgZH7a', 2, 0, CAST(N'2023-02-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (128, N'tpittway3h', N'ejewise3h@histats.com', N'qzus1eQP7Z', 2, 0, CAST(N'2023-05-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (129, N'maleswell3i', N'pbordis3i@surveymonkey.com', N'zX6tUbc', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (130, N'asustins3j', N'mattrill3j@gnu.org', N'06PvyGK', 2, 0, CAST(N'2022-06-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (131, N'bswoffer3k', N'aaskey3k@princeton.edu', N'9cWzJfEQAe', 2, 0, CAST(N'2022-11-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (132, N'nmattosoff3l', N'nandrolli3l@about.me', N'isTfJy', 2, 0, CAST(N'2023-04-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (133, N'gghent3m', N'hmackiewicz3m@springer.com', N'QRliIOzuO2Z', 2, 0, CAST(N'2022-11-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (134, N'rdudenie3n', N'trikard3n@surveymonkey.com', N'Wsvapqd', 2, 0, CAST(N'2023-04-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (135, N'aros3o', N'bprise3o@mapquest.com', N'M9NoxYoR', 2, 0, CAST(N'2022-12-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (136, N'sdabner3p', N'shellwing3p@ebay.com', N'v3eJGtA73vzj', 2, 0, CAST(N'2023-02-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (137, N'fkesby3q', N'acodi3q@elegantthemes.com', N'dfYDd3bK', 2, 0, CAST(N'2023-06-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (138, N'djozsef3r', N'ftregido3r@jiathis.com', N'BvD2uy3', 2, 0, CAST(N'2023-02-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (139, N'htight3s', N'istuttard3s@tripadvisor.com', N'fmAsxe6kz', 2, 0, CAST(N'2023-04-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (140, N'rjoscelyn3t', N'kcampkin3t@tripod.com', N'kBDpGKdOJc', 2, 0, CAST(N'2023-03-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (141, N'blinklater3u', N'gdory3u@people.com.cn', N'q6c4hTD', 2, 0, CAST(N'2023-02-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (142, N'bspeer3v', N'lmariel3v@fc2.com', N'3uLlG6HL9S', 2, 0, CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (143, N'dbratty3w', N'ldodamead3w@boston.com', N'7zPDLJ1ZS8', 2, 0, CAST(N'2023-04-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (144, N'cgartenfeld3x', N'kmetts3x@toplist.cz', N'p6o29eFFsFO', 2, 0, CAST(N'2023-05-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (145, N'yjowle3y', N'ncobbin3y@sogou.com', N'YPYRRdOR', 2, 0, CAST(N'2022-11-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (146, N'ofrankowski3z', N'glangforth3z@nymag.com', N'JejQxG1arA1', 2, 0, CAST(N'2022-11-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (147, N'jainge40', N'emayell40@oracle.com', N'dF5hlrLxCAVx', 2, 0, CAST(N'2023-03-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (148, N'gulster41', N'deddowis41@nbcnews.com', N'FQ3MMydmTSY', 2, 0, CAST(N'2023-05-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (149, N'leagling42', N'llambotin42@seesaa.net', N'59vfDKr5Y', 2, 0, CAST(N'2022-10-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (150, N'rrentoll43', N'mjeayes43@typepad.com', N'mKjdYGFP', 2, 0, CAST(N'2022-07-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (151, N'rproud44', N'hwasielewski44@webnode.com', N'49yIB2Xnex', 2, 0, CAST(N'2023-04-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (152, N'fcammoile45', N'zbater45@narod.ru', N'pTRCYN', 2, 0, CAST(N'2023-02-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (153, N'roats46', N'mjeanet46@trellian.com', N'5BrqFNK', 2, 0, CAST(N'2023-02-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (154, N'hmerrien47', N'tcarass47@geocities.com', N'khFAskWh6Lwl', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (155, N'rcowely48', N'llowres48@phoca.cz', N'7nqA8M', 2, 0, CAST(N'2022-08-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (156, N'mgrowcock49', N'jfree49@123-reg.co.uk', N'SDz2Jsxs', 2, 0, CAST(N'2022-09-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (157, N'vbarens4a', N'glongwood4a@webnode.com', N'c0wp1hxZS9', 2, 0, CAST(N'2022-09-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (158, N'aboultwood4b', N'ekunc4b@microsoft.com', N'0DLL9zSH', 2, 0, CAST(N'2022-11-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (159, N'rbellinger4c', N'atremayne4c@boston.com', N'4JHkJg', 2, 0, CAST(N'2022-07-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (160, N'pthandi4d', N'roheneghan4d@ameblo.jp', N'WvTBUaqVnIMA', 2, 0, CAST(N'2023-05-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (161, N'hbrockton4e', N'cbuglass4e@360.cn', N'gG3pPst7Z5', 2, 0, CAST(N'2022-11-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (162, N'kmattussevich4f', N'hbayford4f@skyrock.com', N'XPkcKcDz92', 2, 0, CAST(N'2022-08-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (163, N'ksleep4g', N'dbalasin4g@last.fm', N'Ax0IhJiw7Ko', 2, 0, CAST(N'2023-01-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (164, N'jstokoe4h', N'ihowitt4h@indiatimes.com', N'gkREJXUY', 2, 0, CAST(N'2022-06-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (165, N'jguerin4i', N'hpostle4i@t.co', N'6TLLxzHZ', 2, 0, CAST(N'2023-01-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (166, N'ndakers4j', N'ljope4j@va.gov', N'UQyU2nSO', 2, 0, CAST(N'2023-05-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (167, N'mkorda4k', N'tgallagher4k@people.com.cn', N'e2MjJGtgPsv', 2, 0, CAST(N'2022-11-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (168, N'jblakemore4l', N'fbentley4l@cdbaby.com', N'ICXEHr27', 2, 0, CAST(N'2022-08-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (169, N'wvanderhoog4m', N'ohicks4m@blog.com', N'5i9nX5fWqT', 2, 0, CAST(N'2022-09-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (170, N'nvanleeuwen4n', N'lcurrin4n@icio.us', N'JF4TtwU', 2, 0, CAST(N'2023-05-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (171, N'wgiovannini4o', N'rfairchild4o@china.com.cn', N'rHdrwZE', 2, 0, CAST(N'2023-01-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (172, N'gspiers4p', N'tparnaby4p@altervista.org', N'LUe7Cg93P', 2, 0, CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (173, N'srocco4q', N'bwhitty4q@furl.net', N'U2xAi2', 2, 0, CAST(N'2023-02-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (174, N'yhorribine4r', N'rarthur4r@bloglovin.com', N'OhC8X4Dy', 2, 0, CAST(N'2022-10-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (175, N'skleimt4s', N'cmagwood4s@e-recht24.de', N'qPmCXp9t', 2, 0, CAST(N'2022-11-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (176, N'tbonifazio4t', N'rsharpus4t@mayoclinic.com', N'lcGSmblh89Y', 2, 0, CAST(N'2022-11-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (177, N'vdanton4u', N'amenichino4u@aboutads.info', N'RhA9aqfXtgN', 2, 0, CAST(N'2022-07-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (178, N'wfillgate4v', N'cfigiovanni4v@dedecms.com', N'VS0m6ZVhj', 2, 0, CAST(N'2022-06-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (179, N'tellar4w', N'mschroeder4w@china.com.cn', N'Zmyz188kkWx', 2, 0, CAST(N'2022-08-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (180, N'kskinner4x', N'rwearn4x@opensource.org', N'3mc4z4SVZ', 2, 0, CAST(N'2022-07-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (181, N'icollie4y', N'ppolleye4y@qq.com', N'bYbEtaGVN8ly', 2, 0, CAST(N'2022-11-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (182, N'oreightley4z', N'nheggman4z@blog.com', N'aVqA8Gju', 2, 0, CAST(N'2023-04-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (183, N'msiebert50', N'pcolleford50@gmpg.org', N'JNWlWk', 2, 0, CAST(N'2022-11-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (184, N'jterbrug51', N'rattock51@rambler.ru', N'ZNIXdJm', 2, 0, CAST(N'2023-02-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (185, N'amcconville52', N'aelder52@dyndns.org', N'ItFjX9X1m', 2, 0, CAST(N'2023-04-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (186, N'nspirritt53', N'fmehaffey53@unblog.fr', N'VSuJHjNLIqT1', 2, 0, CAST(N'2022-08-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (187, N'dspadari54', N'bstenbridge54@netlog.com', N'hs8h8rRv', 2, 0, CAST(N'2022-08-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (188, N'kfelmingham55', N'mlaffan55@amazon.co.jp', N'6iVxzUM', 2, 0, CAST(N'2023-04-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (189, N'tstovell56', N'cmeale56@cornell.edu', N'y60XRmkS', 2, 0, CAST(N'2022-09-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (190, N'ablockwell57', N'berb57@cbslocal.com', N'EI9zBGF', 2, 0, CAST(N'2022-06-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (191, N'gpetracco58', N'rraund58@bandcamp.com', N'O6tSyrN81', 2, 0, CAST(N'2022-07-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (192, N'jgavaghan59', N'akilfeather59@skype.com', N'ETBCpfEW', 2, 0, CAST(N'2023-04-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (193, N'hliddard5a', N'achatterton5a@unc.edu', N'MaFaeFeIC5Iz', 2, 0, CAST(N'2023-02-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (194, N'bmohring5b', N'vvongrollmann5b@google.it', N'EmAPCNg', 2, 0, CAST(N'2023-04-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (195, N'bdodshun5c', N'dloncaster5c@latimes.com', N'gUIIwchL2', 2, 0, CAST(N'2023-03-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (196, N'tkun5d', N'etuffley5d@psu.edu', N'bSxBWp', 2, 0, CAST(N'2023-01-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (197, N'hhallibone5e', N'jdumingo5e@g.co', N'nTcfJ8Unx2Bi', 2, 0, CAST(N'2023-02-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (198, N'hcarillo5f', N'ppinkerton5f@odnoklassniki.ru', N'yL2V24nnE', 2, 0, CAST(N'2022-10-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (199, N'larmatage5g', N'tsaltmarshe5g@mozilla.org', N'bTnoWIL', 2, 0, CAST(N'2022-11-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (200, N'cpadley5h', N'wanscott5h@goo.gl', N'bmqORrg4Ye', 2, 0, CAST(N'2022-12-01' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (201, N'comonahan5i', N'lhamber5i@princeton.edu', N'zaN2P4', 2, 0, CAST(N'2023-03-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (202, N'jlackham5j', N'mbyrth5j@tripod.com', N'vuEdOxmBJ', 2, 0, CAST(N'2022-11-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (203, N'hcornelisse5k', N'rkelwaybamber5k@xing.com', N'3hSXsj', 2, 0, CAST(N'2023-04-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (204, N'pfollit5l', N'lfrobisher5l@unc.edu', N'rkWFrjnDAZew', 2, 0, CAST(N'2022-06-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (205, N'cidenden5m', N'nstealy5m@cisco.com', N'bDzUosr', 2, 0, CAST(N'2022-07-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (206, N'ilegalle5n', N'groselli5n@rakuten.co.jp', N'9EHHuTL', 2, 0, CAST(N'2022-09-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (207, N'lliles5o', N'wreddoch5o@liveinternet.ru', N'AVOsvHA2Ww', 2, 0, CAST(N'2023-01-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (208, N'arudolf5p', N'stremethack5p@dyndns.org', N'leb7h5S', 2, 0, CAST(N'2022-11-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (209, N'lbaden5q', N'uivanin5q@latimes.com', N'HbpTWJXZ', 2, 0, CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (210, N'kcocozza5r', N'jslamaker5r@redcross.org', N'9c4j1RQ6lA', 2, 0, CAST(N'2023-01-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (211, N'mrenfield5s', N'bwoakes5s@macromedia.com', N'giEpuXj', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (212, N'ayardy5t', N'dmussen5t@xrea.com', N'HItU9TdMKY', 2, 0, CAST(N'2023-05-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (213, N'mkeppe5u', N'aknudsen5u@chicagotribune.com', N'OHprTPzJIn', 2, 0, CAST(N'2022-12-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (214, N'mvatcher5v', N'ayakolev5v@cdc.gov', N'xhi893oEa2T', 2, 0, CAST(N'2023-04-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (215, N'gprobyn5w', N'arundall5w@cargocollective.com', N'5NZnVmz', 2, 0, CAST(N'2023-02-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (216, N'bwoolford5x', N'utappington5x@friendfeed.com', N'Zb0kzCUX', 2, 0, CAST(N'2022-12-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (217, N'djennaway5y', N'sgierke5y@ed.gov', N'Aj9Svk', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (218, N'wcrossgrove5z', N'ggamett5z@nih.gov', N'Zh69wuKYi', 2, 0, CAST(N'2023-03-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (219, N'kdestouche60', N'gmathews60@cnet.com', N'D8LxUF3tE', 2, 0, CAST(N'2022-07-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (220, N'bernshaw61', N'mgreatreax61@smh.com.au', N'4xLAqXA', 2, 0, CAST(N'2022-12-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (221, N'sannell62', N'cwhiteley62@cbc.ca', N'ybZUaz8a', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (222, N'salexsandrev63', N'tcanter63@sohu.com', N'Ct396I22L', 2, 0, CAST(N'2022-11-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (223, N'mwainman64', N'brabidge64@unesco.org', N'o9UjLuSSW3', 2, 0, CAST(N'2023-04-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (224, N'awadman65', N'gharlow65@behance.net', N'mVxWPcq', 2, 0, CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (225, N'lacom66', N'fdesimone66@sina.com.cn', N'pkVk5c', 2, 0, CAST(N'2023-03-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (226, N'dchomicz67', N'estarton67@mapquest.com', N'qhdwlYd', 2, 0, CAST(N'2022-09-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (227, N'msedgeman68', N'dsachno68@merriam-webster.com', N'WwfhvqEnD', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (228, N'aevery69', N'rshoutt69@yale.edu', N'qYLk6Qhgo', 2, 0, CAST(N'2023-05-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (229, N'crosenberger6a', N'kfinden6a@nydailynews.com', N'C5rvMu', 2, 0, CAST(N'2023-05-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (230, N'cmillar6b', N'mjerdan6b@topsy.com', N'53K0L3jH6B', 2, 0, CAST(N'2023-06-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (231, N'asurphliss6c', N'wstealfox6c@alibaba.com', N'HlKRdyg6kspT', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (232, N'mlonding6d', N'tbliss6d@acquirethisname.com', N'zgZC87bTetx', 2, 0, CAST(N'2023-05-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (233, N'fkettlestring6e', N'hreavey6e@wikia.com', N'3SutShh20j', 2, 0, CAST(N'2022-10-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (234, N'lwingeatt6f', N'bpautard6f@pcworld.com', N'H2bXMyUCI', 2, 0, CAST(N'2022-10-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (235, N'hbagnold6g', N'nosment6g@dmoz.org', N'5Jn4UH', 2, 0, CAST(N'2022-10-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (236, N'shodgins6h', N'bfincke6h@e-recht24.de', N'3DxdBFIg', 2, 0, CAST(N'2023-03-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (237, N'ghacker6i', N'jtague6i@angelfire.com', N'F4lXgt3WAihd', 2, 0, CAST(N'2023-02-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (238, N'mmullis6j', N'kstood6j@state.tx.us', N'ou3PNfi', 2, 0, CAST(N'2023-04-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (239, N'sdalby6k', N'echastagnier6k@alexa.com', N'Jdrgn9NUoua', 2, 0, CAST(N'2022-12-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (240, N'dmcallen6l', N'scliburn6l@vimeo.com', N'kCe08ey4HfI', 2, 0, CAST(N'2022-12-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (241, N'hkilbourne6m', N'ddarridon6m@over-blog.com', N'UlT00x', 2, 0, CAST(N'2023-04-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (242, N'tdenisyuk6n', N'dmartindale6n@blinklist.com', N'gjecdhI', 2, 0, CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (243, N'mrentenbeck6o', N'poller6o@ihg.com', N'cdpD71s7cLm', 2, 0, CAST(N'2023-02-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (244, N'mroddie6p', N'fpeschka6p@spiegel.de', N'VRz62hmXY', 2, 0, CAST(N'2023-02-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (245, N'tstranger6q', N'vdelisle6q@seattletimes.com', N'JEzE08M3', 2, 0, CAST(N'2023-03-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (246, N'afrapwell6r', N'csecker6r@barnesandnoble.com', N'jJ8eF3Ja', 2, 0, CAST(N'2022-07-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (247, N'glarderot6s', N'deannetta6s@ed.gov', N'5cPzEsC', 2, 0, CAST(N'2022-09-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (248, N'dredmell6t', N'llucken6t@drupal.org', N'gcAMWqb7G', 2, 0, CAST(N'2022-08-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (249, N'alamborne6u', N'kscholz6u@myspace.com', N'tZXitY', 2, 0, CAST(N'2023-05-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (250, N'crubanenko6v', N'mcotman6v@cam.ac.uk', N'AjFCIcpk', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (251, N'glindeboom6w', N'psawer6w@psu.edu', N'wrWXlpMaTW', 2, 0, CAST(N'2022-10-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (252, N'tstovine6x', N'scavaney6x@toplist.cz', N'FNhnH0XnV', 2, 0, CAST(N'2023-04-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (253, N'wbelden6y', N'mlanchbery6y@oakley.com', N'GG18xPaCYVD', 2, 0, CAST(N'2023-03-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (254, N'llambrook6z', N'qmchale6z@amazonaws.com', N'IP754Ftu', 2, 0, CAST(N'2023-01-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (255, N'ceiler70', N'qolcot70@4shared.com', N'H2sR5jSTDgxx', 2, 0, CAST(N'2022-06-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (256, N'gdelaperrelle71', N'tbattelle71@nydailynews.com', N'albiPCCeUqY', 2, 0, CAST(N'2023-05-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (257, N'bclucas72', N'roscallan72@ft.com', N'9mNItS', 2, 0, CAST(N'2022-12-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (258, N'hbuckthorp73', N'kokell73@ifeng.com', N'DXWTH7Gx', 2, 0, CAST(N'2022-10-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (259, N'nhudspeth74', N'bforce74@constantcontact.com', N'tNFKTJk', 2, 0, CAST(N'2022-10-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (260, N'tmowday75', N'abacken75@domainmarket.com', N'1s4oP66KiMxC', 2, 0, CAST(N'2023-05-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (261, N'glovemore76', N'bseppey76@ehow.com', N'yfXWT028KF', 2, 0, CAST(N'2022-08-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (262, N'bbricket77', N'sklagges77@lycos.com', N'3eFW8WS', 2, 0, CAST(N'2022-07-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (263, N'lreadwing78', N'brean78@seattletimes.com', N'XvbZiAsFaIP', 2, 0, CAST(N'2022-07-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (264, N'stomkin79', N'kiacopetti79@moonfruit.com', N'wWBA6V4p', 2, 0, CAST(N'2022-07-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (265, N'sgrove7a', N'bcrace7a@amazon.com', N'h2E2gKiM8', 2, 0, CAST(N'2022-10-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (266, N'pespin7b', N'dsawkins7b@eventbrite.com', N'PgfnuHZ', 2, 0, CAST(N'2023-01-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (267, N'jjacobsen7c', N'kludvigsen7c@theglobeandmail.com', N'mN48zfYPzP', 2, 0, CAST(N'2022-12-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (268, N'tuccello7d', N'alarking7d@php.net', N'EHfNdyYOL', 2, 0, CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (269, N'laliberti7e', N'jwanstall7e@csmonitor.com', N'1hriTs3pnG', 2, 0, CAST(N'2023-05-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (270, N'mgulland7f', N'dhayfield7f@tripadvisor.com', N'PMY1HagV', 2, 0, CAST(N'2023-01-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (271, N'drichen7g', N'kpattillo7g@home.pl', N'6jp6y0gtN', 2, 0, CAST(N'2023-01-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (272, N'aweafer7h', N'iborborough7h@sohu.com', N'HdDqw2w6rqw', 2, 0, CAST(N'2022-06-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (273, N'ekinner7i', N'iblasi7i@privacy.gov.au', N'KDoxEGc1', 2, 0, CAST(N'2022-11-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (274, N'hstatefield7j', N'wpaulsen7j@dagondesign.com', N'50ZxHma9', 2, 0, CAST(N'2023-04-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (275, N'lgullivan7k', N'dgaytor7k@usgs.gov', N'jApCdsjM6', 2, 0, CAST(N'2022-08-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (276, N'ofinlater7l', N'jsex7l@nhs.uk', N'GWNXnKoXp', 2, 0, CAST(N'2022-10-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (277, N'ypavluk7m', N'tpigeram7m@sfgate.com', N'um1mg072zdk', 2, 0, CAST(N'2023-05-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (278, N'amayward7n', N'dkinge7n@un.org', N'UjuuuTnE78', 2, 0, CAST(N'2023-02-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (279, N'away7o', N'kdikles7o@blogspot.com', N'PWN6ET', 2, 0, CAST(N'2022-10-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (280, N'tvasyutichev7p', N'dlaurens7p@webmd.com', N'SBHV1ZqUWoQ', 2, 0, CAST(N'2022-06-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (281, N'natter7q', N'nbebbell7q@tamu.edu', N'9ZycMXlZ', 2, 0, CAST(N'2022-10-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (282, N'wgeggie7r', N'lfilippi7r@telegraph.co.uk', N'iCmxKqVWcH', 2, 0, CAST(N'2023-01-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (283, N'ocanham7s', N'spotes7s@npr.org', N'p1rLa4sY8', 2, 0, CAST(N'2022-09-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (284, N'lbriamo7t', N'lchampkin7t@salon.com', N'9IAbGet7Wr', 2, 0, CAST(N'2022-12-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (285, N'ttebb7u', N'cgrogona7u@ycombinator.com', N'vNF3XZGuUBJ', 2, 0, CAST(N'2023-02-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (286, N'ldibbs7v', N'fringe7v@yellowpages.com', N'eykZKeZ7iuzL', 2, 0, CAST(N'2022-06-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (287, N'kclarke7w', N'knewson7w@intel.com', N'YkWfx7A4Aw3T', 2, 0, CAST(N'2023-04-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (288, N'vboulde7x', N'amearns7x@imdb.com', N'MfiRzBqiuPYS', 2, 0, CAST(N'2023-02-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (289, N'kingliss7y', N'tlandeg7y@yahoo.com', N'qMfWeMBzE', 2, 0, CAST(N'2023-01-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (290, N'mjakubovsky7z', N'dingyon7z@behance.net', N'cb52po', 2, 0, CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (291, N'rventam80', N'scouronne80@house.gov', N'DOrQBhcb', 2, 0, CAST(N'2022-11-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (292, N'cchart81', N'lworms81@sciencedirect.com', N'Inx3Uqljp', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (293, N'dmechan82', N'jdisdel82@bloglovin.com', N'7bEoA7zPU', 2, 0, CAST(N'2023-04-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (294, N'tguarnier83', N'mnulty83@naver.com', N'bn0eIIpwDx', 2, 0, CAST(N'2022-06-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (295, N'tbrennans84', N'agigg84@dell.com', N'VbuhEupn', 2, 0, CAST(N'2023-03-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (296, N'tfilintsev85', N'bedling85@gov.uk', N'W9B5PRvS', 2, 0, CAST(N'2023-03-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (297, N'msnoden86', N'pshorten86@51.la', N'0cCdqY', 2, 0, CAST(N'2022-09-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (298, N'dcandwell87', N'bgodin87@mediafire.com', N'i7Yqmq3DjCq', 2, 0, CAST(N'2023-06-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (299, N'scords88', N'abenes88@networksolutions.com', N'f9cgtp', 2, 0, CAST(N'2023-01-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (300, N'jjaynes89', N'ylethem89@home.pl', N'ygaHD5', 2, 0, CAST(N'2022-12-06' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (301, N'vanthon8a', N'mpepler8a@ebay.co.uk', N'mC2pUSz4E', 2, 0, CAST(N'2022-09-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (302, N'cwoan8b', N'divory8b@surveymonkey.com', N'gv710wyute', 2, 0, CAST(N'2023-03-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (303, N'mbollini8c', N'adukes8c@wikia.com', N'To0JKtI', 2, 0, CAST(N'2022-10-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (304, N'speniello8d', N'bluparto8d@vkontakte.ru', N'XnAVN9RTzGMM', 2, 0, CAST(N'2023-03-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (305, N'ischurcke8e', N'esouthorn8e@twitter.com', N'YQ8gmf', 2, 0, CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (306, N'swoehler8f', N'gessex8f@purevolume.com', N'osh8esoy', 2, 0, CAST(N'2022-07-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (307, N'mcurwood8g', N'aloverock8g@360.cn', N'KXN5Mnp4lY', 2, 0, CAST(N'2023-01-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (308, N'tbeinisch8h', N'ccampagne8h@deviantart.com', N'9kM6rKChyS2k', 2, 0, CAST(N'2022-07-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (309, N'dkenewell8i', N'gstroulger8i@4shared.com', N'eGyvcLX29L', 2, 0, CAST(N'2023-03-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (310, N'cjamson8j', N'hsurmeyers8j@privacy.gov.au', N'HxyuiRmE0', 2, 0, CAST(N'2022-06-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (311, N'msawforde8k', N'ldarridon8k@facebook.com', N'2X6781', 2, 0, CAST(N'2022-11-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (312, N'hmaides8l', N'rcasado8l@linkedin.com', N'yeIK9p18', 2, 0, CAST(N'2023-03-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (313, N'mhonniebal8m', N'iwagge8m@wiley.com', N'ZaW9c0Z5LHa', 2, 0, CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (314, N'tvarley8n', N'rmenlow8n@stumbleupon.com', N'N4SzhgB', 2, 0, CAST(N'2023-01-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (315, N'lmartill8o', N'spaylor8o@newyorker.com', N'oWaNey', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (316, N'hburbank8p', N'nkarpf8p@washingtonpost.com', N'speWhf', 2, 0, CAST(N'2023-02-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (317, N'ameagher8q', N'bsimonitto8q@marriott.com', N'5PIwvIqiRaS', 2, 0, CAST(N'2023-03-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (318, N'aturpey8r', N'rhabble8r@jalbum.net', N'Fg7mNFNVC', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (319, N'chayley8s', N'dpusill8s@irs.gov', N'SE2IsZe2', 2, 0, CAST(N'2022-11-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (320, N'ebaumler8t', N'dhartzog8t@java.com', N'lAWbRO6oj', 2, 0, CAST(N'2023-04-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (321, N'bfazzioli8u', N'mhealks8u@seattletimes.com', N'LH7WrfSW', 2, 0, CAST(N'2023-01-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (322, N'ngentile8v', N'jforgan8v@prnewswire.com', N'DPQ6TlIT', 2, 0, CAST(N'2023-05-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (323, N'elegood8w', N'iplayhill8w@dion.ne.jp', N'rolTqokmFoa', 2, 0, CAST(N'2023-02-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (324, N'bberr8x', N'amcmillan8x@stanford.edu', N'W0hO3W', 2, 0, CAST(N'2023-02-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (325, N'tposten8y', N'evampouille8y@livejournal.com', N'g99eZ8qiD', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (326, N'pswalowe8z', N'rkisting8z@stanford.edu', N'rcFTHbd67j', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (327, N'kduly90', N'cpercifer90@netlog.com', N'uyAP7QY3fnC', 2, 0, CAST(N'2023-05-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (328, N'hkeep91', N'srowlstone91@nhs.uk', N'XICHKul', 2, 0, CAST(N'2023-04-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (329, N'aaxel92', N'ncossam92@gizmodo.com', N'mKTrFFkCWw', 2, 0, CAST(N'2022-10-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (330, N'twickersham93', N'ccramphorn93@smugmug.com', N'T3N9cjOeTT', 2, 0, CAST(N'2022-06-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (331, N'alongworth94', N'lgravenor94@statcounter.com', N'rvi8IIHNJH6X', 2, 0, CAST(N'2022-10-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (332, N'lchedgey95', N'plavelle95@wordpress.com', N'MJ5Qms', 2, 0, CAST(N'2023-04-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (333, N'vscholler96', N'ksimeoli96@redcross.org', N'4YHrRz', 2, 0, CAST(N'2022-08-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (334, N'bpladen97', N'ckesten97@adobe.com', N'mCfneNh', 2, 0, CAST(N'2022-09-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (335, N'etasch98', N'srowler98@jalbum.net', N'jQlvn7mjdQ', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (336, N'agyves99', N'gcandlish99@qq.com', N'u9Fv2udPiTHi', 2, 0, CAST(N'2023-04-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (337, N'clochead9a', N'gmorcomb9a@wikimedia.org', N'ptrqQLVtE', 2, 0, CAST(N'2023-05-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (338, N'clocal9b', N'ebradnick9b@yellowbook.com', N'N4rBP9', 2, 0, CAST(N'2023-05-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (339, N'fdegliabbati9c', N'wmitchener9c@facebook.com', N'k38fpa', 2, 0, CAST(N'2023-02-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (340, N'csteanyng9d', N'rblasl9d@usa.gov', N'maAxKNTlT', 2, 0, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (341, N'sdurrance9e', N'awinsom9e@sciencedirect.com', N'dGISLeQCyx9', 2, 0, CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (342, N'imarkwick9f', N'dmccolm9f@reverbnation.com', N'vOlJstVjfW', 2, 0, CAST(N'2022-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (343, N'aruvel9g', N'eswabey9g@printfriendly.com', N'eEtYhBrgAb3n', 2, 0, CAST(N'2022-07-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (344, N'mnassey9h', N'jcubbit9h@multiply.com', N'DWxXq0Two', 2, 0, CAST(N'2023-05-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (345, N'lpember9i', N'iclatworthy9i@imgur.com', N'Hb2USiDsr14N', 2, 0, CAST(N'2023-05-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (346, N'cescoffier9j', N'smackriell9j@google.es', N'UBO6fBQw3jl', 2, 0, CAST(N'2023-01-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (347, N'tscarlett9k', N'sszymanski9k@constantcontact.com', N'vO90b5a5', 2, 0, CAST(N'2023-02-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (348, N'kcafe9l', N'ahamerton9l@reuters.com', N'MHpFv4et', 2, 0, CAST(N'2022-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (349, N'cpankhurst9m', N'pgolton9m@globo.com', N'bkw6Y2ei', 2, 0, CAST(N'2022-12-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (350, N'psimms9n', N'imylechreest9n@time.com', N'g4wVpP', 2, 0, CAST(N'2022-09-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (351, N'cmineghelli9o', N'rmoreno9o@intel.com', N'u3oO5iBvfFC', 2, 0, CAST(N'2022-09-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (352, N'ldanby9p', N'ewalbrook9p@businesswire.com', N'uLYBbDEoB', 2, 0, CAST(N'2022-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (353, N'msimonin9q', N'sleasor9q@canalblog.com', N'Ub3lIHXc', 2, 0, CAST(N'2023-05-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (354, N'mtellenbrok9r', N'ewittke9r@miibeian.gov.cn', N'OrCx3A', 2, 0, CAST(N'2022-08-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (355, N'berie9s', N'vbrehault9s@wikia.com', N'XeEd3ROaaSIt', 2, 0, CAST(N'2022-09-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (356, N'nsiehard9t', N'pduxbarry9t@angelfire.com', N'6AtIxoWQiZ', 2, 0, CAST(N'2022-06-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (357, N'hsmewing9u', N'jschule9u@wunderground.com', N'xgBiaA', 2, 0, CAST(N'2022-11-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (358, N'adunsford9v', N'nbeden9v@stumbleupon.com', N'b1JjP0m', 2, 0, CAST(N'2023-06-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (359, N'mjoska9w', N'hcleveland9w@devhub.com', N'SzXH16sRwR', 2, 0, CAST(N'2022-06-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (360, N'swastling9x', N'klochead9x@aol.com', N'8Wczowe3WWq', 2, 0, CAST(N'2022-08-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (361, N'aaldhouse9y', N'hmoulsdale9y@symantec.com', N'FknIPES', 2, 0, CAST(N'2023-02-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (362, N'jfison9z', N'dkibby9z@spiegel.de', N'WpxFcETlR6', 2, 0, CAST(N'2022-11-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (363, N'ndifrancecshia0', N'klunta0@skype.com', N'Yywq6pASW', 2, 0, CAST(N'2022-10-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (364, N'lkroina1', N'mleatherbarrowa1@unc.edu', N'DtnZjTyzF', 2, 0, CAST(N'2022-08-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (365, N'wbonda2', N'kpollera2@symantec.com', N'xt9wbeejE9O', 2, 0, CAST(N'2022-07-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (366, N'ctrucea3', N'fhuncotea3@vinaora.com', N'V0p6F3', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (367, N'memmetta4', N'sferribya4@pinterest.com', N'zghVY8J', 2, 0, CAST(N'2022-11-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (368, N'norsia5', N'klaurenta5@dailymotion.com', N'c6ho2fSQTIFe', 2, 0, CAST(N'2023-04-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (369, N'umaccullocha6', N'jespa6@hexun.com', N'LDPpIhJf43', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (370, N'mmancera7', N'rattenborrowa7@aol.com', N'9wC6xQk', 2, 0, CAST(N'2022-09-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (371, N'malfonsettoa8', N'tcopera8@zimbio.com', N'9S5S5sQG', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (372, N'plubecka9', N'aspuriera9@amazonaws.com', N'PK4A5I', 2, 0, CAST(N'2023-01-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (373, N'rtrattlesaa', N'htesauroaa@mozilla.org', N'iLq6AdVj', 2, 0, CAST(N'2022-09-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (374, N'mferroab', N'dtwinbrowab@imdb.com', N'pzH9xTF7', 2, 0, CAST(N'2022-07-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (375, N'ostockinac', N'cliftonac@blogspot.com', N'9vouE640fqai', 2, 0, CAST(N'2023-01-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (376, N'ypimerickad', N'hwoollinad@wikia.com', N'rxQQqeZGqc2p', 2, 0, CAST(N'2023-05-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (377, N'agowenae', N'kcullenae@scribd.com', N'7L4OEx6e', 2, 0, CAST(N'2023-03-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (378, N'fchadbourneaf', N'chelwigaf@time.com', N'o8docsUZ', 2, 0, CAST(N'2022-06-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (379, N'wgoldeag', N'odutteridgeag@uol.com.br', N'KAKn85Ku264', 2, 0, CAST(N'2023-05-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (380, N'amardallah', N'bmalshingerah@imageshack.us', N'F2U1gOIb', 2, 0, CAST(N'2023-05-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (381, N'dsahnowai', N'mrobezai@constantcontact.com', N'VOOXinZsiieY', 2, 0, CAST(N'2023-04-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (382, N'vfranceschinoaj', N'ekenvinaj@indiegogo.com', N'4XqFQIKpns', 2, 0, CAST(N'2023-05-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (383, N'sfilipovak', N'smoroneyak@typepad.com', N'HDntbd', 2, 0, CAST(N'2022-09-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (384, N'lbullockal', N'gshervilal@typepad.com', N'Aqvt7467', 2, 0, CAST(N'2022-12-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (385, N'vyakuninam', N'rsartinam@hao123.com', N'vycocBZ', 2, 0, CAST(N'2023-02-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (386, N'bvarneyan', N'bdionsettoan@google.co.jp', N'k5EGtV7', 2, 0, CAST(N'2022-11-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (387, N'lduffieao', N'stotterdillao@about.com', N'OqwVescm', 2, 0, CAST(N'2022-11-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (388, N'fmattusovap', N'mmishowap@ucsd.edu', N'IXjDxMHu', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (389, N'gsummerillaq', N'dhartfordaq@nydailynews.com', N'TdKlwD', 2, 0, CAST(N'2022-08-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (390, N'tbartolomeuar', N'vosmentar@stumbleupon.com', N'Av4cxxvHNqyX', 2, 0, CAST(N'2022-08-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (391, N'ckealeyas', N'fpoundfordas@chicagotribune.com', N'Aq9nQUDVQ', 2, 0, CAST(N'2023-03-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (392, N'umillamat', N'avakhlovat@state.gov', N'JYlEsxop2S8k', 2, 0, CAST(N'2022-09-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (393, N'mcrankeau', N'whurlau@princeton.edu', N'VApRIS', 2, 0, CAST(N'2023-03-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (394, N'cscoterboshav', N'wdorrityav@shutterfly.com', N'ohT4VK', 2, 0, CAST(N'2022-08-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (395, N'sbarnwellaw', N'jfulliloveaw@drupal.org', N'T0vOFbsH8', 2, 0, CAST(N'2022-10-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (396, N'tdyosax', N'toutlawax@prlog.org', N'uta152VOcsa', 2, 0, CAST(N'2022-07-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (397, N'mhaglanday', N'abettaneyay@ibm.com', N'JHFBYITRhm', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (398, N'arampageaz', N'bierlandaz@yandex.ru', N'2ZQCS01Pbb5', 2, 0, CAST(N'2022-12-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (399, N'dfussellb0', N'cbrunellib0@home.pl', N'FQiRgZHgF', 2, 0, CAST(N'2023-04-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (400, N'pandrinb1', N'cakeherstb1@guardian.co.uk', N'kgjqfzO', 2, 0, CAST(N'2023-01-08' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (401, N'rganforthb2', N'mpilgramb2@si.edu', N'3vq6ogGnV3', 2, 0, CAST(N'2023-02-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (402, N'llezemoreb3', N'zkornyakovb3@blinklist.com', N'19NgLX3D', 2, 0, CAST(N'2022-07-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (403, N'mderkesb4', N'freglarb4@networksolutions.com', N'wCxIkb', 2, 0, CAST(N'2022-10-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (404, N'rklynb5', N'relgeeb5@shinystat.com', N'zKm64TLbm1wH', 2, 0, CAST(N'2023-04-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (405, N'gkohnenb6', N'cpietrzykb6@ucla.edu', N'lGOYG1NC4MnM', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (406, N'rcopemanb7', N'emiddlemassb7@barnesandnoble.com', N'YIyTjWbY', 2, 0, CAST(N'2022-10-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (407, N'tgreaderb8', N'epenab8@blogspot.com', N'6inJqL', 2, 0, CAST(N'2022-10-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (408, N'tdearb9', N'cnurseyb9@slate.com', N'g7garkpWQgEa', 2, 0, CAST(N'2023-01-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (409, N'tinstockba', N'acastendaba@scientificamerican.com', N'ZZFevUqHmBvB', 2, 0, CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (410, N'gsowthcotebb', N'smoncktonbb@joomla.org', N'EqPVx8Tqgn', 2, 0, CAST(N'2022-11-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (411, N'dlavensbc', N'bskillingbc@vk.com', N'59NHL3tbsX0', 2, 0, CAST(N'2022-12-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (412, N'rkullbd', N'pfurmengerbd@chron.com', N'mIyIJOiINzc', 2, 0, CAST(N'2023-02-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (413, N'espreybe', N'rracherbe@yelp.com', N'avhKLXJeDLp9', 2, 0, CAST(N'2022-10-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (414, N'goscanlonbf', N'dhowlingsbf@ehow.com', N'IWHtDzFq', 2, 0, CAST(N'2022-12-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (415, N'jellerbg', N'fbormanbg@newsvine.com', N'CL4hXRJi8Alj', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (416, N'mtoftbh', N'msargentbh@issuu.com', N'pdOpSl72D', 2, 0, CAST(N'2023-03-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (417, N'fledingtonbi', N'ymaddicksbi@seattletimes.com', N'RQ5SMslPBFE2', 2, 0, CAST(N'2022-08-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (418, N'zbleimanbj', N'bdorracottbj@bluehost.com', N'eylzdHlr', 2, 0, CAST(N'2023-04-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (419, N'edoumerquebk', N'eweathersbk@shinystat.com', N'x7o8hld', 2, 0, CAST(N'2023-05-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (420, N'lairdriebl', N'kgibbonbl@seesaa.net', N'ezRCpOr', 2, 0, CAST(N'2022-09-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (421, N'sedgesonbm', N'tpadghambm@europa.eu', N'lXCLyEBNc', 2, 0, CAST(N'2023-05-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (422, N'jaiskovitchbn', N'hpatisebn@phoca.cz', N'lkfH85AXAdwr', 2, 0, CAST(N'2023-01-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (423, N'mrottenburybo', N'blungbo@google.fr', N'SwVN2gd5eA', 2, 0, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (424, N'ccasbournebp', N'rkinlockbp@cmu.edu', N'c2nnznagXiI', 2, 0, CAST(N'2022-10-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (425, N'tpresleybq', N'mrobloubq@hp.com', N'wf755kQs', 2, 0, CAST(N'2022-07-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (426, N'ibraffingtonbr', N'tcawsybr@blogger.com', N's71MDwY', 2, 0, CAST(N'2022-12-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (427, N'btweedybs', N'amelhuishbs@auda.org.au', N'0yeitezZkaJ', 2, 0, CAST(N'2022-09-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (428, N'kbolusbt', N'aschoolingbt@bluehost.com', N'6G9DfOq', 2, 0, CAST(N'2022-10-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (429, N'abalmebu', N'sbavridgebu@weibo.com', N'FyeC8DkkG', 2, 0, CAST(N'2022-06-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (430, N'jsamperbv', N'ddelvesbv@arizona.edu', N'MZgm7Flet5', 2, 0, CAST(N'2023-02-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (431, N'lbainsbw', N'hemsonbw@house.gov', N'JfYxVGp', 2, 0, CAST(N'2023-02-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (432, N'lscorthornebx', N'hacomebx@yandex.ru', N'WMcZnnW', 2, 0, CAST(N'2022-10-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (433, N'jbibbyby', N'kchekeby@spiegel.de', N'hEgpz7Y55e', 2, 0, CAST(N'2022-07-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (434, N'tpattinsonbz', N'sblamphinbz@tripadvisor.com', N'YElJ2j3Y', 2, 0, CAST(N'2023-03-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (435, N'ebischopc0', N'vcabenac0@newyorker.com', N'ZGjJPEQArH', 2, 0, CAST(N'2023-03-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (436, N'cdikelinc1', N'fromeufc1@networkadvertising.org', N'f7MhQdY', 2, 0, CAST(N'2022-09-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (437, N'apavlikc2', N'epeattiec2@skype.com', N'bPOUqukC2u0r', 2, 0, CAST(N'2023-01-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (438, N'npinwillc3', N'jgudec3@jalbum.net', N'65fxTYRQgCA', 2, 0, CAST(N'2022-10-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (439, N'oswiggerc4', N'gforkanc4@tamu.edu', N'dnQmPMZ33', 2, 0, CAST(N'2022-09-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (440, N'dtowerseyc5', N'gbettisonc5@icio.us', N'wDpc27r', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (441, N'lkidgellc6', N'tdabsc6@stanford.edu', N'YK8AmwA1', 2, 0, CAST(N'2023-05-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (442, N'jpavittc7', N'ssydenhamc7@51.la', N'boYJ02EalWhv', 2, 0, CAST(N'2022-10-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (443, N'wolsenc8', N'fstennerc8@sohu.com', N'nzzWMu3L', 2, 0, CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (444, N'lelleynec9', N'gboultc9@amazon.co.jp', N'gB6fPH15nvSU', 2, 0, CAST(N'2023-03-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (445, N'jvondrysca', N'hgoodbarneca@shutterfly.com', N'lpy0TZB', 2, 0, CAST(N'2022-12-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (446, N'lbrendecb', N'lfairfullcb@amazonaws.com', N'N1JSOoYba', 2, 0, CAST(N'2023-04-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (447, N'merteltcc', N'vvaudincc@g.co', N'uS1kee9', 2, 0, CAST(N'2022-07-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (448, N'dbladescd', N'moheagertiecd@acquirethisname.com', N'BjgnGAAsl7', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (449, N'hcahillce', N'kgranvillece@latimes.com', N'fH1X0IcXf', 2, 0, CAST(N'2022-08-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (450, N'rhuntresscf', N'lbradfordcf@aol.com', N'CBunlS', 2, 0, CAST(N'2023-04-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (451, N'chymascg', N'ltuckettcg@homestead.com', N'gPdpiDa5rWC', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (452, N'jdorkinsch', N'dfurbankch@geocities.jp', N'NegQkifY8b9', 2, 0, CAST(N'2022-10-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (453, N'elaurentinci', N'hgrandinci@lulu.com', N'5c6MqKp', 2, 0, CAST(N'2023-06-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (454, N'vgartoncj', N'bitzakcj@cnet.com', N'0MZLy2', 2, 0, CAST(N'2023-05-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (455, N'ecayserck', N'mklimontovichck@epa.gov', N'EYLv1b', 2, 0, CAST(N'2022-10-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (456, N'igoldringcl', N'gstittcl@mapy.cz', N'KKdMKBms', 2, 0, CAST(N'2022-11-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (457, N'eskeycm', N'fvokinscm@chron.com', N'ldRNsVnZFm', 2, 0, CAST(N'2022-07-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (458, N'eabramskicn', N'rlefwichcn@unc.edu', N'gqrcf5XcpOX', 2, 0, CAST(N'2023-03-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (459, N'lperrycostco', N'rbutlandco@npr.org', N'PDWZERW7z0FX', 2, 0, CAST(N'2023-02-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (460, N'vgoodencp', N'ttimberlakecp@1und1.de', N'sAZLvcPbb', 2, 0, CAST(N'2023-01-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (461, N'dbecariscq', N'jmessumcq@etsy.com', N'ZyqQZ0V13S5n', 2, 0, CAST(N'2022-11-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (462, N'vdeloscr', N'bfenixcr@fc2.com', N'TN2hCe', 2, 0, CAST(N'2022-12-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (463, N'eswadlencs', N'emacginleycs@mtv.com', N'Gxgogh', 2, 0, CAST(N'2023-01-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (464, N'gspallsct', N'bdallmanct@howstuffworks.com', N'0WRSMjJjqV', 2, 0, CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (465, N'prickeardcu', N'switulcu@spotify.com', N'bkpBqppl3', 2, 0, CAST(N'2022-10-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (466, N'mattfieldcv', N'lwinsborrowcv@wunderground.com', N'dGs31K', 2, 0, CAST(N'2023-03-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (467, N'jwatkisscw', N'bmuncastercw@squarespace.com', N'IHiLXNmjwJPT', 2, 0, CAST(N'2023-04-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (468, N'rharnwellcx', N'pbruckercx@weather.com', N'4Q9k0Mf', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (469, N'ssatchcy', N'bstrassecy@spotify.com', N'RLWscicTlOc', 2, 0, CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (470, N'kcarnamancz', N'ddeminicocz@baidu.com', N'44TGUelgK', 2, 0, CAST(N'2022-12-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (471, N'lshentond0', N'cdesmondd0@japanpost.jp', N'AXuEepGx0', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (472, N'nkennefickd1', N'joventond1@eventbrite.com', N'BL3QwI', 2, 0, CAST(N'2023-01-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (473, N'rchangd2', N'broelofsd2@ebay.co.uk', N'vZ2c144XFUEZ', 2, 0, CAST(N'2022-10-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (474, N'hdykesd3', N'cwhiskerd3@huffingtonpost.com', N'TNNjKt4Yzxn', 2, 0, CAST(N'2022-12-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (475, N'rlahertyd4', N'kbollind4@tripadvisor.com', N'X7x0HBbsbJ7S', 2, 0, CAST(N'2023-05-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (476, N'rdrinand5', N'dlongfootd5@networksolutions.com', N'5zF0csk', 2, 0, CAST(N'2023-05-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (477, N'dgisbyed6', N'zrobjantd6@huffingtonpost.com', N'zLWQthXc', 2, 0, CAST(N'2022-11-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (478, N'ldoogued7', N'cbunnd7@ycombinator.com', N'9aRZNUudV', 2, 0, CAST(N'2023-01-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (479, N'aupshalld8', N'kbuickd8@last.fm', N'H46LvXTZ', 2, 0, CAST(N'2023-01-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (480, N'phubbersteyd9', N'hcaldarod9@ucoz.ru', N'fV9jgm', 2, 0, CAST(N'2022-12-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (481, N'hmitkcovda', N'dmcginleyda@google.ca', N'4ZKV5Y', 2, 0, CAST(N'2022-12-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (482, N'ttimebydb', N'bbroadheaddb@trellian.com', N'4nBJb7', 2, 0, CAST(N'2022-10-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (483, N'ddomineydc', N'memneydc@weibo.com', N'ZN2Hu8ElPdjY', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (484, N'gdreierdd', N'kjeffcoatdd@cargocollective.com', N'rLUsjCyglE15', 2, 0, CAST(N'2023-02-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (485, N'bboyingtonde', N'jgiffautde@chron.com', N'rpwgkDLbS', 2, 0, CAST(N'2023-04-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (486, N'glancastledf', N'akellerdf@networkadvertising.org', N'WxxeM38J6i', 2, 0, CAST(N'2022-08-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (487, N'hexelbydg', N'aenticottdg@ebay.com', N'wzhOPdGe3AV', 2, 0, CAST(N'2023-03-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (488, N'dkibblewhitedh', N'mtorridh@friendfeed.com', N'qeFT5D', 2, 0, CAST(N'2022-07-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (489, N'mshimmandi', N'jtynnandi@moonfruit.com', N'sBFAIKgo3GvW', 2, 0, CAST(N'2023-04-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (490, N'mbourthoumieuxdj', N'brufflidj@sitemeter.com', N'k9O3lG1', 2, 0, CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (491, N'srosekillydk', N'wdanbyedk@yellowpages.com', N'nctmFoo6ILRe', 2, 0, CAST(N'2023-02-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (492, N'mferrarodl', N'sfeekdl@accuweather.com', N'sEysnu', 2, 0, CAST(N'2022-08-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (493, N'dmcphaildm', N'garsmithdm@lycos.com', N'RrEYuKu', 2, 0, CAST(N'2023-04-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (494, N'alawrencesondn', N'gleamingdn@mapquest.com', N'B0Rz8mEaHwp', 2, 0, CAST(N'2023-04-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (495, N'ecoltherddo', N'amccarrydo@vkontakte.ru', N'grCmoZ', 2, 0, CAST(N'2023-03-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (496, N'sexelldp', N'lshellsheeredp@amazon.co.uk', N'7d0pmiTwj2', 2, 0, CAST(N'2022-07-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (497, N'pfarredq', N'mguilletdq@wikia.com', N'HaUKubi84', 2, 0, CAST(N'2023-04-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (498, N'emacneilagedr', N'abaldamdr@fotki.com', N'eUBOCiVDh', 2, 0, CAST(N'2022-11-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (499, N'abrouwerds', N'tpenkeds@amazon.com', N'gpvRwFz', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (500, N'traglesdt', N'ktommeidt@unicef.org', N'iURrGNJEJt', 2, 0, CAST(N'2022-11-11' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (501, N'ppresserdu', N'areedickdu@narod.ru', N'fKC6s6lPwp', 2, 0, CAST(N'2023-01-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (502, N'bjaramdv', N'lrablandv@ft.com', N'YFHQLH', 2, 0, CAST(N'2023-04-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (503, N'hpietrasikdw', N'eponcetdw@jigsy.com', N'yEWFtqKDfO', 2, 0, CAST(N'2023-04-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (504, N'ccawtedx', N'csimpkindx@apache.org', N'wJq2SGhog1Kg', 2, 0, CAST(N'2022-06-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (505, N'fdreidy', N'sridulfody@slashdot.org', N'KvKxqRWO', 2, 0, CAST(N'2023-02-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (506, N'chumpherstondz', N'lragsdalldz@altervista.org', N'bvlrz3X6Nl', 2, 0, CAST(N'2022-07-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (507, N'mwisbye0', N'rcamamille0@weather.com', N'MLt5XabRnU7E', 2, 0, CAST(N'2023-01-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (508, N'etopleye1', N'fpayfoote1@dagondesign.com', N'pSxUzK', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (509, N'dszymczyke2', N'rvecarde2@ebay.com', N'yeuE5q', 2, 0, CAST(N'2022-06-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (510, N'saulettae3', N'omohamede3@mapquest.com', N'xPPp3HGL71', 2, 0, CAST(N'2023-03-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (511, N'jgookee4', N'rgeppe4@bbb.org', N'efoe6C', 2, 0, CAST(N'2022-12-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (512, N'cgiriardellie5', N'mamangere5@a8.net', N'RorQn8c8t4vX', 2, 0, CAST(N'2023-02-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (513, N'myeandele6', N'bleveridgee6@sphinn.com', N'g4z6BTsdukr', 2, 0, CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (514, N'omcwhane7', N'mlamsheade7@chicagotribune.com', N'Qj3Hfo', 2, 0, CAST(N'2023-03-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (515, N'gsynkee8', N'abevillee8@google.ru', N'ssA0XvDFepON', 2, 0, CAST(N'2023-05-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (516, N'jgobolose9', N'jmabeye9@merriam-webster.com', N'T9TpnI81IV', 2, 0, CAST(N'2022-09-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (517, N'ograssettea', N'pclemenziea@ifeng.com', N'QeAkI9Dq1dY', 2, 0, CAST(N'2022-10-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (518, N'cgrzegorzewiczeb', N'cphettiplaceeb@census.gov', N'n6aLU1x', 2, 0, CAST(N'2023-02-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (519, N'dmarioneauec', N'ggrabiecec@jugem.jp', N'bEuybSgL', 2, 0, CAST(N'2022-12-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (520, N'eolleyed', N'vgreensladeed@indiegogo.com', N'58a4exH', 2, 0, CAST(N'2023-05-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (521, N'cfowldsee', N'cpragnellee@123-reg.co.uk', N'a3G6zCARDJ', 2, 0, CAST(N'2022-06-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (522, N'lzoreref', N'dminchindonef@deviantart.com', N'bJjZONJK1f', 2, 0, CAST(N'2022-12-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (523, N'kuttleyeg', N'dstitfalleg@is.gd', N'Udgj91IbeKOG', 2, 0, CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (524, N'ebissexeh', N'astewarteh@discuz.net', N'7vFNgcxZu', 2, 0, CAST(N'2023-05-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (525, N'snuddsei', N'eveareei@blinklist.com', N'1f3RRtMb', 2, 0, CAST(N'2022-08-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (526, N'havrahamianej', N'gscreechej@icio.us', N'IRnf7cW4pb', 2, 0, CAST(N'2023-01-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (527, N'sdmytrykek', N'opohlek@hostgator.com', N'jbawrEOFaT', 2, 0, CAST(N'2022-12-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (528, N'hpietzkerel', N'krappael@wordpress.org', N'iBT4yXZ0', 2, 0, CAST(N'2022-06-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (529, N'droswarnem', N'kaddeyem@java.com', N'HHj3mAC6Z', 2, 0, CAST(N'2022-08-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (530, N'rnicolen', N'tlamdenen@sphinn.com', N'aeCBtYd', 2, 0, CAST(N'2023-04-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (531, N'scunnoweo', N'dlakeseo@alibaba.com', N'qg1sjWtBak', 2, 0, CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (532, N'cdurbannep', N'ggilpinep@nationalgeographic.com', N'rtmHVV6Z', 2, 0, CAST(N'2022-11-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (533, N'croganeq', N'swilseyeq@altervista.org', N'rJhzOjCs', 2, 0, CAST(N'2023-05-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (534, N'cwandracher', N'tdymokeer@ed.gov', N'BSHkYUAwO', 2, 0, CAST(N'2022-10-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (535, N'amitchelles', N'kshireres@tripadvisor.com', N'cSkFaSpKQ2M', 2, 0, CAST(N'2023-05-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (536, N'fshoobridgeet', N'lbaudtset@google.de', N'UYI0DOIMu', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (537, N'cdugalleu', N'cprobeyeu@sogou.com', N'I6JZCePm', 2, 0, CAST(N'2022-07-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (538, N'tshuxsmithev', N'bdomanekev@upenn.edu', N'ATGInA5I', 2, 0, CAST(N'2023-03-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (539, N'tdebenedictisew', N'bgrelikew@360.cn', N'NStP3UF4Dp', 2, 0, CAST(N'2023-02-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (540, N'stoopex', N'jdursleyex@wp.com', N'6WQYDKKFKkz', 2, 0, CAST(N'2023-02-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (541, N'jpineey', N'jwhiteey@wikimedia.org', N'FQ6qNp', 2, 0, CAST(N'2022-07-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (542, N'sbennellez', N'ejosuweitez@eventbrite.com', N'tGfkBuxXg', 2, 0, CAST(N'2022-08-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (543, N'aokennavainf0', N'ejoutapaitisf0@behance.net', N'Pm2BXd', 2, 0, CAST(N'2023-06-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (544, N'dtassellf1', N'blehrlef1@gmpg.org', N'5GQUFG', 2, 0, CAST(N'2023-03-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (545, N'erimesf2', N'kduerdinf2@cbslocal.com', N'iKPWRfKf5', 2, 0, CAST(N'2023-05-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (546, N'jrisebarerf3', N'gdillingerf3@prlog.org', N'ZXvVurwne', 2, 0, CAST(N'2023-05-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (547, N'jgradlyf4', N'vkellenf4@google.com.hk', N'63m40n', 2, 0, CAST(N'2023-02-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (548, N'bpoyntonf5', N'nrodenborchf5@toplist.cz', N'otb5s4XOyLQn', 2, 0, CAST(N'2023-05-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (549, N'dbartolijnf6', N'rmewittf6@tripadvisor.com', N'pN8QYLqztsA', 2, 0, CAST(N'2023-03-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (550, N'cduthief7', N'cjennionsf7@army.mil', N'EEBHYZNv0b', 2, 0, CAST(N'2022-09-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (551, N'hmccarrisonf8', N'kfrederickf8@bloomberg.com', N'gudKCefNQ', 2, 0, CAST(N'2023-03-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (552, N'dmundfordf9', N'mnapolitanof9@clickbank.net', N'DnJGH4TnDV', 2, 0, CAST(N'2023-04-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (553, N'jstruttonfa', N'bdowardfa@nydailynews.com', N'wEa61AAAGV5', 2, 0, CAST(N'2022-09-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (554, N'hshadwickfb', N'jhurchefb@foxnews.com', N'nVqqbM2f0', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (555, N'msupplefc', N'cshepstonefc@nba.com', N'3yNhoBHSvN', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (556, N'paxbyfd', N'jmackallfd@photobucket.com', N'5ON3qNgG', 2, 0, CAST(N'2023-03-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (557, N'rbrickseyfe', N'awessingfe@sun.com', N'5DZjuU8sz', 2, 0, CAST(N'2022-06-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (558, N'omacguireff', N'bmcquorkelff@engadget.com', N'IvG5IzNY', 2, 0, CAST(N'2022-07-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (559, N'msailefg', N'dglyssannefg@furl.net', N'6QAzIMM9m4', 2, 0, CAST(N'2022-06-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (560, N'wfeighryfh', N'llewisfh@chron.com', N'BdBrxM44yn4', 2, 0, CAST(N'2023-06-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (561, N'abentjensfi', N'stuffsfi@theglobeandmail.com', N'oDioajQPih', 2, 0, CAST(N'2022-11-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (562, N'dlawlingsfj', N'lalsobrookfj@angelfire.com', N'dP68Bf', 2, 0, CAST(N'2023-04-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (563, N'cpottagefk', N'aprocterfk@hc360.com', N'L28baekMsV', 2, 0, CAST(N'2022-11-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (564, N'gbuskfl', N'fhellwichfl@hp.com', N'LFxXePsi', 2, 0, CAST(N'2022-06-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (565, N'ebarbourfm', N'wwoolandfm@jalbum.net', N'UNcZwsMtbt', 2, 0, CAST(N'2022-08-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (566, N'dsammonsfn', N'jcarpefn@t.co', N'0oBzcC2ki', 2, 0, CAST(N'2022-07-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (567, N'rlordenfo', N'rregitzfo@chicagotribune.com', N'rQnCMkUH', 2, 0, CAST(N'2022-07-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (568, N'jtapleyfp', N'atunnickfp@networkadvertising.org', N'nQsdSUu7S9', 2, 0, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (569, N'lailsburyfq', N'oganterfq@accuweather.com', N'j8cC6wQ', 2, 0, CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (570, N'rguerrinfr', N'tbumpusfr@harvard.edu', N'6Fz8YMzdwf', 2, 0, CAST(N'2022-12-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (571, N'esabaterfs', N'ffeehamfs@home.pl', N'I1wlF9c', 2, 0, CAST(N'2022-11-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (572, N'rbricklebankft', N'achallissft@indiegogo.com', N'EU18lJqqyr', 2, 0, CAST(N'2022-11-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (573, N'ksoperfu', N'tfarrefu@google.cn', N'AMx3w3LUGenJ', 2, 0, CAST(N'2022-10-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (574, N'mgrinnellfv', N'acollicottfv@issuu.com', N'4kX2ZII', 2, 0, CAST(N'2023-01-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (575, N'ubellowfw', N'bjacklinfw@scribd.com', N'JwTVzNXoER', 2, 0, CAST(N'2022-07-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (576, N'shayleyfx', N'thaskaynefx@oakley.com', N'SCrGY5', 2, 0, CAST(N'2023-02-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (577, N'lgrassfy', N'rdunlopfy@guardian.co.uk', N'J5fsJu', 2, 0, CAST(N'2022-11-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (578, N'mdowglassfz', N'tdelacotefz@dailymotion.com', N'bJhSj7NM', 2, 0, CAST(N'2023-01-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (579, N'gwegenerg0', N'mclementsg0@businessinsider.com', N'DKlOtZJHZJe', 2, 0, CAST(N'2023-02-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (580, N'vocurrineg1', N'rchrestieng1@shareasale.com', N'0ounUUr', 2, 0, CAST(N'2023-03-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (581, N'oismailg2', N'jfraryg2@yolasite.com', N'vuW8DT', 2, 0, CAST(N'2023-01-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (582, N'tdodgsong3', N'aandrockg3@sphinn.com', N'ToHPvUnSnmqi', 2, 0, CAST(N'2022-12-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (583, N'awilflingerg4', N'lgalletlyg4@sun.com', N'zixQCjp', 2, 0, CAST(N'2022-10-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (584, N'oketteringhamg5', N'mfullerg5@spotify.com', N'6nbZZE7fb', 2, 0, CAST(N'2022-07-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (585, N'lbucknellg6', N'dmauchlineg6@shinystat.com', N'MF8eZxFE', 2, 0, CAST(N'2023-02-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (586, N'tcolegateg7', N'cshalcrosg7@mysql.com', N'QDQ60AIg5J', 2, 0, CAST(N'2022-10-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (587, N'mwallesg8', N'rcowlingg8@stumbleupon.com', N'fj5b8Up38Y', 2, 0, CAST(N'2022-07-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (588, N'bwhitticksg9', N'awebleyg9@sbwire.com', N'QIbmUvfIvgW', 2, 0, CAST(N'2023-01-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (589, N'ssibyllaga', N'wmcdonellga@wiley.com', N'DaAW1F', 2, 0, CAST(N'2022-06-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (590, N'rscandritegb', N'bhaithgb@posterous.com', N'f5NnkVB', 2, 0, CAST(N'2022-12-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (591, N'kmardallgc', N'awillockgc@mozilla.com', N'HGnuOJj94Bq', 2, 0, CAST(N'2023-03-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (592, N'kcadegd', N'gjocklegd@imdb.com', N'axMwBVe9s', 2, 0, CAST(N'2022-06-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (593, N'lgreaterexge', N'nkemmge@simplemachines.org', N'lakc1N6l', 2, 0, CAST(N'2023-02-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (594, N'blarticegf', N'jcollgf@guardian.co.uk', N'TNmCnwBtnuGD', 2, 0, CAST(N'2022-09-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (595, N'vkarelgg', N'nedwinsgg@un.org', N'pjomyYJ', 2, 0, CAST(N'2022-09-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (596, N'rguilayngh', N'cwheatergh@weebly.com', N'zZPhUKNz6', 2, 0, CAST(N'2023-04-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (597, N'jbendsongi', N'aelvinsgi@livejournal.com', N'y0iSosBMTC', 2, 0, CAST(N'2023-02-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (598, N'kbickerdikegj', N'ocarluccigj@census.gov', N'QFCHQxhdK9', 2, 0, CAST(N'2023-01-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (599, N'tbroskegk', N'sdavenportgk@mlb.com', N'dZ9E1Cs', 2, 0, CAST(N'2022-10-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (600, N'qnerhenygl', N'zknattgl@blinklist.com', N'ZY3xaCx2u9tS', 2, 0, CAST(N'2022-11-03' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (601, N'rhatchellgm', N'lhavisgm@reuters.com', N'Zu7POj3emnJb', 2, 0, CAST(N'2022-12-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (602, N'emeeusgn', N'vcreechgn@marriott.com', N'lWYAsYco1cm', 2, 0, CAST(N'2022-12-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (603, N'vkornasgo', N'nclampego@unc.edu', N'ShsmGiiht', 2, 0, CAST(N'2022-07-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (604, N'cmaltbygp', N'aabrashkingp@ezinearticles.com', N'CRaS5J9W5W', 2, 0, CAST(N'2022-07-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (605, N'vstuchberrygq', N'bflawsgq@histats.com', N'pl9CLG9Qf', 2, 0, CAST(N'2023-04-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (606, N'wmcgookingr', N'jbiggansgr@hugedomains.com', N'OEeJZl', 2, 0, CAST(N'2022-10-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (607, N'jnordassgs', N'alampetgs@rambler.ru', N'Sttk9N', 2, 0, CAST(N'2022-09-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (608, N'bodgergt', N'wdenisovichgt@microsoft.com', N'HbO49xnjBJ64', 2, 0, CAST(N'2023-01-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (609, N'llovewellgu', N'efouchgu@timesonline.co.uk', N'NFxMi8e5', 2, 0, CAST(N'2023-03-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (610, N'gremmersgv', N'pscarffgv@mediafire.com', N'x36b6Da', 2, 0, CAST(N'2023-05-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (611, N'omayfieldgw', N'cfullickgw@github.io', N'aq2fY1dv', 2, 0, CAST(N'2022-07-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (612, N'drosellinigx', N'smatisoffgx@shutterfly.com', N'peCPNcprP', 2, 0, CAST(N'2023-05-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (613, N'wmartinettogy', N'ndussygy@berkeley.edu', N'jzl1Ztw15Klo', 2, 0, CAST(N'2023-01-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (614, N'tsturgegz', N'roffillgz@soup.io', N'IrqLxo4cdbx', 2, 0, CAST(N'2022-10-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (615, N'rvandalenh0', N'pgumlyh0@dell.com', N'pd5xWx3sUw', 2, 0, CAST(N'2022-07-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (616, N'lbissekerh1', N'djessetth1@goodreads.com', N'6DVFi5AMgVt', 2, 0, CAST(N'2022-09-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (617, N'fdoomanh2', N'abonwellh2@fc2.com', N'WJFH27CPmXX', 2, 0, CAST(N'2023-05-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (618, N'jlentonh3', N'ekemberh3@dion.ne.jp', N'ugsPXOr', 2, 0, CAST(N'2022-09-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (619, N'ngriffitheh4', N'zbridgesh4@salon.com', N'6vmq7O50', 2, 0, CAST(N'2023-03-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (620, N'aalderwickh5', N'cbaumlerh5@amazon.de', N'drGykSZF0', 2, 0, CAST(N'2022-10-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (621, N'sohaganh6', N'fthoraldh6@jimdo.com', N'2pRVm6q', 2, 0, CAST(N'2023-05-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (622, N'jchittieh7', N'chartburnh7@instagram.com', N'r1IjIq', 2, 0, CAST(N'2022-11-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (623, N'rinotth8', N'clarcombeh8@mysql.com', N'rSzGP4ncmeX', 2, 0, CAST(N'2022-07-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (624, N'ekleinstubh9', N'wluddyh9@lycos.com', N'ovFc7666JA', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (625, N'nstrewtherha', N'kdyshartha@e-recht24.de', N'TrxtPTS6XoAf', 2, 0, CAST(N'2022-09-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (626, N'kcromleyhb', N'kbalmerhb@cdc.gov', N'zXNDjKkHWZ', 2, 0, CAST(N'2022-08-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (627, N'epitherickhc', N'rarisshc@patch.com', N'AGsGgGYFTM', 2, 0, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (628, N'adallicoathd', N'lborzonihd@friendfeed.com', N'rv2OnK729R5', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (629, N'zmuffenhe', N'pivanusyevhe@unc.edu', N'2oDq6F0I', 2, 0, CAST(N'2023-03-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (630, N'pfowleyhf', N'hgeraldihf@nationalgeographic.com', N'WJBSEEnGYmLA', 2, 0, CAST(N'2022-11-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (631, N'vwarrenhg', N'cridgeshg@umn.edu', N'QAyEZWHbLmA', 2, 0, CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (632, N'klindrooshh', N'ccrossthwaitehh@goodreads.com', N'mBUtIB', 2, 0, CAST(N'2023-04-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (633, N'shellierhi', N'jscawtonhi@va.gov', N'Qr2JRZvKk', 2, 0, CAST(N'2022-07-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (634, N'ngreenardhj', N'msherwillhj@last.fm', N'JoYeRHY', 2, 0, CAST(N'2023-03-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (635, N'ckingscotthk', N'kcheccihk@diigo.com', N'AHLYIURB5oN', 2, 0, CAST(N'2022-10-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (636, N'oovertonhl', N'zlivickhl@blogspot.com', N'n0IrtBcVwRZm', 2, 0, CAST(N'2022-12-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (637, N'jlearmanhm', N'smaclaughlinhm@odnoklassniki.ru', N'PKcM97', 2, 0, CAST(N'2022-08-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (638, N'glubomirskihn', N'arollinsonhn@pagesperso-orange.fr', N'lid1HgmRxvJU', 2, 0, CAST(N'2023-02-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (639, N'ldemerho', N'pcottaho@imgur.com', N'w0Co7io5tdZe', 2, 0, CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (640, N'wrheaumehp', N'wmeiningerhp@nifty.com', N'K424zN', 2, 0, CAST(N'2022-09-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (641, N'jwalentahq', N'dsavinhq@canalblog.com', N'01d2WDqO6g4q', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (642, N'mturvillehr', N'tsimonninhr@typepad.com', N'UtdhtHxaFFte', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (643, N'wyoungshs', N'crawlinghs@geocities.com', N'DShyRuj', 2, 0, CAST(N'2023-03-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (644, N'aharringtonht', N'lgekeht@dyndns.org', N'okR19xq', 2, 0, CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (645, N'cfortinhu', N'lmcalindenhu@moonfruit.com', N'abpogd', 2, 0, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (646, N'ckeyndhv', N'pengallhv@hc360.com', N'yGVZt5dT2C', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (647, N'bgatleyhw', N'gbollamhw@foxnews.com', N'0GCauEeT7oy', 2, 0, CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (648, N'fsimkinshx', N'cmussingtonhx@examiner.com', N'qzda7BCQ0XSD', 2, 0, CAST(N'2022-11-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (649, N'apridgeonhy', N'lwybornhy@wufoo.com', N'MA4NUUVVIk', 2, 0, CAST(N'2022-10-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (650, N'cballinghz', N'tbeckfordhz@answers.com', N'XX7g0aHw', 2, 0, CAST(N'2022-11-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (651, N'jdrablei0', N'bwaterdrinkeri0@wufoo.com', N'bfLps3efEzo', 2, 0, CAST(N'2023-02-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (652, N'ecrowsoni1', N'epencosti1@google.it', N'2SaZpCM4B3', 2, 0, CAST(N'2022-07-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (653, N'bisacoffi2', N'rmcgawi2@archive.org', N'2A18qlBCU4', 2, 0, CAST(N'2023-04-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (654, N'shambrighti3', N'karmatysi3@earthlink.net', N'VmtnaG7z3', 2, 0, CAST(N'2023-05-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (655, N'rremingtoni4', N'dmuffitti4@apple.com', N'Djjrhz7mHaLO', 2, 0, CAST(N'2023-05-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (656, N'bwinti5', N'ccricki5@fastcompany.com', N'Rim4IFdpa1e', 2, 0, CAST(N'2022-08-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (657, N'sjacklingsi6', N'mfawdryi6@uiuc.edu', N'XQeIq51tau', 2, 0, CAST(N'2022-07-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (658, N'cdowalli7', N'botteyi7@ibm.com', N'InR8jBF3YL2C', 2, 0, CAST(N'2022-10-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (659, N'caslini8', N'mdangli8@theglobeandmail.com', N'RWU5ynV1r', 2, 0, CAST(N'2022-07-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (660, N'lloryi9', N'amarklini9@cisco.com', N'NHGv7N', 2, 0, CAST(N'2022-12-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (661, N'adrewcliftonia', N'mcargillia@upenn.edu', N'c886b8', 2, 0, CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (662, N'cbernakiewiczib', N'amcknielyib@loc.gov', N'ZHxLw66prGP', 2, 0, CAST(N'2023-04-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (663, N'hpedroliic', N'dmewhaic@stumbleupon.com', N'IRa3QQP', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (664, N'ktrevenaid', N'vkincadeid@addtoany.com', N'Irm9wtRiXu', 2, 0, CAST(N'2023-02-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (665, N'eearthfieldie', N'pmurthwaiteie@fda.gov', N'0icA4tkekxRg', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (666, N'fokeavenyif', N'cgoodbairnif@yellowpages.com', N'nfxTh7WIU', 2, 0, CAST(N'2022-12-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (667, N'ldiplockig', N'kgodleyig@usa.gov', N'4ggUXI', 2, 0, CAST(N'2022-11-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (668, N'jbraamsih', N'dglawsopih@yellowbook.com', N'Mh8xWin1', 2, 0, CAST(N'2022-10-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (669, N'esnodinii', N'ylongmateii@bizjournals.com', N'UL3GJPS', 2, 0, CAST(N'2022-06-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (670, N'mholhouseij', N'dbompassij@virginia.edu', N'e1fjckkO', 2, 0, CAST(N'2023-02-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (671, N'asanchoik', N'csneadik@yelp.com', N'kDKglaEk', 2, 0, CAST(N'2022-09-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (672, N'livashkovil', N'gabbayil@live.com', N'TscTn9iry', 2, 0, CAST(N'2022-10-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (673, N'pmonksim', N'adoerrim@java.com', N'8D6K9yoEjU7', 2, 0, CAST(N'2022-12-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (674, N'ecrakerin', N'cnormanvillein@time.com', N'uO89D79t', 2, 0, CAST(N'2022-07-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (675, N'rpelcheurio', N'ldorewardio@foxnews.com', N'ye843WtIKabu', 2, 0, CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (676, N'lcorzonip', N'cmatousip@slate.com', N'ezr1k6wrVA', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (677, N'ymarjotiq', N'brosencrantziq@printfriendly.com', N'h4rFtGRwaO8j', 2, 0, CAST(N'2022-10-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (678, N'jraesideir', N'bvailir@yandex.ru', N'dAVRCmcTJV', 2, 0, CAST(N'2022-08-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (679, N'fmccardis', N'mmacilriachis@dell.com', N'zAxMyYCbyk', 2, 0, CAST(N'2022-09-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (680, N'tmacbethit', N'ntomasicchioit@google.fr', N'PdVhPeg4Ug', 2, 0, CAST(N'2023-04-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (681, N'iphillippiu', N'mrentcomeiu@blogspot.com', N'kAaPobR8kl6C', 2, 0, CAST(N'2022-12-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (682, N'fhoulstoniv', N'cwoodingtoniv@smugmug.com', N'6rvaOlXEorbb', 2, 0, CAST(N'2022-09-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (683, N'gseabridgeiw', N'lmagsoniw@newsvine.com', N'17MQMc28toh', 2, 0, CAST(N'2023-06-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (684, N'sbodmanix', N'peagletonix@hubpages.com', N'CxJj310ZgG0L', 2, 0, CAST(N'2023-03-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (685, N'hmatejovskyiy', N'sdukeiy@hao123.com', N'OvEn3uJsZl', 2, 0, CAST(N'2022-09-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (686, N'cbaxandalliz', N'kitzcakiz@hao123.com', N'UeLxWEZq4Twi', 2, 0, CAST(N'2023-02-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (687, N'lmessrutherj0', N'vlicencej0@pcworld.com', N'gi78IryUB6eh', 2, 0, CAST(N'2023-06-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (688, N'cbeckeyj1', N'pbanvillej1@webeden.co.uk', N'03SN92USilMN', 2, 0, CAST(N'2022-06-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (689, N'swallettj2', N'rbarabichj2@shop-pro.jp', N'TIrIL7lh', 2, 0, CAST(N'2022-07-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (690, N'eblanchetj3', N'hwaslingj3@ehow.com', N'yTcl3AZHD7Rk', 2, 0, CAST(N'2023-01-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (691, N'wknewstubj4', N'agarraltsj4@gmpg.org', N'0VKTADDk2', 2, 0, CAST(N'2022-11-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (692, N'sleveragej5', N'aburwellj5@kickstarter.com', N'4PXYytx', 2, 0, CAST(N'2022-07-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (693, N'edwellyj6', N'dtchirj6@ocn.ne.jp', N'1nuK1JtMUKJ', 2, 0, CAST(N'2023-02-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (694, N'iglowachj7', N'ralbionj7@wikipedia.org', N'rgZyN4IVJgkA', 2, 0, CAST(N'2022-12-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (695, N'egladhillj8', N'fglozmanj8@addtoany.com', N'UrttIL4lSL8', 2, 0, CAST(N'2022-06-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (696, N'elindoresj9', N'akauschej9@bbb.org', N'EAnJEWesQkc2', 2, 0, CAST(N'2023-01-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (697, N'clintheadja', N'rclarkewilliamsja@pinterest.com', N'M2k7KCwxc', 2, 0, CAST(N'2022-08-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (698, N'amurgatroydjb', N'kraymondjb@slideshare.net', N'T4Opp9', 2, 0, CAST(N'2023-03-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (699, N'dclarkjc', N'geaggerjc@ask.com', N'aM4a8r0', 2, 0, CAST(N'2023-04-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (700, N'ugeevejd', N'ghaleyjd@mtv.com', N'NlpTzVOScXAf', 2, 0, CAST(N'2022-09-30' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (701, N'kclaasenje', N'wcargenvenje@1688.com', N'E2WPEZ', 2, 0, CAST(N'2022-07-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (702, N'wgregonjf', N'kmanifouldjf@bloglovin.com', N'r0AiEnWVqb', 2, 0, CAST(N'2022-11-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (703, N'charesjg', N'capperleyjg@uol.com.br', N'dcuYAB', 2, 0, CAST(N'2022-10-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (704, N'aperfilijh', N'araffonjh@ifeng.com', N'F7Z9a1', 2, 0, CAST(N'2023-02-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (705, N'gcamisji', N'geasterbyji@time.com', N'2Ad2Oc7HgB', 2, 0, CAST(N'2022-12-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (706, N'apinkejj', N'lambagejj@storify.com', N'UWLDKNg', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (707, N'akilvingtonjk', N'cjonathonjk@guardian.co.uk', N'Sc7p1F0JnVNu', 2, 0, CAST(N'2022-09-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (708, N'claxejl', N'kmansonjl@hugedomains.com', N'MnCxPKK', 2, 0, CAST(N'2023-02-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (709, N'rpatterfieldjm', N'rmingassonjm@ed.gov', N'Pi8Gt81z', 2, 0, CAST(N'2023-06-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (710, N'krohlfingjn', N'bgarberjn@mlb.com', N'rFfECwW5S0', 2, 0, CAST(N'2023-04-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (711, N'vredlerjo', N'lpateyjo@gravatar.com', N'iGze4mCT', 2, 0, CAST(N'2023-03-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (712, N'cwillmotjp', N'hpohlingjp@wiley.com', N'NbMkhCAY9sMD', 2, 0, CAST(N'2023-01-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (713, N'mlantaffjq', N'tdrinkalljq@privacy.gov.au', N'9R461nf', 2, 0, CAST(N'2022-07-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (714, N'agawlerjr', N'dleathamjr@ucla.edu', N'uiPQcaAUhbI', 2, 0, CAST(N'2023-05-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (715, N'syukhnovjs', N'msnodayjs@statcounter.com', N'tuA7EL2DpEo', 2, 0, CAST(N'2023-04-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (716, N'cheninghamjt', N'eparrettjt@bloglovin.com', N'1dqSpIOjCGn', 2, 0, CAST(N'2022-07-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (717, N'swilceju', N'nquibellju@delicious.com', N'QBbOpMGqchd', 2, 0, CAST(N'2022-11-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (718, N'cbollisjv', N'jmcgeochjv@dailymotion.com', N'MUNY8m', 2, 0, CAST(N'2022-07-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (719, N'abignaljw', N'elinckjw@google.pl', N'klKqlegeVn6O', 2, 0, CAST(N'2022-10-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (720, N'mheckjx', N'cdeningtonjx@pcworld.com', N'OIfxFzoNX', 2, 0, CAST(N'2022-06-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (721, N'morletonjy', N'tmoffjy@omniture.com', N'xvJRKAY', 2, 0, CAST(N'2022-06-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (722, N'cvidyapinjz', N'uvinterjz@blinklist.com', N'TOrWBk', 2, 0, CAST(N'2022-08-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (723, N'eclissellk0', N'cshowenk0@list-manage.com', N'Y7v3iarkl5i', 2, 0, CAST(N'2022-09-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (724, N'imalyk1', N'nhuzzeyk1@jalbum.net', N'iELGXty56VwU', 2, 0, CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (725, N'omichelik2', N'hvillaltak2@theguardian.com', N'MTwdnVST', 2, 0, CAST(N'2022-09-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (726, N'ebachmannk3', N'tbutterlyk3@ovh.net', N'ODhcL8L2zeL0', 2, 0, CAST(N'2022-11-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (727, N'bguyotk4', N'abrownk4@youtube.com', N'U4TqtN6sM', 2, 0, CAST(N'2023-01-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (728, N'rdowryk5', N'acoppok5@si.edu', N'seTJERKI', 2, 0, CAST(N'2022-12-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (729, N'csweetnamk6', N'aaxlebyk6@nasa.gov', N'WV2dX6Pgz', 2, 0, CAST(N'2023-03-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (730, N'cedsallk7', N'bsoutark7@pen.io', N'lNGaw5ul', 2, 0, CAST(N'2022-11-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (731, N'rmordink8', N'kgoublierk8@blog.com', N'7Jk7jy1a', 2, 0, CAST(N'2022-09-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (732, N'nmactrusteyk9', N'jgatrellk9@sohu.com', N'PrpAzUMDsoka', 2, 0, CAST(N'2022-08-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (733, N'abedfordka', N'dpiserka@harvard.edu', N'uI0RhI', 2, 0, CAST(N'2022-11-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (734, N'gmcgroutherkb', N'cjakoubekkb@yellowbook.com', N'SRUJmozy9nP', 2, 0, CAST(N'2023-02-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (735, N'torneleskc', N'jierlandkc@techcrunch.com', N'EwOeV4', 2, 0, CAST(N'2023-02-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (736, N'gdobrowlskikd', N'tgockelerkd@xing.com', N'bQxQMsohFDk', 2, 0, CAST(N'2023-01-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (737, N'rkiesselke', N'mcaurahke@slashdot.org', N'NiN78U63LVel', 2, 0, CAST(N'2022-12-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (738, N'nlaethamkf', N'lduttkf@altervista.org', N'bsUb9R', 2, 0, CAST(N'2023-05-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (739, N'aplunketkg', N'rdickiekg@mapquest.com', N'nI4V7OfEjzlt', 2, 0, CAST(N'2022-08-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (740, N'wwhiffkh', N'eupcottkh@wikimedia.org', N'AYyVin2OIB', 2, 0, CAST(N'2022-08-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (741, N'closekeki', N'ajedrychowskiki@chronoengine.com', N'nLg7uUsn', 2, 0, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (742, N'msummerillkj', N'catcherleykj@nasa.gov', N'DHcyUcbQEEP', 2, 0, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (743, N'rlawrensonkk', N'mlobleykk@soup.io', N'esl8kb', 2, 0, CAST(N'2023-01-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (744, N'emarriskl', N'ebeebiskl@yahoo.com', N'Z93GO4bpSdJz', 2, 0, CAST(N'2022-06-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (745, N'etidballkm', N'criccioppokm@blinklist.com', N'cIZL3QMUp', 2, 0, CAST(N'2023-04-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (746, N'akedwellkn', N'ipindredkn@fda.gov', N'OvCJ8q', 2, 0, CAST(N'2022-06-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (747, N'ttomlinko', N'jarlidgeko@prweb.com', N'2vxiJd', 2, 0, CAST(N'2023-05-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (748, N'glippokp', N'ablaydonkp@miitbeian.gov.cn', N'dvzCcONS', 2, 0, CAST(N'2022-11-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (749, N'llowcockkq', N'amcwhorterkq@vinaora.com', N'iBsmE89QL', 2, 0, CAST(N'2022-09-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (750, N'clintottkr', N'dlocketkr@omniture.com', N'Z5rSmKPQPiG', 2, 0, CAST(N'2023-04-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (751, N'gscanderetks', N'rseniorks@noaa.gov', N'IfTlJJ0c', 2, 0, CAST(N'2022-09-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (752, N'abehneckenkt', N'whenstridgekt@gmpg.org', N'5YaUnJW6', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (753, N'pknowlerku', N'mgeertzku@hc360.com', N'RjfCOw7o', 2, 0, CAST(N'2023-05-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (754, N'lmatissoffkv', N'iobispokv@example.com', N'pkQCpqjTlh', 2, 0, CAST(N'2023-01-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (755, N'pguyerskw', N'mdyballkw@wordpress.org', N'0glLdXZ', 2, 0, CAST(N'2023-05-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (756, N'aewbanckkx', N'adymockekx@addthis.com', N'xeHl9uSG', 2, 0, CAST(N'2022-07-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (757, N'cholliganky', N'lreemeky@e-recht24.de', N'cwpNusErCCq2', 2, 0, CAST(N'2023-04-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (758, N'lyarnleykz', N'kdunseathkz@angelfire.com', N'8ZyIBUlTZk', 2, 0, CAST(N'2023-04-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (759, N'thonnieball0', N'psimionl0@msn.com', N'Soxat9R', 2, 0, CAST(N'2023-02-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (760, N'nbornel1', N'pserjeantl1@discovery.com', N'VogzEW3', 2, 0, CAST(N'2022-12-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (761, N'jgyfordl2', N'lsmoothl2@chron.com', N'kTwvTCJ', 2, 0, CAST(N'2023-03-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (762, N'cmeindll3', N'hkenionl3@cocolog-nifty.com', N'AmC5j0nLg', 2, 0, CAST(N'2023-02-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (763, N'bkobusl4', N'ebalcersl4@deliciousdays.com', N'3C31qM', 2, 0, CAST(N'2022-11-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (764, N'dsimonl5', N'ncollingl5@google.ca', N'Q393BmdCX0xW', 2, 0, CAST(N'2022-09-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (765, N'mboakel6', N'sschwantl6@163.com', N'tPDChj7Fr', 2, 0, CAST(N'2023-03-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (766, N'mmorgenl7', N'bunderwoodl7@1und1.de', N'Yzdpeo1TJ9wu', 2, 0, CAST(N'2022-08-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (767, N'kgrayleyl8', N'cgosalvezl8@tamu.edu', N'aezzgTLXR', 2, 0, CAST(N'2022-08-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (768, N'gwhetlandl9', N'mtruelovel9@about.com', N'8KlzP39Oje', 2, 0, CAST(N'2022-09-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (769, N'clanghornela', N'bwimsettla@skype.com', N'EIUTVKFkMJS0', 2, 0, CAST(N'2022-09-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (770, N'flabonlb', N'hpaybodylb@yahoo.co.jp', N'Dcb8B2', 2, 0, CAST(N'2022-10-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (771, N'agolledgelc', N'echinnerylc@mlb.com', N'Hyzakl', 2, 0, CAST(N'2022-12-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (772, N'jgaltoneld', N'alabbettld@booking.com', N'qUHMr0COEs', 2, 0, CAST(N'2023-01-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (773, N'fsnarttle', N'fmckyrrellyle@epa.gov', N'aqQcOh3', 2, 0, CAST(N'2023-06-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (774, N'ycadwaladrlf', N'cturnelllf@google.it', N'LBmcUQ2f5p', 2, 0, CAST(N'2023-03-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (775, N'tbottenlg', N'aduplanlg@wikia.com', N'k6sGxogO14i5', 2, 0, CAST(N'2022-06-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (776, N'caveraylh', N'twalasiklh@hatena.ne.jp', N'wNC9VmneFgK5', 2, 0, CAST(N'2022-08-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (777, N'awalchli', N'fbeechamli@go.com', N'UOsRsNM4P1', 2, 0, CAST(N'2023-01-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (778, N'dmerciklj', N'fjeyneslj@amazonaws.com', N'LZJMvE3Wo', 2, 0, CAST(N'2023-03-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (779, N'pbrunetlk', N'msallisslk@sciencedirect.com', N'0f1b238', 2, 0, CAST(N'2022-12-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (780, N'vjarrelll', N'jakhurstll@blog.com', N'r1lrrzN8', 2, 0, CAST(N'2022-07-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (781, N'smarcombelm', N'cpentecustlm@odnoklassniki.ru', N'egaa0Eqyg42M', 2, 0, CAST(N'2022-07-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (782, N'xdelnevoln', N'ipalkeln@live.com', N'xRW58OXKXH', 2, 0, CAST(N'2022-07-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (783, N'lfowellslo', N'nmulqueenylo@wikipedia.org', N'aEF6ta', 2, 0, CAST(N'2023-03-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (784, N'bwashlp', N'yfollinglp@over-blog.com', N'1b3mYnMc', 2, 0, CAST(N'2023-01-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (785, N'lcogleylq', N'mgoulstonelq@narod.ru', N'Tvin4u5H0E', 2, 0, CAST(N'2022-08-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (786, N'lkerfordlr', N'fcopnelllr@dmoz.org', N'3VLzQFnawfj', 2, 0, CAST(N'2023-05-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (787, N'bcraiggls', N'cmashrols@biglobe.ne.jp', N'UXzAYv', 2, 0, CAST(N'2022-07-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (788, N'spifflt', N'smoggachlt@delicious.com', N'nY2jEQ9NbkS', 2, 0, CAST(N'2023-04-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (789, N'jroundlu', N'cfonteslu@liveinternet.ru', N'f4V6LoxR', 2, 0, CAST(N'2023-04-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (790, N'magronskilv', N'tblanpeinlv@fastcompany.com', N'i3k5NX', 2, 0, CAST(N'2022-09-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (791, N'apenningtonlw', N'mburfootlw@ft.com', N'EihOyL2V7', 2, 0, CAST(N'2022-06-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (792, N'ilindenberglx', N'kadanezlx@typepad.com', N'TBDhYZ', 2, 0, CAST(N'2022-12-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (793, N'nreddickly', N'mbeverly@uol.com.br', N'tmDoaweem', 2, 0, CAST(N'2023-01-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (794, N'rlozanolz', N'oardenlz@adobe.com', N'Gi3ih0BgE9', 2, 0, CAST(N'2023-01-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (795, N'jpinshonm0', N'episcullim0@unesco.org', N'ASh6EtU6', 2, 0, CAST(N'2022-09-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (796, N'mkillockm1', N'lkitchinhamm1@ihg.com', N'K85JUp5L', 2, 0, CAST(N'2023-06-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (797, N'kandrewsm2', N'hjeanonm2@dell.com', N'q0xHSG3dX', 2, 0, CAST(N'2023-05-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (798, N'ebushm3', N'fdedeim3@over-blog.com', N'XxRtuahQ', 2, 0, CAST(N'2022-06-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (799, N'rmelleym4', N'kspeirm4@google.ca', N'7kEzUpNWRy', 2, 0, CAST(N'2023-05-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (800, N'sivanm5', N'apollandm5@amazon.co.uk', N'YYBOnLa8', 2, 0, CAST(N'2023-06-06' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (801, N'msevierm6', N'lcermanm6@mediafire.com', N'xcgqSRr', 2, 0, CAST(N'2023-03-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (802, N'biscowitzm7', N'daindrium7@mail.ru', N'HQpRiThIk', 2, 0, CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (803, N'wfarrenm8', N'dsmileym8@devhub.com', N'j72rlF', 2, 0, CAST(N'2022-09-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (804, N'otylorm9', N'lliasm9@indiegogo.com', N'1UStTfb5nJ', 2, 0, CAST(N'2023-02-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (805, N'vvondracekma', N'fjewsonma@ucsd.edu', N'8UWYP0icV', 2, 0, CAST(N'2023-06-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (806, N'jbowllermb', N'hfranemb@who.int', N'EUUzQpi', 2, 0, CAST(N'2022-08-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (807, N'dscrangemc', N'sclickmc@ftc.gov', N'LAQvMCQYIHBs', 2, 0, CAST(N'2022-12-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (808, N'pmckellenmd', N'hterrellmd@alibaba.com', N'zkfMx1VbHrIm', 2, 0, CAST(N'2022-11-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (809, N'tgorime', N'kelrickme@miitbeian.gov.cn', N'LgIUzQwX', 2, 0, CAST(N'2022-10-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (810, N'tocorrinmf', N'mtriplowmf@thetimes.co.uk', N'UHgNKUP7', 2, 0, CAST(N'2023-05-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (811, N'wdunstonmg', N'dkmieciakmg@usatoday.com', N'mdbVsGZHWUrq', 2, 0, CAST(N'2023-05-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (812, N'kstarkmh', N'cskippmh@home.pl', N'8pjsnkyT', 2, 0, CAST(N'2023-04-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (813, N'bprobinmi', N'lnovellomi@tumblr.com', N'4Y4Lwp3NDB', 2, 0, CAST(N'2023-05-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (814, N'jcarayolmj', N'glimeburnmj@joomla.org', N'8GqTRHj', 2, 0, CAST(N'2022-10-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (815, N'mpidginmk', N'gpalfreemk@yale.edu', N'mAAklmxa', 2, 0, CAST(N'2023-02-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (816, N'iheatherml', N'mseabrightml@e-recht24.de', N'ZMJxVV', 2, 0, CAST(N'2022-08-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (817, N'krentalllmm', N'upedrickmm@comcast.net', N'23cq2V', 2, 0, CAST(N'2022-10-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (818, N'tfendleymn', N'jkiwitzmn@weibo.com', N'UJkmvkgtzSO', 2, 0, CAST(N'2022-12-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (819, N'lokeshottmo', N'gtzukermo@ocn.ne.jp', N'BFlAWJ3', 2, 0, CAST(N'2022-09-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (820, N'hbrigginshawmp', N'aprovostmp@webs.com', N'LVBySXf0A', 2, 0, CAST(N'2022-08-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (821, N'kmcnirlanmq', N'wcarnowmq@wix.com', N'qESsIa984tug', 2, 0, CAST(N'2023-01-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (822, N'bivanyukovmr', N'jlissamanmr@arizona.edu', N'12RCYNm', 2, 0, CAST(N'2023-02-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (823, N'adockrillms', N'rmacvanamyms@dagondesign.com', N'E08u3M8UKW9C', 2, 0, CAST(N'2022-07-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (824, N'ssagarmt', N'mkinkaidmt@sun.com', N'XR9uwam3', 2, 0, CAST(N'2022-07-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (825, N'atavernormu', N'gdunrigemu@simplemachines.org', N'wayUxfPK', 2, 0, CAST(N'2022-07-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (826, N'mogdenmv', N'ffernandesmv@xing.com', N'a2rLj183', 2, 0, CAST(N'2022-07-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (827, N'elautiemw', N'maylettmw@linkedin.com', N'56V2ael08A', 2, 0, CAST(N'2023-03-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (828, N'amacafeemx', N'jhoutenmx@kickstarter.com', N'9dbgk9ti64LA', 2, 0, CAST(N'2022-09-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (829, N'mpossellmy', N'jfrancescottimy@tumblr.com', N'uW3UkM', 2, 0, CAST(N'2022-10-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (830, N'lroziermz', N'bsellenmz@jigsy.com', N'emeQBdrL', 2, 0, CAST(N'2023-05-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (831, N'mduligaln0', N'steresian0@constantcontact.com', N'eoRjgEB', 2, 0, CAST(N'2022-09-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (832, N'jdugann1', N'aellensn1@friendfeed.com', N'hTqQ5Knv', 2, 0, CAST(N'2022-10-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (833, N'emccallistern2', N'twarrendern2@meetup.com', N'10iERrnXeKE4', 2, 0, CAST(N'2022-08-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (834, N'tgerbern3', N'rlamanbyn3@spiegel.de', N'mvOXH6CZ1', 2, 0, CAST(N'2023-04-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (835, N'skupisn4', N'gdodridgen4@barnesandnoble.com', N'YKLu4Tohlzu3', 2, 0, CAST(N'2023-03-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (836, N'gtapendenn5', N'ischimaschken5@flavors.me', N'u4SZzWd8Bk', 2, 0, CAST(N'2022-07-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (837, N'gsollandn6', N'chargraven6@xrea.com', N'AzGKzrvmYe7', 2, 0, CAST(N'2023-01-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (838, N'btotterdelln7', N'lrontreen7@nba.com', N'LZ89yxuKv', 2, 0, CAST(N'2022-08-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (839, N'medwickn8', N'alanghornen8@answers.com', N'HPfN7Gi', 2, 0, CAST(N'2022-11-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (840, N'wmcandrewn9', N'cdenen9@soundcloud.com', N'37n9kjbOJ794', 2, 0, CAST(N'2023-02-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (841, N'mfridlingtonna', N'fstrongna@tripadvisor.com', N'lBLi1GE', 2, 0, CAST(N'2023-01-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (842, N'bcaurahnb', N'kkeoghannb@dailymotion.com', N'jrCvxbuCwcz', 2, 0, CAST(N'2023-04-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (843, N'rhollylandnc', N'caikmannc@mapquest.com', N'by1ttiX', 2, 0, CAST(N'2023-05-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (844, N'pmaypothernd', N'mwipernd@nba.com', N'mbkwTtgl0z', 2, 0, CAST(N'2022-10-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (845, N'hdungeene', N'jbrownellne@geocities.com', N'RyiTuww', 2, 0, CAST(N'2022-06-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (846, N'lbrettlenf', N'gpavlovskynf@topsy.com', N'mCuz4k', 2, 0, CAST(N'2022-08-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (847, N'srenihanng', N'gstermanng@bloomberg.com', N'KomiZm4R1rO', 2, 0, CAST(N'2023-04-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (848, N'ipetworthnh', N'bespinhonh@seattletimes.com', N'fULtN0vc0st', 2, 0, CAST(N'2023-05-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (849, N'hdearloveni', N'rwadesonni@storify.com', N'IY4WZTcp', 2, 0, CAST(N'2022-09-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (850, N'lridolfinj', N'mnelmesnj@china.com.cn', N'voCRh3', 2, 0, CAST(N'2023-02-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (851, N'memesnk', N'dnaresnk@intel.com', N'MP5FHG8', 2, 0, CAST(N'2023-03-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (852, N'dkenneficknl', N'eelphnl@de.vu', N'53PNg94wqHk', 2, 0, CAST(N'2023-02-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (853, N'acairdnm', N'rmacnalleynm@toplist.cz', N'Tcap4J66LXp', 2, 0, CAST(N'2022-07-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (854, N'ddeathnn', N'cheymesnn@guardian.co.uk', N'Pmq0B9xPh', 2, 0, CAST(N'2023-05-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (855, N'dcalderonno', N'fgoodingeno@joomla.org', N'mBkipOoN', 2, 0, CAST(N'2022-09-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (856, N'apoletnp', N'dprendergrassnp@bizjournals.com', N'gUeH8Qd', 2, 0, CAST(N'2023-05-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (857, N'rpovelenq', N'aebynq@msu.edu', N'UdpUc73jRA', 2, 0, CAST(N'2022-07-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (858, N'gklossnr', N'dgiffonnr@huffingtonpost.com', N'6m1nn4', 2, 0, CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (859, N'atrehearnns', N'hweatherheadns@myspace.com', N'TqNE0inje', 2, 0, CAST(N'2022-10-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (860, N'nzumbuschnt', N'atommasint@1688.com', N'oLAqsuviIha', 2, 0, CAST(N'2023-05-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (861, N'skillocknu', N'lmalleynu@utexas.edu', N'fDmwKpxZ', 2, 0, CAST(N'2023-01-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (862, N'ehoultnv', N'escraftonnv@sphinn.com', N'aeCMwjk2', 2, 0, CAST(N'2023-03-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (863, N'mhackneynw', N'mworssamnw@imgur.com', N'iaAptqpQcZ', 2, 0, CAST(N'2023-01-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (864, N'lmarzelenx', N'jcomminsnx@hugedomains.com', N'JIEazz', 2, 0, CAST(N'2022-07-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (865, N'rhewinsny', N'srannellsny@mediafire.com', N'DmGtsJTqb', 2, 0, CAST(N'2023-05-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (866, N'dgoltonnz', N'mdunsfordnz@yahoo.co.jp', N'4KaMRk5AZ', 2, 0, CAST(N'2022-11-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (867, N'esumptono0', N'dmcrobertso0@imdb.com', N'LmzUU2h', 2, 0, CAST(N'2023-03-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (868, N'vthurmano1', N'hthaino1@opensource.org', N'W3zj2Q8zJv', 2, 0, CAST(N'2022-12-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (869, N'creapo2', N'kmaydwayo2@businessinsider.com', N'Fv7DwGhoyldP', 2, 0, CAST(N'2022-09-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (870, N'bcuttello3', N'cclineo3@upenn.edu', N'p8v3dsfL4', 2, 0, CAST(N'2022-06-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (871, N'mdooleyo4', N'swintersgillo4@printfriendly.com', N'0UV854e9So', 2, 0, CAST(N'2023-03-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (872, N'mtissingtono5', N'ejerramso5@behance.net', N'5YcA7uXrCC', 2, 0, CAST(N'2022-11-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (873, N'filieveo6', N'cbadgero6@dell.com', N'FaFcGN', 2, 0, CAST(N'2022-11-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (874, N'levinso7', N'jleghorno7@fc2.com', N'9WzIVd4Y', 2, 0, CAST(N'2023-05-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (875, N'nrendero8', N'dskeermero8@howstuffworks.com', N'7ytVkokc', 2, 0, CAST(N'2022-12-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (876, N'ksustono9', N'llaphamo9@facebook.com', N'ORyVEOaschzu', 2, 0, CAST(N'2022-09-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (877, N'zbouetteoa', N'finottoa@tamu.edu', N'LDsKxGT3ao9', 2, 0, CAST(N'2022-08-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (878, N'wgarletteob', N'mgingoldob@dagondesign.com', N'vFN3v1', 2, 0, CAST(N'2022-11-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (879, N'smowatoc', N'asabieoc@amazon.de', N'5sCqTacLE', 2, 0, CAST(N'2022-09-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (880, N'toduilleainod', N'mscoyneod@cargocollective.com', N'Z6Lscs4T1', 2, 0, CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (881, N'fballoe', N'cwickliffeoe@homestead.com', N'lvmkSh', 2, 0, CAST(N'2022-06-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (882, N'ldevonsideof', N'mlavarackof@disqus.com', N'Er1J4TTRgPD', 2, 0, CAST(N'2023-01-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (883, N'hdrissellog', N'lgozzardog@house.gov', N'2rtsRelK', 2, 0, CAST(N'2023-06-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (884, N'chowbrookoh', N'dputtickoh@blogs.com', N'LkOm9eIEOOF', 2, 0, CAST(N'2022-10-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (885, N'rafieldoi', N'sambrogiottioi@mapy.cz', N'fyegKju4x', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (886, N'zcoultoj', N'rwalakoj@techcrunch.com', N'oa6d3DA9u', 2, 0, CAST(N'2023-02-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (887, N'vdenacampok', N'adampierok@smugmug.com', N'1nEKdcOGV', 2, 0, CAST(N'2022-10-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (888, N'ncorraool', N'cmountlowol@last.fm', N'e4U24qS', 2, 0, CAST(N'2022-10-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (889, N'jworcsom', N'lboxenom@princeton.edu', N'3gDdVrE6i5GV', 2, 0, CAST(N'2022-12-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (890, N'mgerrieon', N'gsloweyon@narod.ru', N'7OnuAP', 2, 0, CAST(N'2022-08-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (891, N'festcourtoo', N'cmorysonoo@angelfire.com', N'Y5M9n8G', 2, 0, CAST(N'2023-06-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (892, N'dlonghurstop', N'esallingsop@thetimes.co.uk', N'GxPF5AXZq3z', 2, 0, CAST(N'2022-09-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (893, N'rambroschoq', N'kcrannaoq@yahoo.co.jp', N'Szt8wckWQRGV', 2, 0, CAST(N'2022-06-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (894, N'cdrillingcourtor', N'eepiscopioor@samsung.com', N'RuUPugy9pKG', 2, 0, CAST(N'2022-08-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (895, N'qsimmoniteos', N'smarsos@mashable.com', N'VgkkUru7o9oT', 2, 0, CAST(N'2023-04-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (896, N'dglencroscheot', N'eburnandot@squarespace.com', N'1YP3RMGM1ZY', 2, 0, CAST(N'2023-04-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (897, N'lcurryerou', N'aolivettiou@purevolume.com', N'EL7eveARMq', 2, 0, CAST(N'2022-08-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (898, N'wbembridgeov', N'rmynardov@csmonitor.com', N'lcm3URVP0', 2, 0, CAST(N'2023-02-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (899, N'amoratow', N'gdilowayow@salon.com', N'7TYRu8', 2, 0, CAST(N'2022-10-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (900, N'chambrookox', N'smacclenanox@fastcompany.com', N'iEDmuDM', 2, 0, CAST(N'2022-10-07' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (901, N'thansieoy', N'hgappoy@arizona.edu', N'iy1VYua', 2, 0, CAST(N'2022-12-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (902, N'msimonyioz', N'nwillmettoz@hibu.com', N'ioq1JCoRjv2', 2, 0, CAST(N'2022-08-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (903, N'glarrettp0', N'vleedsp0@seesaa.net', N'H7fYuoWDh', 2, 0, CAST(N'2022-10-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (904, N'flambdeanp1', N'zdemanuelep1@drupal.org', N'ZTue45zgfyC', 2, 0, CAST(N'2023-03-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (905, N'rcarnowp2', N'rclashep2@cornell.edu', N'raVJRWKtqgLV', 2, 0, CAST(N'2022-08-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (906, N'ntomblesonp3', N'iinesonp3@smh.com.au', N'rH5ffH53jKj2', 2, 0, CAST(N'2023-01-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (907, N'rjayumep4', N'lloviep4@usatoday.com', N'wxymSaEcFud2', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (908, N'mwillcottp5', N'cudenp5@baidu.com', N'iK9rt71VNg', 2, 0, CAST(N'2022-06-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (909, N'awanderschekp6', N'tfishwickp6@godaddy.com', N'bOjrqZvC', 2, 0, CAST(N'2023-02-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (910, N'ekelleherp7', N'efredyp7@jimdo.com', N'kjGKVPp', 2, 0, CAST(N'2022-10-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (911, N'akoeppep8', N'rmarhamp8@instagram.com', N'Z703rtO', 2, 0, CAST(N'2022-07-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (912, N'jskoylesp9', N'gbennisp9@walmart.com', N'WkvSn8ZFn3Fb', 2, 0, CAST(N'2022-10-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (913, N'agosfordpa', N'syoellpa@pagesperso-orange.fr', N'o71UFJfDR', 2, 0, CAST(N'2023-06-03' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (914, N'bfeirnpb', N'rklugerpb@china.com.cn', N'io0xWNxO', 2, 0, CAST(N'2022-09-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (915, N'casburypc', N'ldezuanipc@ca.gov', N'Yc3xBz99cz', 2, 0, CAST(N'2023-04-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (916, N'gdanilewiczpd', N'aloggpd@ning.com', N'PW1DwPZ', 2, 0, CAST(N'2022-08-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (917, N'gjeskinspe', N'vwarfieldpe@dropbox.com', N'TQinFE4BZ2wa', 2, 0, CAST(N'2023-05-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (918, N'bsollimepf', N'rmoodeypf@diigo.com', N'M4KRlZ1Xe', 2, 0, CAST(N'2022-07-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (919, N'dcanadapg', N'abowtonpg@goo.gl', N'odeYnzWKmaHW', 2, 0, CAST(N'2022-11-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (920, N'wbartolijnph', N'ccrollyph@topsy.com', N'8E9W63h1CPk', 2, 0, CAST(N'2023-01-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (921, N'twrightempi', N'aconninghampi@unc.edu', N'fim9ji8M27M0', 2, 0, CAST(N'2023-01-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (922, N'dduchanpj', N'mbalduccipj@dmoz.org', N'j9cg5UwLcgLQ', 2, 0, CAST(N'2022-10-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (923, N'afurzeypk', N'ptredwellpk@themeforest.net', N'M9b04tfppq7', 2, 0, CAST(N'2022-12-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (924, N'nlarozepl', N'ykeggpl@amazon.com', N'Mg9b7ogV5', 2, 0, CAST(N'2023-01-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (925, N'starlingpm', N'sburgoinepm@histats.com', N'Rqupt3t93Y', 2, 0, CAST(N'2022-10-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (926, N'chellardpn', N'wschildpn@joomla.org', N'03dUxE1nVP6J', 2, 0, CAST(N'2022-06-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (927, N'bburnagepo', N'gbagnellpo@guardian.co.uk', N'118RfhfXH', 2, 0, CAST(N'2023-05-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (928, N'rdenormanvillepp', N'mburreepp@amazon.co.jp', N'3wtpOn', 2, 0, CAST(N'2022-11-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (929, N'cdowtrypq', N'crenhardpq@vistaprint.com', N'scbbpV', 2, 0, CAST(N'2023-01-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (930, N'leareypr', N'efaireypr@gravatar.com', N'9Uvgc3Ib', 2, 0, CAST(N'2023-02-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (931, N'jmauserps', N'rarndtps@desdev.cn', N'j3n0PywhpX', 2, 0, CAST(N'2022-12-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (932, N'cmacailinept', N'kgrishinpt@xing.com', N'SZFUvw0LeTch', 2, 0, CAST(N'2022-06-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (933, N'edumbletonpu', N'snornasellpu@toplist.cz', N'XJc7RI', 2, 0, CAST(N'2022-07-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (934, N'epolinpv', N'nallchinpv@digg.com', N'hGgngA2Efh3t', 2, 0, CAST(N'2022-10-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (935, N'cnoriegapw', N'cmitchelsonpw@mapy.cz', N'67mO7F', 2, 0, CAST(N'2023-05-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (936, N'ksparkspx', N'nwassungpx@elegantthemes.com', N'PJSKARa9l2', 2, 0, CAST(N'2022-10-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (937, N'gcorpepy', N'whughlinpy@wordpress.org', N'kybMzH2Lw3', 2, 0, CAST(N'2022-08-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (938, N'fgraylingpz', N'gjenckespz@t.co', N'u4YkiHRB', 2, 0, CAST(N'2023-04-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (939, N'jaskellq0', N'psutterbyq0@qq.com', N'B32AIuRKgsF', 2, 0, CAST(N'2022-11-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (940, N'cpaddieq1', N'dhawkshawq1@linkedin.com', N'hNVp6Zm', 2, 0, CAST(N'2022-12-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (941, N'dhamshereq2', N'lblewmenq2@nhs.uk', N'jS7TXAu3hD0', 2, 0, CAST(N'2022-12-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (942, N'clilloq3', N'cjoinceyq3@jimdo.com', N'hAcnOeb', 2, 0, CAST(N'2022-12-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (943, N'kclampettq4', N'pgrundleq4@prweb.com', N'fH89cC0EZ', 2, 0, CAST(N'2023-06-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (944, N'reldrettq5', N'bpohlakq5@cocolog-nifty.com', N'pcxFsO8', 2, 0, CAST(N'2022-08-08' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (945, N'dbraamq6', N'bsemarkeq6@storify.com', N'2PAo0K317K7S', 2, 0, CAST(N'2023-03-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (946, N'caldrinq7', N'droglieriq7@fda.gov', N'7pD8E5cB', 2, 0, CAST(N'2022-10-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (947, N'bpetchellq8', N'wmaymondq8@si.edu', N'yPLdpyA', 2, 0, CAST(N'2023-04-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (948, N'rbickerstaffeq9', N'astellmanq9@exblog.jp', N'30vb9Ur913qr', 2, 0, CAST(N'2022-10-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (949, N'mclineckqa', N'adinseyqa@washingtonpost.com', N'ju2yHSorYTuE', 2, 0, CAST(N'2022-10-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (950, N'wboolqb', N'jlevingsqb@cpanel.net', N'CrRRtiGt', 2, 0, CAST(N'2023-03-29' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (951, N'mchrystieqc', N'clutzmannqc@bloglovin.com', N'XimJyrB3QE', 2, 0, CAST(N'2022-06-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (952, N'mputmanqd', N'obarrottqd@paginegialle.it', N'fBlKpxM', 2, 0, CAST(N'2023-05-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (953, N'ehorrodqe', N'hlefrankqe@hatena.ne.jp', N'P5qQ2TB', 2, 0, CAST(N'2023-05-24' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (954, N'glegriceqf', N'tcoldbatheqf@aol.com', N'voMpus20', 2, 0, CAST(N'2023-05-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (955, N'iostqg', N'nbonaviaqg@csmonitor.com', N'W2PJt9pCdij', 2, 0, CAST(N'2022-09-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (956, N'jcrannageqh', N'wdeinhardqh@abc.net.au', N'cmCEHxvB', 2, 0, CAST(N'2022-12-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (957, N'lscayqi', N'charringtonqi@abc.net.au', N'mmYVvqpJxT', 2, 0, CAST(N'2022-08-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (958, N'irowstonqj', N'gbygateqj@vimeo.com', N'A8GPTtu5E', 2, 0, CAST(N'2022-07-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (959, N'apendockqk', N'ahammantqk@sphinn.com', N'yuzzN860ke', 2, 0, CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (960, N'muccelliql', N'pmeacherql@trellian.com', N'499OEdG', 2, 0, CAST(N'2023-05-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (961, N'gcareqm', N'tlowleqm@a8.net', N'NEJkiwyOT5E', 2, 0, CAST(N'2022-09-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (962, N'ssivessqn', N'bclapshawqn@youku.com', N'KJcQR6', 2, 0, CAST(N'2023-04-23' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (963, N'rsiddeleyqo', N'scapineerqo@merriam-webster.com', N'lSRksaC', 2, 0, CAST(N'2023-04-26' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (964, N'kledstoneqp', N'hwildmanqp@eventbrite.com', N'eNaRVIj', 2, 0, CAST(N'2022-09-07' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (965, N'erollingsqq', N'ngilbertqq@reddit.com', N'50zcF9g', 2, 0, CAST(N'2023-03-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (966, N'gvossingqr', N'ccastleqr@rediff.com', N'c5I1Sru', 2, 0, CAST(N'2022-08-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (967, N'cgibbingsqs', N'ejellingsqs@businesswire.com', N'NQbjKLk5RzA', 2, 0, CAST(N'2022-10-11' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (968, N'kberminghamqt', N'tculpinqt@hubpages.com', N'0l4KSWPEr', 2, 0, CAST(N'2022-06-13' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (969, N'pdavydkovqu', N'bhandforthqu@issuu.com', N'XWf9rq2H', 2, 0, CAST(N'2023-01-28' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (970, N'omcdugalqv', N'ssenussiqv@ning.com', N'Gvpb17on', 2, 0, CAST(N'2023-04-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (971, N'bcorwinqw', N'ypymarqw@apache.org', N'jbjkh6bp1Dj', 2, 0, CAST(N'2022-10-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (972, N'lspawellqx', N'vsackurqx@nationalgeographic.com', N'te29Xzjh', 2, 0, CAST(N'2023-04-22' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (973, N'chughmanqy', N'tandreouqy@sakura.ne.jp', N'I92ihW', 2, 0, CAST(N'2022-06-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (974, N'rfirbankqz', N'sedgecumbeqz@bizjournals.com', N'kl3m0k', 2, 0, CAST(N'2022-10-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (975, N'avispor0', N'jchittimr0@columbia.edu', N'0VJH94', 2, 0, CAST(N'2022-12-31' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (976, N'htondeurr1', N'ssmuthr1@privacy.gov.au', N'3WuEAuRC', 2, 0, CAST(N'2023-04-25' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (977, N'kpeaser2', N'jthunderr2@sohu.com', N'hRQRt0rhQPxw', 2, 0, CAST(N'2023-01-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (978, N'flightbournr3', N'chekr3@edublogs.org', N'jveb8YYe', 2, 0, CAST(N'2023-04-18' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (979, N'aburrissr4', N'gricartr4@eventbrite.com', N'sEIiFdpMrdy', 2, 0, CAST(N'2022-08-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (980, N'ecrossr5', N'ewandreyr5@comcast.net', N'oOStDkr', 2, 0, CAST(N'2023-03-16' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (981, N'gdingsdaler6', N'lcuppleditchr6@businesswire.com', N'ofjDvZTGy', 2, 0, CAST(N'2023-05-04' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (982, N'kmacalroyr7', N'awaslingr7@hexun.com', N'T4EnFG4o9', 2, 0, CAST(N'2022-06-09' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (983, N'clusgdinr8', N'jmarchingtonr8@clickbank.net', N'ncnvcOK', 2, 0, CAST(N'2022-10-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (984, N'bburnessr9', N'cbassanor9@google.es', N'yaGYYsZE', 2, 0, CAST(N'2022-10-27' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (985, N'pmabbottra', N'bcrombra@weather.com', N'XAFaMCdt', 2, 0, CAST(N'2023-04-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (986, N'bpetherrb', N'tcanaperb@wordpress.com', N'E8KacagTU', 2, 0, CAST(N'2022-08-30' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (987, N'kstoggellrc', N'emosconirc@123-reg.co.uk', N'Tv34hOUsOLGW', 2, 0, CAST(N'2022-09-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (988, N'dbielbyrd', N'omatushenkord@huffingtonpost.com', N'mMDPNh', 2, 0, CAST(N'2023-05-10' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (989, N'ryosifovre', N'gpatenre@hud.gov', N'7k2R68iiD', 2, 0, CAST(N'2022-11-01' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (990, N'amattiazzirf', N'kbushbyrf@webeden.co.uk', N'2XX1gG2CWyD0', 2, 0, CAST(N'2022-09-05' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (991, N'gmcmylorrg', N'lverityrg@ted.com', N'0k03oM3Q0Lm', 2, 0, CAST(N'2023-02-15' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (992, N'mtomeirh', N'cdowngaterh@nasa.gov', N'V9HIZI', 2, 0, CAST(N'2022-12-21' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (993, N'chearseyri', N'mhavercroftri@princeton.edu', N'lFXG8hy9F', 2, 0, CAST(N'2023-02-02' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (994, N'wjamesrj', N'rdadswellrj@bigcartel.com', N'68jpD0EdjYS', 2, 0, CAST(N'2023-01-12' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (995, N'flesmonderk', N'ciacopinirk@hugedomains.com', N'1jnmpmM', 2, 0, CAST(N'2022-07-19' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (996, N'skniftonrl', N'jsawdayrl@weibo.com', N'3L9C5vKsVNpU', 2, 0, CAST(N'2022-12-14' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (997, N'fbeaulieurm', N'jreiderm@ycombinator.com', N'R0rAIEyp9Qk3', 2, 0, CAST(N'2023-01-17' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (998, N'mtaguern', N'mdeversrn@tripod.com', N'Az42dyM2MMN9', 2, 0, CAST(N'2022-09-20' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (999, N'rfidelusro', N'kgherardesciro@youtu.be', N'BP6EorN', 2, 0, CAST(N'2022-11-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (1000, N'rpresshaughrp', N'hbrooksonrp@hhs.gov', N'we8lY6Up', 2, 0, CAST(N'2023-04-12' AS Date), NULL)
GO
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (1001, N'kcorballisrq', N'mwestcottrq@mapy.cz', N'7C69yVlj', 2, 0, CAST(N'2022-08-06' AS Date), NULL)
INSERT [dbo].[Account] ([accountID], [username], [email], [password], [role], [isDeleted], [regisDate], [avatar]) VALUES (1002, N'dellerayrr', N'fhardernrr@blogger.com', N'AiVIlgLZ', 2, 0, CAST(N'2023-04-22' AS Date), NULL)
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[Address] ON 

INSERT [dbo].[Address] ([addressID], [detail], [district], [province]) VALUES (1, N'123 Main Street', N'District 1', N'Ho Chi Minh City')
INSERT [dbo].[Address] ([addressID], [detail], [district], [province]) VALUES (2, N'123 Main Street', N'District 1', N'Ho Chi Minh City')
INSERT [dbo].[Address] ([addressID], [detail], [district], [province]) VALUES (3, N'456 Elm Street', N'District 2', N'Ho Chi Minh City')
INSERT [dbo].[Address] ([addressID], [detail], [district], [province]) VALUES (4, N'789 Oak Street', N'District 3', N'Ho Chi Minh City')
INSERT [dbo].[Address] ([addressID], [detail], [district], [province]) VALUES (5, N'321 Pine Street', N'District 4', N'Ho Chi Minh City')
INSERT [dbo].[Address] ([addressID], [detail], [district], [province]) VALUES (6, N'654 Maple Street', N'District 5', N'Ho Chi Minh City')
SET IDENTITY_INSERT [dbo].[Address] OFF
GO
SET IDENTITY_INSERT [dbo].[AddressShipment] ON 

INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (1, N'0123456789', N'123 ABC Street', N'District 1', N'Ho Chi Minh City', 1)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (2, N'0987654321', N'456 XYZ Street', N'District 2', N'Ho Chi Minh City', 2)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (3, N'0912345678', N'789 PQR Street', N'District 3', N'Ho Chi Minh City', 3)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (4, N'0999888777', N'321 DEF Street', N'District 4', N'Ho Chi Minh City', 4)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (5, N'0888777666', N'654 MNO Street', N'District 5', N'Ho Chi Minh City', 5)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (6, N'0977666555', N'987 STU Street', N'District 6', N'Ho Chi Minh City', 6)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (10, N'097666555', N'Phuoc Thien', N'Thu Duc', N'Ho Chi Minh', 2)
INSERT [dbo].[AddressShipment] ([addressShipID], [phoneShipment], [detail], [district], [province], [customerID]) VALUES (11, N'95674389', N'Long Thach My', N'Thu Duc', N'Ho Chi Minh', 3)
SET IDENTITY_INSERT [dbo].[AddressShipment] OFF
GO
SET IDENTITY_INSERT [dbo].[Customer] ON 

INSERT [dbo].[Customer] ([customerID], [phoneNumber], [point], [accountID]) VALUES (1, N'0123456789', NULL, 10)
INSERT [dbo].[Customer] ([customerID], [phoneNumber], [point], [accountID]) VALUES (2, N'0990900909', NULL, 8)
INSERT [dbo].[Customer] ([customerID], [phoneNumber], [point], [accountID]) VALUES (3, N'0987654321', NULL, 11)
INSERT [dbo].[Customer] ([customerID], [phoneNumber], [point], [accountID]) VALUES (4, N'0999888777', NULL, 12)
INSERT [dbo].[Customer] ([customerID], [phoneNumber], [point], [accountID]) VALUES (5, N'0888777666', NULL, 9)
INSERT [dbo].[Customer] ([customerID], [phoneNumber], [point], [accountID]) VALUES (6, N'0977666555', NULL, 13)
SET IDENTITY_INSERT [dbo].[Customer] OFF
GO
SET IDENTITY_INSERT [dbo].[Feedback] ON 

INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (1, N'https://thumbs.dreamstime.com/z/zebra-finch-white-front-background-42150868.jpg', 4, N'So wonderful. I satisified', 2, 3, CAST(N'2023-06-14' AS Date), NULL)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (2, N'https://thumbs.dreamstime.com/z/house-sparrow-27272329.jpg', 5, N'The bird is so cute. Shipment services are good!', 2, 4, CAST(N'2023-06-14' AS Date), NULL)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (3, N'https://img.freepik.com/premium-photo/bald-eagle-22-years-haliaeetus-leucocephalus-front-white-isolated_191971-9621.jpg?w=826', 3, N'Good price, good quality', 2, 2, CAST(N'2023-06-14' AS Date), NULL)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (4, N'https://thumbs.dreamstime.com/z/playful-toucan-25287988.jpg', 5, NULL, 2, 4, CAST(N'2023-06-14' AS Date), NULL)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (1005, N'https://firebasestorage.googleapis.com/v0/b/test-a702c.appspot.com/o/1688518861273-Screenshot%20(2).png?alt=media&token=bca7c873-a791-4c06-b62e-83fbf82abc7a', 4, N'The product is so good', 6, 8, CAST(N'2023-07-05' AS Date), NULL)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (1006, N'https://firebasestorage.googleapis.com/v0/b/test-a702c.appspot.com/o/1688522563990-Screenshot%20(2).png?alt=media&token=7a6128e5-d90d-45d5-a946-5c0e5e0baa8f', 5, N'Good experiences for this shop', 6, 8, CAST(N'2023-07-05' AS Date), 2056)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (1007, N'https://firebasestorage.googleapis.com/v0/b/test-a702c.appspot.com/o/1688522563990-Screenshot%20(2).png?alt=media&token=7a6128e5-d90d-45d5-a946-5c0e5e0baa8f', 5, N'Good experiences for this shop', 6, 8, CAST(N'2023-07-05' AS Date), 2056)
INSERT [dbo].[Feedback] ([feedbackID], [img], [star], [detail], [productID], [accID], [publishedDate], [orderDetailID]) VALUES (1008, N'https://firebasestorage.googleapis.com/v0/b/test-a702c.appspot.com/o/1688522563990-Screenshot%20(2).png?alt=media&token=7a6128e5-d90d-45d5-a946-5c0e5e0baa8f', 5, N'Good experiences for this shop', 6, 8, CAST(N'2023-07-05' AS Date), 2056)
SET IDENTITY_INSERT [dbo].[Feedback] OFF
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (3, CAST(N'2023-05-07' AS Date), 567, 1, 2, NULL, NULL, N'Pending', NULL)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (4, CAST(N'2023-05-27' AS Date), 57890, 1, 2, NULL, NULL, N'Pending', NULL)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (7, CAST(N'2023-06-18' AS Date), 100, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (8, CAST(N'2023-06-18' AS Date), 1720, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (9, CAST(N'2023-06-18' AS Date), 1800, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (10, CAST(N'2023-06-18' AS Date), 2400, 1, 2, 10, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (11, CAST(N'2023-06-18' AS Date), 1020, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (12, CAST(N'2023-06-18' AS Date), 2400, 1, 2, 10, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (13, CAST(N'2023-06-18' AS Date), 700, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (14, CAST(N'2023-06-18' AS Date), 700, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (15, CAST(N'2023-06-18' AS Date), 2400, 1, 2, 10, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (16, CAST(N'2023-06-19' AS Date), 320, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (17, CAST(N'2023-06-19' AS Date), 2400, 1, 2, 10, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (18, CAST(N'2023-06-19' AS Date), 320, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (19, CAST(N'2023-06-19' AS Date), 320, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (20, CAST(N'2023-06-19' AS Date), 1800, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (21, CAST(N'2023-06-19' AS Date), 2400, 1, 2, 10, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (22, CAST(N'2023-06-19' AS Date), 320, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (23, CAST(N'2023-06-19' AS Date), 320, 1, 2, 10, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (24, CAST(N'2023-06-19' AS Date), 2400, 1, 2, 10, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (25, CAST(N'2023-06-19' AS Date), 320, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (26, CAST(N'2023-06-19' AS Date), 4800, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (27, CAST(N'2023-06-19' AS Date), 1800, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (28, CAST(N'2023-06-19' AS Date), 2000, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (29, CAST(N'2023-06-19' AS Date), 1500, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (30, CAST(N'2023-06-19' AS Date), 300, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (31, CAST(N'2023-06-19' AS Date), 2400, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (32, CAST(N'2023-06-19' AS Date), 320, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (33, CAST(N'2023-06-19' AS Date), 320, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (34, CAST(N'2023-06-19' AS Date), 2400, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (35, CAST(N'2023-06-19' AS Date), 320, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (36, CAST(N'2023-06-19' AS Date), 1800, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (37, CAST(N'2023-06-19' AS Date), 300, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (38, CAST(N'2023-06-19' AS Date), 1400, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (39, CAST(N'2023-06-19' AS Date), 3540, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (40, CAST(N'2023-06-20' AS Date), 1405, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (41, CAST(N'2023-06-20' AS Date), 2405, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (42, CAST(N'2023-06-20' AS Date), 325, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (43, CAST(N'2023-06-20' AS Date), 2125, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (44, CAST(N'2023-06-20' AS Date), 2405, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (45, CAST(N'2023-06-20' AS Date), 325, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (46, CAST(N'2023-06-20' AS Date), 4805, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (47, CAST(N'2023-06-20' AS Date), 5405, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (48, CAST(N'2023-06-20' AS Date), 1805, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (49, CAST(N'2023-06-20' AS Date), 2405, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (50, CAST(N'2023-06-20' AS Date), 325, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (51, CAST(N'2023-06-20' AS Date), 2405, 1, 2, 2, NULL, N'Pending', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (52, CAST(N'2023-06-20' AS Date), 2105, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (53, CAST(N'2023-06-21' AS Date), 325, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (1048, CAST(N'2023-06-28' AS Date), 4505, 1, 2, 2, NULL, N'Pending', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (2048, CAST(N'2023-07-02' AS Date), 2405, 1, 2, 10, NULL, N'Completed', 2)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (3055, CAST(N'2023-07-04' AS Date), 325, 1, 2, 10, NULL, N'Completed', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (3056, CAST(N'2023-07-04' AS Date), 705, 1, 2, 10, NULL, N'Completed', 1)
INSERT [dbo].[Order] ([orderID], [orderDate], [total], [paymentID], [customerID], [addressShipID], [shipDate], [status], [shopID]) VALUES (3057, CAST(N'2023-07-04' AS Date), 305, 1, 2, 10, NULL, N'Completed', 2)
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetail] ON 

INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (1, 1, 300, 6, 7)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (2, 1, 300, 2, 7)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (3, 1, 1400, 5, 8)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (4, 1, 400, 6, 8)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (5, 1, 1800, 8, 9)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (6, 1, 2400, 7, 10)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (7, 1, 1000, 2, 11)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (8, 1, 400, 6, 11)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (9, 1, 2400, 7, 12)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (10, 1, 1000, 2, 13)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (11, 1, 1000, 2, 14)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (12, 1, 2400, 7, 15)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (13, 1, 400, 6, 16)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (14, 1, 2400, 7, 17)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (15, 1, 400, 6, 18)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (16, 1, 400, 6, 19)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (17, 1, 1800, 8, 20)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (18, 1, 2400, 7, 21)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (19, 1, 400, 6, 22)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (20, 1, 400, 6, 23)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (21, 1, 2400, 7, 24)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (22, 1, 400, 6, 25)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (23, 2, 2400, 7, 26)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (24, 1, 1800, 8, 27)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (25, 1, 2000, 4, 28)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (26, 1, 1500, 3, 29)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (27, 1, 300, 9, 30)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (28, 1, 2400, 7, 31)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (29, 1, 400, 6, 32)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (30, 1, 400, 6, 33)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (31, 1, 2400, 7, 34)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (32, 1, 400, 6, 35)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (33, 1, 1800, 8, 36)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (34, 1, 300, 9, 37)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (35, 1, 1400, 5, 38)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (36, 1, 1500, 3, 39)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (37, 1, 1400, 5, 39)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (38, 2, 400, 6, 39)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (39, 1, 1400, 5, 40)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (40, 1, 2400, 7, 41)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (41, 1, 400, 6, 42)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (42, 1, 400, 6, 43)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (43, 1, 1800, 8, 43)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (44, 1, 2400, 7, 44)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (45, 1, 400, 6, 45)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (46, 2, 2400, 7, 46)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (47, 3, 1800, 8, 47)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (48, 1, 1800, 8, 48)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (49, 1, 2400, 7, 49)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (50, 1, 320, 6, 50)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (51, 1, 2400, 7, 51)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (52, 3, 700, 2, 52)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (53, 1, 320, 6, 53)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (1048, 3, 1500, 3, 1048)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (1049, 1, 2400, 7, 2048)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (2056, 1, 320, 6, 3055)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (2057, 1, 700, 2, 3056)
INSERT [dbo].[OrderDetail] ([orderDetailID], [quantity], [price], [productID], [orderID]) VALUES (2058, 1, 300, 9, 3057)
SET IDENTITY_INSERT [dbo].[OrderDetail] OFF
GO
SET IDENTITY_INSERT [dbo].[Payment] ON 

INSERT [dbo].[Payment] ([paymentID], [paymentName], [payment_redirect], [paymentImg]) VALUES (1, N'CODE', 0, NULL)
INSERT [dbo].[Payment] ([paymentID], [paymentName], [payment_redirect], [paymentImg]) VALUES (2, N'MOMO', 1, NULL)
SET IDENTITY_INSERT [dbo].[Payment] OFF
GO
SET IDENTITY_INSERT [dbo].[Product] ON 

INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (1, N'Bird', 500, NULL, N'Bird', 5, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/zebra-finch-white-front-background-42150868.jpg', 0, 1, 1000, 1, CAST(N'2023-06-18' AS Date))
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (2, N'Dog Bird', 566, NULL, N'Bird', 7, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/playful-toucan-25287988.jpg', NULL, 1, 1000, 0.7, CAST(N'2023-06-19' AS Date))
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (3, N'Owl', 800, NULL, N'Bird', 2, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://img.freepik.com/premium-photo/great-horned-owl-bubo-virginianus-subarcticus-white-isolated_191971-14332.jpg?w=900', 0, 1, 1500, 1, CAST(N'2023-06-20' AS Date))
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (4, N'Eagle', 1000, NULL, N'Bird', 1, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://img.freepik.com/premium-photo/bald-eagle-22-years-haliaeetus-leucocephalus-front-white-isolated_191971-9621.jpg?w=826', 0, 2, 2000, 1, CAST(N'2023-06-21' AS Date))
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (5, N'Hawk', 700, NULL, N'Bird', 4, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://previews.123rf.com/images/michaelshake/michaelshake1501/michaelshake150100005/35076836-red-tailed-hawk-isolated-and-placed-on-a-white-background-the-most-common-hawk-in-north-america.jpg', 0, 1, 1400, 1, CAST(N'2023-06-22' AS Date))
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (6, N'Finch', 200, NULL, N'Bird', 8, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/zebra-finch-white-front-background-42150868.jpg', 0, 1, 400, 0.8, CAST(N'2023-06-23' AS Date))
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (7, N'Peacock', 1200, NULL, N'Bird', 2, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/peacock-male-front-white-background-40403327.jpg', 0, 2, 2400, 1, NULL)
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (8, N'Canary', 900, NULL, N'Bird', 5, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/canary-873989.jpg', 0, 1, 1800, 1, NULL)
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (9, N'Sparrow', 150, NULL, N'Bird', 10, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/house-sparrow-27272329.jpg', 0, 2, 300, 1, NULL)
INSERT [dbo].[Product] ([productID], [productName], [priceIn], [type], [category], [quantity], [description], [status], [img], [rating], [shopID], [priceOut], [pSale], [dateIn]) VALUES (10, N'Toucan', 1100, NULL, N'Bird', 3, N'Con Chim Xanh Trên Cành Cây

HU?NG D?N CÁCH Ð?T HÀNG

? Chú Chim Vui V? Và Nh?ng Ngu?i B?n

? Cách Ð?t Hàng: B?n Ch?n T?ng S?n Ph?m R?i Thêm Vào Gi? Hàng - Khi Gi? Hàng Ðã Có Ð?y Ð? Các S?n Ph?m C?n Mua, B?n M?i Ti?n Hành ?n Nút “ Thanh Toán”', N'av', N'https://thumbs.dreamstime.com/z/playful-toucan-25287988.jpg', 0, 1, 2200, 1, NULL)
SET IDENTITY_INSERT [dbo].[Product] OFF
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([role], [roleName]) VALUES (1, N'user')
INSERT [dbo].[Role] ([role], [roleName]) VALUES (2, N'admin')
INSERT [dbo].[Role] ([role], [roleName]) VALUES (3, N'sdmin')
INSERT [dbo].[Role] ([role], [roleName]) VALUES (4, N'Customer')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Shop] ON 

INSERT [dbo].[Shop] ([shopID], [shopName], [rate], [contact], [accountID], [addressID], [view]) VALUES (1, N'HighLA', 4.7, N'093456789', 2, 2, NULL)
INSERT [dbo].[Shop] ([shopID], [shopName], [rate], [contact], [accountID], [addressID], [view]) VALUES (2, N'Vitamin', 4.5, N'093456789', 22, 3, NULL)
SET IDENTITY_INSERT [dbo].[Shop] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E61645064D757]    Script Date: 7/5/2023 9:19:43 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Account__AB6E616493AF1DB1]    Script Date: 7/5/2023 9:19:43 AM ******/
ALTER TABLE [dbo].[Account] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Feedback] ADD  CONSTRAINT [feedbackpublishdate]  DEFAULT (getdate()) FOR [publishedDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [orderdatedf]  DEFAULT (getdate()) FOR [orderDate]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [paymentdef]  DEFAULT ((1)) FOR [paymentID]
GO
ALTER TABLE [dbo].[Order] ADD  CONSTRAINT [statusdf]  DEFAULT ('Pending') FOR [status]
GO
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [categorydf]  DEFAULT ('Bird') FOR [category]
GO
ALTER TABLE [dbo].[Account]  WITH CHECK ADD  CONSTRAINT [FK_Account_Role] FOREIGN KEY([role])
REFERENCES [dbo].[Role] ([role])
GO
ALTER TABLE [dbo].[Account] CHECK CONSTRAINT [FK_Account_Role]
GO
ALTER TABLE [dbo].[AddressShipment]  WITH CHECK ADD  CONSTRAINT [FK_AddressShipment_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[AddressShipment] CHECK CONSTRAINT [FK_AddressShipment_Customer]
GO
ALTER TABLE [dbo].[Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
ALTER TABLE [dbo].[Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[Feedback] CHECK CONSTRAINT [FK_Feedback_Product]
GO
ALTER TABLE [dbo].[FeedbackResponse]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackResponse_Feedback] FOREIGN KEY([feedbackID])
REFERENCES [dbo].[Feedback] ([feedbackID])
GO
ALTER TABLE [dbo].[FeedbackResponse] CHECK CONSTRAINT [FK_FeedbackResponse_Feedback]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_AddressShipment] FOREIGN KEY([addressShipID])
REFERENCES [dbo].[AddressShipment] ([addressShipID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_AddressShipment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([customerID])
REFERENCES [dbo].[Customer] ([customerID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Payment] FOREIGN KEY([paymentID])
REFERENCES [dbo].[Payment] ([paymentID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Payment]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Shop] FOREIGN KEY([shopID])
REFERENCES [dbo].[Shop] ([shopID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Shop]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Order] FOREIGN KEY([orderID])
REFERENCES [dbo].[Order] ([orderID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Order]
GO
ALTER TABLE [dbo].[OrderDetail]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetail_Product] FOREIGN KEY([productID])
REFERENCES [dbo].[Product] ([productID])
GO
ALTER TABLE [dbo].[OrderDetail] CHECK CONSTRAINT [FK_OrderDetail_Product]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Shop] FOREIGN KEY([shopID])
REFERENCES [dbo].[Shop] ([shopID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Shop]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Account] FOREIGN KEY([accountID])
REFERENCES [dbo].[Account] ([accountID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Account]
GO
ALTER TABLE [dbo].[Shop]  WITH CHECK ADD  CONSTRAINT [FK_Shop_Address] FOREIGN KEY([addressID])
REFERENCES [dbo].[Address] ([addressID])
GO
ALTER TABLE [dbo].[Shop] CHECK CONSTRAINT [FK_Shop_Address]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [CK__Order__status__151B244E] CHECK  (([status]='Confirmed' OR [status]='Completed' OR [status]='Cancel' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [CK__Order__status__151B244E]
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [CK__Order__status__6477ECF3] CHECK  (([status]='Confirmed' OR [status]='Completed' OR [status]='Cancel' OR [status]='Pending'))
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [CK__Order__status__6477ECF3]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK__Product__categor__17F790F9] CHECK  (([category]='Bird Toy' OR [category]='Bird Food' OR [category]='Bird'))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK__Product__categor__17F790F9]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [CK__Product__categor__19DFD96B] CHECK  (([category]='Bird Toy' OR [category]='Bird Food' OR [category]='Bird'))
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [CK__Product__categor__19DFD96B]
GO
USE [master]
GO
ALTER DATABASE [BirdPlatform] SET  READ_WRITE 
GO
