USE [master]
GO
/****** Object:  Database [Social_Network]    Script Date: 6/28/2022 11:01:19 PM ******/
CREATE DATABASE [Social_Network]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Social_Network', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Social_Network.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Social_Network_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER01\MSSQL\DATA\Social_Network_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Social_Network] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Social_Network].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Social_Network] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Social_Network] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Social_Network] SET ARITHABORT OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Social_Network] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Social_Network] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Social_Network] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Social_Network] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Social_Network] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Social_Network] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Social_Network] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Social_Network] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Social_Network] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Social_Network] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Social_Network] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Social_Network] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Social_Network] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Social_Network] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Social_Network] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Social_Network] SET RECOVERY FULL 
GO
ALTER DATABASE [Social_Network] SET  MULTI_USER 
GO
ALTER DATABASE [Social_Network] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Social_Network] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Social_Network] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Social_Network] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Social_Network] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Social_Network] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Social_Network', N'ON'
GO
ALTER DATABASE [Social_Network] SET QUERY_STORE = OFF
GO
USE [Social_Network]
GO
/****** Object:  Table [dbo].[chat_box]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[chat_box](
	[id] [uniqueidentifier] NOT NULL,
	[user_id1] [uniqueidentifier] NULL,
	[user_id2] [uniqueidentifier] NULL,
	[create_date] [datetime] NULL,
	[modified_date] [datetime] NULL,
	[user_name_1] [nvarchar](255) NULL,
	[user_name_2] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[comment]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[comment](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[modified_date] [datetime] NULL,
	[post_id] [uniqueidentifier] NULL,
	[user_name] [nvarchar](255) NULL,
	[user_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[group_post]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[group_post](
	[id] [uniqueidentifier] NOT NULL,
	[group_name] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[modified_date] [datetime] NULL,
	[member_count] [int] NULL,
	[user_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[image]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[image](
	[id] [uniqueidentifier] NOT NULL,
	[url] [nvarchar](255) NULL,
	[post_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[message]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[message](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[user_id] [uniqueidentifier] NULL,
	[is_like] [int] NULL,
	[user_name] [nvarchar](255) NULL,
	[chat_box_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notify]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notify](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[user_id] [uniqueidentifier] NULL,
	[post_id] [uniqueidentifier] NULL,
	[has_seen] [int] NULL,
	[user_id_action] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[post](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](max) NULL,
	[create_date] [datetime] NULL,
	[modified_date] [datetime] NULL,
	[group_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
	[likes_count] [int] NULL,
	[comment_count] [int] NULL,
	[full_name] [nvarchar](200) NULL,
 CONSTRAINT [PK__post__3213E83F087A1DF1] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_comment]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_comment](
	[id] [uniqueidentifier] NOT NULL,
	[comment_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_group_post]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_group_post](
	[id] [uniqueidentifier] NOT NULL,
	[group_post_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
	[create_date] [datetime] NULL,
	[role_number] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_like]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_like](
	[id] [uniqueidentifier] NOT NULL,
	[post_id] [uniqueidentifier] NULL,
	[user_id] [uniqueidentifier] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_tb]    Script Date: 6/28/2022 11:01:20 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_tb](
	[id] [uniqueidentifier] NOT NULL,
	[user_name] [nvarchar](255) NULL,
	[password] [nvarchar](255) NULL,
	[full_name] [nvarchar](255) NULL,
	[email] [nvarchar](255) NULL,
	[phone_number] [nvarchar](255) NULL,
	[address] [nvarchar](255) NULL,
	[department] [nvarchar](255) NULL,
	[position] [nvarchar](255) NULL,
	[birthday] [datetime] NULL,
	[create_date] [datetime] NULL,
	[gender] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[chat_box] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[chat_box] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[chat_box] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[comment] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[comment] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[comment] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[group_post] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[group_post] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[group_post] ADD  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[image] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[message] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[message] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[notify] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[notify] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF__post__id__4F7CD00D]  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF__post__create_dat__5070F446]  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[post] ADD  CONSTRAINT [DF__post__modified_d__5165187F]  DEFAULT (getdate()) FOR [modified_date]
GO
ALTER TABLE [dbo].[user_comment] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[user_group_post] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[user_group_post] ADD  DEFAULT (getdate()) FOR [create_date]
GO
ALTER TABLE [dbo].[user_like] ADD  DEFAULT (newid()) FOR [id]
GO
ALTER TABLE [dbo].[user_tb] ADD  DEFAULT (newid()) FOR [id]
GO
USE [master]
GO
ALTER DATABASE [Social_Network] SET  READ_WRITE 
GO
