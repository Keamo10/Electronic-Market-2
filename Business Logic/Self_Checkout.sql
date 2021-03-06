USE [master]
GO
/****** Object:  Database [Self_Checkout]    Script Date: 2020/06/09 18:04:15 ******/
CREATE DATABASE [Self_Checkout]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Self_Checkout', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Self_Checkout.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Self_Checkout_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Self_Checkout_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Self_Checkout] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Self_Checkout].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Self_Checkout] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Self_Checkout] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Self_Checkout] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Self_Checkout] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Self_Checkout] SET ARITHABORT OFF 
GO
ALTER DATABASE [Self_Checkout] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Self_Checkout] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Self_Checkout] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Self_Checkout] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Self_Checkout] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Self_Checkout] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Self_Checkout] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Self_Checkout] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Self_Checkout] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Self_Checkout] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Self_Checkout] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Self_Checkout] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Self_Checkout] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Self_Checkout] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Self_Checkout] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Self_Checkout] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Self_Checkout] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Self_Checkout] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Self_Checkout] SET  MULTI_USER 
GO
ALTER DATABASE [Self_Checkout] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Self_Checkout] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Self_Checkout] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Self_Checkout] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Self_Checkout] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Self_Checkout]
GO
/****** Object:  Table [dbo].[Addresses]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Addresses](
	[address_id] [int] IDENTITY(1,1) NOT NULL,
	[Street] [varchar](30) NOT NULL,
	[Suburb] [varchar](30) NOT NULL,
	[city] [varchar](30) NOT NULL,
	[zip_postcode] [varchar](4) NOT NULL,
	[state_province] [varchar](40) NULL,
	[country] [varchar](40) NOT NULL,
 CONSTRAINT [PK_Addresses] PRIMARY KEY CLUSTERED 
(
	[address_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Basket_Items]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Basket_Items](
	[Basket_item_id] [int] IDENTITY(100001,1) NOT NULL,
	[shopping_basket_id] [int] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
	[cost] [money] NOT NULL,
 CONSTRAINT [PK_Basket_Items] PRIMARY KEY CLUSTERED 
(
	[Basket_item_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customer_Addresses]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Customer_Addresses](
	[customer_id] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[date_from] [date] NOT NULL,
	[address_type_code] [int] NULL,
	[date_to] [date] NULL,
 CONSTRAINT [PK_Customer_Addresses] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC,
	[address_id] ASC,
	[date_from] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Customers]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Customers](
	[customer_id] [int] IDENTITY(1,1) NOT NULL,
	[payment_method_code] [int] NULL,
	[customer_name] [nchar](50) NOT NULL,
	[customer_phone] [varchar](10) NOT NULL,
	[customer_email] [varchar](40) NOT NULL,
	[RegisterDate] [date] NOT NULL,
 CONSTRAINT [PK_Customers] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Inventory_Locations]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Inventory_Locations](
	[inventory_location_id] [int] IDENTITY(1,1) NOT NULL,
	[product_id] [int] NOT NULL,
	[location_address_id] [int] NULL,
	[quantity_in_stock] [int] NOT NULL,
	[reorder_level] [int] NULL,
	[reorder_quantity] [int] NULL,
 CONSTRAINT [PK_Inventory_Locations] PRIMARY KEY CLUSTERED 
(
	[inventory_location_id] ASC,
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_Supplier]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_Supplier](
	[supplier_product_id] [int] IDENTITY(1001,1) NOT NULL,
	[product_id] [int] NULL,
	[supplier_code] [int] NULL,
	[standard_price] [money] NOT NULL,
	[percentage_discount] [decimal](3, 2) NULL,
	[minimum_order_quantity] [int] NULL,
	[maximum_order_quantity] [int] NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [PK_Product_Supplier_1] PRIMARY KEY CLUSTERED 
(
	[supplier_product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Products]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Products](
	[product_id] [int] IDENTITY(10001,1) NOT NULL,
	[product_type_code] [int] NULL,
	[product_name] [nvarchar](50) NOT NULL,
	[product_price] [money] NOT NULL,
	[product_description] [nvarchar](50) NULL,
 CONSTRAINT [PK_Products] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ref_Address_Types]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Ref_Address_Types](
	[address_type_code] [int] IDENTITY(1,1) NOT NULL,
	[address_type_description] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Ref_Address_Types] PRIMARY KEY CLUSTERED 
(
	[address_type_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Ref_Payment_Methods]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ref_Payment_Methods](
	[payment_method_code] [int] IDENTITY(10001,1) NOT NULL,
	[payment_method_description] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Ref_Payment_Methods] PRIMARY KEY CLUSTERED 
(
	[payment_method_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ref_Product_Types]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ref_Product_Types](
	[product_type_code] [int] IDENTITY(1,1) NOT NULL,
	[product_type_description] [nvarchar](40) NOT NULL,
 CONSTRAINT [PK_Ref_Product_Types] PRIMARY KEY CLUSTERED 
(
	[product_type_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Shopping_Basket]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Shopping_Basket](
	[shopping_basket_id] [int] IDENTITY(1,1) NOT NULL,
	[customer_id] [int] NOT NULL,
	[basket_datetime] [datetime] NOT NULL,
	[totalcost] [money] NOT NULL,
	[other_basket_details] [nvarchar](50) NULL,
 CONSTRAINT [PK_Shopping_Basket] PRIMARY KEY CLUSTERED 
(
	[shopping_basket_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supplier_Locations]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supplier_Locations](
	[supplier_code] [int] NOT NULL,
	[address_id] [int] NOT NULL,
	[date_from] [date] NOT NULL,
	[date_to] [date] NULL,
 CONSTRAINT [PK_Supplier_Locations] PRIMARY KEY CLUSTERED 
(
	[supplier_code] ASC,
	[address_id] ASC,
	[date_from] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Suppliers]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Suppliers](
	[supplier_code] [int] IDENTITY(1,1) NOT NULL,
	[supplier_name] [varchar](40) NOT NULL,
	[supplier_phone] [nvarchar](10) NOT NULL,
	[supplier_email] [nvarchar](50) NULL,
 CONSTRAINT [PK_Suppliers] PRIMARY KEY CLUSTERED 
(
	[supplier_code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
ALTER TABLE [dbo].[Basket_Items]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Items_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Basket_Items] CHECK CONSTRAINT [FK_Basket_Items_Products]
GO
ALTER TABLE [dbo].[Basket_Items]  WITH CHECK ADD  CONSTRAINT [FK_Basket_Items_Shopping_Basket] FOREIGN KEY([shopping_basket_id])
REFERENCES [dbo].[Shopping_Basket] ([shopping_basket_id])
GO
ALTER TABLE [dbo].[Basket_Items] CHECK CONSTRAINT [FK_Basket_Items_Shopping_Basket]
GO
ALTER TABLE [dbo].[Customer_Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Addresses_Addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[Addresses] ([address_id])
GO
ALTER TABLE [dbo].[Customer_Addresses] CHECK CONSTRAINT [FK_Customer_Addresses_Addresses]
GO
ALTER TABLE [dbo].[Customer_Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Addresses_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Customer_Addresses] CHECK CONSTRAINT [FK_Customer_Addresses_Customers]
GO
ALTER TABLE [dbo].[Customer_Addresses]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Addresses_Ref_Address_Types] FOREIGN KEY([address_type_code])
REFERENCES [dbo].[Ref_Address_Types] ([address_type_code])
GO
ALTER TABLE [dbo].[Customer_Addresses] CHECK CONSTRAINT [FK_Customer_Addresses_Ref_Address_Types]
GO
ALTER TABLE [dbo].[Customers]  WITH CHECK ADD  CONSTRAINT [FK_Customers_Ref_Payment_Methods] FOREIGN KEY([payment_method_code])
REFERENCES [dbo].[Ref_Payment_Methods] ([payment_method_code])
GO
ALTER TABLE [dbo].[Customers] CHECK CONSTRAINT [FK_Customers_Ref_Payment_Methods]
GO
ALTER TABLE [dbo].[Inventory_Locations]  WITH CHECK ADD  CONSTRAINT [FK_Inventory_Locations_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Inventory_Locations] CHECK CONSTRAINT [FK_Inventory_Locations_Products]
GO
ALTER TABLE [dbo].[Product_Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier_Products] FOREIGN KEY([product_id])
REFERENCES [dbo].[Products] ([product_id])
GO
ALTER TABLE [dbo].[Product_Supplier] CHECK CONSTRAINT [FK_Product_Supplier_Products]
GO
ALTER TABLE [dbo].[Product_Supplier]  WITH CHECK ADD  CONSTRAINT [FK_Product_Supplier_Suppliers] FOREIGN KEY([supplier_code])
REFERENCES [dbo].[Suppliers] ([supplier_code])
GO
ALTER TABLE [dbo].[Product_Supplier] CHECK CONSTRAINT [FK_Product_Supplier_Suppliers]
GO
ALTER TABLE [dbo].[Products]  WITH CHECK ADD  CONSTRAINT [FK_Products_Ref_Product_Types] FOREIGN KEY([product_type_code])
REFERENCES [dbo].[Ref_Product_Types] ([product_type_code])
GO
ALTER TABLE [dbo].[Products] CHECK CONSTRAINT [FK_Products_Ref_Product_Types]
GO
ALTER TABLE [dbo].[Shopping_Basket]  WITH CHECK ADD  CONSTRAINT [FK_Shopping_Basket_Customers] FOREIGN KEY([customer_id])
REFERENCES [dbo].[Customers] ([customer_id])
GO
ALTER TABLE [dbo].[Shopping_Basket] CHECK CONSTRAINT [FK_Shopping_Basket_Customers]
GO
ALTER TABLE [dbo].[Supplier_Locations]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Locations_Addresses] FOREIGN KEY([address_id])
REFERENCES [dbo].[Addresses] ([address_id])
GO
ALTER TABLE [dbo].[Supplier_Locations] CHECK CONSTRAINT [FK_Supplier_Locations_Addresses]
GO
ALTER TABLE [dbo].[Supplier_Locations]  WITH CHECK ADD  CONSTRAINT [FK_Supplier_Locations_Suppliers] FOREIGN KEY([supplier_code])
REFERENCES [dbo].[Suppliers] ([supplier_code])
GO
ALTER TABLE [dbo].[Supplier_Locations] CHECK CONSTRAINT [FK_Supplier_Locations_Suppliers]
GO
/****** Object:  StoredProcedure [dbo].[DecreaseQuantity]    Script Date: 2020/06/09 18:04:15 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[DecreaseQuantity]
	-- Add the parameters for the stored procedure here
	@productid int
AS
BEGIN
	UPDATE Inventory_Locations 
	SET quantity_in_stock = quantity_in_stock-1
	WHERE product_id = @productid
END

GO
USE [master]
GO
ALTER DATABASE [Self_Checkout] SET  READ_WRITE 
GO
