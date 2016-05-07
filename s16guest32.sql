USE [master]
GO
/****** Object:  Database [s16guest32]    Script Date: 5/7/2016 5:48:20 AM ******/
CREATE DATABASE [s16guest32]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N's16guest32', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest32.mdf' , SIZE = 3136KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N's16guest32_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.CSDB440\MSSQL\DATA\s16guest32_log.ldf' , SIZE = 784KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [s16guest32] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [s16guest32].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [s16guest32] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [s16guest32] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [s16guest32] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [s16guest32] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [s16guest32] SET ARITHABORT OFF 
GO
ALTER DATABASE [s16guest32] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [s16guest32] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [s16guest32] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [s16guest32] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [s16guest32] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [s16guest32] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [s16guest32] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [s16guest32] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [s16guest32] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [s16guest32] SET  ENABLE_BROKER 
GO
ALTER DATABASE [s16guest32] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [s16guest32] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [s16guest32] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [s16guest32] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [s16guest32] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [s16guest32] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [s16guest32] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [s16guest32] SET RECOVERY FULL 
GO
ALTER DATABASE [s16guest32] SET  MULTI_USER 
GO
ALTER DATABASE [s16guest32] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [s16guest32] SET DB_CHAINING OFF 
GO
ALTER DATABASE [s16guest32] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [s16guest32] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N's16guest32', N'ON'
GO
USE [s16guest32]
GO
/****** Object:  User [s16guest32]    Script Date: 5/7/2016 5:48:20 AM ******/
CREATE USER [s16guest32] FOR LOGIN [s16guest32] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [s16guest32]
GO
/****** Object:  Table [dbo].[addresses]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[addresses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[address] [varchar](40) NOT NULL,
	[address 2] [varchar](40) NULL,
	[address 3] [varchar](40) NULL,
	[city] [varchar](30) NOT NULL,
	[zip_or_postcode] [varchar](50) NOT NULL,
	[state_province_county] [varchar](30) NOT NULL,
	[country_code] [char](3) NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_addresses_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_addresses] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[companies]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[companies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_companies_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_companies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customer_info]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[customer_info](
	[customer_id] [int] NOT NULL,
	[first_name] [varchar](40) NOT NULL,
	[last_name] [varchar](40) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_customer_info_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_customer_info] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[customers]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[company_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_customers_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_customers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[downloads]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[downloads](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[download_link] [text] NOT NULL,
	[release_id] [int] NOT NULL,
	[customer_id] [int] NOT NULL,
	[downloaded_at] [datetime] NOT NULL CONSTRAINT [DF_downloads_downloaded_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_downloads] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[features]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[features](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[feature] [text] NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_features_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_features] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[phone_numbers]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[phone_numbers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[phone_number] [varchar](15) NOT NULL,
	[type] [varchar](10) NOT NULL CONSTRAINT [DF_phone_numbers_type]  DEFAULT ('cell'),
	[entites_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_phone_numbers_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_phone_numbers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[platforms]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[platforms](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [varchar](20) NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_platforms_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_platforms] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[products]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[products](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NOT NULL,
	[description] [text] NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_products_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[releases]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[releases](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[release] [varchar](25) NOT NULL,
	[release_date] [datetime] NOT NULL CONSTRAINT [DF_releases_release_date]  DEFAULT (getdate()),
 CONSTRAINT [PK_customer_releases] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[version_feature]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version_feature](
	[version_id] [int] NOT NULL,
	[feature_id] [int] NOT NULL,
	[feature_type] [text] NOT NULL,
 CONSTRAINT [PK_version_feature] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC,
	[feature_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[version_release]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[version_release](
	[version_id] [int] NOT NULL,
	[release_id] [int] NOT NULL,
 CONSTRAINT [PK_versions_release] PRIMARY KEY CLUSTERED 
(
	[version_id] ASC,
	[release_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[versions]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[versions](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[version] [varchar](30) NOT NULL,
	[product_id] [int] NOT NULL,
	[platform_id] [int] NOT NULL,
	[created_at] [datetime] NOT NULL CONSTRAINT [DF_versions_created_at]  DEFAULT (getdate()),
 CONSTRAINT [PK_dev_releases] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[addresses]  WITH CHECK ADD  CONSTRAINT [FK_addresses_companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[addresses] CHECK CONSTRAINT [FK_addresses_companies]
GO
ALTER TABLE [dbo].[customer_info]  WITH CHECK ADD  CONSTRAINT [FK_customer_info_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[customer_info] CHECK CONSTRAINT [FK_customer_info_customers]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [FK_customers_companies] FOREIGN KEY([company_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [FK_customers_companies]
GO
ALTER TABLE [dbo].[downloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_customer_releases] FOREIGN KEY([release_id])
REFERENCES [dbo].[releases] ([id])
GO
ALTER TABLE [dbo].[downloads] CHECK CONSTRAINT [FK_downloads_customer_releases]
GO
ALTER TABLE [dbo].[downloads]  WITH CHECK ADD  CONSTRAINT [FK_downloads_customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[downloads] CHECK CONSTRAINT [FK_downloads_customers]
GO
ALTER TABLE [dbo].[phone_numbers]  WITH CHECK ADD  CONSTRAINT [FK_phone_numbers_companies] FOREIGN KEY([entites_id])
REFERENCES [dbo].[companies] ([id])
GO
ALTER TABLE [dbo].[phone_numbers] CHECK CONSTRAINT [FK_phone_numbers_companies]
GO
ALTER TABLE [dbo].[phone_numbers]  WITH CHECK ADD  CONSTRAINT [FK_phone_numbers_customers] FOREIGN KEY([entites_id])
REFERENCES [dbo].[customers] ([id])
GO
ALTER TABLE [dbo].[phone_numbers] CHECK CONSTRAINT [FK_phone_numbers_customers]
GO
ALTER TABLE [dbo].[version_feature]  WITH CHECK ADD  CONSTRAINT [FK_version_feature_features] FOREIGN KEY([feature_id])
REFERENCES [dbo].[features] ([id])
GO
ALTER TABLE [dbo].[version_feature] CHECK CONSTRAINT [FK_version_feature_features]
GO
ALTER TABLE [dbo].[version_feature]  WITH CHECK ADD  CONSTRAINT [FK_version_feature_versions] FOREIGN KEY([version_id])
REFERENCES [dbo].[versions] ([id])
GO
ALTER TABLE [dbo].[version_feature] CHECK CONSTRAINT [FK_version_feature_versions]
GO
ALTER TABLE [dbo].[version_release]  WITH CHECK ADD  CONSTRAINT [FK_versions_release_releases] FOREIGN KEY([release_id])
REFERENCES [dbo].[releases] ([id])
GO
ALTER TABLE [dbo].[version_release] CHECK CONSTRAINT [FK_versions_release_releases]
GO
ALTER TABLE [dbo].[version_release]  WITH CHECK ADD  CONSTRAINT [FK_versions_release_versions] FOREIGN KEY([version_id])
REFERENCES [dbo].[versions] ([id])
GO
ALTER TABLE [dbo].[version_release] CHECK CONSTRAINT [FK_versions_release_versions]
GO
ALTER TABLE [dbo].[versions]  WITH CHECK ADD  CONSTRAINT [FK_versions_platforms] FOREIGN KEY([platform_id])
REFERENCES [dbo].[platforms] ([id])
GO
ALTER TABLE [dbo].[versions] CHECK CONSTRAINT [FK_versions_platforms]
GO
ALTER TABLE [dbo].[versions]  WITH CHECK ADD  CONSTRAINT [FK_versions_products] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([id])
GO
ALTER TABLE [dbo].[versions] CHECK CONSTRAINT [FK_versions_products]
GO
/****** Object:  StoredProcedure [dbo].[ClientsRequestForDownload]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeffrey Lima
-- Description:	Returns downloads request for clients
-- =============================================
CREATE PROCEDURE [dbo].[ClientsRequestForDownload]

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT 
	customer_info.first_name AS 'First Name',
	customer_info.last_name AS 'Last Name',
	customer_info.email AS 'E-mail',
	companies.name AS Company,
	phone_numbers.phone_number AS 'Phone Number',
	phone_numbers.type AS 'Phone Type',
	releases.release AS 'Downloaded Release',
	CONVERT(VARCHAR(10), releases.release_date, 101) AS 'Release Date',
	addresses.address AS 'Street',
	addresses.city AS 'City',
	addresses.zip_or_postcode AS 'Zip Code/Postcode',
	addresses.state_province_county AS 'State/Province/County'
FROM [dbo].[downloads] downloads
INNER JOIN [dbo].[customer_info] customer_info ON
	downloads.customer_id=customer_info.customer_id
INNER JOIN [dbo].[customers] customers ON
	customer_info.customer_id=customers.id
INNER JOIN [dbo].[companies] companies ON
	customers.company_id=companies.id
INNER JOIN [dbo].[phone_numbers] phone_numbers ON
	phone_numbers.entites_id=customer_info.customer_id
INNER JOIN [dbo].[addresses] addresses ON
	addresses.company_id=companies.id
INNER JOIN [dbo].[releases] releases ON
	downloads.release_id=releases.id
END

GO
/****** Object:  StoredProcedure [dbo].[DownloadsForTheGivenReleaseByMonth]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeffrey Lima
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[DownloadsForTheGivenReleaseByMonth]
    @release as VARCHAR(50), @month as INT

AS
BEGIN
SELECT   
    releases.release AS 'Release',
    Count(downloads.id) AS 'Downloads Count'
FROM [dbo].[downloads] downloads
INNER JOIN [dbo].[releases] releases ON
	downloads.release_id=releases.id
WHERE releases.release=@release AND 
	MONTH(downloads.downloaded_at)=@month
GROUP BY release;
END

GO
/****** Object:  StoredProcedure [dbo].[ProductVersionRelease]    Script Date: 5/7/2016 5:48:21 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		Jeffrey Lima
-- Description:	Return products with its versions and releases
-- =============================================
CREATE PROCEDURE [dbo].[ProductVersionRelease]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

SELECT 
	products.name AS 'Product',
	platforms.type AS 'Platform',
	products.description AS 'Description',
	versions.version AS 'Version',
	features.feature AS 'New Features',
	version_feature.feature_type AS 'Type of Release',
	CONVERT(VARCHAR(10), releases.release_date, 101) AS 'Date of Release'
FROM [dbo].[products] products
INNER JOIN [dbo].[versions] versions ON 
	products.id=versions.product_id
INNER JOIN [dbo].[platforms] platforms ON
	versions.platform_id=platforms.id
INNER JOIN [dbo].[version_feature] version_feature ON
	versions.id=version_feature.version_id
INNER JOIN [dbo].[features] features ON
	features.id=version_feature.feature_id
INNER JOIN [dbo].[version_release] version_release ON
	versions.id=version_release.version_id
INNER JOIN [dbo].[releases] releases ON
	releases.id=version_release.release_id
END

GO
USE [master]
GO
ALTER DATABASE [s16guest32] SET  READ_WRITE 
GO
