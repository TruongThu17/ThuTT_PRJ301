USE [master]
GO

/****** Object:  Database [InventoryManagement]    Script Date: 2/13/2022 2:04:19 AM ******/
CREATE DATABASE [InventoryManage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'InventoryManage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InventoryManage.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'InventoryManage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\InventoryManage_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
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

ALTER DATABASE[InventoryManage] SET ANSI_PADDING OFF 
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

ALTER DATABASE [InventoryManage] SET QUERY_STORE = OFF
GO

ALTER DATABASE [InventoryManage] SET  READ_WRITE 
GO


/****** Object:  Table [dbo].[ProductType]    Script Date: 2/13/2022 2:04:47 AM ******/
USE [InventoryManage]
GO
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
/****** Object:  Table [dbo].[Supplier]    Script Date: 2/13/2022 2:05:08 AM ******/
USE [InventoryManage]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Supplier](
	[Sid] [varchar](50) NOT NULL,
	[SName] [nvarchar](150) NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 2/13/2022 11:51:09 PM ******/
USE [InventoryManage]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[InforProduct](
	[code] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[importprice] [float],
	[saleprice] [float],
	[dateexpiry] [date],
	[nsx] [varchar](150),
	[quantityinstock] [int],
	[unit] [varchar](150),
	[status] [bit],
	[sid] [varchar](50),
	[Note] [nvarchar](200),
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[InforProduct]  WITH CHECK ADD  CONSTRAINT [FK_InforProduct_Supplier] FOREIGN KEY([sid])
REFERENCES [dbo].[Supplier] ([sid])
GO

ALTER TABLE [dbo].[InforProduct] CHECK CONSTRAINT [FK_InforProduct_Supplier]
GO
ALTER TABLE [dbo].[InforProduct]   WITH CHECK ADD  CONSTRAINT [FK_InforProduct_Prod] FOREIGN KEY([pid])
REFERENCES [dbo].[Prod] ([pid])
GO

ALTER TABLE [dbo].[InforProduct] CHECK CONSTRAINT [FK_InforProduct_Supplier]
GO

/****** Object:  Table [dbo].[Prod]    Script Date: 2/22/2022 12:02:05 AM ******/
USE [InventoryManage]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Prod](
	[pid] [varchar](50) NOT NULL,
	[pname] [varchar](150) NOT NULL,
	[ptid] [varchar](50) NOT NULL,
	primary key(pid))
GO

ALTER TABLE [dbo].[Prod]  WITH CHECK ADD  CONSTRAINT [FK_Prod_ProductType] FOREIGN KEY([ptid])
REFERENCES [dbo].[ProductType] ([ptid])
GO

ALTER TABLE [dbo].[Prod] CHECK CONSTRAINT [FK_Prod_ProductType]
GO


/****** Object:  Table [dbo].[Account]    Script Date: 2/13/2022 2:13:23 AM ******/
USE [InventoryManage]
GO
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
/****** Object:  Table [dbo].[Customer]    Script Date: 2/13/2022 2:21:47 AM ******/
USE [InventoryManage]
GO
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
/****** Object:  Table [dbo].[Bill]    Script Date: 2/13/2022 2:31:17 AM ******/
USE [InventoryManage]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Bill](
	[bid] [varchar](50) NOT NULL,
	[cid] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[dateinvoice] [date] NOT NULL,
	[Note] [varchar](150) NULL,
 CONSTRAINT [PK_Bill] PRIMARY KEY CLUSTERED 
(
	[bid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
/****** Object:  Table [dbo].[Refunded]    Script Date: 2/13/2022 2:41:42 AM ******/
USE [InventoryManage]
GO
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Refunded](
	[rid] [varchar](50) NOT NULL,
	[cid] [varchar](50) NOT NULL,
	[bid] [varchar](50) NOT NULL,
	[pid] [varchar](50) NOT NULL,
	[quantity] [int] NOT NULL,
	[Note] [varchar](150) NULL,
 CONSTRAINT [PK_Refunded] PRIMARY KEY CLUSTERED 
(
	[rid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Refunded]  WITH CHECK ADD  CONSTRAINT [FK_Refunded_Customer] FOREIGN KEY([cid])
REFERENCES [dbo].[Customer] ([cid])
GO

ALTER TABLE [dbo].[Refunded] CHECK CONSTRAINT [FK_Refunded_Customer]
GO
ALTER TABLE [dbo].[Refunded]  WITH CHECK ADD  CONSTRAINT [FK_Refunded_Bill] FOREIGN KEY([bid])
REFERENCES [dbo].[Bill] ([bid])
GO

ALTER TABLE [dbo].[Refunded] CHECK CONSTRAINT [FK_Refunded_Bill]
GO

ALTER TABLE [dbo].[Refunded]  WITH CHECK ADD  CONSTRAINT [FK_Refunded_Prod] FOREIGN KEY([pid])
REFERENCES [dbo].[Prod] ([pid])
GO

ALTER TABLE [dbo].[Refunded] CHECK CONSTRAINT [FK_Refunded_Prod]
GO
-- insert
INSERT INTO [dbo].[Account] ([username],[password]) VALUES ('hoaithu177', '123456')
GO
INSERT INTO [dbo].[Account] ([username],[password]) VALUES ('anhnn181', '654321')
GO 
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c01',N'Nguyen Ngoc','0972276577',N'Binh Yen, Thach That',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c02',N'Le Nam','0971346527',N'Binh Yen, Thach That',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c13',N'Le Lan','0970277555',N'Quoc Oai',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c54',N'Nguyen Manh','0971276122',N'Thach Hoa, Thach That',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c25',N'Truong Quan','0972256555',N'Luc Quan',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c36',N'Nguyen Thuan','0972201432',N'Luc Quan',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c37',N'Le Nam Sang','0971251654',N'Tan Xa',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c28',N'Trong Truong','0972223452',N'Luc Quan',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c29',N'Hai Nam','0972326645',N'Quoc Oai',null)
GO
INSERT INTO [dbo].[Customer] ([cid],[cname],[cphone],[caddress],[Note])VALUES('c10',N'Minh Hai','0974563785',N'Tan Xa',null)
GO

USE [InventoryManage]
GO

INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S01','CTy CP DTNL Xay dung Thuong mai Hoang Son')
GO
INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S02','CTy Cuong Quoc')
GO
INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S03','CTy CP TYT')
GO
INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S04','VLXD VietHome')
GO
INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S05','VLXD Thien An')
GO
INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S06','CTy CP VLXD Song Day')
GO
INSERT INTO [dbo].[Supplier] ([Sid] ,[SName]) VALUES ('S07','CTy TNHH Fixmart')
GO

USE [InventoryManage]
GO

INSERT INTO [dbo].[ProductType] ([ptId] ,[ptName])VALUES('pt01','Xi mang')
GO
INSERT INTO [dbo].[ProductType] ([ptId] ,[ptName])VALUES('pt02','Sat')
GO
INSERT INTO [dbo].[ProductType] ([ptId] ,[ptName])VALUES('pt03','Thep')
GO
USE [InventoryManage]
GO

INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p01','Xi Mang Bim Son PC40','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p02','Xi Mang Bim Son PC30','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p03','Xi Mang Cong Thanh PC40','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p04','Xi Mang Tam Diep PCB30','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p05','Xi Mang But Son PCB40','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p06','	Xi Mang But Son PCB30','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p07','	Xi Mang Vissai PCB40','pt01')
GO
INSERT INTO [dbo].[Prod]([pid],[pname],[ptid])
VALUES ('p08','	Xi Mang Vissai PCB30','pt01')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1001','p02',1270000,1350000,'2022-03-22','Xi Mang Bim Son',60,'Tan',1,'S01','')
GO

INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1002','p02',1260000,1350000,'2022-04-22','Xi Mang Bim Son',40,'Tan',1,'S01','')
GO


INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1003','p02',1270000,1350000,'2022-04-20','Xi Mang Bim Son',60,'Tan',1,'S02','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1004','p01',1310000,1460000,'2022-03-07','Xi Mang Bim Son',60,'Tan',1,'S02','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1005','p01',1330000,1460000,'2022-03-27','Xi Mang Bim Son',60,'Tan',1,'S02','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1006','p03',990000,1140000,'2022-04-27','Xi Mang Cong Thanh',90,'Tan',1,'S03','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1007','p04',970000,1170000,'2022-05-22','Xi Mang Tam Diep',60,'Tan',1,'S05','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1008','p04',980000,1170000,'2022-03-22','Xi Mang Tam Diep',40,'Tan',1,'S04','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1009','p04',980000,1170000,'2022-04-20','Xi Mang Tam Diep',30,'Tan',1,'S01','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1010','p05',990000,1190000,'2022-02-20','Xi Mang But Son',0,'Tan',0,'S01','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1011','p07',1270000,1320000,'2021-3-21','Xi Mang Vissai',0,'Tan',0,'S07','')
GO
INSERT INTO [dbo].[InforProduct]([code],[pid] ,[importprice],[saleprice],[dateexpiry],[nsx],[quantityinstock],[unit],[status],[sid],[Note])
VALUES('1012','p08',1270000,1350000,'2021-02-02','Xi Mang Vissai',0,'Tan',0,'S06','')
GO
