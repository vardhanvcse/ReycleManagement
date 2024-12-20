﻿USE [master]
GO
/****** Object:  Database [RecycleManagement]    Script Date: 10/31/2024 3:29:38 PM ******/
CREATE DATABASE [RecycleManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecycleManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RecycleManagement.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecycleManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RecycleManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [RecycleManagement] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [RecycleManagement].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [RecycleManagement] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [RecycleManagement] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [RecycleManagement] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [RecycleManagement] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [RecycleManagement] SET ARITHABORT OFF 
GO
ALTER DATABASE [RecycleManagement] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [RecycleManagement] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [RecycleManagement] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [RecycleManagement] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [RecycleManagement] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [RecycleManagement] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [RecycleManagement] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [RecycleManagement] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [RecycleManagement] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [RecycleManagement] SET  DISABLE_BROKER 
GO
ALTER DATABASE [RecycleManagement] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [RecycleManagement] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [RecycleManagement] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [RecycleManagement] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [RecycleManagement] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [RecycleManagement] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [RecycleManagement] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [RecycleManagement] SET RECOVERY FULL 
GO
ALTER DATABASE [RecycleManagement] SET  MULTI_USER 
GO
ALTER DATABASE [RecycleManagement] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [RecycleManagement] SET DB_CHAINING OFF 
GO
ALTER DATABASE [RecycleManagement] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [RecycleManagement] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [RecycleManagement] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [RecycleManagement] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [RecycleManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [RecycleManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RecycleManagement]
GO
/****** Object:  UserDefinedFunction [dbo].[GetMonthDetails]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Function [dbo].[GetMonthDetails](@month nvarchar(3)) RETURNS INT
AS
BEGIN

RETURN CASE UPPER (@month) WHEN 'JAN' then 1
                           WHEN 'FEB' then 2
  WHEN 'MAR' then 3
  WHEN 'APR' then 4
  WHEN 'MAY' then 5
  WHEN 'JUN' then 6
  WHEN 'JUL' then 7
  WHEN 'AUG' then 8
  WHEN 'SEP' then 9
  WHEN 'OCT' then 10
  WHEN 'NOV' then 11
  ELSE 12
  END;  
END
GO
/****** Object:  Table [dbo].[land_fill_expense]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[land_fill_expense](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[land_fill_date] [datetime] NULL,
	[weight_in_lbs] [decimal](18, 2) NULL,
	[expense] [decimal](10, 2) NULL,
	[hauler] [nvarchar](50) NULL,
	[user_id] [int] NULL,
	[material_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[material_id] [int] IDENTITY(1,1) NOT NULL,
	[material_name] [nvarchar](50) NULL,
	[material_description] [nvarchar](100) NULL,
 CONSTRAINT [PK_material] PRIMARY KEY CLUSTERED 
(
	[material_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recycling_center]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recycling_center](
	[recyclecenter_id] [int] IDENTITY(1,1) NOT NULL,
	[centername] [nvarchar](50) NULL,
	[centeraddress] [nvarchar](50) NULL,
	[notes] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[recyclecenter_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recycling_collection]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recycling_collection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[collection_date] [date] NULL,
	[material_id] [int] NULL,
	[weight_in_lbs] [decimal](18, 2) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recycling_revenue]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recycling_revenue](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sale_date] [datetime] NULL,
	[material_id] [int] NULL,
	[weight_in_lbs] [decimal](18, 2) NULL,
	[revenue] [decimal](10, 2) NULL,
	[buyer] [nvarchar](50) NULL,
	[user_id] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[role_id] [int] IDENTITY(1,1) NOT NULL,
	[role_name] [nvarchar](20) NOT NULL,
	[role_description] [nvarchar](100) NULL,
 CONSTRAINT [PK_roles] PRIMARY KEY CLUSTERED 
(
	[role_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user](
	[user_id] [int] IDENTITY(1,1) NOT NULL,
	[user_name] [nvarchar](50) NOT NULL,
	[user_mail_id] [nvarchar](50) NOT NULL,
	[phone_num] [nvarchar](14) NOT NULL,
	[address] [nvarchar](50) NOT NULL,
	[user_role] [nvarchar](20) NULL,
	[password] [nvarchar](15) NULL,
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle](
	[vehicle_id] [nvarchar](50) NOT NULL,
	[make_year] [int] NULL,
	[make] [nvarchar](50) NULL,
	[model] [nvarchar](50) NULL,
	[purchase_date] [date] NULL,
	[starting_milage] [decimal](4, 2) NULL,
	[vehicle_weight_id] [int] NULL,
	[vehicle_type_id] [int] NULL,
	[vehicle_description_id] [int] NULL,
	[excempt_law_enforcement] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_class]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_class](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[class] [nvarchar](100) NULL,
	[class_description] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_maintainance_costs]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_maintainance_costs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maintainance_date] [date] NULL,
	[vechicle_id] [nvarchar](50) NULL,
	[current_milage] [decimal](18, 2) NULL,
	[fuel_usage_gallons] [decimal](18, 2) NULL,
	[fuel_cost_dollars] [decimal](18, 2) NULL,
	[maintainance_cost_dollars] [decimal](18, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_types]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_types](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[vehicle_type] [nvarchar](30) NULL,
	[vehicle_description] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_weights]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_weights](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[weight_text] [nvarchar](20) NULL,
	[weight_desc] [nvarchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[land_fill_expense]  WITH CHECK ADD  CONSTRAINT [FK_land_fill_expense_material] FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([material_id])
GO
ALTER TABLE [dbo].[land_fill_expense] CHECK CONSTRAINT [FK_land_fill_expense_material]
GO
ALTER TABLE [dbo].[land_fill_expense]  WITH CHECK ADD  CONSTRAINT [FK_land_fill_expense_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[land_fill_expense] CHECK CONSTRAINT [FK_land_fill_expense_user]
GO
ALTER TABLE [dbo].[recycling_collection]  WITH CHECK ADD FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([material_id])
GO
ALTER TABLE [dbo].[recycling_collection]  WITH CHECK ADD  CONSTRAINT [FK_recycling_collection_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[recycling_collection] CHECK CONSTRAINT [FK_recycling_collection_user]
GO
ALTER TABLE [dbo].[recycling_revenue]  WITH CHECK ADD  CONSTRAINT [FK__recycling__mater__4F7CD00D] FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([material_id])
GO
ALTER TABLE [dbo].[recycling_revenue] CHECK CONSTRAINT [FK__recycling__mater__4F7CD00D]
GO
ALTER TABLE [dbo].[vehicle_maintainance_costs]  WITH CHECK ADD FOREIGN KEY([vechicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
/****** Object:  StoredProcedure [dbo].[Get_UserID_By_Name]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Get_UserID_By_Name](@user_name nvarchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF EXISTS(SELECT 1 FROM dbo.[user] WHERE user_name = @user_name) 
	BEGIN
		SELECT TOP 1 user_id FROM dbo.[user] WHERE user_name = @user_name;
	END
	ELSE
	BEGIN
		SELECT -400;
	END
END

GO
/****** Object:  StoredProcedure [dbo].[Land_Fill_Expense_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Land_Fill_Expense_Add](@land_fill_date datetime,@weight_in_lbs float,@expense float,@hauler nvarchar(50),@user_id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	Declare @LandFillMaterialId int;
	SELECT TOP 1 @LandFillMaterialId = material_id from material WHERE material_name LIKE '%LandFill%'
    -- Insert statements for procedure here
	INSERT INTO Land_Fill_Expense VALUES(@land_fill_date,@weight_in_lbs,@expense,@hauler,@user_id,@LandFillMaterialId) ;
END
GO
/****** Object:  StoredProcedure [dbo].[Material_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Material_Add]( 
	@material_name nvarchar(50),
	@material_description nvarchar(100))
AS
BEGIN	
	SET NOCOUNT ON;
	INSERT INTO material VALUES(@material_name,@material_description);	
	SELECT 1;
END

GO
/****** Object:  StoredProcedure [dbo].[Material_Delete]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Material_Delete] (@material_id int)
AS
BEGIN	
	SET NOCOUNT ON;

    DELETE FROM material where material_id = @material_id;
	SELECT 1;
END

GO
/****** Object:  StoredProcedure [dbo].[Material_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Material_Get](@material_id int) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
      if(@material_id = -1) begin
		SELECT material_id,material_name,material_description from material;
		end
		else
		begin
			SELECT material_id,material_name,material_description from material
			where material_id = @material_id;
		end
END

GO
/****** Object:  StoredProcedure [dbo].[Material_Modify]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Material_Modify](@material_id int
								,@material_name nvarchar(50)
								,@material_description nvarchar(100))	
AS
BEGIN	
	SET NOCOUNT ON;
	UPDATE material SET material_name = @material_name,
						material_description = @material_description
	WHERE material_id = @material_id
	SELECT 1;
END

GO
/****** Object:  StoredProcedure [dbo].[PIEChartReport_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[PIEChartReport_Get]
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here

SELECT 'Food Waste and Compost' as material_name,SUM(weight_in_lbs) as weight_in_lbs FROM recycling_collection rec JOIN material mat
ON mat.material_id = rec.material_id WHERE material_name='FoodWaste'

UNION

SELECT 'Recycling',SUM(weight_in_lbs) as weight_in_lbs FROM recycling_collection rec JOIN material mat
ON mat.material_id = rec.material_id WHERE material_name !='FoodWaste' and material_name !='LandFill'

UNION

SELECT 'LandFill',SUM(weight_in_lbs) as weight_in_lbs FROM recycling_collection rec JOIN material mat 
ON mat.material_id = rec.material_id WHERE material_name ='LandFill';
END
GO
/****** Object:  StoredProcedure [dbo].[Recycling_Collection_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Recycling_Collection_Add](@collection_date date,@material_name nvarchar(50),@weight_in_lbs float,@user_id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION;
	BEGIN TRY
		-- Insert statements for procedure here
		DECLARE @material_id int;
		SELECT @material_id = material_id FROM material
		WHERE material_name = @material_name;

		INSERT INTO  recycling_collection 
		values(@collection_date,@material_id,@weight_in_lbs,@user_id);
		COMMIT TRANSACTION;

		SELECT 1;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;

		SELECT -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Recycling_Revenue_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Recycling_Revenue_Add](@sale_date date,@material_name nvarchar(50),@weight_in_lbs float,
@revenue float,@buyer nvarchar(50),@user_id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	BEGIN TRANSACTION;
	BEGIN TRY
		DECLARE @materialid INT;
		SELECT @materialid= material_id FROM material WHERE material_name = @material_name;
		INSERT INTO recycling_revenue 
		VALUES(@sale_date,@materialid,@weight_in_lbs,@revenue,@buyer,@user_id);
		COMMIT TRANSACTION;
		SELECT 1;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
		SELECT -1;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[ReportGraph_Revenue_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportGraph_Revenue_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	
		DECLARE @CollectionInformation Table(collectiondate nvarchar(50),totalweight float,material_name nvarchar(100));

		INSERT INTO @CollectionInformation(collectiondate,totalweight,material_name) (
		(SELECT 
			convert(nvarchar,DATENAME(MONTH,sale_date)) +'-'+ convert(nvarchar,YEAR(sale_date)) AS collectiondate,
			SUM(revenue) AS totalweight  ,'Monthly Revenue($)' as material_name
	
		FROM 
			recycling_revenue recrev inner join material mat on mat.material_id = recrev.material_id 	
			GROUP BY 
		  YEAR(sale_date),sale_date));


		  SELECT CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATE) AS collectiondate,
		  sum(totalweight) as totalweight,material_name FROM @CollectionInformation
		  GROUP BY collectiondate,material_name
		  ORDER BY 
		  CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATETIME) ASC;

END
GO
/****** Object:  StoredProcedure [dbo].[ReportingGraph_DivertionRate_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportingGraph_DivertionRate_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @CollectionInformation Table(collectiondate nvarchar(50),totalweight float,material_name nvarchar(100));

	INSERT INTO @CollectionInformation(collectiondate,totalweight,material_name) (
	(SELECT 
			convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
			SUM(weight_in_lbs) AS totalweight  ,'Total Waste Generated lbs.' as material_name	
		FROM 
			recycling_collection  rec inner join material mat on mat.material_id = rec.material_id 	  
			GROUP BY convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)))
			
	   union

	  (SELECT 
			convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
			SUM(weight_in_lbs) AS totalweight  ,'Total Waste Diverted lbs.' as material_name	
		FROM 
			recycling_collection  rec inner join material mat on mat.material_id = rec.material_id 	  
			WHERE mat.material_name NOT IN ('LandFill')
			GROUP BY convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date))));
		

		INSERT INTO @CollectionInformation
		SELECT T1.collectiondate,(t1.totalweight/t2.totalweight)*100,'Waste Diversion Rate %' FROM @CollectionInformation T1 join @CollectionInformation T2 on 
		t1.collectiondate = t2.collectiondate where t1.material_name = 'Total Waste Diverted lbs.'
		AND T2.material_name = 'Total Waste Generated lbs.';
			

		SELECT CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATE) AS collectiondate,
	    totalweight,material_name FROM @CollectionInformation
		WHERE material_name ='Waste Diversion Rate %'
		ORDER BY   
		CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATE) ASC;	

END
GO
/****** Object:  StoredProcedure [dbo].[ReportingGraph_LandFill_FoodWaste_Recycling_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[ReportingGraph_LandFill_FoodWaste_Recycling_Get]
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @recycle_collection TABLE(collectiondate NVARCHAR(50),totalweight FLOAT,material_name VARCHAR(100));
INSERT INTO @recycle_collection (collectiondate,totalweight,material_name)
(SELECT
convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
SUM(weight_in_lbs) AS totalweight ,'Recyclable Waste' AS material_name

FROM
recycling_collection rec inner join material mat on mat.material_id = rec.material_id
WHERE mat.material_name NOT IN ('FoodWaste','LandFill')
GROUP BY
 YEAR(collection_date), collection_date);

 
INSERT INTO @recycle_collection (collectiondate,totalweight,material_name)
(SELECT
convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
SUM(weight_in_lbs) AS totalweight ,'Food Waste Compost' AS material_name

FROM
recycling_collection rec inner join material mat on mat.material_id = rec.material_id
WHERE mat.material_name IN ('FoodWaste')
GROUP BY
 YEAR(collection_date), collection_date);

INSERT INTO @recycle_collection (collectiondate,totalweight,material_name)
(SELECT
convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
SUM(weight_in_lbs) AS totalweight ,'LandFill' AS material_name

FROM
recycling_collection rec inner join material mat on mat.material_id = rec.material_id
WHERE mat.material_name IN ('LandFill')
GROUP BY
 YEAR(collection_date), collection_date);

 SELECT CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATE) AS collectiondate,
 sum(totalweight) as totalweight,material_name FROM @recycle_collection
 GROUP BY collectiondate,material_name
 ORDER BY
 CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATETIME) ASC;
END
GO
/****** Object:  StoredProcedure [dbo].[ReportinGraph_Recyclabes_Broad_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[ReportinGraph_Recyclabes_Broad_Get]
AS
BEGIN
-- SET NOCOUNT ON added to prevent extra result sets from
-- interfering with SELECT statements.
SET NOCOUNT ON;

    -- Insert statements for procedure here
DECLARE @recycle_collection TABLE(collectiondate NVARCHAR(50),totalweight FLOAT,material_name VARCHAR(100));
INSERT INTO @recycle_collection (collectiondate,totalweight,material_name)
(SELECT
convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
SUM(weight_in_lbs) AS totalweight ,
TRIM(
CASE
WHEN CHARINDEX('-', mat.material_name) > 0 THEN SUBSTRING(mat.material_name, 0, CHARINDEX('-', mat.material_name))
ELSE mat.material_name
END)

AS material_name

FROM
recycling_collection rec inner join material mat on mat.material_id = rec.material_id
WHERE mat.material_name NOT IN ('FoodWaste','LandFill')
GROUP BY
 YEAR(collection_date), collection_date ,
   TRIM(
CASE
WHEN CHARINDEX('-', mat.material_name) > 0 THEN SUBSTRING(mat.material_name, 0, CHARINDEX('-', mat.material_name))
ELSE mat.material_name
END));

 SELECT CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATE) AS collectiondate,
 sum(totalweight) as totalweight,material_name FROM @recycle_collection
 GROUP BY collectiondate,material_name
 ORDER BY
 CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATETIME) ASC;
 
END
GO
/****** Object:  StoredProcedure [dbo].[Roles_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Roles_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT role_id,role_name,role_description 
	FROM roles;
END
GO
/****** Object:  StoredProcedure [dbo].[SummaryReport_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[SummaryReport_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
		
		DECLARE @CollectionInformation Table(collectiondate nvarchar(50),totalweight float,material_name nvarchar(100));

		INSERT INTO @CollectionInformation(collectiondate,totalweight,material_name) (
		(SELECT 
			convert(nvarchar,DATENAME(MONTH,sale_date)) +'-'+ convert(nvarchar,YEAR(sale_date)) AS collectiondate,
			convert(float,SUM(revenue)) AS totalweight  ,'Recycle Revenue($)' as material_name
	
		FROM 
			recycling_revenue recrev inner join material mat on mat.material_id = recrev.material_id 	
			GROUP BY 
		  YEAR(sale_date),sale_date)

		union

		(SELECT 
			convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
			SUM(weight_in_lbs) AS totalweight ,mat.material_name
	
		FROM 
			recycling_collection rec inner join material mat on mat.material_id = rec.material_id GROUP BY 
		  convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) ,mat.material_name)  

		union


		(SELECT 
			convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
			SUM(weight_in_lbs) AS totalweight  ,'Total Recycled lbs.' as material_name
	
		FROM 
			recycling_collection  rec inner join material mat on mat.material_id = rec.material_id 
			  WHERE mat.material_name NOT IN ('FoodWaste','LandFill')
			GROUP BY convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)))

		union

		(SELECT 
			convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
			SUM(weight_in_lbs) AS totalweight  ,'Total Waste Generated lbs.' as material_name	
		FROM 
			recycling_collection  rec inner join material mat on mat.material_id = rec.material_id 	  
			GROUP BY convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)))
			
	   union

	   (SELECT 
			convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date)) AS collectiondate,
			SUM(weight_in_lbs) AS totalweight  ,'Total Waste Diverted lbs.' as material_name	
		FROM 
			recycling_collection  rec inner join material mat on mat.material_id = rec.material_id 	  
			WHERE mat.material_name NOT IN ('LandFill')
			GROUP BY convert(nvarchar,DATENAME(MONTH,collection_date)) +'-'+ convert(nvarchar,YEAR(collection_date))));

		INSERT INTO @CollectionInformation
		SELECT T1.collectiondate,(t1.totalweight/t2.totalweight)*100,'Waste Diversion Rate %' FROM @CollectionInformation T1 join @CollectionInformation T2 on 
		t1.collectiondate = t2.collectiondate where t1.material_name = 'Total Waste Diverted lbs.'
		AND T2.material_name = 'Total Waste Generated lbs.';
			

		SELECT * FROM @CollectionInformation ORDER BY   
		CAST(DATEFROMPARTS(CONVERT(INT,Substring(collectiondate,CHARINDEX('-',collectiondate)+1,4),0), dbo.GetMonthDetails(TRIM(SUBSTRING(collectiondate,1,3))),01) AS DATE) ASC;	
END
GO
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Add](@user_name nvarchar(50),@user_mail_id nvarchar(50),
@phone_num nvarchar(14),@address nvarchar(50),@user_password nvarchar(15),@role_name nvarchar(20))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	BEGIN TRANSACTION;
	BEGIN TRY
		-- Insert statements for procedure here
		INSERT INTO dbo.[user]([user_name],[user_mail_id],[phone_num],[address],[user_role],[password])
		VALUES(@user_name,@user_mail_id,@phone_num,@address,@role_name,@user_password);
		
		SELECT 1;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT -1;
		ROLLBACK TRANSACTION;
	END CATCH;	
END
GO
/****** Object:  StoredProcedure [dbo].[User_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[User_Get](@user_id int)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF(@user_id > 0)
	BEGIN
		SELECT usr.user_id,user_name,user_mail_id,phone_num,address,user_role  as role_name FROM [user] usr
		WHERE usr.user_id = @user_id;
	END
	ELSE
	BEGIN
		SELECT usr.user_id,user_name,user_mail_id,phone_num,address,user_role  as role_name FROM [user] usr;		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Vehicle_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Vehicle_Add](@vehicle_id nvarchar(50),@make_year int,@make nvarchar(50),
@model nvarchar(50),@purchase_date datetime,@starting_milage decimal(4,2),@vehicle_weight nvarchar(30),
@vehicle_type nvarchar(30),@vehicle_class nvarchar(100),@IsExcempt bit)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	BEGIN TRANSACTION;
	SET NOCOUNT ON;
	BEGIN TRY

	DECLARE  @vehicle_weight_id INT;
	SELECT @vehicle_weight_id = id FROM dbo.vehicle_weights where weight_desc = @vehicle_weight;

	DECLARE @vehicle_type_id  INT;
	SELECT @vehicle_type_id = id FROM vehicle_types WHERE vehicle_type = @vehicle_type;

	DECLARE @vehicle_class_id INT;
	SELECT @vehicle_class_id = id FROM vehicle_class WHERE class = @vehicle_class;

	INSERT INTO vehicle VALUES(@vehicle_id,@make_year,@make,
	@model,@purchase_date,@starting_milage,@vehicle_weight_id,
	@vehicle_type_id,@vehicle_class_id,@IsExcempt);
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION;
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[Vehicle_Class_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Vehicle_Class_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SELECT id,class,class_description FROM Vehicle_Class;
END
GO
/****** Object:  StoredProcedure [dbo].[Vehicle_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Vehicle_Get](@vehicle_id nvarchar(50))
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE  @vehicle_weight_id INT;
	DECLARE @vehicle_type_id  INT;
	DECLARE @vehicle_class_id INT;

	IF(@vehicle_id !='')
	BEGIN
		SELECT  
		vehicle_id,
		make,
		model,
		make_year,
		weight_text,
		weight_desc,
		vehclass.class as vehicle_class,
		vehtype.vehicle_type,
		wei.weight_text	
		FROM vehicle veh inner join  vehicle_weights wei on  veh.vehicle_weight_id = wei.id 
						 inner join vehicle_types vehtype on veh.vehicle_type_id = vehtype.id
						 inner join vehicle_class vehclass on veh.vehicle_description_id  = vehclass.id
		WHERE 		vehicle_id =@vehicle_id ;
	END
	ELSE
	BEGIN
		SELECT  
		vehicle_id,
		make,
		model,
		make_year,
		weight_text,
		weight_desc,
		vehclass.class  as vehicle_class,
		vehtype.vehicle_type,
		wei.weight_text	
		FROM vehicle veh inner join  vehicle_weights wei on  veh.vehicle_weight_id = wei.id 
						 inner join vehicle_types vehtype on veh.vehicle_type_id = vehtype.id
						 inner join vehicle_class vehclass on veh.vehicle_description_id  = vehclass.id;		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Vehicle_Maintainance_Costs_Add]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Vehicle_Maintainance_Costs_Add](@maintainance_date datetime,@vehicleid nvarchar(50),
@current_milage float,@fuel_usage_gallons  float,@fuel_cost_dollars  float,
@maintainance_cost_dollars  float)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	-- Insert statements for procedure here
	INSERT INTO vehicle_maintainance_costs VALUES(@maintainance_date,@vehicleid,
	@current_milage,@fuel_usage_gallons,@fuel_cost_dollars,@maintainance_cost_dollars);
END
GO
/****** Object:  StoredProcedure [dbo].[Vehicle_Types_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Vehicle_Types_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id,vehicle_type,vehicle_description FROM Vehicle_Types;
END
GO
/****** Object:  StoredProcedure [dbo].[Vehicle_Weights_Get]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Vehicle_Weights_Get]
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	SELECT id,weight_text,weight_desc FROM Vehicle_Weights;
END
GO
/****** Object:  StoredProcedure [dbo].[Verify_User_Login]    Script Date: 10/31/2024 3:29:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[Verify_User_Login](@user_id int,@user_password nvarchar(15))
AS
BEGIN
	
	SET NOCOUNT ON;
	IF EXISTS (SELECT * FROM [user] WHERE user_id = @user_id and password = @user_password) 
	BEGIN
	   SELECT 1;
	END
	ELSE
	BEGIN
		SELECT 0;
	END    
END

GO
USE [master]
GO
ALTER DATABASE [RecycleManagement] SET  READ_WRITE 
GO


use [RecycleManagement]
GO

INSERT INTO [dbo].[user]
           ([user_name]
           ,[user_mail_id]
           ,[phone_num]
           ,[address]
		   ,[user_role]
		   ,[password])
     VALUES
           ('admin'
           ,'s566760@nwmissouri.edu'
           ,'6605288733'
           ,'NW MSU'
		   ,'admin'
		   ,'password')
GO

insert into material values('FoodWaste','food waste');
insert into material values('Aluminum','Aluminum waste');
insert into material values('Cardboard','Cardboard waste');
insert into material values('Glass','Glass waste');
insert into material values('Metal-Cans','metal Cans waste');
insert into material values('Metal-Scrap','Metal Scrap waste');

insert into material values('Paper-Books','Paper-Books waste');
insert into material values('Paper-Mixed','Paper-Mixed waste');
insert into material values('Paper-Newspaper','Paper-Newspaper waste');
insert into material values('Paper-White','Paper-White waste');

insert into material values('Plastic-PET','Plastic-PET waste');
insert into material values('Plastic-HDPEColored','Plastic-HDPEColored waste');
insert into material values('Plastic-HDPENatural','Plastic-HDPENatural waste');
insert into material values('LandFill','LandFill');
Go

insert into roles values('admin','Admin Role')
insert into roles values('user','User Role')
Go

insert into vehicle_weights values('low_weight','weight <=8,500 pounds')
insert into vehicle_weights values('heavy_weight','weight >8,500 pounds')
Go
insert into vehicle_types values('Gasoline','Gasoline run vehicle')
insert into vehicle_types values('Diesel','Diesel run vehicle')
insert into vehicle_types values('Hybrid','Hybrid vehicle')
insert into vehicle_types values('E85','E85 vehicle')
insert into vehicle_types values('CNG','CNG run vehicle')
insert into vehicle_types values('Propane','Propane run vehicle')
insert into vehicle_types values('Electric','Electric run vehicle')
GO

insert into vehicle_class values('Cars and Station Wagons','Cars and Station Wagons')
insert into vehicle_class values('LDTs, Vans, SUVs','LDTs, Vans and SUVs')
GO