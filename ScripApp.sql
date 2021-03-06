USE [master]
GO
/****** Object:  Database [Social_Network]    Script Date: 7/3/2022 8:27:52 AM ******/
CREATE DATABASE [Social_Network]
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
ALTER DATABASE [Social_Network] SET  ENABLE_BROKER 
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
/****** Object:  Table [dbo].[chat_box]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[group_post]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[image]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[message]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[notify]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[post]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[user_comment]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[user_group_post]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[user_like]    Script Date: 7/3/2022 8:27:53 AM ******/
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
/****** Object:  Table [dbo].[user_tb]    Script Date: 7/3/2022 8:27:53 AM ******/
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
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'bad2450f-cbc7-4a7a-9918-0365196aeec7', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-21T23:12:49.373' AS DateTime), CAST(N'2022-03-21T23:12:49.373' AS DateTime), N'Kiều Đức Long', N'Kiều Đức Long')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-16T15:29:04.833' AS DateTime), CAST(N'2022-03-16T15:29:04.833' AS DateTime), N'Nguyễn Văn Mạnh', N'Nguyễn Văn An')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'97cea6e3-5126-4f06-8f76-10a6b4486920', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24T21:29:33.640' AS DateTime), CAST(N'2022-03-24T21:29:33.640' AS DateTime), N'Nguyễn Văn Mạnh', N'Dương Minh Thuý')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'fd614b6a-bed7-4300-bb2d-32112cd64235', N'fe4b024d-721a-48ab-9747-35e7ae2974eb', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24T21:32:29.217' AS DateTime), CAST(N'2022-03-24T21:32:29.217' AS DateTime), N'Lê Châu Anh', N'Kiều Đức Long')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'9ece919c-b4af-4d41-8c8c-44504e6f8ebe', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', CAST(N'2022-03-24T21:29:32.680' AS DateTime), CAST(N'2022-03-24T21:29:32.680' AS DateTime), N'Nguyễn Văn Mạnh', N'Thiều Thu Thanh')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'4ca682c9-0397-4304-9171-47c22858a347', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24T21:30:47.287' AS DateTime), CAST(N'2022-03-24T21:30:47.287' AS DateTime), N'Nguyễn Văn Toàn', N'Kiều Đức Long')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'75a43ec6-427b-4c44-bf13-60be59c272a5', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-22T21:28:10.970' AS DateTime), CAST(N'2022-03-22T21:28:10.970' AS DateTime), N'Nguyễn Văn Mạnh', N'Trần Huyền Trang')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'44616d08-7e4a-48ab-a904-70e1b22fe272', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-16T23:13:24.290' AS DateTime), CAST(N'2022-03-16T23:13:24.290' AS DateTime), N'Kiều Đức Long', N'Nguyễn Văn An')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'49e9b19e-01fa-4375-8558-76bbaf57bc29', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24T21:45:34.570' AS DateTime), CAST(N'2022-03-24T21:45:34.570' AS DateTime), N'Dương Minh Thuý', N'Kiều Đức Long')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'472b3320-7605-4544-9a39-76dd02817b7b', N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-21T22:19:12.340' AS DateTime), CAST(N'2022-03-21T22:19:12.340' AS DateTime), N'Lê Thế Nam', N'Nguyễn Văn An')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24T22:09:31.667' AS DateTime), CAST(N'2022-03-24T22:09:31.667' AS DateTime), N'Nguyễn Đức Phương', N'Kiều Đức Long')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-16T12:48:29.080' AS DateTime), CAST(N'2022-03-16T12:48:29.080' AS DateTime), N'Kiều Đức Long', N'Chu Việt Dũng')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'f4a12716-3d9c-4492-b3e3-9370b40f1987', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-16T12:48:31.307' AS DateTime), CAST(N'2022-03-16T12:48:31.307' AS DateTime), N'Kiều Đức Long', N'Lê Thế Nam')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-16T23:13:23.793' AS DateTime), CAST(N'2022-03-16T23:13:23.793' AS DateTime), N'Kiều Đức Long', N'Nguyễn Văn Mạnh')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'ac27918f-0ebc-440f-ba2b-b3836b50ec6c', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-16T23:13:23.293' AS DateTime), CAST(N'2022-03-16T23:13:23.293' AS DateTime), N'Kiều Đức Long', N'QTHT')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'e93ba414-07a7-4dd1-a414-ea3d3cd4ebe0', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-24T21:29:16.280' AS DateTime), CAST(N'2022-03-24T21:29:16.280' AS DateTime), N'Nguyễn Văn Mạnh', N'Lê Thế Nam')
GO
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'0b57ced0-951f-4b65-a46f-0963ac8fae37', N'Đẹp tuyệt vời', CAST(N'2022-03-24T21:53:37.013' AS DateTime), CAST(N'2022-03-24T21:53:37.013' AS DateTime), N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'Nguyễn Văn Mạnh', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'7a15ae5e-1315-41f4-8657-0ed9c3c3454b', N'xin chào mọi người', CAST(N'2022-03-24T21:16:41.600' AS DateTime), CAST(N'2022-03-24T21:16:41.600' AS DateTime), N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'Kiều Đức Long', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'e7acb81d-6670-4430-a047-3a2e149b408d', N'Hôm nào chơi nhé anh!', CAST(N'2022-03-24T21:21:25.483' AS DateTime), CAST(N'2022-03-24T21:21:25.483' AS DateTime), N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'Kiều Đức Long', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'f83a83c5-af93-41d9-8f59-4facf9f07fc0', N'Hay quá', CAST(N'2022-03-16T15:26:16.023' AS DateTime), CAST(N'2022-03-16T15:26:16.023' AS DateTime), N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'Nguyễn Văn An', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'38315e98-ddf9-4aef-869e-61430d30cda6', N'Thấy đồn ả rập bán dầu cho anh kia bằng nhân dân tệ à?', CAST(N'2022-03-16T00:55:47.367' AS DateTime), CAST(N'2022-03-16T00:55:47.367' AS DateTime), N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'Kiều Đức Long', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'9cb55e2f-c1ed-4ed8-82c0-63c30e514c25', N'chào anh nhé', CAST(N'2022-03-22T19:56:30.210' AS DateTime), CAST(N'2022-03-22T19:56:30.210' AS DateTime), N'c06647f1-f281-485a-9e79-d058f510d79b', N'Kiều Đức Long', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'4843cb70-ed0b-406a-8cc6-63ec4af8aac2', N'Cảm ơn bạn nhiều! Quá ý nghĩa', CAST(N'2022-03-24T22:18:25.393' AS DateTime), CAST(N'2022-03-24T22:18:25.393' AS DateTime), N'90713450-95a0-4cfe-a375-d7ba6da10186', N'Nguyễn Văn An', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'e1784489-8a67-4bf8-b00a-73916c7b3dc5', N'Đẹp đôi quá bạn ơi', CAST(N'2022-03-24T21:54:05.983' AS DateTime), CAST(N'2022-03-24T21:54:05.983' AS DateTime), N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'Dương Minh Thuý', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'25c5d37e-e892-41b2-b30c-78cd1037a2f9', N'wowwww', CAST(N'2022-03-15T23:50:17.663' AS DateTime), CAST(N'2022-03-15T23:50:17.663' AS DateTime), N'90713450-95a0-4cfe-a375-d7ba6da10186', N'Kiều Đức Long', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'4b287c6f-9072-4df8-8fe2-7987e513c0e3', N'oke nhe', CAST(N'2022-03-19T23:12:38.070' AS DateTime), CAST(N'2022-03-19T23:12:38.070' AS DateTime), N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', N'Kiều Đức Long', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'6f8be12e-942d-4ab1-bc81-875c886b23c2', N'Xinh đẹp tuyệt vời ạ', CAST(N'2022-03-24T21:54:22.783' AS DateTime), CAST(N'2022-03-24T21:54:22.783' AS DateTime), N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'Dương Minh Thuý', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'78da29e3-6ebd-488c-a2fb-89c7cb09478b', N'hello nha', CAST(N'2022-03-17T22:25:11.923' AS DateTime), CAST(N'2022-03-17T22:25:11.923' AS DateTime), N'90713450-95a0-4cfe-a375-d7ba6da10186', N'Nguyễn Văn Mạnh', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'5fd922b6-1ef2-4a81-98d6-8b41d66b5350', N'David De Gea: "Thành thật mà nói cầu thủ mà tôi ngại đối đầu nhất trong sự nghiệp là Harry Maguire"', CAST(N'2022-03-16T00:06:17.440' AS DateTime), CAST(N'2022-03-16T00:06:17.440' AS DateTime), N'90713450-95a0-4cfe-a375-d7ba6da10186', N'Lê Thế Nam', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'317adda2-a2d0-454f-8ea5-b263f709e9f3', N'wow', CAST(N'2022-03-16T15:24:53.967' AS DateTime), CAST(N'2022-03-16T15:24:53.967' AS DateTime), N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'Nguyễn Văn An', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'de7cd65d-2511-4697-812a-be7674ff868b', N'Tuyệt vời luôn em ơi! tối mai nhé', CAST(N'2022-03-24T21:53:50.367' AS DateTime), CAST(N'2022-03-24T21:53:50.367' AS DateTime), N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'Nguyễn Văn Mạnh', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'9741bc21-98db-4243-a54f-c2f86deec28f', N'Cảm ơn bạn! thật tuyệt vời!', CAST(N'2022-03-24T22:18:11.153' AS DateTime), CAST(N'2022-03-24T22:18:11.153' AS DateTime), N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'Nguyễn Văn An', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'4136a125-2469-49b3-b735-cbe490074f2c', N'Xinh đẹp tuyệt vời ạ', CAST(N'2022-03-24T21:54:51.087' AS DateTime), CAST(N'2022-03-24T21:54:51.087' AS DateTime), N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'Dương Minh Thuý', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'7bdd11d7-4d82-4aeb-b853-d613a6faa826', N'Tuyệt vời lắm em!', CAST(N'2022-03-24T21:19:59.903' AS DateTime), CAST(N'2022-03-24T21:19:59.903' AS DateTime), N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'Nguyễn Văn Mạnh', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
GO
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'af37220f-9376-4b21-b05b-1cd66448399e', N'AOE Việt Nam', CAST(N'2022-03-24T21:11:46.630' AS DateTime), CAST(N'2022-03-24T21:11:46.630' AS DateTime), 8, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'9bd35635-4623-4c4f-bcad-805c7370372b', N'Tuyển dụng', CAST(N'2022-03-24T20:59:35.840' AS DateTime), CAST(N'2022-03-24T20:59:35.840' AS DateTime), 5, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'Phòng nhân sự', CAST(N'2022-03-16T00:25:21.500' AS DateTime), CAST(N'2022-03-16T00:25:21.500' AS DateTime), 3, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'47765bac-3fa2-4f15-aa90-b776e583196b', N'Fanclub', CAST(N'2022-03-16T15:27:15.280' AS DateTime), CAST(N'2022-03-16T15:27:15.280' AS DateTime), 3, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
GO
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'2f303b96-5439-41c5-aabe-098a671e1b72', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514_0.jpg', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'a610e223-1ba7-42c5-98b4-0d2d60263abb', N'b2639252-0eaa-454a-916d-3dfb1fd1121b_0.png', N'b2639252-0eaa-454a-916d-3dfb1fd1121b')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'124c843c-2e41-44dc-995e-0d524ec56d0e', N'd3145b1d-5aea-4624-b028-abb3772611a5_0.jpg', N'd3145b1d-5aea-4624-b028-abb3772611a5')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'283eebb7-f8a0-4992-84c9-16799b84b516', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f_0.png', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'2a35131a-9a5a-4f03-a8ff-2556e353bca3', N'4bbd1849-17b4-4705-bf70-72e0577e1187_3.jpg', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'9a158727-8e45-40bd-a83e-312743b9094b', N'e915c198-de1d-44b4-9244-c4dbf259eb16_1.jpg', N'e915c198-de1d-44b4-9244-c4dbf259eb16')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'35b94dc8-4fa7-4011-b934-31822356b188', N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f_0.png', N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e9abe8fd-e3b1-4af2-bde6-3b110a62c6d8', N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f_1.png', N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'ef976483-ba21-4dd7-a1c9-40e9a1602bb7', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454_0.jpg', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'41fbb4d3-f3a7-4c66-bea5-470d5b0386a8', N'e915c198-de1d-44b4-9244-c4dbf259eb16_2.jpg', N'e915c198-de1d-44b4-9244-c4dbf259eb16')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'5a40bdcf-6610-4e52-a83b-49f6ed06a995', N'3679316c-75c6-4321-8e0b-0206b11ca4b9_1.jpg', N'3679316c-75c6-4321-8e0b-0206b11ca4b9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'c4e5ca21-0ffe-4183-b1dc-4b0eab278b1b', N'399c07ff-c804-4210-b8a1-59d44eda7367_1.png', N'399c07ff-c804-4210-b8a1-59d44eda7367')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'cf519b08-1728-4c9e-9f32-4c80a11a38d0', N'3679316c-75c6-4321-8e0b-0206b11ca4b9_0.png', N'3679316c-75c6-4321-8e0b-0206b11ca4b9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'41464d5a-2539-4995-a842-4e2952f27160', N'46b69986-fa15-4375-8a09-542d46da256d_0.jpg', N'46b69986-fa15-4375-8a09-542d46da256d')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'1a203d90-8aca-43cf-bc77-4f230ccf8fb4', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142_0.jpg', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'4c9f89d3-2fbe-4d62-a2e8-50b7da12c872', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d_0.jpg', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'56c466d1-ccc7-47a7-b283-56c5e702f3c2', N'08995335-f5f0-4325-ae4d-3383b21f2c4f_2.jpg', N'08995335-f5f0-4325-ae4d-3383b21f2c4f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'9aae5133-73d5-4358-b186-58c40cfb5d67', N'89b79f88-621a-46dc-acee-293f36b5dd91_0.jpg', N'89b79f88-621a-46dc-acee-293f36b5dd91')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'4b92b825-74d0-4c1f-a9f5-5a567f399205', N'13b78535-5991-49c9-a3a6-70b29f6b6458_0.png', N'13b78535-5991-49c9-a3a6-70b29f6b6458')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'07c79879-7568-4293-857f-5bd346131058', N'6f059565-af23-4fa1-ae03-479b7d5352fe_0.jpg', N'6f059565-af23-4fa1-ae03-479b7d5352fe')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'd5c843d3-86a7-486f-b62b-5d3a203d4231', N'e915c198-de1d-44b4-9244-c4dbf259eb16_0.jpg', N'e915c198-de1d-44b4-9244-c4dbf259eb16')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'36170f5c-263f-41fa-83cd-5f88e5acd2d1', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1_1.jpg', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'8eee9955-1bc2-41fb-a025-63008623dd07', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1_2.jpg', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'729394cd-3cac-42f5-9330-7201b984ae93', N'4bbd1849-17b4-4705-bf70-72e0577e1187_0.png', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'19b31b85-3a15-40b0-92cb-79e9ba446a22', N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796_1.jpg', N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'12a04bad-d367-4ab1-9386-7bd13788e60a', N'399c07ff-c804-4210-b8a1-59d44eda7367_0.jpg', N'399c07ff-c804-4210-b8a1-59d44eda7367')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'ee88c8e2-1846-4b5e-82aa-7d7124a60fc5', N'13b78535-5991-49c9-a3a6-70b29f6b6458_1.jpg', N'13b78535-5991-49c9-a3a6-70b29f6b6458')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'3432e84d-3780-4d69-9c3b-8216ce9b0080', N'eee13175-f1ac-4331-ad56-8be519ab6d4b_0.jpg', N'eee13175-f1ac-4331-ad56-8be519ab6d4b')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'0ca966c7-a519-43d6-898c-82d615892f25', N'be9959b8-9f52-452b-8a66-33a6e9f03fc3_0.png', N'be9959b8-9f52-452b-8a66-33a6e9f03fc3')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'1fc58452-d06d-43f2-afe1-88bc23ffb3bf', N'90a0be5a-3174-4586-bab7-e2c43b0450e6_0.jpg', N'90a0be5a-3174-4586-bab7-e2c43b0450e6')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'f3d51137-47b6-4c43-bb6c-88c784b9ede0', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514_1.jpg', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'ad8d00a6-10f3-4e18-917c-8a926cbf61cf', N'6f059565-af23-4fa1-ae03-479b7d5352fe_1.jpg', N'6f059565-af23-4fa1-ae03-479b7d5352fe')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e479de07-bacb-4fa1-ac51-8fe8a01cb1b6', N'845e118b-4ec9-4111-98cf-78cbbdcf337f_0.jpg', N'845e118b-4ec9-4111-98cf-78cbbdcf337f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'3a09c12a-5874-4148-b66d-9291522a67f1', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45_0.jpg', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'760b5f8c-e3ce-4a4a-b434-9b9c6ee2d8b8', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51_0.jpg', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'bd0aa805-4c77-43f9-aa07-a408afa05cfb', N'90713450-95a0-4cfe-a375-d7ba6da10186_0.jpg', N'90713450-95a0-4cfe-a375-d7ba6da10186')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'febe003c-b37b-4e06-b128-a55697f16d6c', N'65f6bf3f-6298-4496-a1bb-b3ed55332de7_0.jpg', N'65f6bf3f-6298-4496-a1bb-b3ed55332de7')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'0dc19bd6-302f-4029-83b2-ba3ea30028ed', N'08995335-f5f0-4325-ae4d-3383b21f2c4f_1.jpg', N'08995335-f5f0-4325-ae4d-3383b21f2c4f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'13d9b5e4-be23-4d80-8231-ba958e417cfa', N'775b7daa-5b1e-49ec-ba06-15a6199246ea_0.jpg', N'775b7daa-5b1e-49ec-ba06-15a6199246ea')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'd164e495-ac32-4861-a3d0-c2a6bdff1699', N'4068287b-402b-4a42-8453-302755b85ab2_0.jpg', N'4068287b-402b-4a42-8453-302755b85ab2')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e199dbfd-c067-471a-8e91-c4589876e84a', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169_0.jpg', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'82a2c708-3e0c-4669-8446-c5cec02b9109', N'4bbd1849-17b4-4705-bf70-72e0577e1187_2.jpg', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'55753a8e-6c5d-4689-ba8e-c5e722d38016', N'08995335-f5f0-4325-ae4d-3383b21f2c4f_0.jpg', N'08995335-f5f0-4325-ae4d-3383b21f2c4f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'fb6da654-2eae-4a88-8d48-c64cd4605a08', N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796_0.png', N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'229e18a1-5986-48d0-bb70-c7466651f696', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1_0.jpg', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e163d284-c7df-4d32-b328-da0bf4ca82ae', N'6f059565-af23-4fa1-ae03-479b7d5352fe_2.jpg', N'6f059565-af23-4fa1-ae03-479b7d5352fe')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'121c0aa9-da49-4a39-b93f-e1cb189d7e3f', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a_0.jpg', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'7ebfc544-d7c9-46a1-af25-e75495037f81', N'9961b30b-a55c-4976-8501-ae308bf652f9_0.jpg', N'9961b30b-a55c-4976-8501-ae308bf652f9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'063460ca-cd2f-4f44-a90b-eaf37165ba09', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a_1.jpg', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'8dc9229e-34da-4fcf-b315-ed040d72556a', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a_2.jpg', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e9a8cece-ee5b-4fe9-b04a-f1cf429786dd', N'3679316c-75c6-4321-8e0b-0206b11ca4b9_2.jpg', N'3679316c-75c6-4321-8e0b-0206b11ca4b9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'34735006-9c1c-4e74-8f58-f681a451175e', N'90a0be5a-3174-4586-bab7-e2c43b0450e6_1.jpg', N'90a0be5a-3174-4586-bab7-e2c43b0450e6')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'24a789a0-e139-48b1-bb15-fceea2ab50df', N'4bbd1849-17b4-4705-bf70-72e0577e1187_1.jpg', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'246a5ded-891e-4fe4-96f1-ff94db1f556f', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f_1.jpg', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f')
GO
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'c90b647b-0f54-4ee3-95d1-062314bbb2a0', N'ookk', CAST(N'2022-03-21T20:30:54.783' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'f4a12716-3d9c-4492-b3e3-9370b40f1987')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'03ac4319-20da-4893-8130-094480bf5c7a', N'oke nha', CAST(N'2022-03-23T22:15:02.007' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'64638c09-8e18-4c5e-8408-1203688703b8', N'hi a', CAST(N'2022-03-22T19:48:08.163' AS DateTime), N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, N'Nguyễn Văn An', N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'372b2364-c4d9-463a-bc7e-1e7d9e61eecb', N'helo', CAST(N'2022-03-24T22:09:57.277' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'9b2123bb-d19d-4907-b9d3-259248ca7a0a', N'chao nha', CAST(N'2022-03-21T20:31:24.687' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'368ccc22-ef77-406f-b45a-33684c18fef1', N'Chào', CAST(N'2022-03-24T22:10:11.030' AS DateTime), N'5eb31b89-838b-43af-aa86-2c5c655762e4', 0, N'Nguyễn Đức Phương', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'31074246-4c8c-4cdc-a02f-3cc6e13015b5', N'Chào bạn!', CAST(N'2022-03-16T23:13:34.597' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'4445533e-b494-4e3d-8a35-8152f8035cd2')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'bee11b8a-47f5-484c-82d9-421149eb1ad5', N'Chào anh Mạnh ạ', CAST(N'2022-03-17T21:00:43.563' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'353d0517-945d-43d4-b67c-4d3dd8dadb20', N'Chào Longg', CAST(N'2022-03-24T21:48:59.703' AS DateTime), N'5e01483d-d93c-45a2-a04b-75d65866cc78', 0, N'Lê Thế Nam', N'f4a12716-3d9c-4492-b3e3-9370b40f1987')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'273c1398-9cdf-405f-ae4a-4e9531f8b919', N'Chào Long!', CAST(N'2022-03-25T14:35:35.003' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'4445533e-b494-4e3d-8a35-8152f8035cd2')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'51ac0849-dec1-4746-9780-4f691f52eb60', N'Chào Long nhá!', CAST(N'2022-03-24T21:45:41.233' AS DateTime), N'8254b0fb-14dd-4693-b543-4b7e1408e697', 0, N'Dương Minh Thuý', N'49e9b19e-01fa-4375-8558-76bbaf57bc29')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'b2a1eec3-a384-4ffb-a323-54ba85cbdd54', N'hi', CAST(N'2022-03-23T22:14:06.760' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'555487ae-f015-4d41-8d32-565e8808bd3b', N'xin chào', CAST(N'2022-03-16T15:29:08.033' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'278380de-d582-4a66-a864-5968019e6422', N'xin chào Long', CAST(N'2022-03-17T21:00:33.617' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'dd53954e-e6c3-4aed-895c-5b5bf2c7574c', N'được', CAST(N'2022-03-24T22:10:25.710' AS DateTime), N'5eb31b89-838b-43af-aa86-2c5c655762e4', 0, N'Nguyễn Đức Phương', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'2c6b9058-f020-4a39-a964-64c791fdf245', N'kkkk', CAST(N'2022-03-21T20:31:19.347' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'f4a12716-3d9c-4492-b3e3-9370b40f1987')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'2de827f6-1b43-4d4c-bfdd-664ff1953316', N'isLike', CAST(N'2022-03-16T23:13:36.290' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Kiều Đức Long', N'4445533e-b494-4e3d-8a35-8152f8035cd2')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'142d3bb8-63f8-454b-9630-6a57b2df2246', N'dc', CAST(N'2022-03-21T20:30:49.610' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'ac27918f-0ebc-440f-ba2b-b3836b50ec6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'45c2c80d-9798-4159-803d-79212f2ce9b7', N'chào bạn', CAST(N'2022-03-16T15:29:19.143' AS DateTime), N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, N'Nguyễn Văn An', N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'83ae8c1a-054a-4451-b37c-862ca4e86b57', N'Sáng mai ăn bánh dò nhé ', CAST(N'2022-03-24T22:10:54.597' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'7bcddd59-70dc-4a78-b11f-95b4695d0cdf', N'Cho anh hỏi chút', CAST(N'2022-03-24T21:31:09.870' AS DateTime), N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', 0, N'Nguyễn Văn Toàn', N'4ca682c9-0397-4304-9171-47c22858a347')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'0903f841-6503-490c-b412-9ac6329a5d59', N'Chào Long a là Toàn', CAST(N'2022-03-24T21:30:55.753' AS DateTime), N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', 0, N'Nguyễn Văn Toàn', N'4ca682c9-0397-4304-9171-47c22858a347')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'fe85233f-0be6-47fa-a2d5-a0a894607129', N'Chào Long chị là Châu Anh', CAST(N'2022-03-24T21:32:37.537' AS DateTime), N'fe4b024d-721a-48ab-9747-35e7ae2974eb', 0, N'Lê Châu Anh', N'fd614b6a-bed7-4300-bb2d-32112cd64235')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'1e8d6fd8-d99c-4653-b885-ab075b94e736', N'Chào Long!', CAST(N'2022-07-02T22:38:58.863' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, N'Chu Việt Dũng', N'4445533e-b494-4e3d-8a35-8152f8035cd2')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'45923e24-a9d5-4d96-84f8-b297abe8c65d', N'hii', CAST(N'2022-03-23T22:13:37.890' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'476ec060-256f-445c-aa3b-bfadbc0de810', N'isLike', CAST(N'2022-03-24T21:30:57.057' AS DateTime), N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', 1, N'Nguyễn Văn Toàn', N'4ca682c9-0397-4304-9171-47c22858a347')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'96556fbe-7e5a-4b34-a899-c4696519db53', N'mai ăn sáng không?', CAST(N'2022-03-24T22:10:44.823' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'97f3396e-5865-4732-a878-c4a4ddb758f1', N'hi Long', CAST(N'2022-03-20T20:20:26.960' AS DateTime), N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, N'Nguyễn Văn An', N'44616d08-7e4a-48ab-a904-70e1b22fe272')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'e939e19e-01a1-4b14-8864-c933e36a5381', N'oke luôn', CAST(N'2022-03-24T22:11:02.733' AS DateTime), N'5eb31b89-838b-43af-aa86-2c5c655762e4', 0, N'Nguyễn Đức Phương', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'5af53796-6713-4e8b-bc92-e3be1033b36a', N'Chào Dũng!', CAST(N'2022-03-25T14:35:30.573' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, N'Chu Việt Dũng', N'4445533e-b494-4e3d-8a35-8152f8035cd2')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'139ce670-43bb-42b3-855f-e50d3e5f8ce7', N'Long ơi', CAST(N'2022-03-24T22:18:38.590' AS DateTime), N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, N'Nguyễn Văn An', N'44616d08-7e4a-48ab-a904-70e1b22fe272')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'6fba6561-8180-44eb-b013-e94fa6684a9d', N'Có chuyện gì vậy anh', CAST(N'2022-03-17T21:00:51.780' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'5c9ee3f0-2b49-406c-b4b2-ed825bb89c2b', N'hi a', CAST(N'2022-03-22T19:47:21.910' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'04bb8e93-9f7a-402e-9afc-ee6918a23dcf', N'0ki', CAST(N'2022-03-17T22:59:51.283' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'cb86cd7d-8154-47a8-a1b4-f3e89f4cdb56', N'baiii', CAST(N'2022-03-24T22:10:32.050' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'eb48ead2-446f-4d79-9398-f69dfc0461a9', N'oke nha', CAST(N'2022-03-23T22:15:11.647' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'fcb118e4-7cf4-405b-8def-fc845b8879b0', N'hello e', CAST(N'2022-03-23T22:13:01.610' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'5d144615-c13f-40e5-8839-fe7e47842a7f', N'Chào lại', CAST(N'2022-03-24T22:10:19.493' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Kiều Đức Long', N'52b896aa-7b6b-4ccb-816e-7e204836be94')
GO
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'6501cb0c-f9c8-4d63-9e20-0217aff266f1', N'Kiều Đức Long đã bình luận bài viết của bạn!', CAST(N'2022-03-22T19:56:30.220' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'c06647f1-f281-485a-9e79-d058f510d79b', 1, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'279c7eb7-7d3c-4ae8-872e-040ad3676d9b', N'Nguyễn Văn Mạnh đã bình luận bài viết của bạn!', CAST(N'2022-03-24T21:53:37.020' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', 0, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'9c1fbe6f-d12b-4497-8d4d-128d27930d33', N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-03-24T22:17:48.773' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', 0, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'148713e6-254d-436a-92bf-13e2b955c766', N'Lê Thế Nam đã thích bài viết của bạn!', CAST(N'2022-03-20T20:13:14.780' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'90713450-95a0-4cfe-a375-d7ba6da10186', 1, N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'8f68ea91-43b9-4ee9-9413-153bb7962f30', N'Nguyễn Văn An đã bình luận bài viết của bạn!', CAST(N'2022-03-24T22:18:11.153' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', 0, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'2e625c21-8fb8-4586-bb31-1774191ecd47', N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-03-24T22:17:52.710' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', 0, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'f6e61826-1b78-4369-9423-1fc23cfc9638', N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-03-24T22:17:47.283' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', 0, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'004905c8-b5b2-4a3a-b9b7-37951f898d2d', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:38.003' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', 0, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'd8881d79-b829-437c-94de-39638ffe3966', N'Dương Minh Thuý đã bình luận bài viết của bạn!', CAST(N'2022-03-24T21:54:22.783' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', 0, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'44692a2a-4c82-435c-892d-4283dc7535a3', N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-03-24T21:54:44.713' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', 1, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'779819e3-473c-47aa-b10d-4ce1df5a894e', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-24T21:16:29.773' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', 1, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'8ea11222-e931-4617-888d-4faadeb10ee0', N'Nguyễn Văn An đã bình luận bài viết của bạn!', CAST(N'2022-03-24T22:18:25.393' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'90713450-95a0-4cfe-a375-d7ba6da10186', 0, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'881d862d-5d93-457f-9c45-517668da04e7', N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-03-24T22:17:51.620' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'90713450-95a0-4cfe-a375-d7ba6da10186', 0, N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'23115ff3-b070-4720-966f-57a94a1f9c87', N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-03-24T21:54:07.683' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'46b69986-fa15-4375-8a09-542d46da256d', 0, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'400ae5d5-1ee1-43b3-be35-5fa814674ad0', N'Nguyễn Văn Mạnh đã bình luận bài viết của bạn!', CAST(N'2022-03-24T21:53:50.370' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', 0, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'467920c7-02d1-45b0-bcf9-6ac66ea7a178', N'Kiều Đức Long đã thích bài viết của bạn!', CAST(N'2022-03-22T19:53:24.063' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'c06647f1-f281-485a-9e79-d058f510d79b', 0, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'ab8115c2-3675-4bb6-a91c-7711a928d1bb', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:29.393' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'46b69986-fa15-4375-8a09-542d46da256d', 0, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'1559b6ab-6422-4ae0-96cc-8611b1b140d3', N'Lê Thế Nam đã thích bài viết của bạn!', CAST(N'2022-03-20T20:13:21.340' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', 1, N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'6b42f1fd-f465-4594-8ac3-882397c64071', N'Dương Minh Thuý đã bình luận bài viết của bạn!', CAST(N'2022-03-24T21:54:51.090' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', 0, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'a57dc14a-a24a-4b3b-92e2-931d0a6052fe', N'Nguyễn Văn Mạnh đã bình luận bài viết của bạn!', CAST(N'2022-03-24T21:19:59.910' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', 1, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'381a69c4-a16a-4c28-8377-96e63606042c', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:28.237' AS DateTime), N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', 0, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'c5a8cb03-1cfc-49fa-b2ca-9b167d01409f', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:40.107' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', 1, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'f77560c4-f5d4-4226-9998-9c8598b749ea', N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-03-24T21:54:01.583' AS DateTime), N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', 0, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'2106f335-6d13-4159-bea3-b361b1e7d9ef', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-22T19:53:32.653' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', 1, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'898df97b-c1fc-4e5b-995f-bec7d56e6154', N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-03-17T22:39:25.150' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', 1, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'9d808586-46e9-4f00-b067-bf0e051f3dc1', N'Nguyễn Đức Phương đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:17.847' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', 0, N'5eb31b89-838b-43af-aa86-2c5c655762e4')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'ce1e3813-dc1e-47aa-9ff8-c1636a67798d', N'Nguyễn Đức Phương đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:13.977' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', 1, N'5eb31b89-838b-43af-aa86-2c5c655762e4')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'97eed3a5-3729-47b3-9e4a-c9ce28467779', N'Dương Minh Thuý đã bình luận bài viết của bạn!', CAST(N'2022-03-24T21:54:05.987' AS DateTime), N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', 0, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'5e2f70a3-0851-4686-9034-d3473f56c358', N'Nguyễn Đức Phương đã thích bài viết của bạn!', CAST(N'2022-03-24T21:53:19.647' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'c06647f1-f281-485a-9e79-d058f510d79b', 0, N'5eb31b89-838b-43af-aa86-2c5c655762e4')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'3b15ef39-9541-4bb0-8b44-e788f9a65f3c', N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-03-24T21:54:43.433' AS DateTime), N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', 0, N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[notify] ([id], [content], [create_date], [user_id], [post_id], [has_seen], [user_id_action]) VALUES (N'f169b9d9-97ab-4a54-8815-ecfcadb753b8', N'Lê Thế Nam đã thích bài viết của bạn!', CAST(N'2022-03-20T20:13:12.643' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', 0, N'5e01483d-d93c-45a2-a04b-75d65866cc78')
GO
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'775b7daa-5b1e-49ec-ba06-15a6199246ea', N'Họ chắc chắn không có Mercedes G63 tặng bạn nhưng sẽ fix những con bug khó nhằn do bạn tạo ra. Tag ngay những người anh em "nương tựa" của mình vào đây', CAST(N'2022-03-24T21:10:57.613' AS DateTime), CAST(N'2022-03-24T21:10:57.613' AS DateTime), N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'WOW
Hôm nọ nghe nói Thái Tử không nhận điện của Ngài Tổng Thống vẫn tưởng đó là chuyện tào lao.
Kịch càng ngày càng hay.
Và những phần hay nhất vẫn còn ở phía trước.', CAST(N'2022-03-16T00:33:54.110' AS DateTime), CAST(N'2022-03-16T00:33:54.110' AS DateTime), NULL, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 4, 2, N'Nguyễn Văn Mạnh')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'89b79f88-621a-46dc-acee-293f36b5dd91', N'Công bố kết quả', CAST(N'2022-03-16T15:27:27.847' AS DateTime), CAST(N'2022-03-16T15:27:27.847' AS DateTime), N'47765bac-3fa2-4f15-aa90-b776e583196b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, 0, N'Nguyễn Văn An')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'4068287b-402b-4a42-8453-302755b85ab2', N'MISA Software bật chế độ truy tìm Automation Tester/QC.
Chi tiết xem tại:', CAST(N'2022-03-24T21:11:17.220' AS DateTime), CAST(N'2022-03-24T21:11:17.220' AS DateTime), N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', N'GIÁ XĂNG CÓ THỂ ĐẠT ĐỈNH 40.000Đ/LÍT TRONG THỜI GIAN TỚI

Có thể bạn chưa biết, tính từ khi quả tên lửa đầu tiên của Nga bay sang đất Ukraine đến nay thì giá dầu toàn cầu đã tăng 40% và có lúc là 70% so với cùng kỳ.

Theo ông Michael Kokalari, kinh tế trưởng của tập đoàn VinaCapital thì giá xăng Việt Nam theo đó đã tăng hơn 20% kể từ đầu năm. Mặc dù giá xăng Việt Nam có diễn biến phù hợp với giá dầu thế giới nhưng vẫn có độ trễ, do đó, nếu giá dầu thế giới tiếp tục tăng thì khả năng giá xăng Việt Nam tăng thêm 30% trong vài tháng tiếp theo.

Như vậy, với giá xăng hiện tại là 29.820 đồng/lít và nếu tăng thêm 30% như dự đoán của vị chuyên gia kinh tế thì giá xăng Việt Nam có thể áp sát mốc 40.000 đồng/lít, cột mốc vô tiền khoáng hậu trong suốt chiều dài 4.000 năm dựng nước và giữ nước của cha ông ta.

Theo Wikipedia, mức lương trung bình của người Việt Nam là ~7,8 triệu đồng. Nếu như cột mốc 40k/lít xuất hiện thì 1 tháng lương, chúng ta sẽ mua được ~195 lít xăng thay vì 461 lít như ngày này của 2 năm trước đây', CAST(N'2022-03-15T22:57:57.060' AS DateTime), CAST(N'2022-03-15T22:57:57.060' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, 1, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'[Góc remind] TRUYỀN THÔNG SAU HỘI NGHỊ LÃNH ĐẠO

Thời gian: 15h00 ngày 07/03/2022
Hình thức: Online qua Zoom Join Zoom Meeting: https://mily.vn/vBtBzMS

Meeting ID: 686 868 6822
Passcode: 1234 

Hình nền chung: https://mily.vn/vBtBITP

ACE hãy tham gia link trước 15 phút để ổn định và chương trình có thể bắt đầu đúng giờ nhé. ', CAST(N'2022-03-15T23:02:23.423' AS DateTime), CAST(N'2022-03-15T23:02:23.423' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 3, 1, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'46b69986-fa15-4375-8a09-542d46da256d', N'Cùng chị em MISA unbox quà 8/3 của các văn phòng trên toàn quốc nha!!', CAST(N'2022-03-24T21:50:51.350' AS DateTime), CAST(N'2022-03-24T21:50:51.350' AS DateTime), NULL, N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 2, 0, N'Chu Việt Dũng')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'- Theo kinh nghiệm của game thủ thì nên xây, bo ruộng so với nhiều điều kiện BN, BG với khoảng cách = 1 BE, mục đích là để khi bị địch chém vào thì mình bo vừa 1 cái BE

- Bố trí nhà cửa ruộng vườn cũng rất là quan trọng vì mình bố trí hợp lý thì năng suất làm việc cũng như sự nhanh nhẹn của nông dân được đẩy lên mức cao nhất giúp ta không bị mất thao tác nhiều. Thế nhà đẹp cũng giúp đỡ bạn dễ bo nhà và ít tốn kém tài nguyên hơn.', CAST(N'2022-03-24T21:19:12.890' AS DateTime), CAST(N'2022-03-24T21:19:12.890' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 4, 3, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'845e118b-4ec9-4111-98cf-78cbbdcf337f', N'Kế hoạch tuyển dụng FE dev tháng 4', CAST(N'2022-03-16T00:27:35.520' AS DateTime), CAST(N'2022-03-16T00:27:35.520' AS DateTime), N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, 0, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'd3145b1d-5aea-4624-b028-abb3772611a5', N'Mặc dù đây là một trong những nguyên tắc cơ bản nhưng rất nhiều ứng viên vẫn mắc phải điều này. Ứng viên dùng email không chuyên nghiệp. Thật “ngớ ngẩn” khi bạn làm CV thật đẹp đẽ, hoàn hảo nhưng lại gửi bằng một địa chỉ email kiểu như “hetyeuthichiatay123@gmail.com”. Đây là lỗi sai kinh điển, không thể chấp nhận được đối với người đi xin việc. Nhà tuyển dụng sẽ bỏ qua luôn và cho bạn vào danh sách đen vì lỗi không chuyên nghiệp, sai từ bước cơ bản. Tốt nhất, hãy sử dụng địa chỉ email mang tên bạn đi kèm nghề nghiệp, ví dụ như “Tranthuhuongmarketing@gmail.com”. Email chuyên nghiệp thể hiện bạn là người nghiêm túc với nghề nghiệp, cẩn thận trong giao tiếp và quan trọng nhất là cho nhà tuyển dụng thấy được bạn thực sự tôn trọng họ', CAST(N'2022-03-24T21:00:02.510' AS DateTime), CAST(N'2022-03-24T21:00:02.510' AS DateTime), N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'9961b30b-a55c-4976-8501-ae308bf652f9', N'Kết quả thực hiện theo mục tiêu của dự án bảo trì tháng 1/2022
PS: Từ tháng 2/2022 mục tiêu về lỗi chương trình còn tồn sẽ có thay đổi: Mục tiêu <=5 lỗi/sản phẩm', CAST(N'2022-03-16T13:33:01.520' AS DateTime), CAST(N'2022-03-16T13:33:01.520' AS DateTime), N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 1, 0, N'Nguyễn Văn Mạnh')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'65f6bf3f-6298-4496-a1bb-b3ed55332de7', N'Bo nhà trong Đế Chế AOE là việc rất quan trọng, giúp cho người chơi không bị đối thủ móc máy, để có thời gian phát triển và xin quân để chống trả. Nếu bạn là người chơi lâu năm thì chắc cũng không còn lạ gì nữa, còn đối với người mới chơi thì việc bo sao cho hợp lý và thực sự hiệu quả thì quả thật rất là khó, bài viết dưới đây Taimienphi.vn sẽ hướng dẫn bạn cách bo nhà trong Đế Chế AOE.', CAST(N'2022-03-24T21:12:32.743' AS DateTime), CAST(N'2022-03-24T21:12:32.743' AS DateTime), N'af37220f-9376-4b21-b05b-1cd66448399e', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f', N'• Ăn trưa lại vị trí ngồi làm việc
• Gửi xe dưới tầng hầm + bãi gửi xe đằng sau tòa nhà FPT theo đúng danh sách phân chia HCTH sẽ gửi trong ngày mai (ACE vui lòng check email của Ntha3@fresher.misa.com.vn)
• Địa điểm làm việc (theo ảnh gửi đính kèm)', CAST(N'2022-03-16T13:35:42.997' AS DateTime), CAST(N'2022-03-16T13:35:42.997' AS DateTime), N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'Cùng chị em MISA unbox quà 8/3 của các văn phòng trên toàn quốc nha!!
Mỗi Văn phòng/ trung tâm của MISA lại tổ chức ngày Quốc tế phụ nữ theo một màu sắc riêng cùng với đó là những món quà vật chất & tinh thần vô cùng thú vị. Tuy nhiên, dù ở bất cứ đâu - vị trí nào thì mỗi bóng hồng MISA vẫn luôn tỏa sáng đúng không nào!', CAST(N'2022-03-24T21:50:12.573' AS DateTime), CAST(N'2022-03-24T21:50:12.573' AS DateTime), NULL, N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 2, 3, N'Chu Việt Dũng')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'Chiều 15/3, KSX đã long trọng tổ chức lễ giao nhiệm vụ cho cán bộ để đáp ứng được nhu cầu phát triển sản phẩm ngày càng cao của công ty. Tại buổi lễ,  ông Nguyễn Ngọc Anh được giao nhiệm vụ - Quản lý thi công Dự án ASP Khối dự án Tài chính Doanh nghiệp.', CAST(N'2022-03-16T13:30:22.380' AS DateTime), CAST(N'2022-03-16T13:30:22.380' AS DateTime), NULL, N'5e01483d-d93c-45a2-a04b-75d65866cc78', 3, 1, N'Lê Thế Nam')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'c06647f1-f281-485a-9e79-d058f510d79b', N'Xin chào mọi người mình là Mạnh đây!', CAST(N'2022-03-22T19:53:04.693' AS DateTime), CAST(N'2022-03-22T19:53:04.693' AS DateTime), NULL, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 2, 1, N'Nguyễn Văn Mạnh')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'90713450-95a0-4cfe-a375-d7ba6da10186', N'37 TUỔI 35 NGÀY LÀ SỐ TUỔI HIỆN TẠI CỦA ANH

Với ba bàn tối qua, Ronaldo chạm mốc 807 bàn trong 1.146 trận đấu chính thức cho CLB lẫn ĐTQG. Đưa anh trở thành cầu thủ ghi nhiều bàn nhất trong các trận chính thức của FIFA. Ở độ tuổi 37 cách anh thi đấu như cười vào mặt cái xương sống nhức mỏi của những thanh niên tuổi đôi mươi.

Thật sự trận đấu đêm qua của anh quá cháy. Cú sút ngoài vòng cấm của anh làm tôi nhớ đến những cú sút xé gió của tôi. Những cú sút đưa quả bóng nhựa bay ra ngoài khung thành dưới cái nắng hè oi ả. Nếu không phải vì cuộc sống nghiệt ngã tôi đã theo đuổi nghiệp quần đùi áo số chứ không phải ngồi đây.', CAST(N'2022-03-15T23:03:16.250' AS DateTime), CAST(N'2022-03-15T23:03:16.250' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 4, 4, N'Kiều Đức Long')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'"Anh áo xanh là anh bộ đội
Tình trong ngực và đất nước ở trên vai"
Chúc đồng chí của em hoàn thành tốt mọi nhiệm vụ
#22/3/2022', CAST(N'2022-03-24T21:51:49.893' AS DateTime), CAST(N'2022-03-24T21:51:49.893' AS DateTime), NULL, N'5eb31b89-838b-43af-aa86-2c5c655762e4', 2, 1, N'Nguyễn Đức Phương')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'Liên tục giục HR về tiến độ CV: Khi bạn bắt đầu nộp đơn, hãy theo dõi trong vòng một tuần sau khi gửi đơn hồ sơ để xác nhận xem công ty đã nhận được CV của bạn hay chưa và hỏi xem họ có cần xem xét gì nữa không.', CAST(N'2022-03-24T21:15:14.017' AS DateTime), CAST(N'2022-03-24T21:15:14.017' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 3, 1, N'Kiều Đức Long')
GO
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'eafc0549-a9d3-4c7b-986d-049bc9cf2af6', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-16T00:25:21.580' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'a5c9bd5c-e78a-46d8-ba5c-1b891c05de10', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-16T15:27:15.303' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'1f3b87ae-918c-4354-a3be-1fc552fe9897', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24T20:59:35.973' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'1a676581-5854-47a5-90e7-2aed24aefeb0', N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-07T12:55:14.380' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'c000d0b4-8d6f-467f-be3a-686fcc7839df', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-16T00:25:21.580' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'afeca16d-b96e-4e71-9c7e-68d39d457295', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', CAST(N'2022-03-24T20:59:35.973' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'a0533476-eb5f-423c-b2a3-7b71937be71f', N'af37220f-9376-4b21-b05b-1cd66448399e', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'd0d9f5cf-3b8e-436d-8c14-7d1930e41ad7', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-16T00:25:21.580' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'6b0c11f6-9bc0-4ffc-a998-81841eed2dbf', N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-06T14:56:41.323' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'7bef7912-86f5-40bd-b2dc-865dcdd2bd64', N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-09T13:16:58.623' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'ea1fdf1a-adba-40e8-9302-87514176a0c8', N'af37220f-9376-4b21-b05b-1cd66448399e', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'435abf18-09b3-4719-9ced-8bf916de0b02', N'af37220f-9376-4b21-b05b-1cd66448399e', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'3f017875-ca38-46cc-a0d3-90f3564d6626', N'af37220f-9376-4b21-b05b-1cd66448399e', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'c126e3d1-9d17-4ad8-b59f-9244cd145366', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'fe4b024d-721a-48ab-9747-35e7ae2974eb', CAST(N'2022-03-24T20:59:35.973' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'37082427-5f22-4cfa-8b1a-956185e56815', N'af37220f-9376-4b21-b05b-1cd66448399e', N'fe109dff-cfb2-45ef-9c0c-defb7485dfa1', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'957910de-860a-4cd0-971c-a0dab55b4020', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-16T15:27:15.303' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'00914887-8c6c-4a14-83be-a0f6b30cb87e', N'af37220f-9376-4b21-b05b-1cd66448399e', N'2148a8b3-c05f-4fde-8745-d6778bd2c5ac', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'35b618cb-727e-418a-b94d-a7635d5a078c', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-16T15:27:15.303' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'825e355b-81e8-4307-b26a-aacc8576e725', N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-07T12:55:14.380' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'c79c3052-d353-4f17-b5b4-bc8913935e09', N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-06T14:56:41.323' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'a2e1e6b0-f74a-4a9b-bb8f-cb79c16df3d1', N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-09T13:16:58.623' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'2d47792d-924a-417a-a1c4-d12603e9c61f', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24T20:59:35.973' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'47f59e03-83c0-4fca-a1f4-d7f5606840d5', N'af37220f-9376-4b21-b05b-1cd66448399e', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'36371eab-2c59-4ed2-9c1b-e4ffdc4cbfe1', N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-07T12:55:14.380' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'4442b652-3e82-4aab-8bb9-e8c47edff3b2', N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-09T13:16:58.623' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'72c0f905-57c2-454c-bf2a-ef2a617f7dce', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-24T20:59:35.973' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'28406c9d-3182-4842-93c1-f24b5604db0d', N'5559dc0d-fcb6-45cd-8332-c704cb106dd4', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-07T12:53:26.603' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'f12130d2-a738-4b5b-bb93-fa2631223d60', N'af37220f-9376-4b21-b05b-1cd66448399e', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24T21:11:46.650' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'b05ed00c-ccfc-4451-953c-fbadf8c28775', N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-06T14:56:41.323' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'bfe21764-c6a7-437a-b549-fe61144ab244', N'5559dc0d-fcb6-45cd-8332-c704cb106dd4', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-07T12:53:26.593' AS DateTime), 1)
GO
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'd47eeaed-9340-4ec4-97bd-0b8980fa6a5f', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'e5a191ee-e951-424d-a783-0d315a5131ef', N'845e118b-4ec9-4111-98cf-78cbbdcf337f', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'07d7834b-569d-4ffb-8913-11ae18e22c20', N'9961b30b-a55c-4976-8501-ae308bf652f9', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'0decdc30-ebfc-4c72-b7d5-16723aae201e', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'9cb53874-10b9-461a-bd02-26b412a6bb69', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'a5313e94-22f0-4c44-83d4-41a094294043', N'46b69986-fa15-4375-8a09-542d46da256d', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'4acf3f3a-125b-4b2a-8187-42abf63b297d', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'a234f50a-6577-4522-8d80-42b3ca66a1a4', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'cdb70ac1-84ac-439b-b17f-4941936da9f6', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'5eb31b89-838b-43af-aa86-2c5c655762e4')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'f40de315-839c-47e7-9787-63d98f7387ae', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'ece3f869-109a-4cf7-a193-6804ffac4385', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'b55f553a-e117-4521-a0d1-6c697488881e', N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'cd4d9afe-e5a0-4a88-bd68-6f859e21a4ba', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'f9c7b2cd-db07-4c00-a47d-72def7f057ba', N'46b69986-fa15-4375-8a09-542d46da256d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'766bb9a7-aeb8-4ec4-bdf4-75e164e00aa8', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'5eb31b89-838b-43af-aa86-2c5c655762e4')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'0d79eac5-6abb-451f-b2c0-795ac10c2b02', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'5f50e33d-53c3-4af8-966b-823d8fb559f1', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'158cb9e3-b007-4822-91fc-861698ca85d1', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'41a27502-0c11-4990-a646-8f51b4da928e', N'eee13175-f1ac-4331-ad56-8be519ab6d4b', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'0486243e-54d6-41e3-a6cf-9666b43ffcf5', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'eb692016-6858-4757-a613-9a206b60e982', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'5188dc5b-d0d0-4b84-a57b-a555c1b1e565', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'fca79655-6d28-4d42-a60f-acc16e4ad328', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'18bff756-9c30-46cf-971d-b9b4a2dba54a', N'c06647f1-f281-485a-9e79-d058f510d79b', N'5eb31b89-838b-43af-aa86-2c5c655762e4')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'a2c91cb3-2932-4d98-b8bf-d5a6435b7516', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'65a05caf-faef-4310-8c49-e31df0dee3aa', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'5af4365c-f78a-49a4-86c5-e389cc85db7d', N'eee13175-f1ac-4331-ad56-8be519ab6d4b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'2157507d-ba39-4b7f-accb-e6c34bf67898', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'100ee3bf-b0dc-4748-b998-ea27c4d26d9c', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'7f640db6-68e0-4996-9679-efd18842b38a', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'fdb016f7-5d84-4775-a28a-f1ceb4564af1', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'8254b0fb-14dd-4693-b543-4b7e1408e697')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'64fa365a-cf47-4433-9bde-f5e24cfd2eac', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'881236ae-978f-4a97-91a2-fad6198ea805', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'5420b48f-343d-4a86-bab7-ffe755d54057', N'c06647f1-f281-485a-9e79-d058f510d79b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
GO
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'cvdung', N'123456', N'Chu Việt Dũng', N'dungviet@gmail.com', N'0966246311', N'Cầu Giấy - Hà Nội', N'Sản xuất', N'SA', CAST(N'2000-03-08T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'ndphuong', N'123456', N'Nguyễn Đức Phương', N'ndphuong@gmail.com', N'0949887410', N'Thạch Thất Hà Nội', N'Tổng Công Ty', N'DEV', CAST(N'2022-03-23T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'fe4b024d-721a-48ab-9747-35e7ae2974eb', N'lcanh', N'123456', N'Lê Châu Anh', N'lcanh@gmail.com', N'0966587623', N'Thái Nguyên', N'PR', N'Nhân viên', CAST(N'2022-03-23T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'dmthuy', N'123456', N'Dương Minh Thuý', N'dmthuy@gmail.com', N'0963111222', N'Thái Bình', N'Tiếp Tân', N'Nhân viên', CAST(N'2000-06-15T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', N'ttthanh', N'123456', N'Thiều Thu Thanh', N'ttthanh@gmail.com', N'0357126698', N'Bình Định', N'Nhân sự', N'Phó phòng', CAST(N'1993-04-16T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'a8e8909e-0288-49d0-ab93-5dffdbd1e017', N'nqsang', N'123456', N'Nguyễn Quang Sáng', N'nqsang@gmail.com', N'0949553687', N'Tuyên Quang', N'Bảo Vệ', N'Trưởng phòng', CAST(N'1989-06-16T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'kdlong', N'123456', N'Kiều Đức Long', N'longkieuck@gmail.com', N'0582124554', N'Hà Nội', N'Sản xuất', N'PM', CAST(N'2000-11-27T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'ltnam', N'123456', N'Lê Thế Nam', N'ltnam@gmail.com', N'0966246311', N'Tây Tựu - Hà Nội', N'Bảo Vệ', N'Lead', CAST(N'2000-03-29T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'd1e475bc-92b0-412b-a017-8c176794800c', N'ttthiep', N'123456', N'Trần Trung Thiệp', N'ttthiep@gmail.com', N'0588111479', N'Hưng Yên', N'Nhân Sự', N'Trưởng Phòng', CAST(N'2000-02-22T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'185e039d-2ce4-40ec-8408-9b7a765b5300', N'bmvan', N'123456', N'Bùi Thị Mỹ Văn', N'bmvan@gmail.com', N'0963312216', N'Cần Thơ', N'Khối Sản Xuất', N'DEV', CAST(N'2000-11-16T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', N'thtrang', N'123456', N'Trần Huyền Trang', N'qtht@gmail.com', N'0966246311', N'Hà Nội', N'Sản xuất', N'QC', CAST(N'1998-06-26T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'nvmanh', N'123456', N'Nguyễn Văn Mạnh', N'nvmanh@gmail.com', N'093123218', N'Hà Nội', N'Sản xuất', N'HR', CAST(N'2000-03-16T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'nvan', N'123456', N'Nguyễn Văn An', N'nvan@gmail.com', N'0966246311', N'Hà Nội', N'Nhân sự', N'PM', CAST(N'2000-06-29T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'6422b6aa-22f3-4c78-b402-c887d7beaad9', N'admin', N'admin', N'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'nvtoan', N'123456', N'Nguyễn Văn Toàn', N'nvtoan@gmail.com', N'0963325442', N'Thành Phố Vinh', N'Lễ Tân', N'Lễ Tân Trưởng', CAST(N'1995-12-16T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'2148a8b3-c05f-4fde-8745-d6778bd2c5ac', N'ntthu', N'123456', N'Nguyễn Thị Thu', N'ntthu', N'058666893', N'Sơn La', N'Kinh Doanh', N'Nhân Viên', CAST(N'1995-01-16T00:00:00.000' AS DateTime), NULL, 1)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'fe109dff-cfb2-45ef-9c0c-defb7485dfa1', N'ltdai', N'123456', N'Lương Thế Đại', N'ltdai@gmail.com', N'0963254652', N'Hà Nội', N'Hành Chính', N'Nhân Viên', CAST(N'2000-11-13T00:00:00.000' AS DateTime), NULL, 0)
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
