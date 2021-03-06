USE [master]
GO
/****** Object:  Database [CountryAndCityInformation_DB]    Script Date: 8/13/2015 4:52:38 AM ******/
CREATE DATABASE [CountryAndCityInformation_DB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CountryAndCityInformation_DB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CountryAndCityInformation_DB.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'CountryAndCityInformation_DB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\CountryAndCityInformation_DB_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CountryAndCityInformation_DB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET ARITHABORT OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET RECOVERY FULL 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET  MULTI_USER 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'CountryAndCityInformation_DB', N'ON'
GO
USE [CountryAndCityInformation_DB]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 8/13/2015 4:52:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](50) NULL,
	[CityAbout] [nvarchar](max) NULL,
	[NoOfDewells] [int] NULL,
	[Location] [nvarchar](max) NULL,
	[Weather] [nvarchar](max) NULL,
	[CountryId] [bigint] NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tbl_Country]    Script Date: 8/13/2015 4:52:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[tbl_Country](
	[CountryId] [bigint] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
	[CountryAbout] [varchar](max) NULL,
 CONSTRAINT [PK_tbl_Country] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[CityView]    Script Date: 8/13/2015 4:52:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CityView]
AS
SELECT tbl_City.CityName,tbl_City.NoOfDewells,tbl_Country.CountryName FROM tbl_City  LEFT OUTER JOIN tbl_Country ON tbl_Country.CountryId=tbl_City.CountryId

GO
/****** Object:  View [dbo].[CountryCityView]    Script Date: 8/13/2015 4:52:38 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CountryCityView]
AS
SELECT        dbo.tbl_Country.CountryName, dbo.tbl_Country.CountryAbout, COUNT(*) AS TotalCities, SUM(dbo.tbl_City.NoOfDewells) AS TotalDwellers
FROM            dbo.tbl_Country LEFT OUTER JOIN
                         dbo.tbl_City ON dbo.tbl_Country.CountryId = dbo.tbl_City.CountryId
GROUP BY dbo.tbl_Country.CountryName, dbo.tbl_Country.CountryAbout

GO
ALTER TABLE [dbo].[tbl_City]  WITH CHECK ADD  CONSTRAINT [FK_tbl_City_tbl_Country] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tbl_Country] ([CountryId])
GO
ALTER TABLE [dbo].[tbl_City] CHECK CONSTRAINT [FK_tbl_City_tbl_Country]
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[29] 4[33] 2[21] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "tbl_Country"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 118
               Right = 224
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "tbl_City"
            Begin Extent = 
               Top = 6
               Left = 262
               Bottom = 135
               Right = 448
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 12
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CountryCityView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'CountryCityView'
GO
USE [master]
GO
ALTER DATABASE [CountryAndCityInformation_DB] SET  READ_WRITE 
GO
