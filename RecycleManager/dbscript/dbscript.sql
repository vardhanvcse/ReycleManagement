USE [master]
GO
/****** Object:  Database [RecycleManagement]    Script Date: 9/7/2024 8:13:50 PM ******/
CREATE DATABASE [RecycleManagement]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'RecycleManagement', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RecycleManagement.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'RecycleManagement_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\RecycleManagement_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
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
EXEC sys.sp_db_vardecimal_storage_format N'RecycleManagement', N'ON'
GO
ALTER DATABASE [RecycleManagement] SET QUERY_STORE = ON
GO
ALTER DATABASE [RecycleManagement] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [RecycleManagement]
GO
/****** Object:  Table [dbo].[emp]    Script Date: 9/7/2024 8:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[emp](
	[empName] [varchar](20) NULL,
	[workinhDate] [date] NULL,
	[Workinghour] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 9/7/2024 8:13:51 PM ******/
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
/****** Object:  Table [dbo].[mcnemp]    Script Date: 9/7/2024 8:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[mcnemp](
	[empName] [varchar](20) NULL,
	[workinhDate] [date] NULL,
	[Workinghour] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 9/7/2024 8:13:51 PM ******/
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
/****** Object:  Table [dbo].[user]    Script Date: 9/7/2024 8:13:51 PM ******/
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
/****** Object:  Table [dbo].[user_login]    Script Date: 9/7/2024 8:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_login](
	[user_id] [int] NOT NULL,
	[user_password] [nvarchar](15) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_role]    Script Date: 9/7/2024 8:13:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_role](
	[user_id] [int] NULL,
	[role_id] [int] NULL
) ON [PRIMARY]
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
/****** Object:  StoredProcedure [dbo].[Material_Add]    Script Date: 9/7/2024 8:13:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Delete]    Script Date: 9/7/2024 8:13:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Get]    Script Date: 9/7/2024 8:13:51 PM ******/
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
/****** Object:  StoredProcedure [dbo].[Material_Modify]    Script Date: 9/7/2024 8:13:51 PM ******/
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
