USE [master]
GO
/****** Object:  Database [VideoGames]    Script Date: 07/14/2013 19:57:58 ******/
CREATE DATABASE [VideoGames] ON  PRIMARY 
( NAME = N'VideoGames', FILENAME = N'F:\workspace\git\GitHub\ado-experiments\Database\VideoGames.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'VideoGames_log', FILENAME = N'F:\workspace\git\GitHub\ado-experiments\Database\VideoGames_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [VideoGames] SET COMPATIBILITY_LEVEL = 90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [VideoGames].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [VideoGames] SET ANSI_NULL_DEFAULT OFF
GO
ALTER DATABASE [VideoGames] SET ANSI_NULLS OFF
GO
ALTER DATABASE [VideoGames] SET ANSI_PADDING OFF
GO
ALTER DATABASE [VideoGames] SET ANSI_WARNINGS OFF
GO
ALTER DATABASE [VideoGames] SET ARITHABORT OFF
GO
ALTER DATABASE [VideoGames] SET AUTO_CLOSE ON
GO
ALTER DATABASE [VideoGames] SET AUTO_CREATE_STATISTICS ON
GO
ALTER DATABASE [VideoGames] SET AUTO_SHRINK OFF
GO
ALTER DATABASE [VideoGames] SET AUTO_UPDATE_STATISTICS ON
GO
ALTER DATABASE [VideoGames] SET CURSOR_CLOSE_ON_COMMIT OFF
GO
ALTER DATABASE [VideoGames] SET CURSOR_DEFAULT  GLOBAL
GO
ALTER DATABASE [VideoGames] SET CONCAT_NULL_YIELDS_NULL OFF
GO
ALTER DATABASE [VideoGames] SET NUMERIC_ROUNDABORT OFF
GO
ALTER DATABASE [VideoGames] SET QUOTED_IDENTIFIER OFF
GO
ALTER DATABASE [VideoGames] SET RECURSIVE_TRIGGERS OFF
GO
ALTER DATABASE [VideoGames] SET  DISABLE_BROKER
GO
ALTER DATABASE [VideoGames] SET AUTO_UPDATE_STATISTICS_ASYNC OFF
GO
ALTER DATABASE [VideoGames] SET DATE_CORRELATION_OPTIMIZATION OFF
GO
ALTER DATABASE [VideoGames] SET TRUSTWORTHY OFF
GO
ALTER DATABASE [VideoGames] SET ALLOW_SNAPSHOT_ISOLATION OFF
GO
ALTER DATABASE [VideoGames] SET PARAMETERIZATION SIMPLE
GO
ALTER DATABASE [VideoGames] SET READ_COMMITTED_SNAPSHOT OFF
GO
ALTER DATABASE [VideoGames] SET HONOR_BROKER_PRIORITY OFF
GO
ALTER DATABASE [VideoGames] SET  READ_WRITE
GO
ALTER DATABASE [VideoGames] SET RECOVERY SIMPLE
GO
ALTER DATABASE [VideoGames] SET  MULTI_USER
GO
ALTER DATABASE [VideoGames] SET PAGE_VERIFY CHECKSUM
GO
ALTER DATABASE [VideoGames] SET DB_CHAINING OFF
GO
USE [VideoGames]
GO
/****** Object:  Table [dbo].[Customer]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer](
	[CustomerID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](50) NOT NULL,
	[CustomerAddress] [nvarchar](50) NULL,
	[CustomerDetails] [ntext] NULL,
	[CustomerMembershipId] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Supplier]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier](
	[SupplierID] [int] IDENTITY(1,1) NOT NULL,
	[SupplierName] [nvarchar](50) NOT NULL,
	[SupplierAddress] [nvarchar](250) NULL,
	[SupplierPhone] [nvarchar](50) NULL,
	[SupplierVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Supplier] PRIMARY KEY CLUSTERED 
(
	[SupplierID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductType]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductType](
	[ProductTypeID] [int] IDENTITY(1,1) NOT NULL,
	[ProductTypeName] [nvarchar](50) NOT NULL,
	[ProductTypeDescription] [nvarchar](250) NOT NULL,
 CONSTRAINT [PK_ProductType] PRIMARY KEY CLUSTERED 
(
	[ProductTypeID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductID] [int] IDENTITY(1,1) NOT NULL,
	[ProductName] [nvarchar](100) NOT NULL,
	[ProductDescription] [nvarchar](1000) NOT NULL,
	[ListPrice] [float] NOT NULL,
	[ProductTypeID] [int] NOT NULL,
	[SupplierID] [int] NULL,
	[ReleaseDate] [datetime] NULL,
	[ProductImageUrl] [nvarchar](250) NULL,
	[ListPriceCurrency] [nvarchar](10) NOT NULL,
	[ProductVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Purchase]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Purchase](
	[PurchaseID] [int] IDENTITY(1,1) NOT NULL,
	[CustomerID] [int] NOT NULL,
	[PurchaseDate] [datetime] NOT NULL,
	[Details] [ntext] NULL,
 CONSTRAINT [PK_Purchase] PRIMARY KEY CLUSTERED 
(
	[PurchaseID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[PurchaseItem]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PurchaseItem](
	[PurchaseItemID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseID] [int] NOT NULL,
	[ProductID] [int] NOT NULL,
	[Price] [money] NOT NULL,
	[Quantity] [int] NOT NULL,
	[Discount] [float] NOT NULL,
 CONSTRAINT [PK_PurchaseItem] PRIMARY KEY CLUSTERED 
(
	[PurchaseItemID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Console]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Console](
	[ProductID] [int] NOT NULL,
	[DriveType] [nvarchar](50) NOT NULL,
	[DriveSize] [float] NOT NULL,
	[ConsoleDetails] [ntext] NULL,
 CONSTRAINT [PK_Console] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Accessory]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accessory](
	[ProductID] [int] NOT NULL,
	[SystemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Accessory] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Game]    Script Date: 07/14/2013 19:58:00 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Game](
	[ProductID] [int] NOT NULL,
	[SystemName] [nvarchar](100) NOT NULL,
	[Rating] [nvarchar](100) NULL,
	[Genre] [nvarchar](100) NULL,
	[Publisher] [nvarchar](100) NULL,
	[Developer] [nvarchar](100) NULL,
	[RatingUrl] [nvarchar](250) NULL,
	[PlayerInfo] [nvarchar](100) NULL,
	[GameVersion] [timestamp] NOT NULL,
 CONSTRAINT [PK_Game] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX  = OFF, STATISTICS_NORECOMPUTE  = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS  = ON, ALLOW_PAGE_LOCKS  = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Default [DF_Product_ListPriceCurrency]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Product] ADD  CONSTRAINT [DF_Product_ListPriceCurrency]  DEFAULT (N'USD') FOR [ListPriceCurrency]
GO
/****** Object:  ForeignKey [FK_Product_ProductType]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_ProductType] FOREIGN KEY([ProductTypeID])
REFERENCES [dbo].[ProductType] ([ProductTypeID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_ProductType]
GO
/****** Object:  ForeignKey [FK_Product_Supplier]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier] FOREIGN KEY([SupplierID])
REFERENCES [dbo].[Supplier] ([SupplierID])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Supplier]
GO
/****** Object:  ForeignKey [FK_Purchase_Customer]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Purchase]  WITH CHECK ADD  CONSTRAINT [FK_Purchase_Customer] FOREIGN KEY([CustomerID])
REFERENCES [dbo].[Customer] ([CustomerID])
GO
ALTER TABLE [dbo].[Purchase] CHECK CONSTRAINT [FK_Purchase_Customer]
GO
/****** Object:  ForeignKey [FK_PurchaseItem_Product]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[PurchaseItem]  WITH CHECK ADD  CONSTRAINT [FK_PurchaseItem_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[PurchaseItem] CHECK CONSTRAINT [FK_PurchaseItem_Product]
GO
/****** Object:  ForeignKey [FK_PurchaseItem_Purchase]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[PurchaseItem]  WITH NOCHECK ADD  CONSTRAINT [FK_PurchaseItem_Purchase] FOREIGN KEY([PurchaseID])
REFERENCES [dbo].[Purchase] ([PurchaseID])
GO
ALTER TABLE [dbo].[PurchaseItem] CHECK CONSTRAINT [FK_PurchaseItem_Purchase]
GO
/****** Object:  ForeignKey [FK_Console_Product]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Console]  WITH CHECK ADD  CONSTRAINT [FK_Console_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Console] CHECK CONSTRAINT [FK_Console_Product]
GO
/****** Object:  ForeignKey [FK_Accessory_Product]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Accessory]  WITH CHECK ADD  CONSTRAINT [FK_Accessory_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Accessory] CHECK CONSTRAINT [FK_Accessory_Product]
GO
/****** Object:  ForeignKey [FK_Game_Product]    Script Date: 07/14/2013 19:58:00 ******/
ALTER TABLE [dbo].[Game]  WITH CHECK ADD  CONSTRAINT [FK_Game_Product] FOREIGN KEY([ProductID])
REFERENCES [dbo].[Product] ([ProductID])
GO
ALTER TABLE [dbo].[Game] CHECK CONSTRAINT [FK_Game_Product]
GO
