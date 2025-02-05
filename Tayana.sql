USE [master]
GO
/****** Object:  Database [Tayana]    Script Date: 2024/7/30 下午 12:34:40 ******/
CREATE DATABASE [Tayana]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tayana', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tayana.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tayana_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\Tayana_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tayana] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tayana].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tayana] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tayana] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tayana] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tayana] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tayana] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tayana] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tayana] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tayana] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tayana] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tayana] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tayana] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tayana] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tayana] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tayana] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tayana] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Tayana] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tayana] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tayana] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tayana] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tayana] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tayana] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tayana] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tayana] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Tayana] SET  MULTI_USER 
GO
ALTER DATABASE [Tayana] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tayana] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tayana] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tayana] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tayana] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tayana] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Tayana] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tayana] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tayana]
GO
/****** Object:  Table [dbo].[Account]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Account](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Account] [nvarchar](100) NOT NULL,
	[Password] [nvarchar](100) NOT NULL,
	[Salt] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Name] [nvarchar](100) NULL,
	[MaxPower] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyAbout]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyAbout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CompanyAbout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyCertificate]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyCertificate](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CompanyCertificate] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CompanyImages]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CompanyImages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ImageName] [nvarchar](50) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_CompanyImages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerArea]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerArea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CountryId] [int] NOT NULL,
	[Area] [nvarchar](50) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DealerArea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DealerCountry]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DealerCountry](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Country] [nvarchar](50) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_DealersCountry] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Dealers]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[AreaId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Contact] [nvarchar](max) NULL,
	[Address] [nvarchar](max) NULL,
	[Tel] [nvarchar](max) NULL,
	[Fax] [nvarchar](max) NULL,
	[Cell] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Link] [nvarchar](max) NULL,
	[ImageName] [nvarchar](max) NULL,
	[ImagePath] [nvarchar](max) NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Dealers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[News]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[News](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[CoverId] [int] NOT NULL,
	[IsTop] [bit] NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[HasImage] [bit] NOT NULL,
	[HasFile] [bit] NOT NULL,
	[NewsDate] [datetime] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_News] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsFile]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_NewsFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NewsImage]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NewsImage](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[NewsId] [int] NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_NewsImage] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Yacht]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Yacht](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Model] [nvarchar](max) NOT NULL,
	[ModelLength] [nvarchar](max) NOT NULL,
	[IsNewDesign] [bit] NOT NULL,
	[IsNewBuilding] [bit] NOT NULL,
	[OverView] [nvarchar](max) NULL,
	[DimensionsImagePath] [nvarchar](max) NULL,
	[CoverId] [int] NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_Yacht] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YachtAlbum]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YachtAlbum](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YachtId] [int] NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YachtAlbum] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YachtDimension]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YachtDimension](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YachtId] [int] NOT NULL,
	[Item] [nvarchar](max) NOT NULL,
	[Value] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YachtDimension] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YachtFile]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YachtFile](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YachtId] [int] NOT NULL,
	[FileName] [nvarchar](max) NOT NULL,
	[FilePath] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YachtFile] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YachtLayout]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YachtLayout](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YachtId] [int] NOT NULL,
	[ImageName] [nvarchar](max) NOT NULL,
	[ImagePath] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YachtLayout] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YachtSpecification]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YachtSpecification](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YachtId] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YachtSpecification] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[YachtSpecificationItem]    Script Date: 2024/7/30 下午 12:34:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[YachtSpecificationItem](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[YachtSpecificationId] [int] NOT NULL,
	[Item] [nvarchar](max) NOT NULL,
	[IsDelete] [bit] NOT NULL,
	[CreateTime] [datetime] NOT NULL,
 CONSTRAINT [PK_YachtSpecificationItem] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Account] ON 

INSERT [dbo].[Account] ([Id], [Account], [Password], [Salt], [Email], [Name], [MaxPower], [IsDelete], [CreateTime]) VALUES (1, N'Admin', N'Ql9dBdFytND1j39JiVIm0Q==', N'fd2C5pky2Wnzxme6reCwCA==', N'annmy5622@gmail.com', N'管理員', 1, 0, CAST(N'2024-07-27T21:23:08.670' AS DateTime))
INSERT [dbo].[Account] ([Id], [Account], [Password], [Salt], [Email], [Name], [MaxPower], [IsDelete], [CreateTime]) VALUES (2, N'Test1', N'iVtz80z25rKDWWQXLyj5sA==', N'AAVcUFbgRv+aCP3GhtTxBQ==', N'test@gmail.com', N'測試1', 0, 0, CAST(N'2024-07-28T21:39:26.203' AS DateTime))
INSERT [dbo].[Account] ([Id], [Account], [Password], [Salt], [Email], [Name], [MaxPower], [IsDelete], [CreateTime]) VALUES (3, N'Test2', N'G72sYXInucSghI/XkZby5g==', N'ShBsNNFy3U+iEHEVPzH0ig==', N'Test2@gmail.com', N'測試2', 0, 0, CAST(N'2024-07-28T22:32:24.400' AS DateTime))
SET IDENTITY_INSERT [dbo].[Account] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyAbout] ON 

INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (1, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'', CAST(N'2024-07-09T16:43:16.247' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (2, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-09T16:43:22.977' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (4, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">455434Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-09T17:08:41.190' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (5, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-09T17:08:46.847' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (6, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;6515616</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-09T17:13:15.007' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (7, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/test1 - 複製.jpg', CAST(N'2024-07-09T17:13:27.713' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (8, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-09T17:13:45.787' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (9, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-28T22:58:15.820' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (10, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/black_surprise.jpg', CAST(N'2024-07-28T22:58:23.607' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (11, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among123', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">12312Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/black_surprise.jpg', CAST(N'2024-07-28T22:58:35.160' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (12, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-28T22:58:53.370' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (13, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">123Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/LOGO.jpg', CAST(N'2024-07-29T16:11:52.040' AS DateTime))
INSERT [dbo].[CompanyAbout] ([Id], [Title], [Content], [ImagePath], [CreateTime]) VALUES (14, N'The Luxury Tayana 48 Pilothouse Lavish Woodwork Is Among', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Founded in 1973, Ta Yang Building Co., Ltd. Has built over 1400 blue water cruising yachts to date. This world renowned custom yacht builder offers a large compliment of sailboats ranging from 37&rsquo; to 72&rsquo;, many offer aft or center cockpit design, deck saloon or pilothouse options.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2003, Tayana introduced the new Tayana 64 Deck Saloon, designed by Robb Ladd, which offers the latest in building techniques, large sail area and a beam of 18 feet.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yachts have been considered the leader in building custom interiors for the last two decades, offering it`s clients the luxury of a living arrangement they prefer rather than have to settle for the compromise of a production boat. Using the finest in exotic woods, the best equipment such as Lewmar, Whitlock, Yanmar engines, Selden spars to name a few, Ta yang has achieved the reputation for building one of the finest semi custom blue water cruising yachts in the world, at an affordable price.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Peter Chen was recently appointed the General Manager of Tayana. Peter has a wide-ranging knowledge of the yacht building industry; as part of the TAYANA team, Peter&rsquo;s vision is genuinely rooted in honesty and integrity. &ldquo;Our aim is to create outstanding styling, live aboard comfort, and safety at sea for every proud Tayana owner.&rdquo;</span></p>
', N'/BackStage/CompanyImages/pit010.jpg', CAST(N'2024-07-29T16:12:03.677' AS DateTime))
SET IDENTITY_INSERT [dbo].[CompanyAbout] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyCertificate] ON 

INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (1, N'', CAST(N'2024-07-09T16:51:19.240' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (2, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2024-07-09T16:51:25.530' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (3, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2024-07-09T17:08:23.480' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (4, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.1221</span></p>
', CAST(N'2024-07-09T17:08:27.150' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (5, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2024-07-09T17:08:35.613' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (6, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.123123</span></p>
', CAST(N'2024-07-28T22:58:59.257' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (7, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2024-07-28T22:59:11.647' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (8, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2024-07-28T23:03:44.120' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (9, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.123</span></p>
', CAST(N'2024-07-29T16:12:09.717' AS DateTime))
INSERT [dbo].[CompanyCertificate] ([Id], [Content], [CreateTime]) VALUES (10, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Tayana Yacht has the approval of ISO9001: 2000 quality certification by Bureau Veritas Certification (Taiwan) Co., Ltd in 2002. In August, 2011, formally upgraded to ISO9001: 2008. We will continue to adhere to quality-oriented, transparent and committed to delivering improvement customer satisfaction and build even stronger trusting relationships with customers.</span></p>
', CAST(N'2024-07-29T16:12:14.367' AS DateTime))
SET IDENTITY_INSERT [dbo].[CompanyCertificate] OFF
GO
SET IDENTITY_INSERT [dbo].[CompanyImages] ON 

INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (1, N'certificate1651561sadf6sdf156s.jpg', N'/BackStage/CompanyImages/certificate1651561sadf6sdf156s.jpg', 1, CAST(N'2024-07-09T17:00:57.540' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (2, N'1600w-Fcz7KkZ5YaU.jpg', N'/BackStage/CompanyImages/1600w-Fcz7KkZ5YaU.jpg', 1, CAST(N'2024-07-09T17:00:57.550' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (3, N'1600w-bK_WEelNCjo.jpg', N'/BackStage/CompanyImages/1600w-bK_WEelNCjo.jpg', 0, CAST(N'2024-07-09T17:00:57.550' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (4, N'certificate1651561sadf6sdf156s.jpg', N'/BackStage/CompanyImages/certificate1651561sadf6sdf156s.jpg', 0, CAST(N'2024-07-09T17:08:17.987' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (5, N'地獄梗圖03.jpg', N'/BackStage/CompanyImages/地獄梗圖03.jpg', 1, CAST(N'2024-07-09T17:15:01.910' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (6, N'3fd8b52ff53590c18f2a918e54de85ce.png', N'/BackStage/CompanyImages/3fd8b52ff53590c18f2a918e54de85ce.png', 1, CAST(N'2024-07-09T17:15:01.917' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (7, N'meme-marketing-2.jpg', N'/BackStage/CompanyImages/meme-marketing-2.jpg', 1, CAST(N'2024-07-09T17:15:01.920' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (8, N'1600w-Fcz7KkZ5YaU.jpg', N'/BackStage/CompanyImages/1600w-Fcz7KkZ5YaU.jpg', 0, CAST(N'2024-07-10T13:30:26.160' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (10, N'VS.jpg', N'/BackStage/CompanyImages/VS.jpg', 1, CAST(N'2024-07-12T17:22:53.777' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (12, N'20210609005219.jpg', N'/BackStage/CompanyImages/20210609005219.jpg', 1, CAST(N'2024-07-28T23:01:43.470' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (13, N'48.png', N'/BackStage/CompanyImages/48.png', 1, CAST(N'2024-07-28T23:03:02.857' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (14, N'46.jpg', N'/BackStage/CompanyImages/46.jpg', 1, CAST(N'2024-07-28T23:03:02.867' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (15, N'Certificate of Yacht (1).jpg', N'/BackStage/CompanyImages/Certificate of Yacht (1).jpg', 1, CAST(N'2024-07-29T16:12:24.100' AS DateTime))
INSERT [dbo].[CompanyImages] ([Id], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (16, N'Certificate of Yacht (2).jpg', N'/BackStage/CompanyImages/Certificate of Yacht (2).jpg', 1, CAST(N'2024-07-29T16:12:24.100' AS DateTime))
SET IDENTITY_INSERT [dbo].[CompanyImages] OFF
GO
SET IDENTITY_INSERT [dbo].[DealerArea] ON 

INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (1, 1, N'Annapolis', 0, CAST(N'2024-07-04T14:53:43.257' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (2, 19, N'Paris', 0, CAST(N'2024-07-04T15:07:30.203' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (3, 1, N'San Francisco', 0, CAST(N'2024-07-05T11:17:41.703' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (4, 20, N'444444', 0, CAST(N'2024-07-09T14:20:12.870' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (5, 1, N'San Diego', 0, CAST(N'2024-07-28T22:40:31.663' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (6, 1, N'Seattle', 0, CAST(N'2024-07-28T22:40:40.367' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (7, 1, N'China', 1, CAST(N'2024-07-28T22:44:00.740' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (8, 21, N'China2', 0, CAST(N'2024-07-28T22:44:10.347' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (9, 22, N'Hong Kong', 0, CAST(N'2024-07-28T22:44:19.770' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (10, 26, N'ㄉˇ', 1, CAST(N'2024-07-29T10:40:43.597' AS DateTime))
INSERT [dbo].[DealerArea] ([Id], [CountryId], [Area], [IsDelete], [CreateTime]) VALUES (11, 28, N'Punk', 0, CAST(N'2024-07-29T16:13:04.070' AS DateTime))
SET IDENTITY_INSERT [dbo].[DealerArea] OFF
GO
SET IDENTITY_INSERT [dbo].[DealerCountry] ON 

INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (1, N'Unite States', 0, CAST(N'2024-07-03T17:01:55.440' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (19, N'Europe', 0, CAST(N'2024-07-04T12:42:09.940' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (20, N'132132', 1, CAST(N'2024-07-09T14:20:03.697' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (21, N'China', 0, CAST(N'2024-07-28T22:40:53.010' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (22, N'Hong Kong', 0, CAST(N'2024-07-28T22:41:04.590' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (23, N'E', 1, CAST(N'2024-07-28T22:48:17.160' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (24, N'123', 1, CAST(N'2024-07-28T22:56:59.557' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (25, N'132132', 1, CAST(N'2024-07-29T10:33:20.930' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (26, N'132132', 1, CAST(N'2024-07-29T10:40:33.973' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (27, N'132132', 1, CAST(N'2024-07-29T10:51:43.323' AS DateTime))
INSERT [dbo].[DealerCountry] ([Id], [Country], [IsDelete], [CreateTime]) VALUES (28, N'Cyber', 1, CAST(N'2024-07-29T16:12:54.190' AS DateTime))
SET IDENTITY_INSERT [dbo].[DealerCountry] OFF
GO
SET IDENTITY_INSERT [dbo].[Dealers] ON 

INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (1, 1, N'Noyce Yachts', N'Mr. Robert Noyce', N'4880 Church Lane Galesville, MD 20765', N'(410)263-3346', N'', N'', N'Robert@noyceyachts.com', N'www.noyceyachts.com', N'dealers001.jpg', N'/BackStage/DealersImages/dealers001.jpg', 0, CAST(N'2024-07-04T17:11:54.117' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (3, 3, N'Pacific Yacht Imports', N'Mr. Neil Weinberg', N'Grand Marina 2051 Grand Street# 12 Alameda, CA 94501, USA', N'(510)865-2541', N'(510)865-2369', N'', N'', N'www.pacificyachtimports.net', N'dealers002.jpg', N'/BackStage/DealersImages/dealers002.jpg', 0, CAST(N'2024-07-05T11:25:06.040' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (4, 2, N'Noyce Yachts2', N'Mr. Robert Noyce3', N'Grand Marina 2051 Grand Street# 12 Alameda, CA 94501, USA', N'(410)263-33463', N'(510)865-2369', N'', N'Robert@noyceyachts.com', N'www.pacificyachtimports.net', N'dealers004.jpg', N'/BackStage/DealersImages/dealers004.jpg', 0, CAST(N'2024-07-05T15:01:52.330' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (5, 4, N'453456', N'4564564', N'', N'', N'', N'', N'', N'', N'VS.jpg', N'/BackStage/DealersImages/VS.jpg', 0, CAST(N'2024-07-09T14:20:37.080' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (6, 8, N'StarBay Boats(Dalian) Co.,Ltd', N'Mr.Peter Dong', N'No.7-5 Zone B, Xinghai Square, Dalian,China P.C.116021', N'+86-411-8464 3093', N'+86-411-8464 3093', N'', N'peter_pme@163.com', N'http://www.me-cn.com', N'pngtree-chinese-people-png-image_6313717.png', N'/BackStage/DealersImages/pngtree-chinese-people-png-image_6313717.png', 0, CAST(N'2024-07-28T22:45:55.130' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (7, 9, N'Piercey Marine Limited', N'Mr. Steve Piercey', N'93 Che Keng Tuk Road, Sai Kung, HONG KONG', N'(852) 2791 4106', N'(852) 2791 4124 ', N'', N'info@pierceymarine.com', N'http://www.pierceymarine.com', N'20210609005219.jpg', N'/BackStage/DealersImages/20210609005219.jpg', 0, CAST(N'2024-07-28T22:47:01.650' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (8, 5, N'Cabrillo Yacht sales', N'Mr. Dan Peter', N'5060 N.Harbor Dr.san Diego,CA 92106', N'866-353-0409', N'(619)200-1024', N'', N'danpeter@cabrilloyachtsales.com', N'', N'dealers0034.jpg', N'/BackStage/DealersImages/dealers0034.jpg', 0, CAST(N'2024-07-28T22:48:09.240' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (9, 5, N'Cabrillo Yacht sales', N'Mr. Dan Peter', N'', N'', N'', N'', N'', N'danpeter.com', N'dealers003.jpg', N'/BackStage/DealersImages/dealers003.jpg', 0, CAST(N'2024-07-28T22:50:18.547' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (10, 6, N'Seattle Yachts', N'Ted Griffin', N'7001 Seaview Ave NW Suite 150 Seattle, WA. 98117 U.S.A.', N'206-789-8044', N'206-789-3976', N'206-819-7137', N'ted@seattleyachts.com', N'http://www.seattleyachts.com', N'Yacht-Brokerage.jpg', N'/BackStage/DealersImages/Yacht-Brokerage.jpg', 0, CAST(N'2024-07-28T22:51:42.630' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (11, 9, N'test', N'123', N'123', N'123', N'123', N'', N'', N'', N'S__32948664.jpg', N'/BackStage/DealersImages/S__32948664.jpg', 1, CAST(N'2024-07-28T22:54:32.973' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (12, 10, N'ㄉˇ', N'ㄉˇ123', N'', N'', N'', N'', N'', N'', N'pngtree-chinese-people-png-image_6313717.png', N'/BackStage/DealersImages/pngtree-chinese-people-png-image_6313717.png', 1, CAST(N'2024-07-29T10:40:57.160' AS DateTime))
INSERT [dbo].[Dealers] ([Id], [AreaId], [Name], [Contact], [Address], [Tel], [Fax], [Cell], [Email], [Link], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (13, 11, N'CD Projekt Red', N'Vincent ', N'Jagiellońska 74 E, 03-301 Warszawa, Poland', N'(410)263-3346', N'+86-411-8464 3093', N'', N'', N'https://www.cdprojekt.com/en/contact/', N'Dealer of CyberPunk 2077.jpg', N'/BackStage/DealersImages/Dealer of CyberPunk 2077.jpg', 0, CAST(N'2024-07-29T16:15:03.533' AS DateTime))
SET IDENTITY_INSERT [dbo].[Dealers] OFF
GO
SET IDENTITY_INSERT [dbo].[News] ON 

INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (47, N'TAYANA 48 setting mast', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">New Building Tayana 48 &quot;OAHANCHI&quot; setting mast in test. Estimated completing in Aug. and delivery in Nov.2017</span></p>
', 62, 0, 0, 1, 1, CAST(N'2017-07-26T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:07:10.043' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (48, N'Tayana V42 Vessel Delivery', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">BRAHMINY KITE (Tayana V42 Hull 188) sail away from Kaohsiung to Malaysia on Apr. 19</span><sup style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif;">th</sup><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">, 2017 after completing commissioning and sea trial. Captains Philippe &amp; Anderson are happy their staying in Taiwan and admire our People friendly. Bon Voyage.</span></p>
', 64, 1, 0, 1, 1, CAST(N'2017-04-20T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:08:01.003' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (49, N'Tayana V42 Vessel Delivery', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">BRAHMINY KITE (Tayana V42 Hull 188) sail away from Kaohsiung to Malaysia on Apr. 19</span><sup style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif;">th</sup><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">, 2017 after completing commissioning and sea trial. Captains Philippe &amp; Anderson are happy their staying in Taiwan and admire our People friendly. Bon Voyage.</span></p>
', 67, 0, 0, 1, 0, CAST(N'2016-05-18T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:08:31.667' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (50, N'TAYANA 47 PEREGRINA’S JOURNEY', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">In 2010, TAYANA 47 PEREGRINA&rsquo;s owner Peter and his family began their journey from Miami. During 5 &frac12; year circumnavigation, they visited 35 countries and traveled about 34,000 miles with safety. Peter recorded all journeying stories with words and pictures in his blog. If you are interested in their journey, please visit his blog&nbsp;</span><a href="https://web.archive.org/web/20170824082241/http://www.blog.mailasail.com/peregrina" style="font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;" target="_blank">www.blog.mailasail.com/peregrina</a><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">. We believe that you will feel amazed at their journey.&nbsp;</span></p>
', 68, 0, 0, 1, 1, CAST(N'2016-05-13T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:09:18.437' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (51, N'Tayana 48 (H.P.F) winning a prize', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">There were two Tayana yachts joining the&ldquo;Taiwan-Okinawa Friendship International Yacht Race&rdquo;, one was T48 (H.P.F) and the other was T58 (Eagles Quest II). T48 owner (Chih Yung Lee) and his sailors sailed almost 130 nautical miles from Keelung to Ishigaki in the bad sea condition. After finishing the race, they won the third prize in class B and got a Okinawa classic wine.</span></p>
', 69, 0, 0, 1, 0, CAST(N'2016-05-13T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:09:49.020' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (52, N'T58-110 Eagles Quest II visited Taiwan', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">Our T58 owner K.D. Chu from Hong Kong just led his crew finished the&ldquo;Taiwan-Okinawa Friendship International Yacht Race&rdquo;. After a couple days staying in Taiwan for maintenance and refuel, Eagles Quest II began her new journey on May 7</span><sup style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif;">th&nbsp;</sup><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">. Japan is the next calling and then plan to cross Arctic Ocean in this summer.</span></p>
', 18, 0, 0, 0, 0, CAST(N'2016-05-11T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:10:06.317' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (53, N'Gang-Bu elementary school after-school activities', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">The students at Gang-Bu elementary school have an after-school activities to Visit our factory today. After brief introduction, we lead them to see our yachts and molds. The children are very excited and get much yacht knowledge that they less read from their textbook.</span></p>
', 70, 0, 0, 1, 0, CAST(N'2016-04-29T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:10:31.837' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (54, N'2016 Taiwan Boat Show closed', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">2016 Taiwan INT&rsquo;L Boat show closed on Mar 14</span><sup style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif;">th</sup><span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">, 2016. There are over thousands of visitors during boat show time. What a terrific Boat Show for Taiwan, a truly international standard! Tayana 37 gets lots of praises on her interior and exterior.</span></p>
', 71, 0, 0, 1, 0, CAST(N'2016-03-15T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:11:00.070' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (55, N'2016 Taiwan Boat Show', N'<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<span style="font-size: 12px;">Welcome to visit us in Taiwan INT&#39;L Boat Show March 10-13 , 2016</span></p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<span style="font-size: 12px;"><span style="line-height: 24.48px;">TAYANA</span><span style="line-height: 24.48px;">&nbsp;will exhibit&nbsp;&nbsp;</span><span style="line-height: 24.48px;">&quot;TAYANA 37&quot;</span><span style="line-height: 24.48px;">&nbsp;in Kaohsiung exhibition center.</span>&nbsp;</span></p>
', 72, 0, 0, 1, 0, CAST(N'2016-01-08T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:11:36.197' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (56, N'TAYANA42 Electromechanical Testing', N'', 73, 0, 0, 1, 0, CAST(N'2015-12-24T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:13:06.727' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (57, N'SONEVA IN AQUA I sea trial', N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 11px;">SONEVA IN AQUA sea trial in kaohsiung two days(Sep 17-18,2015),and her sail speed&nbsp;above&nbsp;&nbsp;8 knots. After final check and renovation,she will be delivered to Maldives.SONEVA IN AQUA is the biggest yacht that TAYANA had built, and her success reveal TAYANA &#39;s&nbsp;</span><span class="hps" style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 11px;">technology is c<span class="hps">ontinuous progress. TAYANA don&#39;t&nbsp;</span>&nbsp;be satisfied and will keep on buiding more outstanding yachts in the future.</span></p>
', 78, 0, 0, 1, 0, CAST(N'2015-09-25T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:13:32.360' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (58, N'New General Manager', N'<ul style="margin: 0px; padding-right: 0px; padding-left: 0px; list-style-type: none; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	<li style="margin: 0px; padding: 0px; list-style-type: none; display: inline;">
		Mr.Joy Huang is the new General Manager of TAYANA</li>
</ul>
', 79, 0, 0, 1, 0, CAST(N'2015-08-14T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:14:47.987' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (59, N'TEST', N'<p>
	asdasd</p>
', 80, 0, 0, 1, 1, CAST(N'2024-07-15T00:00:00.000' AS DateTime), CAST(N'2024-07-15T18:18:41.190' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (60, N'0718222', N'<p>
	sadasdasd222</p>
', 83, 0, 1, 1, 1, CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-18T14:17:22.813' AS DateTime))
INSERT [dbo].[News] ([Id], [Title], [Content], [CoverId], [IsTop], [IsDelete], [HasImage], [HasFile], [NewsDate], [CreateTime]) VALUES (61, N'Cyberpunk 2077 Yacht Unveiled in Futuristic Ribbon-Cutting Ceremony', N'<p>
	In a dazzling display of futuristic innovation and luxury, the Cyberpunk 2077 yacht was unveiled yesterday in a spectacular ribbon-cutting ceremony. The event, held at a high-tech marina, was attended by industry leaders, yachting enthusiasts, and media from around the world.</p>
<p>
	&nbsp;</p>
<p>
	The ceremony featured the yacht&#39;s captain, adorned in a sleek, cyberpunk-inspired uniform, taking center stage. With a pair of oversized, high-tech scissors, the captain ceremoniously cut through a vibrant red ribbon, officially launching the Cyberpunk 2077 into the world of luxury yachting.</p>
<p>
	&nbsp;</p>
<p>
	The backdrop of the event was nothing short of breathtaking. The Cyberpunk 2077, with its sleek, angular hull and neon accents, was surrounded by a high-tech stage setup complete with neon lights, holographic displays, and pulsating electronic music. The yacht itself, a marvel of modern engineering, showcased its cutting-edge design and advanced features, promising an unparalleled yachting experience.</p>
<p>
	&nbsp;</p>
<p>
	Guests were treated to a tour of the yacht, revealing its state-of-the-art amenities including luxury cabins equipped with smart home technology, an open-concept salon with panoramic views, and a dining area featuring an automated chef system. The yacht&#39;s twin 3000 HP hybrid engines, advanced AI-driven navigation system, and eco-friendly innovations were highlights of the tour, emphasizing the vessel&#39;s blend of performance, luxury, and sustainability.</p>
<p>
	&nbsp;</p>
<p>
	The ceremony concluded with a round of applause and cheers from the attendees, who were left in awe of the Cyberpunk 2077&#39;s futuristic elegance and technological prowess. As the yacht set sail for its maiden voyage, it marked the beginning of a new era in luxury yachting, where cutting-edge technology meets unparalleled comfort and style.</p>
<p>
	&nbsp;</p>
', 85, 0, 1, 1, 1, CAST(N'2024-07-18T00:00:00.000' AS DateTime), CAST(N'2024-07-29T16:09:26.987' AS DateTime))
SET IDENTITY_INSERT [dbo].[News] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsFile] ON 

INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (27, 47, N'空白 - 複製 (2).docx', N'/BackStage/NewsFiles/News_47/空白 - 複製 (2).docx', 0, CAST(N'2024-07-15T18:07:10.050' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (28, 47, N'空白 - 複製 (2).pdf', N'/BackStage/NewsFiles/News_47/空白 - 複製 (2).pdf', 0, CAST(N'2024-07-15T18:07:10.057' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (29, 47, N'空白 - 複製 (3).docx', N'/BackStage/NewsFiles/News_47/空白 - 複製 (3).docx', 0, CAST(N'2024-07-15T18:07:10.057' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (30, 48, N'空白 - 複製 (5).pdf', N'/BackStage/NewsFiles/News_48/空白 - 複製 (5).pdf', 0, CAST(N'2024-07-15T18:08:01.010' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (31, 48, N'空白 - 複製 (6).docx', N'/BackStage/NewsFiles/News_48/空白 - 複製 (6).docx', 0, CAST(N'2024-07-15T18:08:01.013' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (32, 50, N'1326663.jpg', N'/BackStage/NewsFiles/News_50/1326663.jpg', 0, CAST(N'2024-07-15T18:09:18.443' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (33, 59, N'中大型游艇.jpg', N'/BackStage/NewsFiles/News_59/中大型游艇.jpg', 0, CAST(N'2024-07-15T18:18:41.193' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (34, 59, N'空白 - 複製.docx', N'/BackStage/NewsFiles/News_59/空白 - 複製.docx', 0, CAST(N'2024-07-15T18:18:53.740' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (35, 59, N'空白 - 複製.pdf', N'/BackStage/NewsFiles/News_59/空白 - 複製.pdf', 0, CAST(N'2024-07-15T18:18:53.743' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (36, 59, N'空白.docx', N'/BackStage/NewsFiles/News_59/空白.docx', 0, CAST(N'2024-07-15T18:18:53.750' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (37, 59, N'空白.pdf', N'/BackStage/NewsFiles/News_59/空白.pdf', 0, CAST(N'2024-07-15T18:18:53.750' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (38, 59, N'新文字文件 - 複製 (2).txt', N'/BackStage/NewsFiles/News_59/新文字文件 - 複製 (2).txt', 0, CAST(N'2024-07-15T18:18:53.760' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (39, 59, N'新文字文件 - 複製 (3).txt', N'/BackStage/NewsFiles/News_59/新文字文件 - 複製 (3).txt', 0, CAST(N'2024-07-15T18:18:53.760' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (40, 60, N'instpubs.sql', N'/BackStage/NewsFiles/News_60/instpubs.sql', 0, CAST(N'2024-07-18T14:17:22.817' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (41, 61, N'Yacht CyberPunk 2077 Distinguishing Features.pdf', N'/BackStage/NewsFiles/News_61/Yacht CyberPunk 2077 Distinguishing Features.pdf', 1, CAST(N'2024-07-29T16:09:45.253' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (42, 61, N'Yacht CyberPunk 2077 Layout .pdf', N'/BackStage/NewsFiles/News_61/Yacht CyberPunk 2077 Layout .pdf', 1, CAST(N'2024-07-29T16:09:45.257' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (43, 61, N'Yacht CyberPunk 2077 Distinguishing Features.pdf', N'/BackStage/NewsFiles/News_61/Yacht CyberPunk 2077 Distinguishing Features.pdf', 0, CAST(N'2024-07-29T16:10:29.863' AS DateTime))
INSERT [dbo].[NewsFile] ([Id], [NewsId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (44, 61, N'Yacht CyberPunk 2077 Layout .pdf', N'/BackStage/NewsFiles/News_61/Yacht CyberPunk 2077 Layout .pdf', 0, CAST(N'2024-07-29T16:10:29.867' AS DateTime))
SET IDENTITY_INSERT [dbo].[NewsFile] OFF
GO
SET IDENTITY_INSERT [dbo].[NewsImage] ON 

INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (18, 0, N'Default Thumbnail330551993_1213323659543185_6818128368040108673.jpg', N'/BackStage/NewsFiles/Default Thumbnail330551993_1213323659543185_6818128368040108673.jpg', 0, CAST(N'2024-07-12T10:53:22.040' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (62, 47, N'40f2fbf47c157d40e1b8509f648388d3.jpg', N'/BackStage/NewsFiles/News_47/40f2fbf47c157d40e1b8509f648388d3.jpg', 0, CAST(N'2024-07-15T18:07:10.060' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (63, 47, N'106437IB-H041_L.jpg', N'/BackStage/NewsFiles/News_47/106437IB-H041_L.jpg', 0, CAST(N'2024-07-15T18:07:10.063' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (64, 48, N'112243IB-H041_L.jpg', N'/BackStage/NewsFiles/News_48/112243IB-H041_L.jpg', 0, CAST(N'2024-07-15T18:08:01.013' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (65, 48, N'1326663.jpg', N'/BackStage/NewsFiles/News_48/1326663.jpg', 0, CAST(N'2024-07-15T18:08:01.023' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (66, 48, N'22365360.jpg', N'/BackStage/NewsFiles/News_48/22365360.jpg', 0, CAST(N'2024-07-15T18:08:01.030' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (67, 49, N'2014071856392757.jpg', N'/BackStage/NewsFiles/News_49/2014071856392757.jpg', 0, CAST(N'2024-07-15T18:08:31.670' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (68, 50, N'中大型游艇.jpg', N'/BackStage/NewsFiles/News_50/中大型游艇.jpg', 0, CAST(N'2024-07-15T18:09:18.447' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (69, 51, N'aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', N'/BackStage/NewsFiles/News_51/aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', 0, CAST(N'2024-07-15T18:09:49.023' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (70, 53, N'HsYeANay5PzJmKmS3gzV9t.jpg', N'/BackStage/NewsFiles/News_53/HsYeANay5PzJmKmS3gzV9t.jpg', 0, CAST(N'2024-07-15T18:10:31.843' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (71, 54, N's20160315042844.jpg', N'/BackStage/NewsFiles/News_54/s20160315042844.jpg', 0, CAST(N'2024-07-15T18:11:00.077' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (72, 55, N's20160108033100.jpg', N'/BackStage/NewsFiles/News_55/s20160108033100.jpg', 0, CAST(N'2024-07-15T18:11:36.207' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (73, 56, N'45345.jpg', N'/BackStage/NewsFiles/News_56/45345.jpg', 0, CAST(N'2024-07-15T18:13:06.730' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (74, 56, N'45345345212.png', N'/BackStage/NewsFiles/News_56/45345345212.png', 0, CAST(N'2024-07-15T18:13:06.733' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (75, 56, N'453453.png', N'/BackStage/NewsFiles/News_56/453453.png', 0, CAST(N'2024-07-15T18:13:06.743' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (76, 56, N'0211123.jpg', N'/BackStage/NewsFiles/News_56/0211123.jpg', 0, CAST(N'2024-07-15T18:13:06.750' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (77, 56, N'0111.jpg', N'/BackStage/NewsFiles/News_56/0111.jpg', 0, CAST(N'2024-07-15T18:13:06.750' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (78, 57, N's20150925075149.jpg', N'/BackStage/NewsFiles/News_57/s20150925075149.jpg', 0, CAST(N'2024-07-15T18:13:32.363' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (79, 58, N's20150814040047.jpg', N'/BackStage/NewsFiles/News_58/s20150814040047.jpg', 0, CAST(N'2024-07-15T18:14:47.993' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (80, 59, N'unnamed (2).jpg', N'/BackStage/NewsFiles/News_59/unnamed (2).jpg', 0, CAST(N'2024-07-15T18:18:41.197' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (81, 59, N'VaMFiMXraLeAPLSNuTWEfe.jpg', N'/BackStage/NewsFiles/News_59/VaMFiMXraLeAPLSNuTWEfe.jpg', 0, CAST(N'2024-07-15T18:18:41.203' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (82, 59, N'YaUcHYiD4Wcpb87c92pxh7.jpg', N'/BackStage/NewsFiles/News_59/YaUcHYiD4Wcpb87c92pxh7.jpg', 0, CAST(N'2024-07-15T18:18:41.207' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (83, 60, N'test1 - 複製.jpg', N'/BackStage/NewsFiles/News_60/test1 - 複製.jpg', 0, CAST(N'2024-07-18T14:17:22.823' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (84, 60, N'pit010.jpg', N'/BackStage/NewsFiles/News_60/pit010.jpg', 0, CAST(N'2024-07-18T14:17:40.923' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (85, 61, N'News Images of CyberPunk 2077  (1).jpg', N'/BackStage/NewsFiles/News_61/News Images of CyberPunk 2077  (1).jpg', 0, CAST(N'2024-07-29T16:09:45.257' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (86, 61, N'News Images of CyberPunk 2077  (2).jpg', N'/BackStage/NewsFiles/News_61/News Images of CyberPunk 2077  (2).jpg', 0, CAST(N'2024-07-29T16:09:45.260' AS DateTime))
INSERT [dbo].[NewsImage] ([Id], [NewsId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (87, 61, N'News Images of CyberPunk 2077  (3).jpg', N'/BackStage/NewsFiles/News_61/News Images of CyberPunk 2077  (3).jpg', 0, CAST(N'2024-07-29T16:09:45.260' AS DateTime))
SET IDENTITY_INSERT [dbo].[NewsImage] OFF
GO
SET IDENTITY_INSERT [dbo].[Yacht] ON 

INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (2, N'Tayana', N'37', 0, 0, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">The Tayana 37 is perhaps the most successful semi-custom cruising boat to be built. It was designed by Bob Perry and introduced in 1975 as a response to the Westsail 32 which were selling in enormous numbers. Today looking back, with the boat still in production with a boat count of 588, most still sailing, and an active and owners community, its very apparent that Perry has succeeded.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">One could say the boat was designed to ignite imaginations of tropical sunsets in exotic locations; think oodles of teak and a beautiful custom interior, wrapped into traditional double-ender hull with a full keel. Beneath the alluring romance, you&rsquo;ll find a boat that is solidly built, and indeed many Tayana 37s can be found on the blue water cruising circuit around the world.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">Tayana 37 has been constructed of the finest materials, using the best techniques. There is no better yacht in her size range on the market. With care and proper maintenance she will not only prove to be an excellent investment, she will take you cruising anywhere in the world safely and comfortably. This is being proven almost daily. Ocean crossings by Tayana 37&rsquo;s are routine. Circumnavigations have been reported. By the same token, over 500 of these yachts are the primary homes of their owners.</span></p>
', N'/BackStage/YachtFiles/Yacht_2/Dimension/37Dimension.jpg', 21, 0, CAST(N'2024-07-21T00:00:45.863' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (5, N'TEST', N'1', 1, 0, N'<p>
	TEST</p>
', N'/BackStage/YachtFiles/Yacht_5/Dimension/螢幕擷取畫面 2024-07-20 235122.png', 23, 1, CAST(N'2024-07-22T12:31:20.957' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (6, N'Test', N'2 ', 0, 0, N'<p>
	asdafsdf</p>
', N'/BackStage/YachtFiles/Yacht_6/Dimension/37Dimension.jpg', 24, 1, CAST(N'2024-07-22T15:35:51.390' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (7, N'Test', N'3', 0, 0, N'<p>
	4345</p>
', N'/BackStage/YachtFiles/Yacht_7/Dimension/37Dimension.jpg', 26, 1, CAST(N'2024-07-22T15:41:57.407' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (8, N'Test', N'12', 1, 1, N'<p>
	sadasd</p>
', N'/BackStage/YachtFiles/Yacht_8/Dimension/37Dimension.jpg', 37, 1, CAST(N'2024-07-22T17:39:25.183' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (9, N'Tayana', N'42', 0, 0, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">Putting thoroughbred performance into performance cruisers has never been easy. In his Vancouver 42, however, Robert Harris has made it look easy. Combing rugged good looks, liveaboard volume, and go-anywhere capabilities in a boat that still ghosts racily in single-digit wind strengths is quite a feat. On top of that, Harris made here a double-ender. To this exceptional design the builder, Ta-Yang of Taiwan, brings both an internationally acclaimed standard of construction quality and a refined semicustom flexibility that gives individual sailors exceptional control of the look and layout of their boats. The formula for making husky boats sail like-sylphs is one that Harris has explored in depth throughout his decades at the forefront of sailboat design. Oversimplified, that approach involves a very slippery hull, a very powerful sailplan, and a set of jumbo underwater foils that are as efficient as they are big. Although the Vancouver 42 displaces close to 30,000 pounds, Harris has made it possible for her to carry that weight with considerable grace. For pure power and for coast-wise sailing, she can be rigged as a sloop. The vast majority of buyers, however, specify the cutter rig and its putative superiority for passagemaking. An even wider range of options is available below. Dealers in the States have become very adept at working with factory- so adept that they are able to make next-day price quotations on custom arrangements Auto-cad aid or facsimile-copied to Taiwan. Ta Yang yard have developed an expertise and a price in exercising it that are evident in the 42 from her superbly finished glass moldings to the seamanlike way in which her systems have been integrated into units organized to function well.</span></p>
', N'/BackStage/YachtFiles/Yacht_9/Dimension/V42-1.png', 39, 0, CAST(N'2024-07-26T16:42:41.653' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (10, N'Tayana', N'44', 1, 0, N'<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	This is &quot;don&#39;t miss news&quot; from one of the world&#39;s oldest and most successful offshore yacht builders. Tayana has been staying busy working on a comprehensive program of new boat development. With customer product development, the new Tayana 44 is a reality ! With a keen ear we listened to offshore sailors around the world. Now, the Dixon designed 44 is the latest in the pround Tayana fleet. The Tayanaworld flagship Ladd 64, the Dixon 54 and now the 44 share the same design, quality and value that you demand. Team up with our experts and cruise beautifully with TAYANA !</p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	&nbsp;</p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px;">
	Quality, Performance and Value-Welcome to the new Tayanaworld Yachts !</p>
', N'/BackStage/YachtFiles/Yacht_10/Dimension/V44-1.png', 47, 0, CAST(N'2024-07-26T16:51:04.420' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (11, N'Tayana', N'46', 0, 0, N'<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">
	Tayana VANCOUVER 460</p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">
	Well, finally, here she is!<br />
	　<br />
	With the New Tayana/Vancouver 460 Pilot, Robert B. Harris has achieved a unique break-through in design. A yacht that combines long haul passage-making with crew comfort, luxury and extensive cruising amenities unseen before in yachts under 65 feet.</p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">
	The design of the Tayana/Vancouver 460 Pilot smoothly blends the Vancouver tradition of a powerful proven sea kindly hull, with the latest refinements in hull design. With its very respectable speed under sail or power, and with the added luxury and protection of a true pilothouse, she has the ability to cross the world&#39;s oceans in safety and comfort without compromise, driving through the roughest of sea conditions with power and control. With all lines brought back to the cockpit (including 8 lines in 2 conduits) and 2 separate, fully instrumented steering stations, she can be handled by 1 or 2 people in safety and comfort. Imagine a pilot house with clean, beautiful lines, the 6&#39;5&quot; headroom underneath creating 33% more space than similar sized yachts. We have an exciting new keel which is encapsulated lead in an elongated bulb &amp; now the option of an extra salt water keel ballast system. The keel is designed to complement a no-nonsense, work to weather, deep-chested yacht. No saucer shaped hulls for us! Built in Taiwan by the world famous Tayana Yachts, she is a head-turning new boat design combining the enviable Vancouver heritage with the finest in cruising design and safety. A fresh new design whose time has arrived.</p>
<p style="margin: 0px; padding: 0px; color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">
	We have a choice of rigs, High Seas or ICW and an amazing angle of vanishing stability of zero degrees! You can choose one of two transoms: Traditional or Sugar Scoop, and we can customize to a high degree to help create your dream yacht.<br />
	　<br />
	She is a Tayana Yacht built by the famous Ta-Yang Shipyard in Taiwan.</p>
', N'/BackStage/YachtFiles/Yacht_11/Dimension/46.jpg', 51, 0, CAST(N'2024-07-26T16:58:20.410' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (12, N'Tayana', N'48', 0, 0, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">Many sailors want a boat with traditional looks, fine joinery, strong construction, conservative lines, and all the modern convenience. The craftsmen at Tayana have been putting those elements together for years. Tayana 48 the hull is a solidly built Bob design, and the cruising skipper can create an interior layout choosing from a range of options designed around the popular center cockpit configuration. The 40-foot waterline is relatively long to produce good speed, and the boat&#39;s underwater profile features a long-chord keel of moderate draft and a solid rudder mounted on a large skeg for good tracking and control response. The hull has a moderate reverse transom. All these components together form a contemporary and well-proportioned boat. Every Tayana can be slightly different below to accommodate in the individual owner&#39;s needs. The design process is an easy one, since Tayana&#39;s factory dealers use a computer-aided design (CAD) system to layout potential interiors suited to specific needs. In winds that ranged from 10-20 knots for the test sail, the cutter rig 48 slid through the short, steep waves easily with a solid, gentle motion. The boat sails well to windward in these conditions, and off the wind it tracks ruler straight; it&#39;s stable and easy to steer. The Tayana 48 represents a refined approach to the questions of getting a well-executed interior and a solid, proven hull form. The Tayana 48 DS is a variation on the company&#39;s popular 48-footer. Designer Rob Ladd added a deck saloon and raised the floor structure on Bob Perry&#39;s original hull to create a spacious, open interior. Raising the saloon floor not only improved visibility from the cabin, but also opened more space for tankage, always welcome on a cruiser. Warm, traditional teak joinery is everywhere. The large wrap-around saloon windows keep the living spaces bright, and headroom ( in spite of the raised floor) will make any tall sailor smile, but additional handholds below would make navigating the wide-open interior easier. The master cabin aft is equipped with a large double bunk on centerline, a private head and stand-up shower stall, a hanging locker, and plenty of storage space. Two-and three-cabin accommodation plans are available for guest staterooms. The boat&#39;s system are carefully installed, with substantial wiring and plumbing that should hold up for years, but this is a complex vessel. The genset is mounted where it will have to be removed to gain access to the front of the engine for repairs, and, because the stainless steel tanks are mounted in the bilge, periodic checks for corrosion are in order. Diligent monitoring and familiarity with the systems and/or careful selection of a knowledgeable mechanic will be essential. On deck, torails that are more like mini bulwarks combine with 32-inch-tall lifelines and tree-sturdy stanchions stanchions to provide a secure feeling under way. The high center cockpit is comfortable and dry, but there is a large step down from the cockpit to the deck. The ground-tackle system is outstanding. Hefty bow rollers and a powerful windlass make it easy to set and raise the hook, and oversized polished stainless mooring cleats are strong, well placed, and aesthetically pleasing. The Tayana 48DS is big and strong enough to take care of you on a passage, and it will wrap you in luxury as well.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">Designer&#39;s comments The design target for the Tayana 48 was to produce a boat that would outperform the competition in this size range in both boat speed and interior volume. This began with a comparative process not unlike the type used by designers designing racing yachs. Hull proportions were studied along with interior layouts in order to produce a hull that was not entirely based upon getting the maximum number of cubic feet into the allotted length overall. The general hull form features overhangs on the short side for a long useable sailing length. The sections shown moderate deadrise running from the forefoot to just aft of amidships where it begins to flatten out. All deadrise is gone at the transom. Beam at the waterline (BWL) is generous for good initial stability. Beam aft is moderate insuring that the 48 will not show distorted asymmetry when heeled that can lead to wicked helm situation and a boat with two personalities. The rig is positioned well forward in this design. This does two things that work to the cruisers advantage. It creates a rig that is forgiving in terms of helm balance and the need to reef in order to keep the boat manageable in a breeze. This boat has the power in it&#39;s stability to be pressed hard and you can&#39;t take advantage of that without good helm balance. This mast positional also results in the mast being lined up with the main bulkhead which opens up the main saloon space and makes strong chainplate attachment easy. The interior is available in either a three stateroom or two stateroom layout. Numerous optional arrangements are available as are further customizations to the existing layouts. Headroom is excellent in this design due to the deck onfiguration. My association with the Ta Yang yard goes back to the third fiberglass boat I ever designed, the venerable Tayana 37. The detailing is clean and the joinerwork is excellent. A new 48 shows just how far this Taiwanese yard has come in the last 20 years.</span></p>
', N'/BackStage/YachtFiles/Yacht_12/Dimension/37Dimension.jpg', 62, 0, CAST(N'2024-07-26T17:10:58.863' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (13, N'Tayana', N'52', 0, 0, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">Breaking 400 means a lot in baseball. In the world of production auxiliary sailboats, it can mean even more. The Ta Yang yard built and sold over 600 of Bob Perry&#39;s Tayana 37s. It&#39;s not surprising that it gave him another turn at the plate. This time up produced the Tayana 52. She is a fast cruiser of moderate draft. Perry tried hard to work greater than expected stability into the equation, through both the extra-firm turn that he gave her bilges and the depth to which he sunk her more than 7 tons of ballast in her longish fin keel. Available in either aft- or center- cockpit configurations, the 52 retains quite a traditional air, no matter how you slice her deck mold. Achieving 6-foot 6-inch headroom while maintaining a low silhouette is something that Perry says is &quot;nothing tricky, just a matter of lots of little details.&quot; Her modern masthead rig is well understood by sailors and offers a good helping of power in most wind conditions. An inner forestay suitable for a staysail adds lots of versatility to the setup. Ta Yang allows considerable owner involvement in detailing the below decks accommodations. Lockers and drawers are there in the standard layout in an abundance the proves that a good amount of thought has gone into helping a boat of this size support the large number that she can sleep.</span><br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<br style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;" />
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">From her counter stern to her characteristically Perry scimitar bow, the Tayana 52 helps to illustrate why Perry&#39;s designs tend to be hit far more than the average. Robert Perry said that Tayana has the &quot;sweetest sheer&quot; he has ever drawn.Few yachts exhibit the stunning symmetry and the sheer beauty of the 52. Whether lying at anchor or playing with high sweeping seas, she is an eye-catcher of the first magnitude. The Tayana 52 is truly a magnificent sailing machine.</span></p>
', N'/BackStage/YachtFiles/Yacht_13/Dimension/S__32948664.jpg', 72, 0, CAST(N'2024-07-26T17:14:22.263' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (14, N'Tayana', N'54', 0, 1, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">&quot;Tayana 54 Designers Comments&quot; We are excited by our first design for Ta-Yang the centre cockpit, raised saloon Tayana 54. A truly contemporary design that does not compromise comfort and sailing performance a design that has evolved to meet the demands of today&#39;s cruising yachtsman. Well suited to both coastal cruising and long distance sailing. The design encompasses Bill Dixon&#39;s 25 years of experience designing and cruising centre cockpit yachts. An undistorted hull characterised by its long waterline, fine entry, beam carried aft, will ensure a high degree of performance, comfort and stability. The integrally moulded keel allows the internal lead ballast to be secure and low. The modern cruising sailor is influencing deck design and layouts, with emphasis on large comfortable cockpits. The Tayana 54 has an unusually large wide centre cockpit, a cockpit more normally associated with aft cockpit designs. Additional to this is dedicated aft deck seating introducing a second leisure area to the deck, with direct access and stairs to the transom platform. The high freeboard hull allows the coach roof to be low and sporty, keeping the cockpit relatively low against the shear. The layout of the cockpit ensures ease of handling with its dedicated areas for sail control, and sailing shorthanded. Deck storage is provided by a full width lazerette aft, and a forepeak locker. A high aspect ratio cutter rig was the chosen configuration with its excellent combination of handling and performance, the handling enhanced further by the selftacking staysail. With hull beam carried aft and good freeboard, the Tayana has a very voluminous interior despite the large cockpit. Aft is a truly spacious airy owner&#39;s cabin with large en-suite facilities. The large galley is conveniently located in the passageway to the owner&#39;s cabin. From the galley there is access to a walk-in engine room with enough space to access and service all the equipments modern yachts inevitably carry. The raised saloon is wide and airy with hull ports and the large coach roof windows, with the chart table is located beside the companionway. All fuel and water tanks are located under the saloon for optimum weight placement. The combination of Dixon Yacht Design&#39;s experience, and Ta Yang&#39;s reputation will ensure the Tayana 54 will be an outstanding yacht suited the requirements of the modern cruising yachtsman.</span></p>
', N'/BackStage/YachtFiles/Yacht_14/Dimension/52.png', 81, 0, CAST(N'2024-07-26T17:16:29.877' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (15, N'Tayana', N'55', 0, 0, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">The Tayana 55/58 is designed by the Dutch Naval Architect and designer. Pieter Beeldsnijder, who is recognized throughout the world as premier designer. The Tayana 55/58 is designed and built for serious cruising. The hull is one of the most durable, versatile, safest and best performing hulls in its class. The wide (16&#39;2&quot;) beam of T55/58 easily accommodates a three or four cabin layout; and few if any yachts of its size can carry it&#39;s standard three cabin layout with a full stand up engine room and workbench so effortlessly. Can you handle a bigger boat ?? Our philosophy at Tayana yachts is, sailing should be a pleasure. Our Tayana 55/58 can be easily handled by a cruising couple by incorporating modern sailing technologies. The Tayana 58DS is the latest evolution the legendary Tayana 55. The deck saloon provides light, air, visibility, and protection.extra large tankage for both fuel and water is another gained feature of the raised sole in the Deck Saloon series. The Tayana 58DS is beautiful cruising yacht with very respectable performance characteristics. It incorporates the latest technologies in hardware and equipment. The custom interior joinery work of Ta Yang is legendary. We invite you to compare us inch for inch and winch for winch with the competition&hellip; and then compare the cost. We believe, that we will make a believer out of you.</span></p>
', N'/BackStage/YachtFiles/Yacht_15/Dimension/37Dimension.jpg', 91, 0, CAST(N'2024-07-26T17:21:24.547' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (16, N'Tayana', N'58', 0, 0, N'<p>
	<span style="color: rgb(63, 63, 63); font-family: Arial, Helvetica, sans-serif; font-size: 14.4px; text-align: justify;">The Tayana 55/58 is designed by the Dutch Naval Architect and designer. Pieter Beeldsnijder, who is recognized throughout the world as premier designer. The Tayana 55/58 is designed and built for serious cruising. The hull is one of the most durable, versatile, safest and best performing hulls in its class. The wide (16&#39;2&quot;) beam of T55/58 easily accommodates a three or four cabin layout; and few if any yachts of its size can carry it&#39;s standard three cabin layout with a full stand up engine room and workbench so effortlessly. Can you handle a bigger boat ?? Our philosophy at Tayana yachts is, sailing should be a pleasure. Our Tayana 55/58 can be easily handled by a cruising couple by incorporating modern sailing technologies. The Tayana 58DS is the latest evolution the legendary Tayana 55. The deck saloon provides light, air, visibility, and protection.extra large tankage for both fuel and water is another gained feature of the raised sole in the Deck Saloon series. The Tayana 58DS is beautiful cruising yacht with very respectable performance characteristics. It incorporates the latest technologies in hardware and equipment. The custom interior joinery work of Ta Yang is legendary. We invite you to compare us inch for inch and winch for winch with the competition&hellip; and then compare the cost. We believe, that we will make a believer out of you.</span></p>
', N'/BackStage/YachtFiles/Yacht_16/Dimension/37Dimension.jpg', 101, 0, CAST(N'2024-07-26T17:23:38.970' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (17, N'ISARA ', N'50', 1, 0, N'<h2>
	Overview of the ISARA 50 Yacht</h2>
<h3>
	Introduction</h3>
<p>
	The ISARA 50 is a luxurious and sophisticated sailing yacht, epitomizing elegance and performance on the open water. Designed for those who seek both adventure and comfort, the ISARA 50 seamlessly blends cutting-edge technology with exquisite craftsmanship, offering an unparalleled yachting experience.</p>
<h3>
	Design and Construction</h3>
<p>
	The ISARA 50 stands out with its sleek, modern design that is both aesthetically pleasing and highly functional. The yacht&#39;s hull is crafted from high-quality composite materials, ensuring durability and optimal performance. Its streamlined shape and innovative hull design reduce drag and enhance speed, making it perfect for long voyages and quick getaways alike.</p>
<p>
	The deck layout is meticulously planned to maximize space and functionality. It features wide walkways, ample seating areas, and strategically placed handrails for safety. The spacious cockpit is designed for socializing and relaxation, equipped with comfortable seating and a large dining table for al fresco meals.</p>
<h3>
	Interior</h3>
<p>
	Step inside the ISARA 50, and you&#39;ll be greeted by a world of luxury. The interior is elegantly designed, with high-quality finishes and attention to detail evident in every corner. The open-plan saloon is bathed in natural light, thanks to large panoramic windows, creating a bright and inviting atmosphere.</p>
<p>
	The yacht boasts a fully equipped galley with modern appliances, allowing for gourmet meal preparation even while at sea. The saloon area is perfect for entertaining guests, with plush seating and a state-of-the-art entertainment system.</p>
<p>
	Accommodation on the ISARA 50 is nothing short of exceptional. The yacht features multiple cabins, each designed to provide maximum comfort and privacy. The master suite is a true retreat, with a spacious bed, ample storage, and an en-suite bathroom with luxurious fittings. Guest cabins are equally well-appointed, ensuring everyone on board enjoys a restful night&#39;s sleep.</p>
<h3>
	Performance and Handling</h3>
<p>
	The ISARA 50 is engineered to deliver exceptional performance on the water. Its advanced sail plan and rigging systems make it easy to handle, whether you&#39;re an experienced sailor or a novice. The yacht is equipped with a powerful engine, ensuring smooth and efficient cruising even in calm conditions.</p>
<p>
	Innovative technology is at the heart of the ISARA 50&#39;s performance. The yacht features an advanced navigation system, providing real-time data and ensuring safe and accurate passage planning. The helm station is ergonomically designed, with intuitive controls and excellent visibility, allowing for precise maneuvering.</p>
<h3>
	Comfort and Amenities</h3>
<p>
	Comfort is paramount on the ISARA 50. The yacht is equipped with a range of amenities to enhance your onboard experience. Climate control systems ensure a comfortable environment regardless of the weather, while advanced soundproofing techniques guarantee a peaceful and quiet interior.</p>
<p>
	For those who enjoy water sports, the ISARA 50 comes with ample storage for equipment, and easy access to the water via a swim platform. Whether you&#39;re into diving, snorkeling, or simply enjoying a swim, the ISARA 50 is designed to accommodate all your aquatic activities.</p>
<h3>
	Conclusion</h3>
<p>
	The ISARA 50 is more than just a yacht; it&#39;s a statement of style and sophistication. With its impeccable design, luxurious interior, and outstanding performance, the ISARA 50 is the perfect vessel for those who demand the best. Whether you&#39;re planning a leisurely cruise or an adventurous voyage, the ISARA 50 promises an unforgettable yachting experience.</p>
', N'/BackStage/YachtFiles/Yacht_17/Dimension/V44-1.png', 112, 0, CAST(N'2024-07-26T17:26:45.153' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (18, N'Test', N'11', 0, 0, N'<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	sadsadsdafdsafdsafdsfsdsadsadsdafdsafdsafdsfsd</p>
<p>
	&nbsp;</p>
', N'/BackStage/YachtFiles/Yacht_18/Dimension/V44-1.png', 134, 1, CAST(N'2024-07-28T23:06:45.627' AS DateTime))
INSERT [dbo].[Yacht] ([Id], [Model], [ModelLength], [IsNewDesign], [IsNewBuilding], [OverView], [DimensionsImagePath], [CoverId], [IsDelete], [CreateTime]) VALUES (19, N'Cyberpunk', N'2077', 1, 0, N'<ul>
	<li>
		<strong>General Description</strong></li>
</ul>
<p>
	The Cyberpunk 2077 yacht stands as a testament to the pinnacle of futuristic design and technological innovation. Crafted for the discerning elite, this vessel seamlessly integrates cutting-edge technology, unparalleled luxury, and eco-conscious engineering. The yacht&rsquo;s aesthetic draws inspiration from the cyberpunk genre, characterized by a blend of high-tech and dystopian elements, resulting in a striking, avant-garde masterpiece on the water.</p>
<ul>
	<li>
		<strong>Exterior Design</strong></li>
</ul>
<p>
	The exterior of the Cyberpunk 2077 yacht boasts a sleek, angular hull with a metallic sheen, emphasizing both speed and durability. The innovative design includes an array of neon and LED lighting that casts a distinctive, futuristic glow, making the yacht a striking sight both day and night. The expansive deck is crafted from a blend of high-tech composites and traditional teak, offering durability and elegance.</p>
<p>
	&nbsp;</p>
', N'/BackStage/YachtFiles/Yacht_19/Dimension/Yacht Dimension.jpg', 140, 1, CAST(N'2024-07-29T16:04:02.067' AS DateTime))
SET IDENTITY_INSERT [dbo].[Yacht] OFF
GO
SET IDENTITY_INSERT [dbo].[YachtAlbum] ON 

INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (14, 2, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235135.png', 0, CAST(N'2024-07-21T00:00:45.873' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (15, 2, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-21T00:00:45.873' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (16, 2, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235109.png', 0, CAST(N'2024-07-21T00:00:45.877' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (17, 2, N'螢幕擷取畫面 2024-07-20 235100.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235100.png', 0, CAST(N'2024-07-21T00:00:45.880' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (18, 2, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235047.png', 0, CAST(N'2024-07-21T00:00:45.887' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (19, 2, N'螢幕擷取畫面 2024-07-20 235027.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235027.png', 0, CAST(N'2024-07-21T00:00:45.890' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (20, 2, N'螢幕擷取畫面 2024-07-20 235016.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235016.png', 0, CAST(N'2024-07-21T00:00:45.890' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (21, 2, N'螢幕擷取畫面 2024-07-20 235005.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 235005.png', 0, CAST(N'2024-07-21T00:00:45.897' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (22, 2, N'螢幕擷取畫面 2024-07-20 234938.png', N'/BackStage/YachtFiles/Yacht_2/Album/螢幕擷取畫面 2024-07-20 234938.png', 0, CAST(N'2024-07-21T00:00:45.903' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (23, 5, N'螢幕擷取畫面 2024-07-20 235016.png', N'/BackStage/YachtFiles/Yacht_5/Album/螢幕擷取畫面 2024-07-20 235016.png', 0, CAST(N'2024-07-22T12:31:20.973' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (24, 6, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_6/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-22T15:35:51.397' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (25, 7, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_7/Album/螢幕擷取畫面 2024-07-20 235122.png', 1, CAST(N'2024-07-22T15:41:57.420' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (26, 7, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_7/Album/螢幕擷取畫面 2024-07-20 235135.png', 0, CAST(N'2024-07-22T16:40:34.223' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (27, 7, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_7/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-22T16:40:34.223' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (28, 7, N'螢幕擷取畫面 2024-07-20 235100.png', N'/BackStage/YachtFiles/Yacht_7/Album/螢幕擷取畫面 2024-07-20 235100.png', 1, CAST(N'2024-07-22T16:40:34.227' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (29, 7, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_7/Album/螢幕擷取畫面 2024-07-20 235047.png', 1, CAST(N'2024-07-22T16:40:34.227' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (30, 7, N'螢幕擷取畫面 2024-07-20 235027.png', N'/BackStage/YachtFiles/Yacht_7/Album/螢幕擷取畫面 2024-07-20 235027.png', 0, CAST(N'2024-07-22T16:40:34.230' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (31, 8, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_8/Album/20120405025758--1.jpg', 1, CAST(N'2024-07-22T17:39:25.210' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (32, 8, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_8/Album/20120405025743--1.jpg', 1, CAST(N'2024-07-22T17:39:25.210' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (33, 8, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_8/Album/螢幕擷取畫面 2024-07-20 235135.png', 1, CAST(N'2024-07-22T17:39:25.217' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (34, 8, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_8/Album/螢幕擷取畫面 2024-07-20 235135.png', 0, CAST(N'2024-07-22T17:42:16.367' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (35, 8, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_8/Album/螢幕擷取畫面 2024-07-20 235122.png', 1, CAST(N'2024-07-22T17:42:16.367' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (36, 8, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_8/Album/螢幕擷取畫面 2024-07-20 235135.png', 0, CAST(N'2024-07-22T17:42:27.367' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (37, 8, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_8/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-22T17:42:27.370' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (38, 8, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_8/Album/螢幕擷取畫面 2024-07-20 235109.png', 0, CAST(N'2024-07-22T17:42:27.373' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (39, 9, N'20120416091008.jpg', N'/BackStage/YachtFiles/Yacht_9/Album/20120416091008.jpg', 0, CAST(N'2024-07-26T16:42:41.690' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (40, 9, N'20120416091331.jpg', N'/BackStage/YachtFiles/Yacht_9/Album/20120416091331.jpg', 0, CAST(N'2024-07-26T16:42:41.690' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (41, 9, N'20120416091553.jpg', N'/BackStage/YachtFiles/Yacht_9/Album/20120416091553.jpg', 0, CAST(N'2024-07-26T16:42:41.693' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (42, 9, N'20120402043001--1.jpg', N'/BackStage/YachtFiles/Yacht_9/Album/20120402043001--1.jpg', 0, CAST(N'2024-07-26T16:42:41.697' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (43, 9, N'20120416091740.jpg', N'/BackStage/YachtFiles/Yacht_9/Album/20120416091740.jpg', 0, CAST(N'2024-07-26T16:42:41.697' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (44, 9, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_9/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-26T16:42:41.700' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (45, 9, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_9/Album/螢幕擷取畫面 2024-07-20 235109.png', 0, CAST(N'2024-07-26T16:42:41.703' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (46, 10, N'20120416091008.jpg', N'/BackStage/YachtFiles/Yacht_10/Album/20120416091008.jpg', 0, CAST(N'2024-07-26T16:51:04.437' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (47, 10, N'20120416091331.jpg', N'/BackStage/YachtFiles/Yacht_10/Album/20120416091331.jpg', 0, CAST(N'2024-07-26T16:51:04.437' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (48, 10, N'20120416091553.jpg', N'/BackStage/YachtFiles/Yacht_10/Album/20120416091553.jpg', 0, CAST(N'2024-07-26T16:51:04.437' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (49, 10, N'20120402043001--1.jpg', N'/BackStage/YachtFiles/Yacht_10/Album/20120402043001--1.jpg', 0, CAST(N'2024-07-26T16:51:04.440' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (50, 10, N'20120416091740.jpg', N'/BackStage/YachtFiles/Yacht_10/Album/20120416091740.jpg', 0, CAST(N'2024-07-26T16:51:04.440' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (51, 11, N'螢幕擷取畫面 2024-07-26 165638.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-26 165638.png', 0, CAST(N'2024-07-26T16:58:20.420' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (52, 11, N'螢幕擷取畫面 2024-07-26 165630.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-26 165630.png', 0, CAST(N'2024-07-26T16:58:20.423' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (53, 11, N'螢幕擷取畫面 2024-07-26 165620.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-26 165620.png', 0, CAST(N'2024-07-26T16:58:20.427' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (54, 11, N'螢幕擷取畫面 2024-07-26 165610.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-26 165610.png', 0, CAST(N'2024-07-26T16:58:20.430' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (55, 11, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235135.png', 0, CAST(N'2024-07-26T16:58:20.437' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (56, 11, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-26T16:58:20.437' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (57, 11, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235109.png', 0, CAST(N'2024-07-26T16:58:20.440' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (58, 11, N'螢幕擷取畫面 2024-07-20 235100.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235100.png', 0, CAST(N'2024-07-26T16:58:20.447' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (59, 11, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235047.png', 0, CAST(N'2024-07-26T16:58:20.450' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (60, 11, N'螢幕擷取畫面 2024-07-20 235027.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235027.png', 0, CAST(N'2024-07-26T16:58:20.453' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (61, 11, N'螢幕擷取畫面 2024-07-20 235016.png', N'/BackStage/YachtFiles/Yacht_11/Album/螢幕擷取畫面 2024-07-20 235016.png', 0, CAST(N'2024-07-26T16:58:20.457' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (62, 12, N'48.png', N'/BackStage/YachtFiles/Yacht_12/Album/48.png', 0, CAST(N'2024-07-26T17:10:58.890' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (63, 12, N'螢幕擷取畫面 2024-07-26 165638.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-26 165638.png', 0, CAST(N'2024-07-26T17:10:58.903' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (64, 12, N'螢幕擷取畫面 2024-07-26 165630.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-26 165630.png', 0, CAST(N'2024-07-26T17:10:58.907' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (65, 12, N'螢幕擷取畫面 2024-07-26 165620.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-26 165620.png', 0, CAST(N'2024-07-26T17:10:58.907' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (66, 12, N'螢幕擷取畫面 2024-07-26 165610.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-26 165610.png', 0, CAST(N'2024-07-26T17:10:58.910' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (67, 12, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-26T17:10:58.920' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (68, 12, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-20 235109.png', 0, CAST(N'2024-07-26T17:10:58.920' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (69, 12, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-20 235047.png', 0, CAST(N'2024-07-26T17:10:58.923' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (70, 12, N'螢幕擷取畫面 2024-07-20 235027.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-20 235027.png', 0, CAST(N'2024-07-26T17:10:58.927' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (71, 12, N'螢幕擷取畫面 2024-07-20 235005.png', N'/BackStage/YachtFiles/Yacht_12/Album/螢幕擷取畫面 2024-07-20 235005.png', 0, CAST(N'2024-07-26T17:10:58.930' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (72, 13, N'40f2fbf47c157d40e1b8509f648388d3.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/40f2fbf47c157d40e1b8509f648388d3.jpg', 0, CAST(N'2024-07-26T17:14:22.270' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (73, 13, N'106437IB-H041_L.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/106437IB-H041_L.jpg', 0, CAST(N'2024-07-26T17:14:22.277' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (74, 13, N'112243IB-H041_L.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/112243IB-H041_L.jpg', 0, CAST(N'2024-07-26T17:14:22.280' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (75, 13, N'1326663.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/1326663.jpg', 0, CAST(N'2024-07-26T17:14:22.290' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (76, 13, N'22365360.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/22365360.jpg', 0, CAST(N'2024-07-26T17:14:22.297' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (77, 13, N'2014071856392757.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/2014071856392757.jpg', 0, CAST(N'2024-07-26T17:14:22.300' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (78, 13, N'aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', 0, CAST(N'2024-07-26T17:14:22.307' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (79, 13, N'd5d82f534a6283c5272a34cb9a17bd29_XL.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/d5d82f534a6283c5272a34cb9a17bd29_XL.jpg', 0, CAST(N'2024-07-26T17:14:22.310' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (80, 13, N'Estrella 超級遊艇.jpg', N'/BackStage/YachtFiles/Yacht_13/Album/Estrella 超級遊艇.jpg', 0, CAST(N'2024-07-26T17:14:22.317' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (81, 14, N'106437IB-H041_L.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/106437IB-H041_L.jpg', 0, CAST(N'2024-07-26T17:16:29.883' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (82, 14, N'112243IB-H041_L.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/112243IB-H041_L.jpg', 0, CAST(N'2024-07-26T17:16:29.887' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (83, 14, N'1326663.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/1326663.jpg', 0, CAST(N'2024-07-26T17:16:29.900' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (84, 14, N'22365360.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/22365360.jpg', 0, CAST(N'2024-07-26T17:16:29.903' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (85, 14, N'2014071856392757.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/2014071856392757.jpg', 0, CAST(N'2024-07-26T17:16:29.910' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (86, 14, N'aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', 0, CAST(N'2024-07-26T17:16:29.917' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (87, 14, N'd5d82f534a6283c5272a34cb9a17bd29_XL.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/d5d82f534a6283c5272a34cb9a17bd29_XL.jpg', 0, CAST(N'2024-07-26T17:16:29.920' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (88, 14, N'Estrella 超級遊艇.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/Estrella 超級遊艇.jpg', 0, CAST(N'2024-07-26T17:16:29.930' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (89, 14, N'HsYeANay5PzJmKmS3gzV9t.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/HsYeANay5PzJmKmS3gzV9t.jpg', 0, CAST(N'2024-07-26T17:16:29.930' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (90, 14, N'Leopard-43-Powercat_RT-2.jpg', N'/BackStage/YachtFiles/Yacht_14/Album/Leopard-43-Powercat_RT-2.jpg', 0, CAST(N'2024-07-26T17:16:29.937' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (91, 15, N'22365360.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/22365360.jpg', 0, CAST(N'2024-07-26T17:21:24.570' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (92, 15, N'2014071856392757.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/2014071856392757.jpg', 0, CAST(N'2024-07-26T17:21:24.573' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (93, 15, N'Estrella 超級遊艇.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/Estrella 超級遊艇.jpg', 0, CAST(N'2024-07-26T17:21:24.583' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (94, 15, N'HsYeANay5PzJmKmS3gzV9t.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/HsYeANay5PzJmKmS3gzV9t.jpg', 0, CAST(N'2024-07-26T17:21:24.587' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (95, 15, N'Leopard-43-Powercat_RT-2.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/Leopard-43-Powercat_RT-2.jpg', 0, CAST(N'2024-07-26T17:21:24.590' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (96, 15, N'promotion_group1-03.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/promotion_group1-03.jpg', 0, CAST(N'2024-07-26T17:21:24.597' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (97, 15, N'YaUcHYiD4Wcpb87c92pxh7.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/YaUcHYiD4Wcpb87c92pxh7.jpg', 0, CAST(N'2024-07-26T17:21:24.600' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (98, 15, N'小琉球枋星遊艇小琉球海上遊憩之旅.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/小琉球枋星遊艇小琉球海上遊憩之旅.jpg', 0, CAST(N'2024-07-26T17:21:24.603' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (99, 15, N'中大型游艇.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/中大型游艇.jpg', 0, CAST(N'2024-07-26T17:21:24.607' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (100, 15, N'迪拜的私人豪華遊艇體驗-Klook客路.jpg', N'/BackStage/YachtFiles/Yacht_15/Album/迪拜的私人豪華遊艇體驗-Klook客路.jpg', 0, CAST(N'2024-07-26T17:21:24.610' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (101, 16, N'aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/aman-at-sea-interior-credit-sinot-yacht-architecture-design-jpg-34464-6639de56a96ca.jpg', 0, CAST(N'2024-07-26T17:23:38.973' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (102, 16, N'd5d82f534a6283c5272a34cb9a17bd29_XL.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/d5d82f534a6283c5272a34cb9a17bd29_XL.jpg', 0, CAST(N'2024-07-26T17:23:38.977' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (103, 16, N'Estrella 超級遊艇.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/Estrella 超級遊艇.jpg', 0, CAST(N'2024-07-26T17:23:38.980' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (104, 16, N'HsYeANay5PzJmKmS3gzV9t.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/HsYeANay5PzJmKmS3gzV9t.jpg', 0, CAST(N'2024-07-26T17:23:38.990' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (105, 16, N'Leopard-43-Powercat_RT-2.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/Leopard-43-Powercat_RT-2.jpg', 0, CAST(N'2024-07-26T17:23:38.993' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (106, 16, N'NdFrKEhJbavuQYfaRbo7Hw.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/NdFrKEhJbavuQYfaRbo7Hw.jpg', 0, CAST(N'2024-07-26T17:23:38.993' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (107, 16, N'promotion_group1-03.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/promotion_group1-03.jpg', 0, CAST(N'2024-07-26T17:23:38.997' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (108, 16, N'unnamed (1).jpg', N'/BackStage/YachtFiles/Yacht_16/Album/unnamed (1).jpg', 0, CAST(N'2024-07-26T17:23:39.000' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (109, 16, N'unnamed (2).jpg', N'/BackStage/YachtFiles/Yacht_16/Album/unnamed (2).jpg', 0, CAST(N'2024-07-26T17:23:39.000' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (110, 16, N'VaMFiMXraLeAPLSNuTWEfe.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/VaMFiMXraLeAPLSNuTWEfe.jpg', 0, CAST(N'2024-07-26T17:23:39.003' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (111, 16, N'YaUcHYiD4Wcpb87c92pxh7.jpg', N'/BackStage/YachtFiles/Yacht_16/Album/YaUcHYiD4Wcpb87c92pxh7.jpg', 0, CAST(N'2024-07-26T17:23:39.003' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (112, 17, N'Estrella 超級遊艇.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/Estrella 超級遊艇.jpg', 0, CAST(N'2024-07-26T17:26:45.163' AS DateTime))
GO
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (113, 17, N'HsYeANay5PzJmKmS3gzV9t.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/HsYeANay5PzJmKmS3gzV9t.jpg', 0, CAST(N'2024-07-26T17:26:45.173' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (114, 17, N'Leopard-43-Powercat_RT-2.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/Leopard-43-Powercat_RT-2.jpg', 0, CAST(N'2024-07-26T17:26:45.177' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (115, 17, N'NdFrKEhJbavuQYfaRbo7Hw.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/NdFrKEhJbavuQYfaRbo7Hw.jpg', 0, CAST(N'2024-07-26T17:26:45.177' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (116, 17, N'promotion_group1-03.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/promotion_group1-03.jpg', 0, CAST(N'2024-07-26T17:26:45.180' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (117, 17, N'unnamed (1).jpg', N'/BackStage/YachtFiles/Yacht_17/Album/unnamed (1).jpg', 0, CAST(N'2024-07-26T17:26:45.183' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (118, 17, N'unnamed (2).jpg', N'/BackStage/YachtFiles/Yacht_17/Album/unnamed (2).jpg', 0, CAST(N'2024-07-26T17:26:45.183' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (119, 17, N'VaMFiMXraLeAPLSNuTWEfe.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/VaMFiMXraLeAPLSNuTWEfe.jpg', 0, CAST(N'2024-07-26T17:26:45.187' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (120, 17, N'YaUcHYiD4Wcpb87c92pxh7.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/YaUcHYiD4Wcpb87c92pxh7.jpg', 0, CAST(N'2024-07-26T17:26:45.187' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (121, 17, N'小琉球枋星遊艇小琉球海上遊憩之旅.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/小琉球枋星遊艇小琉球海上遊憩之旅.jpg', 0, CAST(N'2024-07-26T17:26:45.190' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (122, 17, N'中大型游艇.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/中大型游艇.jpg', 0, CAST(N'2024-07-26T17:26:45.193' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (123, 17, N'迪拜的私人豪華遊艇體驗-Klook客路.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/迪拜的私人豪華遊艇體驗-Klook客路.jpg', 0, CAST(N'2024-07-26T17:26:45.193' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (124, 17, N'遊艇-遊艇趴-遊艇價格-e1617691646282.jpg', N'/BackStage/YachtFiles/Yacht_17/Album/遊艇-遊艇趴-遊艇價格-e1617691646282.jpg', 0, CAST(N'2024-07-26T17:26:45.197' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (125, 18, N'48.png', N'/BackStage/YachtFiles/Yacht_18/Album/48.png', 1, CAST(N'2024-07-28T23:06:45.657' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (126, 18, N'46.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/46.jpg', 1, CAST(N'2024-07-28T23:06:45.660' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (127, 18, N'V44-1.png', N'/BackStage/YachtFiles/Yacht_18/Album/V44-1.png', 1, CAST(N'2024-07-28T23:06:45.667' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (128, 18, N'螢幕擷取畫面 2024-07-26 165638.png', N'/BackStage/YachtFiles/Yacht_18/Album/螢幕擷取畫面 2024-07-26 165638.png', 1, CAST(N'2024-07-28T23:06:45.677' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (129, 18, N'螢幕擷取畫面 2024-07-26 165630.png', N'/BackStage/YachtFiles/Yacht_18/Album/螢幕擷取畫面 2024-07-26 165630.png', 1, CAST(N'2024-07-28T23:06:45.680' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (130, 18, N'螢幕擷取畫面 2024-07-26 165620.png', N'/BackStage/YachtFiles/Yacht_18/Album/螢幕擷取畫面 2024-07-26 165620.png', 1, CAST(N'2024-07-28T23:06:45.683' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (131, 18, N'螢幕擷取畫面 2024-07-26 165610.png', N'/BackStage/YachtFiles/Yacht_18/Album/螢幕擷取畫面 2024-07-26 165610.png', 1, CAST(N'2024-07-28T23:06:45.690' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (132, 18, N'20120405025743--1 (1).jpg', N'/BackStage/YachtFiles/Yacht_18/Album/20120405025743--1 (1).jpg', 1, CAST(N'2024-07-28T23:06:45.697' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (133, 18, N'black_surprise.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/black_surprise.jpg', 1, CAST(N'2024-07-28T23:06:45.703' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (134, 18, N'VaMFiMXraLeAPLSNuTWEfe.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/VaMFiMXraLeAPLSNuTWEfe.jpg', 0, CAST(N'2024-07-28T23:10:25.877' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (135, 18, N'YaUcHYiD4Wcpb87c92pxh7.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/YaUcHYiD4Wcpb87c92pxh7.jpg', 0, CAST(N'2024-07-28T23:10:25.883' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (136, 18, N'小琉球枋星遊艇小琉球海上遊憩之旅.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/小琉球枋星遊艇小琉球海上遊憩之旅.jpg', 0, CAST(N'2024-07-28T23:10:25.890' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (137, 18, N'中大型游艇.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/中大型游艇.jpg', 0, CAST(N'2024-07-28T23:10:25.897' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (138, 18, N'迪拜的私人豪華遊艇體驗-Klook客路.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/迪拜的私人豪華遊艇體驗-Klook客路.jpg', 0, CAST(N'2024-07-28T23:10:25.900' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (139, 18, N'遊艇-遊艇趴-遊艇價格-e1617691646282.jpg', N'/BackStage/YachtFiles/Yacht_18/Album/遊艇-遊艇趴-遊艇價格-e1617691646282.jpg', 0, CAST(N'2024-07-28T23:10:25.907' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (140, 19, N'Yacht Album (1).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (1).jpg', 0, CAST(N'2024-07-29T16:04:02.090' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (141, 19, N'Yacht Album (2).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (2).jpg', 0, CAST(N'2024-07-29T16:04:02.093' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (142, 19, N'Yacht Album (3).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (3).jpg', 0, CAST(N'2024-07-29T16:04:02.097' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (143, 19, N'Yacht Album (4).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (4).jpg', 0, CAST(N'2024-07-29T16:04:02.097' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (144, 19, N'Yacht Album (5).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (5).jpg', 0, CAST(N'2024-07-29T16:04:02.100' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (145, 19, N'Yacht Album (6).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (6).jpg', 0, CAST(N'2024-07-29T16:04:02.110' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (146, 19, N'Yacht Album (7).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (7).jpg', 0, CAST(N'2024-07-29T16:04:02.110' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (147, 19, N'Yacht Album (8).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (8).jpg', 0, CAST(N'2024-07-29T16:04:02.113' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (148, 19, N'Yacht Album (9).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (9).jpg', 0, CAST(N'2024-07-29T16:04:02.113' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (149, 19, N'Yacht Album (10).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (10).jpg', 0, CAST(N'2024-07-29T16:04:02.120' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (150, 19, N'Yacht Album (11).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (11).jpg', 0, CAST(N'2024-07-29T16:04:02.130' AS DateTime))
INSERT [dbo].[YachtAlbum] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (151, 19, N'Yacht Album (12).jpg', N'/BackStage/YachtFiles/Yacht_19/Album/Yacht Album (12).jpg', 0, CAST(N'2024-07-29T16:04:02.130' AS DateTime))
SET IDENTITY_INSERT [dbo].[YachtAlbum] OFF
GO
SET IDENTITY_INSERT [dbo].[YachtDimension] ON 

INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (17, 2, N'Hull length', N'36’-8”', 0, CAST(N'2024-07-21T00:01:36.097' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (18, 2, N'L.W.L.', N'31’-0”’', 0, CAST(N'2024-07-21T00:01:36.103' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (19, 2, N'B. MAX', N'11’-6”', 0, CAST(N'2024-07-21T00:01:36.107' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (20, 2, N'Standard draft', N'5’-8”', 0, CAST(N'2024-07-21T00:01:36.107' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (21, 2, N'Ballast', N'8000 lbs', 0, CAST(N'2024-07-21T00:01:36.110' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (22, 2, N'Displacement', N'22500 lbs', 0, CAST(N'2024-07-21T00:01:36.110' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (23, 2, N'Sail area', N'768 sq.ft.', 0, CAST(N'2024-07-21T00:01:36.110' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (24, 2, N'Cutter', N'861 sq.ft.', 0, CAST(N'2024-07-21T00:01:36.113' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (26, 5, N'Hull length12', N'111', 0, CAST(N'2024-07-22T12:31:50.810' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (27, 5, N'123', N'123', 1, CAST(N'2024-07-22T15:11:25.363' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (28, 5, N'123', N'123', 0, CAST(N'2024-07-22T15:14:22.650' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (29, 6, N'Hull length', N'453543', 0, CAST(N'2024-07-22T15:36:05.073' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (30, 6, N'L.W.L.', N'123', 0, CAST(N'2024-07-22T15:36:05.077' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (31, 6, N'B. MAX', N'453', 0, CAST(N'2024-07-22T15:36:05.080' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (32, 6, N'Engine diesel', N'12321', 0, CAST(N'2024-07-22T15:36:05.080' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (33, 6, N'diesel', N'453', 0, CAST(N'2024-07-22T15:36:05.080' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (34, 6, N'123', N'123', 1, CAST(N'2024-07-22T15:37:48.270' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (35, 7, N'Hull length', N'123', 0, CAST(N'2024-07-22T15:42:03.160' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (36, 7, N'123', N'52', 0, CAST(N'2024-07-22T17:31:30.597' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (37, 7, N'456', N'12', 1, CAST(N'2024-07-22T17:31:34.453' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (38, 8, N'L.W.L.', N'4', 0, CAST(N'2024-07-22T17:39:52.170' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (39, 8, N'Ballast', N'4', 0, CAST(N'2024-07-22T17:39:52.170' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (40, 8, N'Displacement', N'5', 0, CAST(N'2024-07-22T17:39:52.173' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (41, 8, N'Engine diesel', N'1', 0, CAST(N'2024-07-22T17:39:52.177' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (42, 8, N'diesel', N'12', 0, CAST(N'2024-07-22T17:39:52.180' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (43, 8, N'Engine', N'444', 0, CAST(N'2024-07-22T17:42:35.327' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (44, 8, N'1243', N'4', 1, CAST(N'2024-07-22T17:42:39.437' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (45, 8, N'44', N'4', 1, CAST(N'2024-07-22T17:42:45.263' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (46, 2, N'12', N'12', 1, CAST(N'2024-07-23T17:46:51.643' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (47, 9, N'Hull length', N'41’-9”', 0, CAST(N'2024-07-26T16:43:48.370' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (48, 9, N'L.W.L.', N'33’', 0, CAST(N'2024-07-26T16:43:48.370' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (49, 9, N'B. MAX', N'12’-6”', 0, CAST(N'2024-07-26T16:43:48.373' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (50, 9, N'Standard draft', N'5’-10”', 0, CAST(N'2024-07-26T16:43:48.373' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (51, 9, N'Ballast', N'11800 lbs', 0, CAST(N'2024-07-26T16:43:48.377' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (52, 9, N'Displacement', N'29147 lbs', 0, CAST(N'2024-07-26T16:43:48.377' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (53, 9, N'Engine diesel', N'56 hp', 0, CAST(N'2024-07-26T16:43:48.380' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (54, 9, N'Sail area', N'1009 sq.ft.', 0, CAST(N'2024-07-26T16:43:48.383' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (55, 10, N'LENGTH OVERALL', N'13.225 m　/　43''-5"', 0, CAST(N'2024-07-26T16:53:45.890' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (56, 10, N'LENGTH WATERLINE', N'12.48 m　/　40''-11"', 0, CAST(N'2024-07-26T16:53:45.893' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (57, 10, N'BEAM MAX', N'4.187 m　/　13''-9"', 0, CAST(N'2024-07-26T16:53:45.893' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (58, 10, N' LIGHTSHIP DISPLACEMENT', N'14 tonnes　/　30,800 lbs', 0, CAST(N'2024-07-26T16:53:45.897' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (59, 10, N'DRAFT', N'1.98 m　/　6''-6"', 0, CAST(N'2024-07-26T16:53:45.900' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (60, 10, N' SHALLOW DRAFT KEEL', N'1.6 m　/　5''-3"', 0, CAST(N'2024-07-26T16:53:45.900' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (61, 11, N'Hull length', N'45’-7”', 0, CAST(N'2024-07-26T16:58:59.940' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (62, 11, N'L.W.L.', N'37’-2”', 0, CAST(N'2024-07-26T16:58:59.943' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (63, 11, N'B. MAX', N'13’-6”', 0, CAST(N'2024-07-26T16:58:59.943' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (64, 11, N'Ballast', N'11000 lbs', 0, CAST(N'2024-07-26T16:58:59.947' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (65, 11, N'Displacement', N'34500 lbs', 0, CAST(N'2024-07-26T16:58:59.950' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (66, 11, N'Engine diesel', N'100 hp', 0, CAST(N'2024-07-26T16:58:59.953' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (67, 11, N'Draft', N'5’-10”', 0, CAST(N'2024-07-26T16:58:59.953' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (68, 11, N'Head room', N'6’-5”', 0, CAST(N'2024-07-26T16:58:59.953' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (69, 11, N'Sail area', N'1425 sq.ft.', 0, CAST(N'2024-07-26T16:59:09.237' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (70, 9, N'Designer', N'Robert Harris', 0, CAST(N'2024-07-26T16:59:31.270' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (71, 12, N'Hull length', N'48’', 0, CAST(N'2024-07-26T17:11:54.160' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (72, 12, N'L.W.L."', N'40’-3”', 0, CAST(N'2024-07-26T17:11:54.160' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (73, 12, N'B. MAX', N'14’-6”', 0, CAST(N'2024-07-26T17:11:54.163' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (74, 12, N'Ballast', N'11675 lbs', 0, CAST(N'2024-07-26T17:11:54.163' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (75, 12, N'Displacement', N'35000 lbs', 0, CAST(N'2024-07-26T17:11:54.167' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (76, 12, N'Engine diesel', N'75 hp', 0, CAST(N'2024-07-26T17:11:54.167' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (77, 12, N'Standard draft', N'6’', 0, CAST(N'2024-07-26T17:11:54.170' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (78, 12, N'Draft shoal(option)', N'5’-3”', 0, CAST(N'2024-07-26T17:11:54.170' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (79, 12, N'Sail area(cutter)', N'1316 sq.ft.', 0, CAST(N'2024-07-26T17:12:02.860' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (80, 12, N'Designer', N'Robert H.Perry', 0, CAST(N'2024-07-26T17:12:08.380' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (81, 13, N'Hull length', N'55’-5”', 0, CAST(N'2024-07-26T17:15:30.750' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (82, 13, N'L.W.L."', N'42''', 0, CAST(N'2024-07-26T17:15:30.753' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (83, 13, N'B. MAX', N'15’-1”', 0, CAST(N'2024-07-26T17:15:30.753' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (84, 13, N'Ballast', N'14800 lbs', 0, CAST(N'2024-07-26T17:15:30.757' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (85, 13, N'Standard draft', N'6’-6”', 0, CAST(N'2024-07-26T17:15:30.760' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (86, 13, N'Draft shoal(option)', N'5’-8”', 0, CAST(N'2024-07-26T17:15:30.760' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (87, 13, N'Displacement', N'38570 lbs', 0, CAST(N'2024-07-26T17:15:30.767' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (88, 13, N'Engine diesel', N'100 hp', 0, CAST(N'2024-07-26T17:15:30.767' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (89, 13, N'Sail area(cutter)', N'1414 sq.ft.', 0, CAST(N'2024-07-26T17:15:42.103' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (90, 13, N'Designer', N'Robert H.Perry', 0, CAST(N'2024-07-26T17:15:47.987' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (91, 14, N'Hull length	', N'54’ 16.46m', 0, CAST(N'2024-07-26T17:18:45.817' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (92, 14, N'L.W.L.	', N'50’-3” 15.32m', 0, CAST(N'2024-07-26T17:18:52.280' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (93, 14, N'B. MAX	', N'16’-1” 4.90m', 0, CAST(N'2024-07-26T17:18:59.473' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (94, 14, N'Standard draft	', N'7’-4” 2.18m', 0, CAST(N'2024-07-26T17:19:05.713' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (95, 14, N'Ballast', N'18960 lbs', 0, CAST(N'2024-07-26T17:19:12.447' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (96, 14, N'Displacement', N'25900 kgs(Lightship) 25900 kgs(Full Load)', 0, CAST(N'2024-07-26T17:19:32.830' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (97, 14, N'Engine diesel	', N'110 hp', 0, CAST(N'2024-07-26T17:19:38.750' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (98, 14, N'Sail area of mainsall	', N'71 sqm', 0, CAST(N'2024-07-26T17:19:44.883' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (99, 14, N'100% Yankee	', N'67 sqm', 0, CAST(N'2024-07-26T17:19:51.393' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (100, 14, N'Staysall', N'27 sqm', 0, CAST(N'2024-07-26T17:19:58.640' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (101, 14, N'Genoa 130%	', N'67 sqm', 0, CAST(N'2024-07-26T17:20:04.080' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (102, 14, N'Flasher 165%	', N'98 sqm', 0, CAST(N'2024-07-26T17:20:09.040' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (103, 14, N'Designer', N'Bill Dixon	', 0, CAST(N'2024-07-26T17:20:17.157' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (104, 15, N'Hull length', N'55’', 0, CAST(N'2024-07-26T17:23:04.773' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (105, 15, N'L.W.L.', N'45’-11”', 0, CAST(N'2024-07-26T17:23:04.777' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (106, 15, N'B. MAX', N'16’-1”', 0, CAST(N'2024-07-26T17:23:04.780' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (107, 15, N'Ballast', N'17600 lbs', 0, CAST(N'2024-07-26T17:23:04.783' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (108, 15, N'Displacement', N'48400 lbs', 0, CAST(N'2024-07-26T17:23:04.787' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (109, 15, N'Engine diesel', N'160 hp', 0, CAST(N'2024-07-26T17:23:04.787' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (110, 15, N'Designer', N'Reter Beeldsnijder', 0, CAST(N'2024-07-26T17:23:04.790' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (111, 16, N'Hull length', N'58''', 0, CAST(N'2024-07-26T17:24:20.707' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (112, 16, N'L.W.L.', N'45’-11”', 0, CAST(N'2024-07-26T17:24:20.710' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (113, 16, N'B. MAX', N'16’-1”', 0, CAST(N'2024-07-26T17:24:20.710' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (114, 16, N'Ballast', N'7’-2”', 0, CAST(N'2024-07-26T17:24:20.713' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (115, 16, N'Displacement', N'6’-6”', 0, CAST(N'2024-07-26T17:24:20.713' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (116, 16, N'Engine diesel', N'17600 lbs', 0, CAST(N'2024-07-26T17:24:20.717' AS DateTime))
GO
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (117, 16, N'Sail area	', N'1715 sq.ft.', 0, CAST(N'2024-07-26T17:24:20.717' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (118, 16, N'Designer', N'Reter Beeldsnijder	', 0, CAST(N'2024-07-26T17:24:20.717' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (119, 17, N'Hull length', N'54’', 0, CAST(N'2024-07-26T17:27:39.440' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (120, 17, N'L.W.L.', N'50’-3” ', 0, CAST(N'2024-07-26T17:27:39.443' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (121, 17, N'B. MAX', N'16’-1” ', 0, CAST(N'2024-07-26T17:27:39.443' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (122, 17, N'Ballast', N'18960 lbs', 0, CAST(N'2024-07-26T17:27:39.447' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (123, 17, N'Displacement', N'11800 lbs', 0, CAST(N'2024-07-26T17:27:39.447' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (124, 17, N'Engine diesel', N'29147 lbs', 0, CAST(N'2024-07-26T17:27:39.447' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (125, 17, N'Standard draft', N'768 sq.ft.', 0, CAST(N'2024-07-26T17:27:39.450' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (126, 17, N'100% Yankee', N'67 sqm', 0, CAST(N'2024-07-26T17:27:39.450' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (127, 18, N'Hull length', N'123', 0, CAST(N'2024-07-28T23:07:04.750' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (128, 18, N'L.W.L.', N'2314', 0, CAST(N'2024-07-28T23:07:04.753' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (129, 18, N'B. MAX', N'3215', 0, CAST(N'2024-07-28T23:07:04.757' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (130, 18, N'Ballast', N'3245', 0, CAST(N'2024-07-28T23:07:04.757' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (131, 18, N'Displacement', N'4325', 0, CAST(N'2024-07-28T23:07:04.760' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (132, 18, N'test', N'22123', 0, CAST(N'2024-07-28T23:07:04.763' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (133, 18, N'test23', N'111', 0, CAST(N'2024-07-28T23:11:00.480' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (134, 18, N'test34', N'55555', 0, CAST(N'2024-07-28T23:11:04.720' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (135, 19, N'Hull length', N'100 feet (30 meters)', 0, CAST(N'2024-07-29T16:05:34.100' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (136, 19, N'L.W.L.', N'90 feet (27.4 meters)', 0, CAST(N'2024-07-29T16:05:34.103' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (137, 19, N'B. MAX', N'20 feet (6 meters)', 0, CAST(N'2024-07-29T16:05:34.107' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (138, 19, N'Ballast', N'40 tons', 0, CAST(N'2024-07-29T16:05:34.107' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (139, 19, N'Displacement', N'200 tons', 0, CAST(N'2024-07-29T16:05:34.110' AS DateTime))
INSERT [dbo].[YachtDimension] ([Id], [YachtId], [Item], [Value], [IsDelete], [CreateTime]) VALUES (140, 19, N'Draft', N'5 feet (1.5 meters)', 0, CAST(N'2024-07-29T16:05:34.110' AS DateTime))
SET IDENTITY_INSERT [dbo].[YachtDimension] OFF
GO
SET IDENTITY_INSERT [dbo].[YachtFile] ON 

INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (4, 2, N'TAYANA37-STANDARD SPECIFICATIONS.pdf', N'/BackStage/YachtFiles/Yacht_2/Files/TAYANA37-STANDARD SPECIFICATIONS.pdf', 0, CAST(N'2024-07-21T00:00:45.870' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (5, 2, N'test23', N'test', 1, CAST(N'2024-07-22T00:19:07.403' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (6, 2, N'113年07月.pdf', N'/BackStage/YachtFiles/Yacht_2/Files/113年07月.pdf', 1, CAST(N'2024-07-22T11:55:12.143' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (7, 5, N'活頁簿12.xlsx', N'/BackStage/YachtFiles/Yacht_5/Files/活頁簿1.xlsx', 1, CAST(N'2024-07-22T12:31:20.970' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (8, 5, N'TAYANA37-STANDARD SPECIFICATIONS.pdf', N'/BackStage/YachtFiles/Yacht_5/Files/TAYANA37-STANDARD SPECIFICATIONS.pdf', 0, CAST(N'2024-07-22T15:20:15.867' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (9, 8, N'使用者故事.mhtml', N'/BackStage/YachtFiles/Yacht_8/Files/使用者故事.mhtml', 0, CAST(N'2024-07-22T17:39:25.190' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (10, 8, N'求職應援 職場AI人才養成計畫│聯成電腦.mhtml', N'/BackStage/YachtFiles/Yacht_8/Files/求職應援 職場AI人才養成計畫│聯成電腦.mhtml', 0, CAST(N'2024-07-22T17:39:25.200' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (11, 8, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_8/Files/螢幕擷取畫面 2024-07-20 235122.png', 1, CAST(N'2024-07-22T17:43:25.953' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (12, 8, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_8/Files/螢幕擷取畫面 2024-07-20 235047.png', 1, CAST(N'2024-07-22T17:43:32.380' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (13, 8, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_8/Files/螢幕擷取畫面 2024-07-20 235135.png', 1, CAST(N'2024-07-22T17:43:41.767' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (14, 8, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_8/Files/螢幕擷取畫面 2024-07-20 235122.png', 1, CAST(N'2024-07-22T17:43:41.767' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (15, 9, N'TAYANA42-STANDARD SPECIFICATIONS.pdf', N'/BackStage/YachtFiles/Yacht_9/Files/TAYANA42-STANDARD SPECIFICATIONS.pdf', 0, CAST(N'2024-07-26T16:42:41.687' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (16, 10, N'tayana 44 layout.pdf', N'/BackStage/YachtFiles/Yacht_10/Files/tayana 44 layout.pdf', 0, CAST(N'2024-07-26T16:51:04.430' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (17, 11, N'tayana 46 layout.pdf', N'/BackStage/YachtFiles/Yacht_11/Files/tayana 46 layout.pdf', 0, CAST(N'2024-07-26T16:58:20.420' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (18, 12, N'空白 - 複製 (7).pdf', N'/BackStage/YachtFiles/Yacht_12/Files/空白 - 複製 (7).pdf', 0, CAST(N'2024-07-26T17:10:58.877' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (19, 12, N'空白 - 複製.pdf', N'/BackStage/YachtFiles/Yacht_12/Files/空白 - 複製.pdf', 0, CAST(N'2024-07-26T17:10:58.880' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (20, 12, N'空白.pdf', N'/BackStage/YachtFiles/Yacht_12/Files/空白.pdf', 0, CAST(N'2024-07-26T17:10:58.887' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (21, 12, N'新文字文件 - 複製 (2).txt', N'/BackStage/YachtFiles/Yacht_12/Files/新文字文件 - 複製 (2).txt', 0, CAST(N'2024-07-26T17:10:58.887' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (22, 12, N'tayana 48 layout.pdf', N'/BackStage/YachtFiles/Yacht_12/Files/tayana 48 layout.pdf', 0, CAST(N'2024-07-26T17:10:58.890' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (23, 15, N'空白 - 複製.pdf', N'/BackStage/YachtFiles/Yacht_15/Files/空白 - 複製.pdf', 0, CAST(N'2024-07-26T17:21:24.557' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (24, 15, N'空白.docx', N'/BackStage/YachtFiles/Yacht_15/Files/空白.docx', 0, CAST(N'2024-07-26T17:21:24.560' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (25, 15, N'空白.pdf', N'/BackStage/YachtFiles/Yacht_15/Files/空白.pdf', 0, CAST(N'2024-07-26T17:21:24.563' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (26, 15, N'新文字文件.txt', N'/BackStage/YachtFiles/Yacht_15/Files/新文字文件.txt', 0, CAST(N'2024-07-26T17:21:24.567' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (27, 17, N'ISARA 50 layout .pdf', N'/BackStage/YachtFiles/Yacht_17/Files/ISARA 50 layout .pdf', 0, CAST(N'2024-07-26T17:26:45.160' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (28, 18, N'活頁簿1.xlsx', N'/BackStage/YachtFiles/Yacht_18/Files/活頁簿1.xlsx', 0, CAST(N'2024-07-28T23:06:45.647' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (29, 18, N'專題提醒.docx', N'/BackStage/YachtFiles/Yacht_18/Files/專題提醒.docx', 0, CAST(N'2024-07-28T23:06:45.647' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (30, 19, N'Yacht CyberPunk 2077 Distinguishing Features.pdf', N'/BackStage/YachtFiles/Yacht_19/Files/Yacht CyberPunk 2077 Distinguishing Features.pdf', 0, CAST(N'2024-07-29T16:04:02.080' AS DateTime))
INSERT [dbo].[YachtFile] ([Id], [YachtId], [FileName], [FilePath], [IsDelete], [CreateTime]) VALUES (31, 19, N'Yacht CyberPunk 2077 Layout .pdf', N'/BackStage/YachtFiles/Yacht_19/Files/Yacht CyberPunk 2077 Layout .pdf', 0, CAST(N'2024-07-29T16:04:02.083' AS DateTime))
SET IDENTITY_INSERT [dbo].[YachtFile] OFF
GO
SET IDENTITY_INSERT [dbo].[YachtLayout] ON 

INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (3, 2, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_2/Layout/20120405025758--1.jpg', 0, CAST(N'2024-07-21T00:00:45.913' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (4, 2, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_2/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-21T00:00:45.917' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (5, 5, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_5/Layout/螢幕擷取畫面 2024-07-20 235047.png', 0, CAST(N'2024-07-22T12:31:20.983' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (6, 6, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_6/Layout/螢幕擷取畫面 2024-07-20 235047.png', 0, CAST(N'2024-07-22T15:35:51.407' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (7, 7, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_7/Layout/螢幕擷取畫面 2024-07-20 235047.png', 1, CAST(N'2024-07-22T15:41:57.427' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (8, 7, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_7/Layout/20120405025758--1.jpg', 1, CAST(N'2024-07-22T17:36:35.973' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (9, 7, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_7/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-22T17:36:35.977' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (10, 7, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_7/Layout/20120405025758--1.jpg', 0, CAST(N'2024-07-22T17:36:51.013' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (11, 8, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_8/Layout/螢幕擷取畫面 2024-07-20 235135.png', 1, CAST(N'2024-07-22T17:39:25.230' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (12, 8, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_8/Layout/螢幕擷取畫面 2024-07-20 235122.png', 0, CAST(N'2024-07-22T17:39:25.233' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (13, 8, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_8/Layout/螢幕擷取畫面 2024-07-20 235109.png', 1, CAST(N'2024-07-22T17:39:25.237' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (14, 8, N'螢幕擷取畫面 2024-07-20 235100.png', N'/BackStage/YachtFiles/Yacht_8/Layout/螢幕擷取畫面 2024-07-20 235100.png', 0, CAST(N'2024-07-22T17:39:25.237' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (15, 8, N'螢幕擷取畫面 2024-07-20 235047.png', N'/BackStage/YachtFiles/Yacht_8/Layout/螢幕擷取畫面 2024-07-20 235047.png', 0, CAST(N'2024-07-22T17:39:25.240' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (16, 8, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_8/Layout/20120405025758--1.jpg', 1, CAST(N'2024-07-22T17:41:50.210' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (17, 9, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_9/Layout/20120405025758--1.jpg', 0, CAST(N'2024-07-26T16:42:41.713' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (18, 9, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_9/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-26T16:42:41.713' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (19, 10, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_10/Layout/20120405025758--1.jpg', 0, CAST(N'2024-07-26T16:51:04.450' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (20, 10, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_10/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-26T16:51:04.450' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (21, 11, N'V44-1.png', N'/BackStage/YachtFiles/Yacht_11/Layout/V44-1.png', 0, CAST(N'2024-07-26T16:58:20.470' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (22, 12, N'20120405025758--1.jpg', N'/BackStage/YachtFiles/Yacht_12/Layout/20120405025758--1.jpg', 0, CAST(N'2024-07-26T17:10:58.940' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (23, 12, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_12/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-26T17:10:58.940' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (24, 13, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_13/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-26T17:14:22.327' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (25, 14, N'37Dimension.jpg', N'/BackStage/YachtFiles/Yacht_14/Layout/37Dimension.jpg', 0, CAST(N'2024-07-26T17:16:29.947' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (26, 14, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_14/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-26T17:16:29.950' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (27, 15, N'48.png', N'/BackStage/YachtFiles/Yacht_15/Layout/48.png', 0, CAST(N'2024-07-26T17:21:24.620' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (28, 15, N'V44-1.png', N'/BackStage/YachtFiles/Yacht_15/Layout/V44-1.png', 0, CAST(N'2024-07-26T17:21:24.623' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (29, 16, N'20120405025743--1 (1).jpg', N'/BackStage/YachtFiles/Yacht_16/Layout/20120405025743--1 (1).jpg', 0, CAST(N'2024-07-26T17:23:39.010' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (30, 16, N'black_surprise.jpg', N'/BackStage/YachtFiles/Yacht_16/Layout/black_surprise.jpg', 0, CAST(N'2024-07-26T17:23:39.010' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (31, 17, N'37Dimension.jpg', N'/BackStage/YachtFiles/Yacht_17/Layout/37Dimension.jpg', 0, CAST(N'2024-07-26T17:26:45.207' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (32, 17, N'20120405025743--1.jpg', N'/BackStage/YachtFiles/Yacht_17/Layout/20120405025743--1.jpg', 0, CAST(N'2024-07-26T17:26:45.210' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (33, 18, N'螢幕擷取畫面 2024-07-20 235135.png', N'/BackStage/YachtFiles/Yacht_18/Layout/螢幕擷取畫面 2024-07-20 235135.png', 1, CAST(N'2024-07-28T23:06:45.717' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (34, 18, N'螢幕擷取畫面 2024-07-20 235122.png', N'/BackStage/YachtFiles/Yacht_18/Layout/螢幕擷取畫面 2024-07-20 235122.png', 1, CAST(N'2024-07-28T23:06:45.723' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (35, 18, N'螢幕擷取畫面 2024-07-20 235109.png', N'/BackStage/YachtFiles/Yacht_18/Layout/螢幕擷取畫面 2024-07-20 235109.png', 1, CAST(N'2024-07-28T23:06:45.733' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (36, 18, N'螢幕擷取畫面 2024-07-20 235027.png', N'/BackStage/YachtFiles/Yacht_18/Layout/螢幕擷取畫面 2024-07-20 235027.png', 0, CAST(N'2024-07-28T23:08:11.877' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (37, 19, N'Yacht Layout (1).jpg', N'/BackStage/YachtFiles/Yacht_19/Layout/Yacht Layout (1).jpg', 0, CAST(N'2024-07-29T16:04:02.143' AS DateTime))
INSERT [dbo].[YachtLayout] ([Id], [YachtId], [ImageName], [ImagePath], [IsDelete], [CreateTime]) VALUES (38, 19, N'Yacht Layout (2).jpg', N'/BackStage/YachtFiles/Yacht_19/Layout/Yacht Layout (2).jpg', 0, CAST(N'2024-07-29T16:04:02.147' AS DateTime))
SET IDENTITY_INSERT [dbo].[YachtLayout] OFF
GO
SET IDENTITY_INSERT [dbo].[YachtSpecification] ON 

INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (12, 2, N'HULL', 0, CAST(N'2024-07-21T00:01:52.967' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (13, 2, N'DECK/HARDWARE', 0, CAST(N'2024-07-21T00:01:57.640' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (14, 2, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-21T00:02:01.913' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (15, 2, N'STEERING', 0, CAST(N'2024-07-21T00:02:05.923' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (16, 2, N'SPARS/RIGGING', 0, CAST(N'2024-07-21T00:02:09.180' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (17, 2, N'SAILS', 0, CAST(N'2024-07-21T00:02:13.203' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (18, 2, N'INTERIOR', 0, CAST(N'2024-07-21T00:02:17.150' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (19, 2, N'ELECTRICAL', 0, CAST(N'2024-07-21T00:02:20.710' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (20, 2, N'PLUMBING', 0, CAST(N'2024-07-21T00:02:24.153' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (21, 6, N'Title1', 0, CAST(N'2024-07-22T15:36:21.067' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (22, 6, N'Title12', 0, CAST(N'2024-07-22T15:42:18.797' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (23, 7, N'Title1', 1, CAST(N'2024-07-22T15:43:52.863' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (24, 7, N'Title123', 0, CAST(N'2024-07-22T15:43:56.033' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (25, 8, N'Title1', 0, CAST(N'2024-07-22T17:39:56.603' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (26, 8, N'Title2', 1, CAST(N'2024-07-22T17:39:58.660' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (27, 8, N'Title3', 0, CAST(N'2024-07-22T17:40:01.490' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (28, 8, N'Title5', 1, CAST(N'2024-07-22T17:40:19.800' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (29, 8, N'Title45', 0, CAST(N'2024-07-22T17:40:23.777' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (30, 9, N'HULL', 0, CAST(N'2024-07-26T16:44:05.060' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (31, 9, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T16:44:12.293' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (32, 9, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T16:44:16.420' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (33, 9, N'STEERING', 0, CAST(N'2024-07-26T16:44:20.080' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (34, 9, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T16:44:23.707' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (35, 9, N'SAILS', 0, CAST(N'2024-07-26T16:44:32.070' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (36, 9, N'INTERIOR', 0, CAST(N'2024-07-26T16:44:36.653' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (37, 9, N'ELECTRICAL', 0, CAST(N'2024-07-26T16:44:39.957' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (38, 9, N'PLUMBING', 0, CAST(N'2024-07-26T16:44:43.747' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (39, 10, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (40, 10, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (41, 10, N'STEERING', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (42, 10, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (43, 10, N'SAILS', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (44, 10, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (45, 10, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (46, 10, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:12.250' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (47, 11, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (48, 11, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (49, 11, N'STEERING', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (50, 11, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (51, 11, N'SAILS', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (52, 11, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (53, 11, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (54, 11, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:37.407' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (55, 12, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (56, 12, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (57, 12, N'STEERING', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (58, 12, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (59, 12, N'SAILS', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (60, 12, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (61, 12, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (62, 12, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:38.190' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (63, 13, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (64, 13, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (65, 13, N'STEERING', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (66, 13, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (67, 13, N'SAILS', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (68, 13, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (69, 13, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (70, 13, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:38.760' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (71, 14, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (72, 14, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (73, 14, N'STEERING', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (74, 14, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (75, 14, N'SAILS', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (76, 14, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (77, 14, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (78, 14, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:39.290' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (79, 15, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (80, 15, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (81, 15, N'STEERING', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (82, 15, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (83, 15, N'SAILS', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (84, 15, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (85, 15, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (86, 15, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:39.783' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (87, 16, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (88, 16, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (89, 16, N'STEERING', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (90, 16, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (91, 16, N'SAILS', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (92, 16, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (93, 16, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (94, 16, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:40.287' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (95, 17, N'DECK/HARDWARE', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (96, 17, N'ENGINE/MACHINERY', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (97, 17, N'STEERING', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (98, 17, N'SPARS/RIGGING', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (99, 17, N'SAILS', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (100, 17, N'INTERIOR', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (101, 17, N'ELECTRICAL', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (102, 17, N'PLUMBING', 0, CAST(N'2024-07-26T17:31:40.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (103, 10, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (104, 11, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (105, 12, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (106, 13, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (107, 14, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (108, 15, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (109, 16, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (110, 17, N'HULL', 0, CAST(N'2024-07-26T17:35:38.523' AS DateTime))
GO
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (111, 18, N'123123', 0, CAST(N'2024-07-28T23:07:08.570' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (112, 18, N'456456', 0, CAST(N'2024-07-28T23:07:16.780' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (113, 19, N'Hull', 0, CAST(N'2024-07-29T16:05:43.420' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (114, 19, N'Exterior', 0, CAST(N'2024-07-29T16:05:47.997' AS DateTime))
INSERT [dbo].[YachtSpecification] ([Id], [YachtId], [Name], [IsDelete], [CreateTime]) VALUES (115, 19, N'Technology', 0, CAST(N'2024-07-29T16:05:51.887' AS DateTime))
SET IDENTITY_INSERT [dbo].[YachtSpecification] OFF
GO
SET IDENTITY_INSERT [dbo].[YachtSpecificationItem] ON 

INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (17, 12, N'Hand laid up FRP hull, white with blue cove stripe and boot top.', 0, CAST(N'2024-07-21T00:02:35.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (18, 12, N'Teak rubrail.', 0, CAST(N'2024-07-21T00:02:35.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (19, 13, N'Hand laid up FRP cord deck.', 0, CAST(N'2024-07-21T00:03:25.943' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (20, 13, N'Teak cockpit seats and cockpit grating', 0, CAST(N'2024-07-21T00:03:25.950' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (21, 13, N'Teak skylight', 0, CAST(N'2024-07-21T00:03:25.950' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (22, 13, N'Teak companionway hatch with doors & stormboards', 0, CAST(N'2024-07-21T00:03:25.953' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (23, 13, N'Teak or alumnum forward hatch', 0, CAST(N'2024-07-21T00:03:25.957' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (24, 13, N'Teak exterior trim', 0, CAST(N'2024-07-21T00:03:25.960' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (25, 13, N'Teak exterior handrails', 0, CAST(N'2024-07-21T00:03:25.963' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (26, 13, N'Teak samsom posts forward', 0, CAST(N'2024-07-21T00:03:25.967' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (27, 13, N'Laminated bow sprit with teak platform & anchor rollers', 0, CAST(N'2024-07-21T00:03:25.970' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (28, 13, N'Chain locker and one deck pipe', 0, CAST(N'2024-07-21T00:03:25.973' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (29, 13, N'SS stanchions, vinyl covered dbl lifelines w/ gates P&S', 0, CAST(N'2024-07-21T00:04:08.777' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (30, 13, N'SS bow pulpit', 0, CAST(N'2024-07-21T00:04:08.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (31, 13, N'SS stern pulpit', 0, CAST(N'2024-07-21T00:04:08.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (32, 13, N'Stainless hawse pipes & mooring cleats (six)', 0, CAST(N'2024-07-21T00:04:08.787' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (33, 13, N'Stainless steel opening ports (ten)', 0, CAST(N'2024-07-21T00:04:08.790' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (34, 13, N'Dorade vents (four)', 0, CAST(N'2024-07-21T00:04:08.790' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (35, 13, N'FRP seahood', 0, CAST(N'2024-07-21T00:04:08.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (36, 13, N'Propane locker for two 20 lb tanks, vented overboard', 0, CAST(N'2024-07-21T00:04:08.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (37, 13, N'Two coaming lockers', 0, CAST(N'2024-07-21T00:04:08.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (38, 13, N'Aluminium mainsheet traveler w/ roller car', 0, CAST(N'2024-07-21T00:04:08.797' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (39, 13, N'Staysail track', 0, CAST(N'2024-07-21T00:04:38.190' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (40, 13, N'Aluminium genoa tracks with cars', 0, CAST(N'2024-07-21T00:04:38.190' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (41, 13, N'Teak sliding companionway hatch', 0, CAST(N'2024-07-21T00:04:38.197' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (42, 13, N'Teak coaming caps', 0, CAST(N'2024-07-21T00:04:38.200' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (43, 13, N'Winch handles', 0, CAST(N'2024-07-21T00:04:38.203' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (44, 13, N'Seven Lewmar winches Two 40CST jib sheet One 40CSTmain sheet One 30CST staysail One 30CST jib halyard One 30CST main halyard One 30CST staysail halyard', 1, CAST(N'2024-07-21T00:04:38.207' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (45, 14, N'01Diesel engine – Yanmar 4JHE, fresh water cooled, 55HP', 0, CAST(N'2024-07-21T00:05:11.967' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (46, 14, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-21T00:05:11.970' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (47, 14, N'Dripless shaft gland', 0, CAST(N'2024-07-21T00:05:11.973' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (48, 14, N'Bronze three blade propeller', 0, CAST(N'2024-07-21T00:05:11.973' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (49, 14, N'Fiberglass drip pan', 0, CAST(N'2024-07-21T00:05:11.973' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (50, 15, N'Pedestal steering', 0, CAST(N'2024-07-21T00:05:30.297' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (51, 15, N'Teak traditional steering wheel', 0, CAST(N'2024-07-21T00:05:30.297' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (52, 15, N'Teak & SS emergency tiller', 0, CAST(N'2024-07-21T00:05:30.300' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (53, 15, N'SS rudder shaft', 0, CAST(N'2024-07-21T00:05:30.303' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (54, 16, N'Alumnium mast & boom, mast with electrical conduits', 0, CAST(N'2024-07-21T00:05:43.870' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (55, 16, N'5/16” SS standing rigging w/ swaged terminals', 0, CAST(N'2024-07-21T00:05:43.870' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (56, 16, N'Staysail boom & fittings', 0, CAST(N'2024-07-21T00:05:43.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (57, 17, N'Main, 8 oz, w/2 reef points', 0, CAST(N'2024-07-21T00:06:12.067' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (58, 17, N'Yankee jib, 8 oz, 100%', 0, CAST(N'2024-07-21T00:06:12.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (59, 17, N'Staysail, 8 oz', 0, CAST(N'2024-07-21T00:06:12.073' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (60, 17, N'Mizzon, 8 oz (ketch only)', 0, CAST(N'2024-07-21T00:06:12.080' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (61, 17, N'Sail bags for all sails', 0, CAST(N'2024-07-21T00:06:12.080' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (62, 17, N'Sail covers for all sails (blue)', 0, CAST(N'2024-07-21T00:06:12.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (63, 18, N'Teak and holly cabin sole', 0, CAST(N'2024-07-21T00:06:49.057' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (64, 18, N'White formica counters in head & galley. Teak veneer chart & dinette table tops.', 0, CAST(N'2024-07-21T00:06:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (65, 18, N'Teak framed mirror in head', 0, CAST(N'2024-07-21T00:06:49.063' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (66, 18, N'Interior teak handrails', 0, CAST(N'2024-07-21T00:06:49.067' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (67, 18, N'V-berth filler (if applicable)', 0, CAST(N'2024-07-21T00:06:49.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (68, 18, N'Vinyl cushion covers', 0, CAST(N'2024-07-21T00:06:49.073' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (69, 18, N'Ice chest insulated w/ 4” PU foam & SS lined', 0, CAST(N'2024-07-21T00:06:49.077' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (70, 18, N'Interior varnished quality polyurethane satin', 0, CAST(N'2024-07-21T00:06:49.077' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (71, 18, N'Stove alcove SS lined', 0, CAST(N'2024-07-21T00:06:49.080' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (72, 18, N'Easily removable head liner', 0, CAST(N'2024-07-21T00:06:49.080' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (73, 18, N'Ceiling on all exposed hull areas', 0, CAST(N'2024-07-21T00:06:57.043' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (74, 19, N'Dual l20AH, 12 volt batteries in FRP boxes', 0, CAST(N'2024-07-21T00:07:21.167' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (75, 19, N'Eight l2 volt cabin lights overhead & six reading lights', 0, CAST(N'2024-07-21T00:07:21.167' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (76, 19, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers & volt meter & ammeter and DC outltes', 0, CAST(N'2024-07-21T00:07:21.170' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (77, 19, N'll0 volt shore power system w/ 30amp power socket, electric panel w/ breakers & volt meter and ammeter, ll0 volt outlets throughout yacht', 0, CAST(N'2024-07-21T00:07:21.170' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (78, 19, N'International rules running lights', 0, CAST(N'2024-07-21T00:07:21.170' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (79, 19, N'Deck flood light', 0, CAST(N'2024-07-21T00:07:21.173' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (80, 19, N'Anchor light', 0, CAST(N'2024-07-21T00:07:21.173' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (81, 20, N'90 gallon mild steel fuel tank', 0, CAST(N'2024-07-21T00:07:57.563' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (82, 20, N'l00 gallon SS fresh water tank', 0, CAST(N'2024-07-21T00:07:57.567' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (83, 20, N'30 gallon FRP holding tank', 0, CAST(N'2024-07-21T00:07:57.567' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (84, 20, N'Manual marine head', 0, CAST(N'2024-07-21T00:07:57.570' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (85, 20, N'Hot and cold pressure water system', 0, CAST(N'2024-07-21T00:07:57.577' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (86, 20, N'One heavy duty electrical bilge pump', 0, CAST(N'2024-07-21T00:07:57.580' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (87, 20, N'One high capacity manual bilge pump to pump bilge & holding tank', 0, CAST(N'2024-07-21T00:07:57.580' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (88, 20, N'l0 gallon water heater, (ll0 or 220volt) & engine heated', 0, CAST(N'2024-07-21T00:07:57.583' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (89, 20, N'Bilge pump strainer', 0, CAST(N'2024-07-21T00:07:57.583' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (90, 20, N'Sea cocks on all through hull fittings', 0, CAST(N'2024-07-21T00:07:57.590' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (91, 20, N'Double clamps on all through-hulls below water line', 0, CAST(N'2024-07-21T00:08:02.717' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (92, 21, N'1', 1, CAST(N'2024-07-22T15:36:29.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (93, 21, N'2', 1, CAST(N'2024-07-22T15:36:29.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (94, 21, N'3', 1, CAST(N'2024-07-22T15:36:29.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (95, 21, N'4', 1, CAST(N'2024-07-22T15:36:29.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (96, 21, N'7', 1, CAST(N'2024-07-22T15:36:29.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (97, 21, N'5', 1, CAST(N'2024-07-22T15:36:29.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (98, 21, N'453', 0, CAST(N'2024-07-22T15:42:25.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (99, 21, N'1232', 0, CAST(N'2024-07-22T15:42:25.767' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (100, 21, N'1122', 0, CAST(N'2024-07-22T15:42:25.767' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (101, 21, N'12', 0, CAST(N'2024-07-22T15:42:25.770' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (102, 22, N'453', 0, CAST(N'2024-07-22T15:42:31.130' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (103, 22, N'1221', 0, CAST(N'2024-07-22T15:42:31.130' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (104, 22, N'4532', 0, CAST(N'2024-07-22T15:42:31.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (105, 22, N'4532', 0, CAST(N'2024-07-22T15:42:31.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (106, 23, N'453', 0, CAST(N'2024-07-22T15:44:01.367' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (107, 23, N'1', 0, CAST(N'2024-07-22T15:44:01.370' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (108, 24, N'q', 0, CAST(N'2024-07-22T15:44:11.443' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (109, 24, N'Teak companionway hatch with doors & stormboards', 0, CAST(N'2024-07-22T15:44:11.450' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (110, 24, N'Seven Lewmar winches Two 40CST jib sheet One 40CSTmain sheet One 30CST staysail One 30CST jib halyard One 30CST main halyard One 30CST staysail halyard', 0, CAST(N'2024-07-22T15:44:11.450' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (111, 27, N'1', 0, CAST(N'2024-07-22T17:40:37.907' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (112, 27, N'2', 0, CAST(N'2024-07-22T17:40:37.910' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (113, 27, N'2', 0, CAST(N'2024-07-22T17:40:37.910' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (114, 27, N'4', 0, CAST(N'2024-07-22T17:40:37.910' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (115, 27, N'4', 0, CAST(N'2024-07-22T17:40:37.910' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (116, 27, N'5', 0, CAST(N'2024-07-22T17:40:37.910' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (117, 27, N'2', 0, CAST(N'2024-07-22T17:40:37.910' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (118, 29, N'45', 1, CAST(N'2024-07-22T17:40:43.327' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (119, 29, N'21', 0, CAST(N'2024-07-22T17:40:43.330' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (120, 29, N'12', 0, CAST(N'2024-07-22T17:40:43.330' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (121, 29, N'1', 0, CAST(N'2024-07-22T17:40:43.330' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (122, 29, N'2', 0, CAST(N'2024-07-22T17:40:43.330' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (123, 26, N'12', 0, CAST(N'2024-07-22T17:40:48.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (124, 26, N'12', 0, CAST(N'2024-07-22T17:40:48.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (125, 26, N'12', 0, CAST(N'2024-07-22T17:40:48.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (126, 26, N'12', 0, CAST(N'2024-07-22T17:40:48.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (127, 26, N'12', 0, CAST(N'2024-07-22T17:40:48.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (128, 26, N'12', 0, CAST(N'2024-07-22T17:40:48.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (129, 25, N'45', 0, CAST(N'2024-07-22T17:40:53.460' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (130, 25, N'4', 0, CAST(N'2024-07-22T17:40:53.463' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (131, 25, N'123', 0, CAST(N'2024-07-22T17:40:53.463' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (132, 25, N'45', 0, CAST(N'2024-07-22T17:40:53.467' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (133, 25, N'45', 0, CAST(N'2024-07-22T17:40:53.467' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (134, 26, N'12', 0, CAST(N'2024-07-22T17:40:59.983' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (135, 26, N'12', 0, CAST(N'2024-07-22T17:40:59.983' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (136, 26, N'333', 0, CAST(N'2024-07-22T17:41:06.693' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (137, 13, N'123', 1, CAST(N'2024-07-23T15:50:46.530' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (138, 13, N'21321', 1, CAST(N'2024-07-23T17:46:23.533' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (139, 13, N'12', 1, CAST(N'2024-07-23T17:46:23.540' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (140, 13, N'123', 1, CAST(N'2024-07-23T17:46:23.540' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (141, 30, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T16:44:54.800' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (142, 30, N'Teak rubrail', 0, CAST(N'2024-07-26T16:44:54.800' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (143, 31, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T16:45:29.243' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (144, 31, N'Molded nonskid', 0, CAST(N'2024-07-26T16:45:29.247' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (145, 31, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T16:45:29.250' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (146, 31, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T16:45:29.250' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (147, 31, N'Aluminum hatches', 0, CAST(N'2024-07-26T16:45:29.250' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (148, 31, N'S.S. potholes', 0, CAST(N'2024-07-26T16:45:29.253' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (149, 31, N'Teak exterior handrails', 0, CAST(N'2024-07-26T16:45:29.253' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (150, 31, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T16:45:29.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (151, 31, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T16:45:29.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (152, 31, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T16:45:29.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (153, 31, N'SS bow pulpit', 0, CAST(N'2024-07-26T16:45:57.173' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (154, 31, N'SS stern pulpit', 0, CAST(N'2024-07-26T16:45:57.180' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (155, 31, N'Aluminum toe rail with haswse holes', 0, CAST(N'2024-07-26T16:45:57.180' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (156, 31, N'Mooring cleats', 0, CAST(N'2024-07-26T16:45:57.183' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (157, 31, N'Dorade vents, 5 ea', 0, CAST(N'2024-07-26T16:45:57.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (158, 31, N'FRP seahood', 0, CAST(N'2024-07-26T16:45:57.190' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (159, 31, N'Propane locker for two 20 lb tanks vented overboard', 0, CAST(N'2024-07-26T16:45:57.190' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (160, 31, N'Lazarette hatch', 0, CAST(N'2024-07-26T16:45:57.190' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (161, 31, N'Two coaming lockers', 0, CAST(N'2024-07-26T16:45:57.193' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (162, 31, N'Aluminum mainsheet traveler w/ roller car', 0, CAST(N'2024-07-26T16:45:57.193' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (163, 31, N'SS staysail traveler', 0, CAST(N'2024-07-26T16:46:21.443' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (164, 31, N'SS genoa tracks with cars', 0, CAST(N'2024-07-26T16:46:21.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (165, 31, N'Mast safety guards', 0, CAST(N'2024-07-26T16:46:21.450' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (166, 31, N'Anchor windlass, two speed', 0, CAST(N'2024-07-26T16:46:21.450' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (167, 31, N'Lexan sliding companionway hatch', 0, CAST(N'2024-07-26T16:46:21.450' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (168, 31, N'Teak louvered companionway doors', 0, CAST(N'2024-07-26T16:46:21.450' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (169, 31, N'SS stanchions w/ vinyl covered double life lines w/ gates P&S', 0, CAST(N'2024-07-26T16:46:21.453' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (170, 31, N'Winches, Lewmar', 0, CAST(N'2024-07-26T16:46:21.453' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (171, 32, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T16:46:38.007' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (172, 32, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T16:46:38.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (173, 32, N'Dripless shaft gland', 0, CAST(N'2024-07-26T16:46:38.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (174, 32, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T16:46:38.017' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (175, 32, N'FRP drip pan', 0, CAST(N'2024-07-26T16:46:38.020' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (176, 32, N'Engine room blower', 0, CAST(N'2024-07-26T16:46:38.020' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (177, 32, N'Pedestal steering EDSON', 1, CAST(N'2024-07-26T16:46:51.307' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (178, 32, N'Destroyer type steering wheel SS', 1, CAST(N'2024-07-26T16:46:51.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (179, 32, N'Teak emergency tiller', 1, CAST(N'2024-07-26T16:46:51.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (180, 32, N'SS rudder', 1, CAST(N'2024-07-26T16:46:51.317' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (181, 34, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T16:47:03.560' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (182, 34, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T16:47:03.560' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (183, 34, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T16:47:03.563' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (184, 33, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T16:47:32.690' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (185, 33, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T16:47:32.690' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (186, 33, N'Teak emergency tiller', 0, CAST(N'2024-07-26T16:47:32.690' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (187, 33, N'SS rudder', 0, CAST(N'2024-07-26T16:47:32.690' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (188, 35, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T16:47:49.153' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (189, 35, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T16:47:49.157' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (190, 35, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T16:47:49.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (191, 35, N'Sail bags for all sails', 0, CAST(N'2024-07-26T16:47:49.163' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (192, 35, N'Sail covers for main sail', 0, CAST(N'2024-07-26T16:47:49.163' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (193, 36, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T16:48:23.480' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (194, 36, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T16:48:23.483' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (195, 36, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T16:48:23.487' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (196, 36, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T16:48:23.490' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (197, 36, N'Interior teak handrails', 0, CAST(N'2024-07-26T16:48:23.490' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (198, 36, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T16:48:23.493' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (199, 36, N'Cloth cushions covers', 0, CAST(N'2024-07-26T16:48:23.493' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (200, 36, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T16:48:23.497' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (201, 36, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T16:48:23.497' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (202, 36, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T16:48:23.497' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (203, 36, N'Easily removable head liner', 0, CAST(N'2024-07-26T16:48:40.530' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (204, 36, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T16:48:40.533' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (205, 36, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T16:48:40.537' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (206, 36, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T16:48:40.540' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (207, 38, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T16:49:15.877' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (208, 38, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T16:49:15.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (209, 38, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T16:49:15.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (210, 38, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T16:49:15.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (211, 38, N'Manual marine head', 0, CAST(N'2024-07-26T16:49:15.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (212, 38, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T16:49:15.883' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (213, 38, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T16:49:15.883' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (214, 38, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T16:49:15.883' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (215, 38, N'Bilge pump strainers', 0, CAST(N'2024-07-26T16:49:15.887' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (216, 38, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T16:49:15.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (217, 37, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T16:49:35.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (218, 37, N'International running lights', 0, CAST(N'2024-07-26T16:49:35.407' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (219, 37, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T16:49:35.407' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (220, 37, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T16:49:35.410' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (221, 37, N'12 volt deck flood light', 0, CAST(N'2024-07-26T16:49:35.413' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (222, 37, N'12 volt anchor light', 0, CAST(N'2024-07-26T16:49:35.413' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (223, 37, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T16:49:35.417' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (238, 39, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (239, 39, N'Teak rubrail', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (240, 39, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (241, 39, N'Molded nonskid', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (242, 39, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (243, 39, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (244, 39, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (245, 39, N'S.S. potholes', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (246, 39, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (247, 39, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (248, 39, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (249, 39, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (250, 39, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (251, 39, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:37:46.667' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (266, 47, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (267, 47, N'Teak rubrail', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (268, 47, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (269, 47, N'Molded nonskid', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (270, 47, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (271, 47, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (272, 47, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (273, 47, N'S.S. potholes', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (274, 47, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (275, 47, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (276, 47, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (277, 47, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (278, 47, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (279, 47, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:37:54.747' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (294, 55, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (295, 55, N'Teak rubrail', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (296, 55, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (297, 55, N'Molded nonskid', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (298, 55, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (299, 55, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (300, 55, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (301, 55, N'S.S. potholes', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (302, 55, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (303, 55, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (304, 55, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (305, 55, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (306, 55, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (307, 55, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:38:00.783' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (322, 63, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (323, 63, N'Teak rubrail', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (324, 63, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (325, 63, N'Molded nonskid', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (326, 63, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (327, 63, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (328, 63, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (329, 63, N'S.S. potholes', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (330, 63, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (331, 63, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (332, 63, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (333, 63, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (334, 63, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (335, 63, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:38:08.617' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (350, 71, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (351, 71, N'Teak rubrail', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (352, 71, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (353, 71, N'Molded nonskid', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (354, 71, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (355, 71, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (356, 71, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (357, 71, N'S.S. potholes', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (358, 71, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (359, 71, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (360, 71, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (361, 71, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (362, 71, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (363, 71, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:38:15.620' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (378, 79, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (379, 79, N'Teak rubrail', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (380, 79, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (381, 79, N'Molded nonskid', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (382, 79, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (383, 79, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (384, 79, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (385, 79, N'S.S. potholes', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (386, 79, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (387, 79, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (388, 79, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (389, 79, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (390, 79, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (391, 79, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:38:21.287' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (406, 87, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (407, 87, N'Teak rubrail', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (408, 87, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (409, 87, N'Molded nonskid', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (410, 87, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (411, 87, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (412, 87, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (413, 87, N'S.S. potholes', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (414, 87, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (415, 87, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (416, 87, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (417, 87, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (418, 87, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (419, 87, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:38:32.220' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (434, 95, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (435, 95, N'Teak rubrail', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (436, 95, N'Hand laid up FRP, cored deck', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (437, 95, N'Molded nonskid', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (438, 95, N'Teak cockpit seats and sole', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (439, 95, N'FRP cockpit coaming with teak cap', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (440, 95, N'Aluminum hatches', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (441, 95, N'S.S. potholes', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (442, 95, N'Teak exterior handrails', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (443, 95, N'Double anchor sprit with rollers', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (444, 95, N'Chain locker & one deckpipe', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (445, 95, N'Anchor well in foredeck', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (446, 95, N'SS bow pulpit', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (447, 95, N'SS stern pulpit', 0, CAST(N'2024-07-26T17:38:37.013' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (465, 40, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (466, 40, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (467, 40, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (468, 40, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (469, 40, N'FRP drip pan', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (470, 40, N'Engine room blower', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (471, 40, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (472, 40, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (473, 40, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (474, 40, N'SS rudder', 0, CAST(N'2024-07-26T18:15:40.010' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (475, 48, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (476, 48, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (477, 48, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (478, 48, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (479, 48, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (480, 48, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (481, 48, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (482, 48, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (483, 48, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (484, 48, N'SS rudder', 0, CAST(N'2024-07-26T18:16:15.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (485, 56, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (486, 56, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (487, 56, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (488, 56, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (489, 56, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (490, 56, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (491, 56, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (492, 56, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (493, 56, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (494, 56, N'SS rudder', 0, CAST(N'2024-07-26T18:16:19.763' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (495, 64, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (496, 64, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (497, 64, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (498, 64, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (499, 64, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (500, 64, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (501, 64, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (502, 64, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (503, 64, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (504, 64, N'SS rudder', 0, CAST(N'2024-07-26T18:16:22.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (505, 72, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (506, 72, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (507, 72, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (508, 72, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (509, 72, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (510, 72, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (511, 72, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (512, 72, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (513, 72, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (514, 72, N'SS rudder', 0, CAST(N'2024-07-26T18:16:26.997' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (515, 80, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (516, 80, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (517, 80, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (518, 80, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (519, 80, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (520, 80, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (521, 80, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (522, 80, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (523, 80, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (524, 80, N'SS rudder', 0, CAST(N'2024-07-26T18:16:28.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (525, 88, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (526, 88, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (527, 88, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (528, 88, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (529, 88, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (530, 88, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (531, 88, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (532, 88, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (533, 88, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (534, 88, N'SS rudder', 0, CAST(N'2024-07-26T18:16:30.273' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (535, 96, N'Diesel engine-Yanmar 4JH2E freshwater cooled, 50HP', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (536, 96, N'Engine cooling water intake strainer', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (537, 96, N'Dripless shaft gland', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (538, 96, N'Bronze three blade propeller', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (539, 96, N'FRP drip pan', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (540, 96, N'Engine room blower', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (541, 96, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (542, 96, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (543, 96, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (544, 96, N'SS rudder', 0, CAST(N'2024-07-26T18:16:32.160' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (545, 41, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:16:57.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (546, 41, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:16:57.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (547, 41, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:16:57.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (548, 41, N'SS rudder', 0, CAST(N'2024-07-26T18:16:57.793' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (549, 49, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:00.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (550, 49, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:00.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (551, 49, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:00.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (552, 49, N'SS rudder', 0, CAST(N'2024-07-26T18:17:00.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (553, 57, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:02.613' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (554, 57, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:02.613' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (555, 57, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:02.613' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (556, 57, N'SS rudder', 0, CAST(N'2024-07-26T18:17:02.613' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (557, 65, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:05.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (558, 65, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:05.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (559, 65, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:05.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (560, 65, N'SS rudder', 0, CAST(N'2024-07-26T18:17:05.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (561, 73, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:07.370' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (562, 73, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:07.370' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (563, 73, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:07.370' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (564, 73, N'SS rudder', 0, CAST(N'2024-07-26T18:17:07.370' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (565, 81, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:09.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (566, 81, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:09.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (567, 81, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:09.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (568, 81, N'SS rudder', 0, CAST(N'2024-07-26T18:17:09.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (569, 89, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:12.627' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (570, 89, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:12.627' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (571, 89, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:12.627' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (572, 89, N'SS rudder', 0, CAST(N'2024-07-26T18:17:12.627' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (573, 97, N'Pedestal steering EDSON', 0, CAST(N'2024-07-26T18:17:16.200' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (574, 97, N'Destroyer type steering wheel SS', 0, CAST(N'2024-07-26T18:17:16.200' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (575, 97, N'Teak emergency tiller', 0, CAST(N'2024-07-26T18:17:16.200' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (576, 97, N'SS rudder', 0, CAST(N'2024-07-26T18:17:16.200' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (577, 42, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:29.233' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (578, 42, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:29.233' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (579, 42, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:29.233' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (580, 50, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:31.607' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (581, 50, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:31.607' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (582, 50, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:31.607' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (583, 58, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:33.213' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (584, 58, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:33.213' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (585, 58, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:33.213' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (586, 66, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:34.843' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (587, 66, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:34.843' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (588, 66, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:34.843' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (589, 74, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:36.787' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (590, 74, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:36.787' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (591, 74, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:36.787' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (592, 82, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:39.173' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (593, 82, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:39.173' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (594, 82, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:39.173' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (595, 90, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:41.680' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (596, 90, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:41.680' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (597, 90, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:41.680' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (598, 98, N'Aluminum mast and boom, mast w/ electrical conduits', 0, CAST(N'2024-07-26T18:17:43.077' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (599, 98, N'Standing rigging 5/16” & 3/8” SS w/ swaged terminals.', 0, CAST(N'2024-07-26T18:17:43.077' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (600, 98, N'Staysail boom & fittings', 0, CAST(N'2024-07-26T18:17:43.077' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (601, 43, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:18:07.357' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (602, 43, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:07.357' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (603, 43, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:07.357' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (604, 43, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:18:07.357' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (605, 43, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:18:07.357' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (606, 51, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:18:09.797' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (607, 51, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:09.797' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (608, 51, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:09.797' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (609, 51, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:18:09.797' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (610, 51, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:18:09.797' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (636, 59, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:18:57.593' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (637, 59, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:57.593' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (638, 59, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:57.593' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (639, 59, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:18:57.593' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (640, 59, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:18:57.593' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (641, 67, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:18:59.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (642, 67, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:59.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (643, 67, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:18:59.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (644, 67, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:18:59.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (645, 67, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:18:59.093' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (646, 75, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:19:01.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (647, 75, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:01.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (648, 75, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:01.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (649, 75, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:19:01.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (650, 75, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:19:01.873' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (651, 83, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:19:03.527' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (652, 83, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:03.527' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (653, 83, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:03.527' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (654, 83, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:19:03.527' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (655, 83, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:19:03.527' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (656, 91, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:19:04.877' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (657, 91, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:04.877' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (658, 91, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:04.877' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (659, 91, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:19:04.877' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (660, 91, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:19:04.877' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (661, 99, N'Mainsail, 8 oz dacron w/ 2 reef points', 0, CAST(N'2024-07-26T18:19:06.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (662, 99, N'Jib, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:06.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (663, 99, N'Staysail, 8 oz dacron', 0, CAST(N'2024-07-26T18:19:06.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (664, 99, N'Sail bags for all sails', 0, CAST(N'2024-07-26T18:19:06.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (665, 99, N'Sail covers for main sail', 0, CAST(N'2024-07-26T18:19:06.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (666, 44, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (667, 44, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (668, 44, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (669, 44, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (670, 44, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (671, 44, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (672, 44, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (673, 44, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (674, 44, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (675, 44, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (676, 44, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (677, 44, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (678, 44, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (679, 44, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:46.083' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (680, 52, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (681, 52, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (682, 52, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (683, 52, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (684, 52, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (685, 52, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (686, 52, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (687, 52, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (688, 52, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (689, 52, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (690, 52, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (691, 52, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (692, 52, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (693, 52, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:48.403' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (694, 60, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (695, 60, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (696, 60, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (697, 60, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (698, 60, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (699, 60, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (700, 60, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (701, 60, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (702, 60, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (703, 60, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (704, 60, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (705, 60, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (706, 60, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (707, 60, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:49.893' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (708, 68, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (709, 68, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (710, 68, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (711, 68, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (712, 68, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (713, 68, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (714, 68, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (715, 68, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (716, 68, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (717, 68, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (718, 68, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (719, 68, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (720, 68, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (721, 68, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:51.257' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (722, 76, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (723, 76, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (724, 76, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (725, 76, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (726, 76, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (727, 76, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (728, 76, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (729, 76, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (730, 76, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (731, 76, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (732, 76, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (733, 76, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (734, 76, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (735, 76, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:52.853' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (736, 84, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (737, 84, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (738, 84, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (739, 84, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (740, 84, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (741, 84, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (742, 84, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (743, 84, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (744, 84, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (745, 84, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (746, 84, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (747, 84, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (748, 84, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (749, 84, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:54.780' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (750, 92, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (751, 92, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (752, 92, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (753, 92, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (754, 92, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (755, 92, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (756, 92, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (757, 92, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (758, 92, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (759, 92, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (760, 92, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (761, 92, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (762, 92, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (763, 92, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:56.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (764, 100, N'Teak and spruce joinery & cabinetry throughout', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (765, 100, N'Teak & holly cabin sole', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (766, 100, N'White formica counter in head & galley, simulated wood grain, teak veneer desk & table top', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (767, 100, N'Teak framed mirror in head', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (768, 100, N'Interior teak handrails', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (769, 100, N'V-berth filler if applicable', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (770, 100, N'Cloth cushions covers', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (771, 100, N'Ice chest has 4” P.U. foam & SS liner', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (772, 100, N'Interior polyurethane vanrish, satin', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (773, 100, N'Stove alcove SS lined', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (774, 100, N'Easily removable head liner', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (775, 100, N'Teak fiddles & teak trim on counters & tables', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (776, 100, N'Four inch interior foam cushions w/ cloth covering', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (777, 100, N'Solid teak doors & frames', 0, CAST(N'2024-07-26T18:19:57.977' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (778, 46, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (779, 46, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (780, 46, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (781, 46, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (782, 46, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (783, 46, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (784, 46, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (785, 46, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (786, 46, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (787, 46, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:13.510' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (788, 54, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (789, 54, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (790, 54, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (791, 54, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (792, 54, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (793, 54, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (794, 54, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (795, 54, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (796, 54, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (797, 54, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:15.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (798, 62, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (799, 62, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (800, 62, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (801, 62, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (802, 62, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (803, 62, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (804, 62, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (805, 62, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (806, 62, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (807, 62, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:16.890' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (808, 70, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (809, 70, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (810, 70, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (811, 70, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (812, 70, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (813, 70, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (814, 70, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (815, 70, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (816, 70, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (817, 70, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:18.377' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (818, 78, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (819, 78, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (820, 78, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (821, 78, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (822, 78, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (823, 78, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (824, 78, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (825, 78, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (826, 78, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (827, 78, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:22.310' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (828, 86, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (829, 86, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (830, 86, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (831, 86, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (832, 86, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (833, 86, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (834, 86, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (835, 86, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (836, 86, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (837, 86, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:24.920' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (838, 94, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (839, 94, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (840, 94, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (841, 94, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (842, 94, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (843, 94, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (844, 94, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (845, 94, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (846, 94, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (847, 94, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:26.993' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (848, 102, N'Two 60 gallon mild steel fuel tanks', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (849, 102, N'Two 70 gallon SS water tanks', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (850, 102, N'One 30 gallon holding tank', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (851, 102, N'One 10 gallon hot water heater, 110 volt & engine heat exchanger', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (852, 102, N'Manual marine head', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (853, 102, N'Hot and cold pressure water system', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (854, 102, N'One high capacity manual bilge pump', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (855, 102, N'One heavy duty electric bilge pump', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (856, 102, N'Bilge pump strainers', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (857, 102, N'Sea cocks on all through hulls', 0, CAST(N'2024-07-26T18:20:28.447' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (858, 45, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (859, 45, N'International running lights', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (860, 45, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (861, 45, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (862, 45, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (863, 45, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (864, 45, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:45.160' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (865, 53, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (866, 53, N'International running lights', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (867, 53, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (868, 53, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (869, 53, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
GO
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (870, 53, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (871, 53, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:46.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (872, 61, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (873, 61, N'International running lights', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (874, 61, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (875, 61, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (876, 61, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (877, 61, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (878, 61, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:48.070' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (879, 69, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (880, 69, N'International running lights', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (881, 69, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (882, 69, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (883, 69, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (884, 69, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (885, 69, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:49.060' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (886, 77, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (887, 77, N'International running lights', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (888, 77, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (889, 77, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (890, 77, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (891, 77, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (892, 77, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:51.347' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (893, 85, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (894, 85, N'International running lights', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (895, 85, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (896, 85, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (897, 85, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (898, 85, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (899, 85, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:53.360' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (900, 93, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (901, 93, N'International running lights', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (902, 93, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (903, 93, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (904, 93, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (905, 93, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (906, 93, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:54.660' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (907, 101, N'Two 120AH 12 volt batteries & FRP boxes', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (908, 101, N'International running lights', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (909, 101, N'Eight 12 volt cabin lights overhead & two reading lights', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (910, 101, N'12 volt electrical system w/ 3 way switch, electric panel w/ breakers and volt meter & ammeter', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (911, 101, N'12 volt deck flood light', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (912, 101, N'12 volt anchor light', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (913, 101, N'110 volt electrical system w/30 amp shore power plug, electric panel w/ breakers & voltmeter & ammeter & 110 volt outlets throughout the yacht', 0, CAST(N'2024-07-26T18:20:56.187' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (914, 103, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:05.280' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (915, 103, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:05.280' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (916, 104, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:13.050' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (917, 104, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:13.050' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (918, 105, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:18.123' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (919, 105, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:18.123' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (920, 106, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:20.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (921, 106, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:20.697' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (922, 107, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:23.987' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (923, 107, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:23.987' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (924, 108, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:37.803' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (925, 108, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:37.803' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (926, 109, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:39.217' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (927, 109, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:39.217' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (928, 110, N'Hand laid up FRP hull, white, with blue cove stripe & boot top', 0, CAST(N'2024-07-26T18:24:40.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (929, 110, N'Teak rubrail', 0, CAST(N'2024-07-26T18:24:40.880' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (930, 111, N'111111', 0, CAST(N'2024-07-28T23:07:25.630' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (931, 111, N'222', 0, CAST(N'2024-07-28T23:07:25.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (932, 111, N'333', 0, CAST(N'2024-07-28T23:07:25.633' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (933, 111, N'444', 0, CAST(N'2024-07-28T23:07:25.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (934, 111, N'555', 0, CAST(N'2024-07-28T23:07:25.637' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (935, 112, N'66666', 0, CAST(N'2024-07-28T23:07:36.133' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (936, 112, N'222222', 0, CAST(N'2024-07-28T23:07:36.137' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (937, 112, N'44444', 0, CAST(N'2024-07-28T23:07:36.143' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (938, 112, N'5555', 0, CAST(N'2024-07-28T23:07:36.143' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (939, 113, N'Sleek', 0, CAST(N'2024-07-29T16:06:12.260' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (940, 113, N'Angular design with a metallic finish', 0, CAST(N'2024-07-29T16:06:12.263' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (941, 113, N'Reflecting the cyberpunk theme', 0, CAST(N'2024-07-29T16:06:12.263' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (942, 114, N' Spacious,featuring a blend of high-tech materials and traditional teak.', 0, CAST(N'2024-07-29T16:06:26.260' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (943, 114, N'Neon and LED lighting systems integrated into the exterior.', 0, CAST(N'2024-07-29T16:06:26.267' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (944, 114, N'Providing a distinctive glow at night.', 0, CAST(N'2024-07-29T16:06:26.267' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (945, 115, N'Advanced AI-driven navigation system, capable of autonomous piloting.', 0, CAST(N'2024-07-29T16:06:45.140' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (946, 115, N'Integrated biometric security systems, including facial recognition and fingerprint scanning.', 0, CAST(N'2024-07-29T16:06:45.140' AS DateTime))
INSERT [dbo].[YachtSpecificationItem] ([Id], [YachtSpecificationId], [Item], [IsDelete], [CreateTime]) VALUES (947, 115, N'High-speed satellite internet and an encrypted communication network.', 0, CAST(N'2024-07-29T16:06:45.140' AS DateTime))
SET IDENTITY_INSERT [dbo].[YachtSpecificationItem] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Account]    Script Date: 2024/7/30 下午 12:34:40 ******/
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [IX_Account] UNIQUE NONCLUSTERED 
(
	[Account] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_MaxPower]  DEFAULT ((0)) FOR [MaxPower]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Account] ADD  CONSTRAINT [DF_Account_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CompanyAbout] ADD  CONSTRAINT [DF_CompanyAbout_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CompanyCertificate] ADD  CONSTRAINT [DF_CompanyCertificate_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[CompanyImages] ADD  CONSTRAINT [DF_CompanyImages_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[CompanyImages] ADD  CONSTRAINT [DF_CompanyImages_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[DealerArea] ADD  CONSTRAINT [DF_DealerArea_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[DealerArea] ADD  CONSTRAINT [DF_DealerArea_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[DealerCountry] ADD  CONSTRAINT [DF_DealerCountry_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[DealerCountry] ADD  CONSTRAINT [DF_DealersCountry_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Dealers] ADD  CONSTRAINT [DF_Dealers_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Dealers] ADD  CONSTRAINT [DF_Dealers_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_CoverId]  DEFAULT ((18)) FOR [CoverId]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_IsTop]  DEFAULT ((0)) FOR [IsTop]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_Table_1_HasPhoto]  DEFAULT ((0)) FOR [HasImage]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_HasFile]  DEFAULT ((0)) FOR [HasFile]
GO
ALTER TABLE [dbo].[News] ADD  CONSTRAINT [DF_News_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[NewsFile] ADD  CONSTRAINT [DF_NewsFile_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsFile] ADD  CONSTRAINT [DF_NewsFile_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[NewsImage] ADD  CONSTRAINT [DF_NewsImage_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[NewsImage] ADD  CONSTRAINT [DF_NewsImage_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[Yacht] ADD  CONSTRAINT [DF_Yacht_IsNewDesign]  DEFAULT ((0)) FOR [IsNewDesign]
GO
ALTER TABLE [dbo].[Yacht] ADD  CONSTRAINT [DF_Yacht_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[Yacht] ADD  CONSTRAINT [DF_Yacht_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[YachtAlbum] ADD  CONSTRAINT [DF_YachtAlbum_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[YachtAlbum] ADD  CONSTRAINT [DF_YachtAlbum_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[YachtDimension] ADD  CONSTRAINT [DF_YachtDimension_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[YachtDimension] ADD  CONSTRAINT [DF_YachtDimension_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[YachtFile] ADD  CONSTRAINT [DF_YachtFile_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[YachtFile] ADD  CONSTRAINT [DF_YachtFile_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[YachtLayout] ADD  CONSTRAINT [DF_YachtLayout_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[YachtLayout] ADD  CONSTRAINT [DF_YachtLayout_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[YachtSpecification] ADD  CONSTRAINT [DF_YachtSpecification_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[YachtSpecification] ADD  CONSTRAINT [DF_YachtSpecification_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[YachtSpecificationItem] ADD  CONSTRAINT [DF_YachtSpecificationItem_IsDelete]  DEFAULT ((0)) FOR [IsDelete]
GO
ALTER TABLE [dbo].[YachtSpecificationItem] ADD  CONSTRAINT [DF_YachtSpecificationItem_CreateTime]  DEFAULT (getdate()) FOR [CreateTime]
GO
ALTER TABLE [dbo].[DealerArea]  WITH CHECK ADD  CONSTRAINT [FK_DealerArea_DealerCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[DealerCountry] ([Id])
GO
ALTER TABLE [dbo].[DealerArea] CHECK CONSTRAINT [FK_DealerArea_DealerCountry]
GO
ALTER TABLE [dbo].[Dealers]  WITH CHECK ADD  CONSTRAINT [FK_Dealers_DealerArea] FOREIGN KEY([AreaId])
REFERENCES [dbo].[DealerArea] ([Id])
GO
ALTER TABLE [dbo].[Dealers] CHECK CONSTRAINT [FK_Dealers_DealerArea]
GO
ALTER TABLE [dbo].[NewsFile]  WITH CHECK ADD  CONSTRAINT [FK_NewsFile_News] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([Id])
GO
ALTER TABLE [dbo].[NewsFile] CHECK CONSTRAINT [FK_NewsFile_News]
GO
ALTER TABLE [dbo].[NewsImage]  WITH NOCHECK ADD  CONSTRAINT [FK_NewsImage_News] FOREIGN KEY([NewsId])
REFERENCES [dbo].[News] ([Id])
GO
ALTER TABLE [dbo].[NewsImage] CHECK CONSTRAINT [FK_NewsImage_News]
GO
ALTER TABLE [dbo].[YachtAlbum]  WITH CHECK ADD  CONSTRAINT [FK_YachtAlbum_Yacht] FOREIGN KEY([YachtId])
REFERENCES [dbo].[Yacht] ([Id])
GO
ALTER TABLE [dbo].[YachtAlbum] CHECK CONSTRAINT [FK_YachtAlbum_Yacht]
GO
ALTER TABLE [dbo].[YachtDimension]  WITH CHECK ADD  CONSTRAINT [FK_YachtDimension_Yacht] FOREIGN KEY([YachtId])
REFERENCES [dbo].[Yacht] ([Id])
GO
ALTER TABLE [dbo].[YachtDimension] CHECK CONSTRAINT [FK_YachtDimension_Yacht]
GO
ALTER TABLE [dbo].[YachtFile]  WITH CHECK ADD  CONSTRAINT [FK_YachtFile_Yacht] FOREIGN KEY([YachtId])
REFERENCES [dbo].[Yacht] ([Id])
GO
ALTER TABLE [dbo].[YachtFile] CHECK CONSTRAINT [FK_YachtFile_Yacht]
GO
ALTER TABLE [dbo].[YachtLayout]  WITH CHECK ADD  CONSTRAINT [FK_YachtLayout_Yacht] FOREIGN KEY([YachtId])
REFERENCES [dbo].[Yacht] ([Id])
GO
ALTER TABLE [dbo].[YachtLayout] CHECK CONSTRAINT [FK_YachtLayout_Yacht]
GO
ALTER TABLE [dbo].[YachtSpecification]  WITH CHECK ADD  CONSTRAINT [FK_YachtSpecification_Yacht] FOREIGN KEY([YachtId])
REFERENCES [dbo].[Yacht] ([Id])
GO
ALTER TABLE [dbo].[YachtSpecification] CHECK CONSTRAINT [FK_YachtSpecification_Yacht]
GO
ALTER TABLE [dbo].[YachtSpecificationItem]  WITH CHECK ADD  CONSTRAINT [FK_YachtSpecificationItem_YachtSpecification] FOREIGN KEY([YachtSpecificationId])
REFERENCES [dbo].[YachtSpecification] ([Id])
GO
ALTER TABLE [dbo].[YachtSpecificationItem] CHECK CONSTRAINT [FK_YachtSpecificationItem_YachtSpecification]
GO
USE [master]
GO
ALTER DATABASE [Tayana] SET  READ_WRITE 
GO
