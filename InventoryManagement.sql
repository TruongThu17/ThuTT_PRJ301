USE [master]
GO
/****** Object:  Database [InventoryManage]    Script Date: 3/9/2022 11:54:18 PM ******/
CREATE DATABASE [InventoryManage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InventoryManage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryManage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InventoryManage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [InventoryManage] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [InventoryManage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [InventoryManage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [InventoryManage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [InventoryManage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [InventoryManage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [InventoryManage] SET ARITHABORT OFF 
GO
ALTER DATABASE [InventoryManage] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [InventoryManage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [InventoryManage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [InventoryManage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [InventoryManage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [InventoryManage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [InventoryManage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [InventoryManage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [InventoryManage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [InventoryManage] SET  ENABLE_BROKER 
GO
ALTER DATABASE [InventoryManage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [InventoryManage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [InventoryManage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [InventoryManage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [InventoryManage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [InventoryManage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [InventoryManage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [InventoryManage] SET RECOVERY FULL 
GO
ALTER DATABASE [InventoryManage] SET  MULTI_USER 
GO
ALTER DATABASE [InventoryManage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [InventoryManage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [InventoryManage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [InventoryManage] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [InventoryManage] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [InventoryManage] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'InventoryManage', N'ON'
GO
ALTER DATABASE [InventoryManage] SET QUERY_STORE = OFF
GO
USE [InventoryManage]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[username] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Bill]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Bill](
	[bid] [varchar](50) NOT NULL,
	[cid] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[total] [float] NOT NULL,
	[dateinvoice] [date] NOT NULL,
	[Note] [varchar](150) NULL,
PRIMARY KEY CLUSTERED 
(
	[bid] ASC,
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[cid] [varchar](50) NOT NULL,
	[cname] [nvarchar](150) NOT NULL,
	[cphone] [varchar](20) NOT NULL,
	[caddress] [nvarchar](300) NOT NULL,
	[Note] [nvarchar](150) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[cid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[InforProduct]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InforProduct](
	[code] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[importprice] [float] NULL,
	[saleprice] [float] NULL,
	[dateexpiry] [date] NULL,
	[quantityinstock] [int] NULL,
	[unit] [varchar](150) NULL,
	[status] [bit] NULL,
	[sid] [varchar](50) NULL,
	[dateimport] [date] NULL,
	[Note] [nvarchar](200) NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Prod]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Prod](
	[pid] [varchar](50) NOT NULL,
	[pname] [varchar](150) NOT NULL,
	[nsx] [varchar](150) NULL,
	[ptid] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[pid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ptId] [varchar](50) NOT NULL,
	[ptName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ptId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 3/9/2022 11:54:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[Sid] [varchar](50) NOT NULL,
	[SName] [nvarchar](150) NOT NULL,
	[Email] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'anhnn181', N'654321')
GO
INSERT [dbo].[Account] ([username], [password]) VALUES (N'hoaithu177', N'123456')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b01', N'c01', N'1001', 10, 1460000, CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b01', N'c01', N'1009', 1000, 18350000, CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b01', N'c01', N'1011', 800, 14640000, CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b01', N'c01', N'1012', 100, 1140000, CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b01', N'c01', N'1016', 100, 24700000, CAST(N'2022-03-02' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b02', N'c02', N'1001', 2, 2920000, CAST(N'2022-03-02' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b02', N'c02', N'1002', 3, 4050000, CAST(N'2022-03-02' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b02', N'c02', N'1011', 1000, 18300000, CAST(N'2022-03-02' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b03', N'c03', N'1004', 8, 9360000, CAST(N'2022-02-11' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b03', N'c03', N'1013', 100, 1130000, CAST(N'2022-02-13' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b03', N'c03', N'1026', 100, 183000, CAST(N'2022-02-11' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b04', N'c04', N'1002', 7, 9450000, CAST(N'2022-01-29' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b05', N'c02', N'1002', 3, 2700000, CAST(N'2022-03-09' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b06', N'c05', N'1001', 5, 7300000, CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b07', N'c06', N'1002', 8, 10350000, CAST(N'2022-03-02' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b08', N'c07', N'1001', 10, 14600000, CAST(N'2022-02-01' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b08', N'c07', N'1011', 400, 7320000, CAST(N'2022-03-04' AS Date), N'')
GO
INSERT [dbo].[Bill] ([bid], [cid], [pid], [quantity], [total], [dateinvoice], [Note]) VALUES (N'b09', N'c08', N'1012', 300, 34200000, CAST(N'2022-03-05' AS Date), N'')
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c01', N'Nguyen Ngoc', N'0972276577', N'Binh Yen, Thach That', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c02', N'Le Nam', N'0971346527', N'Binh Yen, Thach That', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c03', N'Le Lan', N'0970277555', N'Quoc Oai', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c04', N'Nguyen Manh', N'0971276122', N'Thach Hoa, Thach That', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c05', N'Truong Quan', N'0972256555', N'Luc Quan', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c06', N'Nguyen Thuan', N'0972201432', N'Luc Quan', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c07', N'Le Nam Sang', N'0971251654', N'Tan Xa', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c08', N'Trong Truong', N'0972223452', N'Luc Quan', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c09', N'Hai Nam', N'0972326645', N'Quoc Oai', NULL)
GO
INSERT [dbo].[Customer] ([cid], [cname], [cphone], [caddress], [Note]) VALUES (N'c10', N'Minh Hai', N'0974563785', N'Tan Xa', NULL)
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1001', N'1002', 1270000, 1350000, CAST(N'2022-03-22' AS Date), 60, N'Tan', 1, N'S01', CAST(N'2022-01-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1002', N'1002', 1260000, 1350000, CAST(N'2022-04-22' AS Date), 40, N'Tan', 1, N'S01', CAST(N'2022-02-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1003', N'1002', 1270000, 1350000, CAST(N'2022-04-20' AS Date), 60, N'Tan', 1, N'S02', CAST(N'2022-01-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1004', N'1001', 1310000, 1460000, CAST(N'2022-03-07' AS Date), 60, N'Tan', 1, N'S02', CAST(N'2022-01-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1005', N'1001', 1330000, 1460000, CAST(N'2022-03-27' AS Date), 60, N'Tan', 1, N'S02', CAST(N'2022-01-27' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1006', N'1003', 990000, 1140000, CAST(N'2022-04-27' AS Date), 90, N'Tan', 1, N'S03', CAST(N'2022-02-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1007', N'1004', 970000, 1170000, CAST(N'2022-05-22' AS Date), 60, N'Tan', 1, N'S05', CAST(N'2022-02-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1008', N'1004', 980000, 1170000, CAST(N'2022-03-22' AS Date), 40, N'Tan', 1, N'S04', CAST(N'2022-01-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1009', N'1004', 980000, 1170000, CAST(N'2022-04-20' AS Date), 30, N'Tan', 1, N'S01', CAST(N'2022-02-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1010', N'1005', 990000, 1190000, CAST(N'2022-02-20' AS Date), 0, N'Tan', 0, N'S01', CAST(N'2021-12-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1011', N'1007', 1270000, 1320000, CAST(N'2021-03-21' AS Date), 0, N'Tan', 0, N'S07', CAST(N'2021-01-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1012', N'1008', 1270000, 1350000, CAST(N'2021-02-02' AS Date), 0, N'Tan', 0, N'S06', CAST(N'2020-12-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1013', N'1009', 17250, 18350, NULL, 1000000, N'Met', 1, N'S01', CAST(N'2022-01-21' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1014', N'1009', 17000, 18350, NULL, 5000000, N'Met', 1, N'S02', CAST(N'2021-02-20' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1015', N'1010', 17250, 18300, NULL, 8000000, N'Met', 1, N'S01', CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1016', N'1011', 17200, 18300, NULL, 8000000, N'Met', 1, N'S01', CAST(N'2022-02-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1017', N'1026', 17200, 18300, NULL, 8000000, N'Met', 1, N'S01', CAST(N'2022-02-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1018', N'1012', 97000, 114000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-01-11' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1019', N'1013', 96000, 113000, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1020', N'1014', 160000, 180000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-01-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1021', N'1016', 227000, 247000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-02-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1022', N'1017', 221000, 245000, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1023', N'1018', 289000, 313000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-01-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1024', N'1019', 287100, 311500, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-02-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1025', N'1020', 381500, 408000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-01-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1026', N'1021', 380000, 405000, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1027', N'1022', 485500, 506000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-01-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1028', N'1023', 470500, 499000, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-02-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1029', N'1024', 590000, 610000, NULL, 1000000, N'Cay', 1, N'S04', CAST(N'2022-01-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1030', N'1025', 585500, 605000, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-01-01' AS Date), N'')
GO
INSERT [dbo].[InforProduct] ([code], [pid], [importprice], [saleprice], [dateexpiry], [quantityinstock], [unit], [status], [sid], [dateimport], [Note]) VALUES (N'p1032', N'1015', 157000, 178000, NULL, 8000000, N'Cay', 1, N'S04', CAST(N'2022-03-01' AS Date), N'')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1001', N'Xi Mang Bim Son PC40', N'Xi Mang Bim Son', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1002', N'Xi Mang Bim Son PC30', N'Xi Mang Bim Son', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1003', N'Xi Mang Cong Thanh PC40', N'Xi Mang Cong Thanh', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1004', N'Xi Mang Tam Diep PCB30', N'Xi Mang Tam Diep', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1005', N'Xi Mang But Son PCB40', N'Xi Mang But Son', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1006', N'	Xi Mang But Son PCB30', N'Xi Mang But Son', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1007', N'	Xi Mang Vissai PCB40', N'Xi Mang Vissai', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1008', N'	Xi Mang Vissai PCB30', N'Xi Mang Vissai', N'pt01')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1009', N'D6,8', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1010', N'D6,8', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1011', N'D8V', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1012', N'D10', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1013', N'D10', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1014', N'D12', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1015', N'D12', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1016', N'D14', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1017', N'D14', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1018', N'D16', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1019', N'D16', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1020', N'D18', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1021', N'D18', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1022', N'D20', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1023', N'D20', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1024', N'D22', N'Hoa Phat', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1025', N'D22', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[Prod] ([pid], [pname], [nsx], [ptid]) VALUES (N'1026', N'D8V', N'Viet Duc', N'pt02')
GO
INSERT [dbo].[ProductType] ([ptId], [ptName]) VALUES (N'pt01', N'Xi mang')
GO
INSERT [dbo].[ProductType] ([ptId], [ptName]) VALUES (N'pt02', N'Sat, Thep')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S01', N'CTy CP DTNL Xay dung Thuong mai Hoang Son', N'HoangSonCPTM@gmail.com', N'0971333555')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S02', N'CTy Cuong Quoc', N'CuongQuocct@gmail.com', N'0972777888')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S03', N'CTy CP TYT', N'CPTYT@gmail.com', N'0971333555')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S04', N'VLXD VietHome', N'VietHomevlxd1.2@gmail.com', N'0971342252')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S05', N'VLXD Thien An', N'ThienAnvlxd22@gmail.com', N'0971221122')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S06', N'CTy CP VLXD Song Day', N'Songdaycpvlxd@gmail.com', N'0972276558')
GO
INSERT [dbo].[Supplier] ([Sid], [SName], [Email], [Phone]) VALUES (N'S07', N'CTy TNHH Fixmart', N'Fixmarttnhh@gmail.com', N'0972111333')
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Customer] FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([cid])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Customer]
GO
ALTER TABLE [dbo].[Bill]  WITH CHECK ADD  CONSTRAINT [FK_Bill_Prod] FOREIGN KEY([pid])
REFERENCES [dbo].[Prod] ([pid])
GO
ALTER TABLE [dbo].[Bill] CHECK CONSTRAINT [FK_Bill_Prod]
GO
ALTER TABLE [dbo].[InforProduct]  WITH CHECK ADD  CONSTRAINT [FK_InforProduct_Prod] FOREIGN KEY([pid])
REFERENCES [dbo].[Prod] ([pid])
GO
ALTER TABLE [dbo].[InforProduct] CHECK CONSTRAINT [FK_InforProduct_Prod]
GO
ALTER TABLE [dbo].[InforProduct]  WITH CHECK ADD  CONSTRAINT [FK_InforProduct_Supplier] FOREIGN KEY([sid])
REFERENCES [dbo].[Supplier] ([Sid])
GO
ALTER TABLE [dbo].[InforProduct] CHECK CONSTRAINT [FK_InforProduct_Supplier]
GO
ALTER TABLE [dbo].[Prod]  WITH CHECK ADD  CONSTRAINT [FK_Prod_ProductType] FOREIGN KEY([ptid])
REFERENCES [dbo].[ProductType] ([ptId])
GO
ALTER TABLE [dbo].[Prod] CHECK CONSTRAINT [FK_Prod_ProductType]
GO
USE [master]
GO
ALTER DATABASE [InventoryManage] SET  READ_WRITE 
GO
