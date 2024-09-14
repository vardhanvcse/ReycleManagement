USE [master]
GO
/****** Object:  Database [RecycleManagement]    Script Date: 9/14/2024 6:25:48 PM ******/
CREATE DATABASE [RecycleManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecycleManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\RecycleManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
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
/****** Object:  Table [dbo].[land_fill_expense]    Script Date: 9/14/2024 6:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[land_fill_expense](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[land_fill_date] [datetime] NULL,
	[weight_in_lbs] [decimal](18, 0) NULL,
	[expense] [decimal](10, 2) NULL,
	[hauler] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 9/14/2024 6:25:48 PM ******/
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
/****** Object:  Table [dbo].[recycling_center]    Script Date: 9/14/2024 6:25:48 PM ******/
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
/****** Object:  Table [dbo].[recycling_collection]    Script Date: 9/14/2024 6:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recycling_collection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[collection_date] [date] NULL,
	[material_id] [int] NULL,
	[weight_in_lbs] [decimal](18, 0) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[recycling_revenue]    Script Date: 9/14/2024 6:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[recycling_revenue](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[sale_date] [datetime] NULL,
	[material_id] [int] NULL,
	[weight_in_lbs] [decimal](18, 0) NULL,
	[revenue] [decimal](10, 2) NULL,
	[buyer] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 9/14/2024 6:25:48 PM ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 9/14/2024 6:25:48 PM ******/
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
 CONSTRAINT [PK_user] PRIMARY KEY CLUSTERED 
(
	[user_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_login]    Script Date: 9/14/2024 6:25:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login](
	[user_id] [int] NOT NULL,
	[user_password] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 9/14/2024 6:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle]    Script Date: 9/14/2024 6:25:49 PM ******/
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
	[vehicle_type] [int] NULL,
	[vehicle_description] [int] NULL,
	[excempt_law_enforcement] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[vehicle_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_class]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  Table [dbo].[vehicle_maintainance_costs]    Script Date: 9/14/2024 6:25:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[vehicle_maintainance_costs](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[maintainance_date] [date] NULL,
	[vechicle_id] [nvarchar](50) NULL,
	[current_milage] [decimal](3, 2) NULL,
	[fuel_usage_gallons] [decimal](3, 2) NULL,
	[fuel_cost_dollars] [decimal](4, 2) NULL,
	[maintainance_cost_dollars] [decimal](4, 2) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[vehicle_types]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  Table [dbo].[vehicle_weights]    Script Date: 9/14/2024 6:25:49 PM ******/
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
ALTER TABLE [dbo].[recycling_collection]  WITH CHECK ADD FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([material_id])
GO
ALTER TABLE [dbo].[recycling_revenue]  WITH CHECK ADD FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([material_id])
GO
ALTER TABLE [dbo].[user_login]  WITH CHECK ADD  CONSTRAINT [FK_user_login_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_login] CHECK CONSTRAINT [FK_user_login_user]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_user_role_roles] FOREIGN KEY([role_id])
REFERENCES [dbo].[roles] ([role_id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_user_role_roles]
GO
ALTER TABLE [dbo].[user_role]  WITH CHECK ADD  CONSTRAINT [FK_user_role_user] FOREIGN KEY([user_id])
REFERENCES [dbo].[user] ([user_id])
GO
ALTER TABLE [dbo].[user_role] CHECK CONSTRAINT [FK_user_role_user]
GO
ALTER TABLE [dbo].[vehicle_maintainance_costs]  WITH CHECK ADD FOREIGN KEY([vechicle_id])
REFERENCES [dbo].[vehicle] ([vehicle_id])
GO
/****** Object:  StoredProcedure [dbo].[Get_UserID_By_Name]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Add]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Delete]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Get]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Modify]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Roles_Get]    Script Date: 9/14/2024 6:25:49 PM ******/
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
/****** Object:  StoredProcedure [dbo].[User_Add]    Script Date: 9/14/2024 6:25:49 PM ******/
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
		INSERT INTO dbo.[user]([user_name],[user_mail_id],[phone_num],[address])
		VALUES(@user_name,@user_mail_id,@phone_num,@address);

		DECLARE @user_id INT;
		SELECT @user_id= MAX(user_id) FROM dbo.[user];
		DECLARE @role_id nvarchar(20);
		SELECT @role_id = role_id FROM roles WHERE role_name = @role_name;

		INSERT INTO user_login VALUES(@user_id,@user_password);
		INSERT INTO user_role VALUES(@user_id,@role_id);

		SELECT 1;
		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		SELECT -1;
		ROLLBACK TRANSACTION;
	END CATCH;	
END
GO
/****** Object:  StoredProcedure [dbo].[User_Get]    Script Date: 9/14/2024 6:25:49 PM ******/
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
		SELECT user_id,user_name,user_mail_id,phone_num,address FROM [user]
		WHERE user_id = @user_id;
	END
	ELSE
	BEGIN
		SELECT user_id,user_name,user_mail_id,phone_num,address FROM [user];
	END
END
GO
/****** Object:  StoredProcedure [dbo].[Verify_User_Login]    Script Date: 9/14/2024 6:25:49 PM ******/
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
	IF EXISTS (SELECT * FROM user_login WHERE user_id = @user_id and user_password = @user_password) 
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

INSERT INTO [dbo].[user]
           ([user_name]
           ,[user_mail_id]
           ,[phone_num]
           ,[address])
     VALUES
           ('admin'
           ,'s566760@nwmissouri.edu'
           ,'6605288733'
           ,'NW MSU')
GO


INSERT INTO user_login
           
     VALUES
           (1
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
Go

insert into roles values('admin','Admin Role')
insert into roles values('user','User Role')
Go
Insert into user_role values(1,1)
Go

CREATE LOGIN AdminLOGIN WITH PASSWORD = 'PasswordCheck@1'
GO

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