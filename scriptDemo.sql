USE [master]
GO
/****** Object:  Database [MANGXAHOI]    Script Date: 7/3/2022 8:25:13 AM ******/
CREATE DATABASE [MANGXAHOI]
Go
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MANGXAHOI].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MANGXAHOI] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MANGXAHOI] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MANGXAHOI] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MANGXAHOI] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MANGXAHOI] SET ARITHABORT OFF 
GO
ALTER DATABASE [MANGXAHOI] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [MANGXAHOI] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MANGXAHOI] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MANGXAHOI] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MANGXAHOI] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MANGXAHOI] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MANGXAHOI] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MANGXAHOI] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MANGXAHOI] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MANGXAHOI] SET  DISABLE_BROKER 
GO
ALTER DATABASE [MANGXAHOI] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MANGXAHOI] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MANGXAHOI] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MANGXAHOI] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MANGXAHOI] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MANGXAHOI] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [MANGXAHOI] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MANGXAHOI] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MANGXAHOI] SET  MULTI_USER 
GO
ALTER DATABASE [MANGXAHOI] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MANGXAHOI] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MANGXAHOI] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MANGXAHOI] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MANGXAHOI] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MANGXAHOI] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'MANGXAHOI', N'ON'
GO
ALTER DATABASE [MANGXAHOI] SET QUERY_STORE = OFF
GO
USE [MANGXAHOI]
GO
/****** Object:  Table [dbo].[ChatBox]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChatBox](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId1] [uniqueidentifier] NOT NULL,
	[UserId2] [uniqueidentifier] NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_ChatBox] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comment]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comment](
	[Id] [uniqueidentifier] NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](1000) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_Comment] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GroupPost]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GroupPost](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupName] [nvarchar](50) NULL,
	[Description] [nvarchar](1000) NULL,
	[MemberCount] [int] NULL,
	[Status] [nvarchar](50) NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_GroupPost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Image]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Image](
	[Id] [uniqueidentifier] NOT NULL,
	[CreatedDate] [date] NULL,
	[PostId] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_Image] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Message]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Message](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[ChatboxId] [uniqueidentifier] NOT NULL,
	[Content] [nvarchar](100) NULL,
	[Username] [varchar](50) NOT NULL,
	[IsLike] [bit] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Message] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Notify]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Notify](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[HasSeen] [bit] NULL,
	[Content] [nvarchar](1000) NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_Notify] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Post]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Post](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupId] [uniqueidentifier] NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[LikeCount] [int] NULL,
	[Content] [nvarchar](1000) NULL,
	[CommentCount] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_Post] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Roles]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleName] [varchar](50) NULL,
	[Description] [nvarchar](50) NULL,
	[IsAdmin] [bit] NOT NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Id] [uniqueidentifier] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[FullName] [nvarchar](50) NULL,
	[Email] [varchar](50) NULL,
	[PhoneNumber] [varchar](50) NULL,
	[Address] [nvarchar](1000) NULL,
	[Department] [nvarchar](50) NULL,
	[Position] [nvarchar](50) NULL,
	[DateOfBirth] [date] NULL,
	[Gender] [int] NULL,
	[CreatedDate] [date] NULL,
	[ModifiedDate] [date] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroupPost]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroupPost](
	[Id] [uniqueidentifier] NOT NULL,
	[GroupPostId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[IsAdminGroup] [bit] NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_UserGroupPost] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserLike]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserLike](
	[Id] [uniqueidentifier] NOT NULL,
	[PostId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_UserLike] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserRole]    Script Date: 7/3/2022 8:25:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRole](
	[Id] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[CreatedDate] [date] NULL,
 CONSTRAINT [PK_UserRole] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'bad2450f-cbc7-4a7a-9918-0365196aeec7', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'97cea6e3-5126-4f06-8f76-10a6b4486920', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'fd614b6a-bed7-4300-bb2d-32112cd64235', N'fe4b024d-721a-48ab-9747-35e7ae2974eb', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'9ece919c-b4af-4d41-8c8c-44504e6f8ebe', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'4ca682c9-0397-4304-9171-47c22858a347', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'75a43ec6-427b-4c44-bf13-60be59c272a5', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-22' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'44616d08-7e4a-48ab-a904-70e1b22fe272', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'49e9b19e-01fa-4375-8558-76bbaf57bc29', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'472b3320-7605-4544-9a39-76dd02817b7b', N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-21' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'f4a12716-3d9c-4492-b3e3-9370b40f1987', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'ac27918f-0ebc-440f-ba2b-b3836b50ec6c', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-16' AS Date))
INSERT [dbo].[ChatBox] ([Id], [UserId1], [UserId2], [CreatedDate]) VALUES (N'e93ba414-07a7-4dd1-a414-ea3d3cd4ebe0', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-24' AS Date))
GO
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'0b57ced0-951f-4b65-a46f-0963ac8fae37', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'Đẹp tuyệt vời', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'7a15ae5e-1315-41f4-8657-0ed9c3c3454b', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'xin chào mọi người', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'e7acb81d-6670-4430-a047-3a2e149b408d', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'Hôm nào chơi nhé anh!', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'f83a83c5-af93-41d9-8f59-4facf9f07fc0', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'Hay quá', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'38315e98-ddf9-4aef-869e-61430d30cda6', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'Thấy đồn ả rập bán dầu cho anh kia bằng nhân dân tệ à?', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'9cb55e2f-c1ed-4ed8-82c0-63c30e514c25', N'c06647f1-f281-485a-9e79-d058f510d79b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'chào anh nhé', CAST(N'2022-03-22' AS Date), CAST(N'2022-03-22' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'4843cb70-ed0b-406a-8cc6-63ec4af8aac2', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'Cảm ơn bạn nhiều! Quá ý nghĩa', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'e1784489-8a67-4bf8-b00a-73916c7b3dc5', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'Đẹp đôi quá bạn ơi', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'25c5d37e-e892-41b2-b30c-78cd1037a2f9', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'wowwww', CAST(N'2022-03-15' AS Date), CAST(N'2022-03-15' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'4b287c6f-9072-4df8-8fe2-7987e513c0e3', N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'oke nhe', CAST(N'2022-03-19' AS Date), CAST(N'2022-03-19' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'6f8be12e-942d-4ab1-bc81-875c886b23c2', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'Xinh đẹp tuyệt vời ạ', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'78da29e3-6ebd-488c-a2fb-89c7cb09478b', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'hello nha', CAST(N'2022-03-17' AS Date), CAST(N'2022-03-17' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'5fd922b6-1ef2-4a81-98d6-8b41d66b5350', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'David De Gea: "Thành thật mà nói cầu thủ mà tôi ngại đối đầu nhất trong sự nghiệp là Harry Maguire"', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'317adda2-a2d0-454f-8ea5-b263f709e9f3', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'wow', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'de7cd65d-2511-4697-812a-be7674ff868b', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'Tuyệt vời luôn em ơi! tối mai nhé', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'9741bc21-98db-4243-a54f-c2f86deec28f', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'Cảm ơn bạn! thật tuyệt vời!', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'4136a125-2469-49b3-b735-cbe490074f2c', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'Xinh đẹp tuyệt vời ạ', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Comment] ([Id], [PostId], [UserId], [Content], [CreatedDate], [ModifiedDate]) VALUES (N'7bdd11d7-4d82-4aeb-b853-d613a6faa826', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'Tuyệt vời lắm em!', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
GO
INSERT [dbo].[GroupPost] ([Id], [GroupName], [Description], [MemberCount], [Status], [CreatedDate], [ModifiedDate]) VALUES (N'af37220f-9376-4b21-b05b-1cd66448399e', N'AOE Việt Nam', N'AOE Việt Nam', 8, N'Hoạt động', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[GroupPost] ([Id], [GroupName], [Description], [MemberCount], [Status], [CreatedDate], [ModifiedDate]) VALUES (N'9bd35635-4623-4c4f-bcad-805c7370372b', N'Tuyển dụng', N'Tuyển dụng', 5, N'Hoạt động', CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[GroupPost] ([Id], [GroupName], [Description], [MemberCount], [Status], [CreatedDate], [ModifiedDate]) VALUES (N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'Phòng nhân sự', N'Phòng nhân sự', 3, N'Hoạt động', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[GroupPost] ([Id], [GroupName], [Description], [MemberCount], [Status], [CreatedDate], [ModifiedDate]) VALUES (N'47765bac-3fa2-4f15-aa90-b776e583196b', N'Fanclub', N'Fanclub', 3, N'Hoạt động', CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
GO
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'a610e223-1ba7-42c5-98b4-0d2d60263abb', CAST(N'2022-03-24' AS Date), N'b2639252-0eaa-454a-916d-3dfb1fd1121b')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'124c843c-2e41-44dc-995e-0d524ec56d0e', CAST(N'2022-03-24' AS Date), N'd3145b1d-5aea-4624-b028-abb3772611a5')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'35b94dc8-4fa7-4011-b934-31822356b188', CAST(N'2022-03-24' AS Date), N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'e9abe8fd-e3b1-4af2-bde6-3b110a62c6d8', CAST(N'2022-03-24' AS Date), N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'ef976483-ba21-4dd7-a1c9-40e9a1602bb7', CAST(N'2022-03-24' AS Date), N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'41464d5a-2539-4995-a842-4e2952f27160', CAST(N'2022-03-24' AS Date), N'46b69986-fa15-4375-8a09-542d46da256d')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'1a203d90-8aca-43cf-bc77-4f230ccf8fb4', CAST(N'2022-03-24' AS Date), N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'4c9f89d3-2fbe-4d62-a2e8-50b7da12c872', CAST(N'2022-03-24' AS Date), N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'9aae5133-73d5-4358-b186-58c40cfb5d67', CAST(N'2022-03-24' AS Date), N'89b79f88-621a-46dc-acee-293f36b5dd91')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'0ca966c7-a519-43d6-898c-82d615892f25', CAST(N'2022-03-24' AS Date), N'be9959b8-9f52-452b-8a66-33a6e9f03fc3')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'e479de07-bacb-4fa1-ac51-8fe8a01cb1b6', CAST(N'2022-03-24' AS Date), N'845e118b-4ec9-4111-98cf-78cbbdcf337f')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'3a09c12a-5874-4148-b66d-9291522a67f1', CAST(N'2022-03-24' AS Date), N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'760b5f8c-e3ce-4a4a-b434-9b9c6ee2d8b8', CAST(N'2022-03-24' AS Date), N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'bd0aa805-4c77-43f9-aa07-a408afa05cfb', CAST(N'2022-03-24' AS Date), N'90713450-95a0-4cfe-a375-d7ba6da10186')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'febe003c-b37b-4e06-b128-a55697f16d6c', CAST(N'2022-03-24' AS Date), N'65f6bf3f-6298-4496-a1bb-b3ed55332de7')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'13d9b5e4-be23-4d80-8231-ba958e417cfa', CAST(N'2022-03-24' AS Date), N'775b7daa-5b1e-49ec-ba06-15a6199246ea')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'd164e495-ac32-4861-a3d0-c2a6bdff1699', CAST(N'2022-03-24' AS Date), N'4068287b-402b-4a42-8453-302755b85ab2')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'e199dbfd-c067-471a-8e91-c4589876e84a', CAST(N'2022-03-24' AS Date), N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169')
INSERT [dbo].[Image] ([Id], [CreatedDate], [PostId]) VALUES (N'7ebfc544-d7c9-46a1-af25-e75495037f81', CAST(N'2022-03-24' AS Date), N'9961b30b-a55c-4976-8501-ae308bf652f9')
GO
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'c90b647b-0f54-4ee3-95d1-062314bbb2a0', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'f4a12716-3d9c-4492-b3e3-9370b40f1987', N'ookk', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-21' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'03ac4319-20da-4893-8130-094480bf5c7a', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'oke nha', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-23' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'64638c09-8e18-4c5e-8408-1203688703b8', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b', N'hi a', N'Nguy?n Van An', 0, CAST(N'2022-03-22' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'372b2364-c4d9-463a-bc7e-1e7d9e61eecb', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'helo', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'9b2123bb-d19d-4907-b9d3-259248ca7a0a', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'chao nha', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-21' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'368ccc22-ef77-406f-b45a-33684c18fef1', N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'Chào', N'Nguy?n Ð?c Phuong', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'31074246-4c8c-4cdc-a02f-3cc6e13015b5', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'Chào bạn!', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'bee11b8a-47f5-484c-82d9-421149eb1ad5', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'Chào anh Mạnh ạ', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-17' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'353d0517-945d-43d4-b67c-4d3dd8dadb20', N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'f4a12716-3d9c-4492-b3e3-9370b40f1987', N'Chào Longg', N'Lê Th? Nam', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'273c1398-9cdf-405f-ae4a-4e9531f8b919', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'Chào Long!', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-25' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'51ac0849-dec1-4746-9780-4f691f52eb60', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'49e9b19e-01fa-4375-8558-76bbaf57bc29', N'Chào Long nhá!', N'Duong Minh Thuý', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'b2a1eec3-a384-4ffb-a323-54ba85cbdd54', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'hi', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-23' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'555487ae-f015-4d41-8d32-565e8808bd3b', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b', N'xin chào', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'278380de-d582-4a66-a864-5968019e6422', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'xin chào Long', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-17' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'dd53954e-e6c3-4aed-895c-5b5bf2c7574c', N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'được', N'Nguy?n Ð?c Phuong', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'2c6b9058-f020-4a39-a964-64c791fdf245', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'f4a12716-3d9c-4492-b3e3-9370b40f1987', N'kkkk', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-21' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'2de827f6-1b43-4d4c-bfdd-664ff1953316', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'isLike', N'Ki?u Ð?c Long', 1, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'142d3bb8-63f8-454b-9630-6a57b2df2246', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'ac27918f-0ebc-440f-ba2b-b3836b50ec6c', N'dc', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-21' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'45c2c80d-9798-4159-803d-79212f2ce9b7', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'8cefea88-dc4e-4ce1-bae3-0e0d6d13ae4b', N'chào bạn', N'Nguy?n Van An', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'83ae8c1a-054a-4451-b37c-862ca4e86b57', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'Sáng mai ăn bánh dò nhé ', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'7bcddd59-70dc-4a78-b11f-95b4695d0cdf', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'4ca682c9-0397-4304-9171-47c22858a347', N'Cho anh hỏi chút', N'Nguy?n Van Toàn', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'0903f841-6503-490c-b412-9ac6329a5d59', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'4ca682c9-0397-4304-9171-47c22858a347', N'Chào Long a là Toàn', N'Nguy?n Van Toàn', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'fe85233f-0be6-47fa-a2d5-a0a894607129', N'fe4b024d-721a-48ab-9747-35e7ae2974eb', N'fd614b6a-bed7-4300-bb2d-32112cd64235', N'Chào Long chị là Châu Anh', N'Lê Châu Anh', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'1e8d6fd8-d99c-4653-b885-ab075b94e736', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'Chào Long!', N'Chu Vi?t Dung', 0, CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'45923e24-a9d5-4d96-84f8-b297abe8c65d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'hii', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-23' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'476ec060-256f-445c-aa3b-bfadbc0de810', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'4ca682c9-0397-4304-9171-47c22858a347', N'isLike', N'Nguy?n Van Toàn', 1, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'96556fbe-7e5a-4b34-a899-c4696519db53', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'mai ăn sáng không?', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'97f3396e-5865-4732-a878-c4a4ddb758f1', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'44616d08-7e4a-48ab-a904-70e1b22fe272', N'hi Long', N'Nguy?n Van An', 0, CAST(N'2022-03-20' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'e939e19e-01a1-4b14-8864-c933e36a5381', N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'oke luôn', N'Nguy?n Ð?c Phuong', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'5af53796-6713-4e8b-bc92-e3be1033b36a', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'4445533e-b494-4e3d-8a35-8152f8035cd2', N'Chào Dũng!', N'Chu Vi?t Dung', 0, CAST(N'2022-03-25' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'139ce670-43bb-42b3-855f-e50d3e5f8ce7', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'44616d08-7e4a-48ab-a904-70e1b22fe272', N'Long ơi', N'Nguy?n Van An', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'6fba6561-8180-44eb-b013-e94fa6684a9d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'Có chuyện gì vậy anh', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-17' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'5c9ee3f0-2b49-406c-b4b2-ed825bb89c2b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'hi a', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-22' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'04bb8e93-9f7a-402e-9afc-ee6918a23dcf', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'0ki', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-17' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'cb86cd7d-8154-47a8-a1b4-f3e89f4cdb56', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'baiii', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'eb48ead2-446f-4d79-9398-f69dfc0461a9', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'oke nha', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-23' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'fcb118e4-7cf4-405b-8def-fc845b8879b0', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'9b8aeb3e-f283-4e31-afac-a67950f88a6c', N'hello e', N'Nguy?n Van M?nh', 0, CAST(N'2022-03-23' AS Date))
INSERT [dbo].[Message] ([Id], [UserId], [ChatboxId], [Content], [Username], [IsLike], [CreatedDate]) VALUES (N'5d144615-c13f-40e5-8839-fe7e47842a7f', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'52b896aa-7b6b-4ccb-816e-7e204836be94', N'Chào lại', N'Ki?u Ð?c Long', 0, CAST(N'2022-03-24' AS Date))
GO
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'6501cb0c-f9c8-4d63-9e20-0217aff266f1', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 1, N'Kiều Đức Long đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'279c7eb7-7d3c-4ae8-872e-040ad3676d9b', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 1, N'Nguyễn Văn Mạnh đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'9c1fbe6f-d12b-4497-8d4d-128d27930d33', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'148713e6-254d-436a-92bf-13e2b955c766', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Lê Thế Nam đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'8f68ea91-43b9-4ee9-9413-153bb7962f30', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn An đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'2e625c21-8fb8-4586-bb31-1774191ecd47', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'f6e61826-1b78-4369-9423-1fc23cfc9638', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'004905c8-b5b2-4a3a-b9b7-37951f898d2d', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 1, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'd8881d79-b829-437c-94de-39638ffe3966', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 1, N'Dương Minh Thuý đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'44692a2a-4c82-435c-892d-4283dc7535a3', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'779819e3-473c-47aa-b10d-4ce1df5a894e', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'8ea11222-e931-4617-888d-4faadeb10ee0', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn An đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'881d862d-5d93-457f-9c45-517668da04e7', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn An đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'23115ff3-b070-4720-966f-57a94a1f9c87', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 1, N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'400ae5d5-1ee1-43b3-be35-5fa814674ad0', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Nguyễn Văn Mạnh đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'467920c7-02d1-45b0-bcf9-6ac66ea7a178', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 1, N'Kiều Đức Long đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'ab8115c2-3675-4bb6-a91c-7711a928d1bb', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'1559b6ab-6422-4ae0-96cc-8611b1b140d3', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Lê Thế Nam đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'6b42f1fd-f465-4594-8ac3-882397c64071', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, N'Dương Minh Thuý đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'a57dc14a-a24a-4b3b-92e2-931d0a6052fe', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Nguyễn Văn Mạnh đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'381a69c4-a16a-4c28-8377-96e63606042c', N'5eb31b89-838b-43af-aa86-2c5c655762e4', 0, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'c5a8cb03-1cfc-49fa-b2ca-9b167d01409f', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'f77560c4-f5d4-4226-9998-9c8598b749ea', N'5eb31b89-838b-43af-aa86-2c5c655762e4', 0, N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'2106f335-6d13-4159-bea3-b361b1e7d9ef', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'898df97b-c1fc-4e5b-995f-bec7d56e6154', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Nguyễn Văn Mạnh đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'9d808586-46e9-4f00-b067-bf0e051f3dc1', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Nguyễn Đức Phương đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'ce1e3813-dc1e-47aa-9ff8-c1636a67798d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Nguyễn Đức Phương đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'97eed3a5-3729-47b3-9e4a-c9ce28467779', N'5eb31b89-838b-43af-aa86-2c5c655762e4', 0, N'Dương Minh Thuý đã bình luận bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'5e2f70a3-0851-4686-9034-d3473f56c358', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Đức Phương đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'3b15ef39-9541-4bb0-8b44-e788f9a65f3c', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, N'Dương Minh Thuý đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Notify] ([Id], [UserId], [HasSeen], [Content], [CreatedDate]) VALUES (N'f169b9d9-97ab-4a54-8815-ecfcadb753b8', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Lê Thế Nam đã thích bài viết của bạn!', CAST(N'2022-07-02' AS Date))
GO
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'775b7daa-5b1e-49ec-ba06-15a6199246ea', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Họ chắc chắn không có Mercedes G63 tặng bạn nhưng sẽ fix những con bug khó nhằn do bạn tạo ra. Tag ngay những người anh em "nương tựa" của mình vào đây', 0, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', NULL, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 4, N'WOW
Hôm nọ nghe nói Thái Tử không nhận điện của Ngài Tổng Thống vẫn tưởng đó là chuyện tào lao.
Kịch càng ngày càng hay.
Và những phần hay nhất vẫn còn ở phía trước.', 2, CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'89b79f88-621a-46dc-acee-293f36b5dd91', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, N'Công bố kết quả', 0, CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'4068287b-402b-4a42-8453-302755b85ab2', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'MISA Software bật chế độ truy tìm Automation Tester/QC.
Chi tiết xem tại:', 0, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'GIÁ XĂNG CÓ THỂ ĐẠT ĐỈNH 40.000Đ/LÍT TRONG THỜI GIAN TỚI

Có thể bạn chưa biết, tính từ khi quả tên lửa đầu tiên của Nga bay sang đất Ukraine đến nay thì giá dầu toàn cầu đã tăng 40% và có lúc là 70% so với cùng kỳ.
', 1, CAST(N'2022-03-15' AS Date), CAST(N'2022-03-15' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'b2639252-0eaa-454a-916d-3dfb1fd1121b', NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 3, N'[Góc remind] TRUYỀN THÔNG SAU HỘI NGHỊ LÃNH ĐẠO

Thời gian: 15h00 ngày 07/03/2022
Hình thức: Online qua Zoom Join Zoom Meeting: https://mily.vn/vBtBzMS

Meeting ID: 686 868 6822
Passcode: 1234 

Hình nền chung: https://mily.vn/vBtBITP

ACE hãy tham gia link trước 15 phút để ổn định và chương trình có thể bắt đầu đúng giờ nhé. ', 1, CAST(N'2022-03-15' AS Date), CAST(N'2022-03-15' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'46b69986-fa15-4375-8a09-542d46da256d', NULL, N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 2, N'Cùng chị em MISA unbox quà 8/3 của các văn phòng trên toàn quốc nha!!', 0, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 4, N'- Theo kinh nghiệm của game thủ thì nên xây, bo ruộng so với nhiều điều kiện BN, BG với khoảng cách = 1 BE, mục đích là để khi bị địch chém vào thì mình bo vừa 1 cái BE

- Bố trí nhà cửa ruộng vườn cũng rất là quan trọng vì mình bố trí hợp lý thì năng suất làm việc cũng như sự nhanh nhẹn của nông dân được đẩy lên mức cao nhất giúp ta không bị mất thao tác nhiều. Thế nhà đẹp cũng giúp đỡ bạn dễ bo nhà và ít tốn kém tài nguyên hơn.', 3, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'845e118b-4ec9-4111-98cf-78cbbdcf337f', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, N'Kế hoạch tuyển dụng FE dev tháng 4', 0, CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'd3145b1d-5aea-4624-b028-abb3772611a5', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Mặc dù đây là một trong những nguyên tắc cơ bản nhưng rất nhiều ứng viên vẫn mắc phải điều này. Ứng viên dùng email không chuyên nghiệp. Thật “ngớ ngẩn” khi bạn làm CV thật đẹp đẽ, hoàn hảo nhưng lại gửi bằng một địa chỉ email kiểu như “hetyeuthichiatay123@gmail.com”. Đây là lỗi sai kinh điển, không thể chấp nhận được đối với người đi xin việc. Nhà tuyển dụng sẽ bỏ qua luôn và cho bạn vào danh sách đen vì lỗi không chuyên nghiệp, sai từ bước cơ bản. Tốt nhất, hãy sử dụng địa chỉ email mang tên bạn đi kèm nghề nghiệp, ví dụ như “Tranthuhuongmarketing@gmail.com”. Email chuyên nghiệp thể hiện bạn là người nghiêm túc với nghề nghiệp, cẩn thận trong giao tiếp và quan trọng nhất là cho nhà tuyển dụng thấy được bạn thực sự tôn trọng họ', 0, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'9961b30b-a55c-4976-8501-ae308bf652f9', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 1, N'Kết quả thực hiện theo mục tiêu của dự án bảo trì tháng 1/2022
PS: Từ tháng 2/2022 mục tiêu về lỗi chương trình còn tồn sẽ có thay đổi: Mục tiêu <=5 lỗi/sản phẩm', 0, CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'65f6bf3f-6298-4496-a1bb-b3ed55332de7', N'af37220f-9376-4b21-b05b-1cd66448399e', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bo nhà trong Đế Chế AOE là việc rất quan trọng, giúp cho người chơi không bị đối thủ móc máy, để có thời gian phát triển và xin quân để chống trả. Nếu bạn là người chơi lâu năm thì chắc cũng không còn lạ gì nữa, còn đối với người mới chơi thì việc bo sao cho hợp lý và thực sự hiệu quả thì quả thật rất là khó, bài viết dưới đây Taimienphi.vn sẽ hướng dẫn bạn cách bo nhà trong Đế Chế AOE.', 0, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'9ba037ae-55cd-4460-98f0-bbdb1bcb884f', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'• Ăn trưa lại vị trí ngồi làm việc
• Gửi xe dưới tầng hầm + bãi gửi xe đằng sau tòa nhà FPT theo đúng danh sách phân chia HCTH sẽ gửi trong ngày mai (ACE vui lòng check email của Ntha3@fresher.misa.com.vn)
• Địa điểm làm việc (theo ảnh gửi đính kèm)', 0, CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', NULL, N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 2, N'Cùng chị em MISA unbox quà 8/3 của các văn phòng trên toàn quốc nha!!
Mỗi Văn phòng/ trung tâm của MISA lại tổ chức ngày Quốc tế phụ nữ theo một màu sắc riêng cùng với đó là những món quà vật chất & tinh thần vô cùng thú vị. Tuy nhiên, dù ở bất cứ đâu - vị trí nào thì mỗi bóng hồng MISA vẫn luôn tỏa sáng đúng không nào!', 3, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', NULL, N'5e01483d-d93c-45a2-a04b-75d65866cc78', 3, N'Chiều 15/3, KSX đã long trọng tổ chức lễ giao nhiệm vụ cho cán bộ để đáp ứng được nhu cầu phát triển sản phẩm ngày càng cao của công ty. Tại buổi lễ,  ông Nguyễn Ngọc Anh được giao nhiệm vụ - Quản lý thi công Dự án ASP Khối dự án Tài chính Doanh nghiệp.', 1, CAST(N'2022-03-16' AS Date), CAST(N'2022-03-16' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'c06647f1-f281-485a-9e79-d058f510d79b', NULL, N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 2, N'Xin chào mọi người mình là Mạnh đây!', 1, CAST(N'2022-03-22' AS Date), CAST(N'2022-03-22' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'90713450-95a0-4cfe-a375-d7ba6da10186', NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 4, N'37 TUỔI 35 NGÀY LÀ SỐ TUỔI HIỆN TẠI CỦA ANH

Với ba bàn tối qua, Ronaldo chạm mốc 807 bàn trong 1.146 trận đấu chính thức cho CLB lẫn ĐTQG. Đưa anh trở thành cầu thủ ghi nhiều bàn nhất trong các trận chính thức của FIFA. Ở độ tuổi 37 cách anh thi đấu như cười vào mặt cái xương sống nhức mỏi của những thanh niên tuổi đôi mươi.

Thật sự trận đấu đêm qua của anh quá cháy. Cú sút ngoài vòng cấm của anh làm tôi nhớ đến những cú sút xé gió của tôi. Những cú sút đưa quả bóng nhựa bay ra ngoài khung thành dưới cái nắng hè oi ả. Nếu không phải vì cuộc sống nghiệt ngã tôi đã theo đuổi nghiệp quần đùi áo số chứ không phải ngồi đây.', 4, CAST(N'2022-03-15' AS Date), CAST(N'2022-03-15' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', NULL, N'5eb31b89-838b-43af-aa86-2c5c655762e4', 2, N'"Anh áo xanh là anh bộ đội
Tình trong ngực và đất nước ở trên vai"
Chúc đồng chí của em hoàn thành tốt mọi nhiệm vụ
#22/3/2022', 1, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
INSERT [dbo].[Post] ([Id], [GroupId], [UserId], [LikeCount], [Content], [CommentCount], [CreatedDate], [ModifiedDate]) VALUES (N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 3, N'Liên tục giục HR về tiến độ CV: Khi bạn bắt đầu nộp đơn, hãy theo dõi trong vòng một tuần sau khi gửi đơn hồ sơ để xác nhận xem công ty đã nhận được CV của bạn hay chưa và hỏi xem họ có cần xem xét gì nữa không.', 1, CAST(N'2022-03-24' AS Date), CAST(N'2022-03-24' AS Date))
GO
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [IsAdmin], [CreatedDate], [ModifiedDate]) VALUES (N'2e0f51b9-366c-4605-bbc6-d80ed4518cb5', N'Qu?n tr? viên', N'Quản trị viên', 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[Roles] ([Id], [RoleName], [Description], [IsAdmin], [CreatedDate], [ModifiedDate]) VALUES (N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', N'Thành viên', N'Thành viên', 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
GO
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'cvdung', N'123456', N'Chu Việt Dũng', N'dungviet@gmail.com', N'0966246311', N'Cầu Giấy - Hà Nội', N'Sản xuất', N'SA', CAST(N'2000-03-08' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'ndphuong', N'123456', N'Nguyễn Đức Phương', N'ndphuong@gmail.com', N'0949887410', N'Thạch Thất Hà Nội', N'Tổng Công Ty', N'DEV', CAST(N'2022-03-23' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'fe4b024d-721a-48ab-9747-35e7ae2974eb', N'lcanh', N'123456', N'Lê Châu Anh', N'lcanh@gmail.com', N'0966587623', N'Thái Nguyên', N'PR', N'Nhân viên', CAST(N'2022-03-23' AS Date), 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'dmthuy', N'123456', N'Dương Minh Thuý', N'dmthuy@gmail.com', N'0963111222', N'Thái Bình', N'Tiếp Tân', N'Nhân viên', CAST(N'2000-06-15' AS Date), 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', N'ttthanh', N'123456', N'Thiều Thu Thanh', N'ttthanh@gmail.com', N'0357126698', N'Bình Định', N'Nhân sự', N'Phó phòng', CAST(N'1993-04-16' AS Date), 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'a8e8909e-0288-49d0-ab93-5dffdbd1e017', N'nqsang', N'123456', N'Nguyễn Quang Sáng', N'nqsang@gmail.com', N'0949553687', N'Tuyên Quang', N'Bảo Vệ', N'Trưởng phòng', CAST(N'1989-06-16' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'kdlong', N'123456', N'Kiều Đức Long', N'longkieuck@gmail.com', N'0582124554', N'Hà Nội', N'Sản xuất', N'PM', CAST(N'2000-11-27' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'ltnam', N'123456', N'Lê Thế Nam', N'ltnam@gmail.com', N'0966246311', N'Tây Tựu - Hà Nội', N'Bảo Vệ', N'Lead', CAST(N'2000-03-29' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'd1e475bc-92b0-412b-a017-8c176794800c', N'ttthiep', N'123456', N'Trần Trung Thiệp', N'ttthiep@gmail.com', N'0588111479', N'Hưng Yên', N'Nhân Sự', N'Trưởng Phòng', CAST(N'2000-02-22' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'185e039d-2ce4-40ec-8408-9b7a765b5300', N'bmvan', N'123456', N'Bùi Thị Mỹ Văn', N'bmvan@gmail.com', N'0963312216', N'Cần Thơ', N'Khối Sản Xuất', N'DEV', CAST(N'2000-11-16' AS Date), 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', N'thtrang', N'123456', N'Trần Huyền Trang', N'qtht@gmail.com', N'0966246311', N'Hà Nội', N'Sản xuất', N'QC', CAST(N'1998-06-26' AS Date), 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'nvmanh', N'123456', N'Nguyễn Văn Mạnh', N'nvmanh@gmail.com', N'093123218', N'Hà Nội', N'Sản xuất', N'HR', CAST(N'2000-03-16' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'nvan', N'123456', N'Nguyễn Văn An', N'nvan@gmail.com', N'0966246311', N'Hà Nội', N'Nhân sự', N'PM', CAST(N'2000-06-29' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'6422b6aa-22f3-4c78-b402-c887d7beaad9', N'admin', N'admin', N'ADMIN', NULL, NULL, NULL, NULL, NULL, NULL, NULL, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'nvtoan', N'123456', N'Nguyễn Văn Toàn', N'nvtoan@gmail.com', N'0963325442', N'Thành Phố Vinh', N'Lễ Tân', N'Lễ Tân Trưởng', CAST(N'1995-12-16' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'2148a8b3-c05f-4fde-8745-d6778bd2c5ac', N'ntthu', N'123456', N'Nguyễn Thị Thu', N'ntthu', N'058666893', N'Sơn La', N'Kinh Doanh', N'Nhân Viên', CAST(N'1995-01-16' AS Date), 1, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
INSERT [dbo].[User] ([Id], [Username], [Password], [FullName], [Email], [PhoneNumber], [Address], [Department], [Position], [DateOfBirth], [Gender], [CreatedDate], [ModifiedDate]) VALUES (N'fe109dff-cfb2-45ef-9c0c-defb7485dfa1', N'ltdai', N'123456', N'Lương Thế Đại', N'ltdai@gmail.com', N'0963254652', N'Hà Nội', N'Hành Chính', N'Nhân Viên', CAST(N'2000-11-13' AS Date), 0, CAST(N'2022-07-02' AS Date), CAST(N'2022-07-02' AS Date))
GO
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'eafc0549-a9d3-4c7b-986d-049bc9cf2af6', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'a5c9bd5c-e78a-46d8-ba5c-1b891c05de10', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'1f3b87ae-918c-4354-a3be-1fc552fe9897', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'8254b0fb-14dd-4693-b543-4b7e1408e697', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'c000d0b4-8d6f-467f-be3a-686fcc7839df', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'afeca16d-b96e-4e71-9c7e-68d39d457295', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'a0533476-eb5f-423c-b2a3-7b71937be71f', N'af37220f-9376-4b21-b05b-1cd66448399e', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'd0d9f5cf-3b8e-436d-8c14-7d1930e41ad7', N'782228b2-9422-4ae1-bee4-82c0f10c8298', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'ea1fdf1a-adba-40e8-9302-87514176a0c8', N'af37220f-9376-4b21-b05b-1cd66448399e', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'435abf18-09b3-4719-9ced-8bf916de0b02', N'af37220f-9376-4b21-b05b-1cd66448399e', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'3f017875-ca38-46cc-a0d3-90f3564d6626', N'af37220f-9376-4b21-b05b-1cd66448399e', N'8254b0fb-14dd-4693-b543-4b7e1408e697', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'c126e3d1-9d17-4ad8-b59f-9244cd145366', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'fe4b024d-721a-48ab-9747-35e7ae2974eb', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'37082427-5f22-4cfa-8b1a-956185e56815', N'af37220f-9376-4b21-b05b-1cd66448399e', N'fe109dff-cfb2-45ef-9c0c-defb7485dfa1', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'957910de-860a-4cd0-971c-a0dab55b4020', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', 1, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'00914887-8c6c-4a14-83be-a0f6b30cb87e', N'af37220f-9376-4b21-b05b-1cd66448399e', N'2148a8b3-c05f-4fde-8745-d6778bd2c5ac', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'35b618cb-727e-418a-b94d-a7635d5a078c', N'47765bac-3fa2-4f15-aa90-b776e583196b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, CAST(N'2022-03-16' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'2d47792d-924a-417a-a1c4-d12603e9c61f', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 1, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'47f59e03-83c0-4fca-a1f4-d7f5606840d5', N'af37220f-9376-4b21-b05b-1cd66448399e', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'72c0f905-57c2-454c-bf2a-ef2a617f7dce', N'9bd35635-4623-4c4f-bcad-805c7370372b', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', 0, CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserGroupPost] ([Id], [GroupPostId], [UserId], [IsAdminGroup], [CreatedDate]) VALUES (N'f12130d2-a738-4b5b-bb93-fa2631223d60', N'af37220f-9376-4b21-b05b-1cd66448399e', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, CAST(N'2022-03-24' AS Date))
GO
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'd47eeaed-9340-4ec4-97bd-0b8980fa6a5f', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'e5a191ee-e951-424d-a783-0d315a5131ef', N'845e118b-4ec9-4111-98cf-78cbbdcf337f', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'07d7834b-569d-4ffb-8913-11ae18e22c20', N'9961b30b-a55c-4976-8501-ae308bf652f9', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'0decdc30-ebfc-4c72-b7d5-16723aae201e', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'9cb53874-10b9-461a-bd02-26b412a6bb69', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'a5313e94-22f0-4c44-83d4-41a094294043', N'46b69986-fa15-4375-8a09-542d46da256d', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'4acf3f3a-125b-4b2a-8187-42abf63b297d', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'a234f50a-6577-4522-8d80-42b3ca66a1a4', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'cdb70ac1-84ac-439b-b17f-4941936da9f6', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'5eb31b89-838b-43af-aa86-2c5c655762e4', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'f40de315-839c-47e7-9787-63d98f7387ae', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'ece3f869-109a-4cf7-a193-6804ffac4385', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'b55f553a-e117-4521-a0d1-6c697488881e', N'be9959b8-9f52-452b-8a66-33a6e9f03fc3', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'cd4d9afe-e5a0-4a88-bd68-6f859e21a4ba', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'f9c7b2cd-db07-4c00-a47d-72def7f057ba', N'46b69986-fa15-4375-8a09-542d46da256d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'766bb9a7-aeb8-4ec4-bdf4-75e164e00aa8', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'5eb31b89-838b-43af-aa86-2c5c655762e4', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'0d79eac5-6abb-451f-b2c0-795ac10c2b02', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'5f50e33d-53c3-4af8-966b-823d8fb559f1', N'b2639252-0eaa-454a-916d-3dfb1fd1121b', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'158cb9e3-b007-4822-91fc-861698ca85d1', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'0486243e-54d6-41e3-a6cf-9666b43ffcf5', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'eb692016-6858-4757-a613-9a206b60e982', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'5188dc5b-d0d0-4b84-a57b-a555c1b1e565', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'fca79655-6d28-4d42-a60f-acc16e4ad328', N'90713450-95a0-4cfe-a375-d7ba6da10186', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'18bff756-9c30-46cf-971d-b9b4a2dba54a', N'c06647f1-f281-485a-9e79-d058f510d79b', N'5eb31b89-838b-43af-aa86-2c5c655762e4', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'a2c91cb3-2932-4d98-b8bf-d5a6435b7516', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'65a05caf-faef-4310-8c49-e31df0dee3aa', N'f94a5b52-7a16-44a3-89a6-25fb2c3d452d', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'2157507d-ba39-4b7f-accb-e6c34bf67898', N'3a999015-8aa7-4dbe-ae2c-ff8af1ef3142', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'100ee3bf-b0dc-4748-b998-ea27c4d26d9c', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'7f640db6-68e0-4996-9679-efd18842b38a', N'fb4d8a75-8b89-4fcf-b40f-c20bc183a454', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'fdb016f7-5d84-4775-a28a-f1ceb4564af1', N'35e76cd3-06d1-4b24-9ea8-c1636ad8cd51', N'8254b0fb-14dd-4693-b543-4b7e1408e697', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'64fa365a-cf47-4433-9bde-f5e24cfd2eac', N'd382ed8a-1ee8-40d6-8c0e-ee845b0e0c45', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'881236ae-978f-4a97-91a2-fad6198ea805', N'b0ef3ab2-76fa-4e41-97b8-60cf18bdf169', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-24' AS Date))
INSERT [dbo].[UserLike] ([Id], [PostId], [UserId], [CreatedDate]) VALUES (N'5420b48f-343d-4a86-bab7-ffe755d54057', N'c06647f1-f281-485a-9e79-d058f510d79b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-24' AS Date))
GO
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'cf46c452-0edd-4669-97cc-094399e70787', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'26c42c0b-4e26-484c-b3eb-1147d13cf551', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'25a3adff-4036-4e34-9b6e-150dd61314eb', N'fe109dff-cfb2-45ef-9c0c-defb7485dfa1', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'a8d38d4b-6573-433e-bab5-29f6db348d20', N'8254b0fb-14dd-4693-b543-4b7e1408e697', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'd9af3c01-0eb6-4783-af66-3e0b1e12734b', N'fe4b024d-721a-48ab-9747-35e7ae2974eb', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'67845ed6-d8dd-4916-97f5-4e31b865b5b2', N'b69f0723-24c7-4628-9d6d-5bd1439d6bfe', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'0fbbb383-3dad-4ca6-bf0e-5adb33b42636', N'fcae27b8-4117-4a6b-a9b1-ca708c02069b', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'c21c5cc7-5281-4169-8922-6a520c4f0490', N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'1e845a0c-cb08-4b49-807f-8e1c1d4fed5a', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'176f1399-aa9d-401b-a648-93df790ac58f', N'2148a8b3-c05f-4fde-8745-d6778bd2c5ac', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'9bc7ace3-2208-48ba-9540-9a0c7f6a229b', N'6422b6aa-22f3-4c78-b402-c887d7beaad9', N'2e0f51b9-366c-4605-bbc6-d80ed4518cb5', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'd771fa0f-5f1e-4481-95d4-9fb1807d5404', N'a8e8909e-0288-49d0-ab93-5dffdbd1e017', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'199bedf3-f307-4e77-bace-a57b6e0f0451', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'08c7b274-8689-45dc-99a6-c694966ade6d', N'd1e475bc-92b0-412b-a017-8c176794800c', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'a816a6c5-71c4-42f1-94f3-d54137a1ec8c', N'185e039d-2ce4-40ec-8408-9b7a765b5300', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'0f7d4d6e-fb86-4239-acc6-e46cfb38c495', N'13d2f693-2e47-43d3-97b2-c38a5ad6365e', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
INSERT [dbo].[UserRole] ([Id], [UserId], [RoleId], [CreatedDate]) VALUES (N'006bb6f6-0b05-441f-9359-f63cdf3b2a19', N'5eb31b89-838b-43af-aa86-2c5c655762e4', N'cc6f94fd-990f-4ec6-b2f0-e90026c3470e', CAST(N'2022-07-02' AS Date))
GO
ALTER TABLE [dbo].[ChatBox]  WITH CHECK ADD  CONSTRAINT [FK_ChatBox_User] FOREIGN KEY([UserId1])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ChatBox] CHECK CONSTRAINT [FK_ChatBox_User]
GO
ALTER TABLE [dbo].[ChatBox]  WITH CHECK ADD  CONSTRAINT [FK_ChatBox_User1] FOREIGN KEY([UserId2])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[ChatBox] CHECK CONSTRAINT [FK_ChatBox_User1]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_Post]
GO
ALTER TABLE [dbo].[Comment]  WITH CHECK ADD  CONSTRAINT [FK_Comment_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Comment] CHECK CONSTRAINT [FK_Comment_User]
GO
ALTER TABLE [dbo].[Image]  WITH CHECK ADD  CONSTRAINT [FK_Image_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[Image] CHECK CONSTRAINT [FK_Image_Post]
GO
ALTER TABLE [dbo].[Message]  WITH CHECK ADD  CONSTRAINT [FK_Message_ChatBox] FOREIGN KEY([ChatboxId])
REFERENCES [dbo].[ChatBox] ([Id])
GO
ALTER TABLE [dbo].[Message] CHECK CONSTRAINT [FK_Message_ChatBox]
GO
ALTER TABLE [dbo].[Notify]  WITH CHECK ADD  CONSTRAINT [FK_Notify_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Notify] CHECK CONSTRAINT [FK_Notify_User]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_GroupPost] FOREIGN KEY([GroupId])
REFERENCES [dbo].[GroupPost] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_GroupPost]
GO
ALTER TABLE [dbo].[Post]  WITH CHECK ADD  CONSTRAINT [FK_Post_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Post] CHECK CONSTRAINT [FK_Post_User]
GO
ALTER TABLE [dbo].[UserGroupPost]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupPost_GroupPost] FOREIGN KEY([GroupPostId])
REFERENCES [dbo].[GroupPost] ([Id])
GO
ALTER TABLE [dbo].[UserGroupPost] CHECK CONSTRAINT [FK_UserGroupPost_GroupPost]
GO
ALTER TABLE [dbo].[UserGroupPost]  WITH CHECK ADD  CONSTRAINT [FK_UserGroupPost_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserGroupPost] CHECK CONSTRAINT [FK_UserGroupPost_User]
GO
ALTER TABLE [dbo].[UserLike]  WITH CHECK ADD  CONSTRAINT [FK_UserLike_Post] FOREIGN KEY([PostId])
REFERENCES [dbo].[Post] ([Id])
GO
ALTER TABLE [dbo].[UserLike] CHECK CONSTRAINT [FK_UserLike_Post]
GO
ALTER TABLE [dbo].[UserLike]  WITH CHECK ADD  CONSTRAINT [FK_UserLike_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserLike] CHECK CONSTRAINT [FK_UserLike_User]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_Roles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[Roles] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_Roles]
GO
ALTER TABLE [dbo].[UserRole]  WITH CHECK ADD  CONSTRAINT [FK_UserRole_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[UserRole] CHECK CONSTRAINT [FK_UserRole_User]
GO
USE [master]
GO
ALTER DATABASE [MANGXAHOI] SET  READ_WRITE 
GO
