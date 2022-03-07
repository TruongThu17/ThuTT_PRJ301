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
	[Email] [nvarchar](150) NOT NULL,
	[Phone] [nvarchar](150) NOT NULL,
	
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[Sid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
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
	[nsx] [varchar](150),
	[ptid] [varchar](50) NOT NULL,
	primary key(pid))
GO

ALTER TABLE [dbo].[Prod]  WITH CHECK ADD  CONSTRAINT [FK_Prod_ProductType] FOREIGN KEY([ptid])
REFERENCES [dbo].[ProductType] ([ptid])
GO

ALTER TABLE [dbo].[Prod] CHECK CONSTRAINT [FK_Prod_ProductType]
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
	[quantityinstock] [int],
	[unit] [varchar](150),
	[status] [bit],
	[sid] [varchar](50),
	[dateimport] [date],
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

INSERT INTO [dbo].[Supplier] VALUES ('S01','CTy CP DTNL Xay dung Thuong mai Hoang Son', 'HoangSonCPTM@gmail.com', '0971333555')
GO
INSERT INTO [dbo].[Supplier] VALUES ('S02','CTy Cuong Quoc', 'CuongQuocct@gmail.com', '0972777888')
GO
INSERT INTO [dbo].[Supplier] VALUES ('S03','CTy CP TYT', 'CPTYT@gmail.com', '0971333555')
GO
INSERT INTO [dbo].[Supplier] VALUES ('S04','VLXD VietHome', 'VietHomevlxd1.2@gmail.com', '0971342252')
GO
INSERT INTO [dbo].[Supplier] VALUES ('S05','VLXD Thien An','ThienAnvlxd22@gmail.com', '0971221122')
GO
INSERT INTO [dbo].[Supplier] VALUES ('S06','CTy CP VLXD Song Day','Songdaycpvlxd@gmail.com', '0972276558')
GO
INSERT INTO [dbo].[Supplier] VALUES ('S07','CTy TNHH Fixmart','Fixmarttnhh@gmail.com', '0972111333')
GO

USE [InventoryManage]
GO

INSERT INTO [dbo].[ProductType] ([ptId] ,[ptName])VALUES('pt01','Xi mang')
GO
INSERT INTO [dbo].[ProductType] ([ptId] ,[ptName])VALUES('pt02','Sat, Thep')
GO
USE [InventoryManage]
GO

INSERT INTO Prod
VALUES ('1001','Xi Mang Bim Son PC40','Xi Mang Bim Son','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1002','Xi Mang Bim Son PC30','Xi Mang Bim Son','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1003','Xi Mang Cong Thanh PC40','Xi Mang Cong Thanh','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1004','Xi Mang Tam Diep PCB30','Xi Mang Tam Diep','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1005','Xi Mang But Son PCB40','Xi Mang But Son','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1006','	Xi Mang But Son PCB30','Xi Mang But Son','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1007','	Xi Mang Vissai PCB40','Xi Mang Vissai','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1008','	Xi Mang Vissai PCB30','Xi Mang Vissai','pt01')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1009','D6,8','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1010','D6,8','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1011','D8V','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1026','D8V','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1012','D10','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1013','D10','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1014','D12','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1015','D12','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1016','D14','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1017','D14','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1018','D16','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1019','D16','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1020','D18','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1021','D18','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1022','D20','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1023','D20','Viet Duc','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1024','D22','Hoa Phat','pt02')
GO
INSERT INTO [dbo].[Prod]
VALUES ('1025','D22','Viet Duc','pt02')
GO


INSERT INTO [dbo].[InforProduct]
VALUES('p1001','1002',1270000,1350000,'2022-03-22',60,'Tan',1,'S01','2022-01-21','')
GO

INSERT INTO [dbo].[InforProduct]
VALUES('p1002','1002',1260000,1350000,'2022-04-22',40,'Tan',1,'S01','2022-02-21','')
GO


INSERT INTO [dbo].[InforProduct]
VALUES('p1003','1002',1270000,1350000,'2022-04-20',60,'Tan',1,'S02','2022-01-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1004','1001',1310000,1460000,'2022-03-07',60,'Tan',1,'S02','2022-01-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1005','1001',1330000,1460000,'2022-03-27',60,'Tan',1,'S02','2022-01-27','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1006','1003',990000,1140000,'2022-04-27',90,'Tan',1,'S03','2022-02-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1007','1004',970000,1170000,'2022-05-22',60,'Tan',1,'S05','2022-02-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1008','1004',980000,1170000,'2022-03-22',40,'Tan',1,'S04','2022-01-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1009','1004',980000,1170000,'2022-04-20',30,'Tan',1,'S01','2022-02-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1010','1005',990000,1190000,'2022-02-20',0,'Tan',0,'S01','2021-12-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1011','1007',1270000,1320000,'2021-3-21',0,'Tan',0,'S07','2021-01-21','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1012','1008',1270000,1350000,'2021-02-02',0,'Tan',0,'S06','2020-12-21','')
GO

INSERT INTO [dbo].[InforProduct]
VALUES('p1013','1009',17250,183500,null,1000,'Met',1,'S01','2022-01-21','')
GO

INSERT INTO [dbo].[InforProduct]
VALUES('p1014','1009',17000,183500,null,5000,'Met',1,'S02','2021-02-20','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1015','1010',17250,183000,null,8000,'Met',1,'S01','2022-03-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1016','1011',17200,183000,null,8000,'Met',1,'S01','2022-02-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1017','1026',17200,183000,null,8000,'Met',1,'S01','2022-02-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1018','1012',97000,114000,null,10000,'Cay',1,'S04','2022-01-11','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1019','1013',96000,113000,null,8000,'Cay',1,'S04','2022-03-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1020','1014',160000,180000,null,10000,'Cay',1,'S04','2022-01-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1032','1015',157000,178000,null,8000,'Cay',1,'S04','2022-03-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1021','1016',227000,247000,null,10000,'Cay',1,'S04','2022-02-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1022','1017',22100,245000,null,8000,'Cay',1,'S04','2022-03-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1023','1018',289000,313000,null,10000,'Cay',1,'S04','2022-01-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1024','1019',287100,311500,null,8000,'Cay',1,'S04','2022-02-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1025','1020',381500,408000,null,10000,'Cay',1,'S04','2022-01-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1026','1021',380000,405000,null,8000,'Cay',1,'S04','2022-03-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1027','1022',485500,506000,null,10000,'Cay',1,'S04','2022-01-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1028','1023',470500,499000,null,8000,'Cay',1,'S04','2022-02-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1029','1024',590000,610000,null,10000,'Cay',1,'S04','2022-01-01','')
GO
INSERT INTO [dbo].[InforProduct]
VALUES('p1030','1025',585500,605000,null,8000,'Cay',1,'S04','2022-01-01','')
GO