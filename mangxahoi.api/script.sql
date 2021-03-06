USE [Social_Network]
GO
/****** Object:  Table [dbo].[chat_box]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[comment]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[group_post]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[image]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[message]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[notify]    Script Date: 14/3/2022 9:03:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notify](
	[id] [uniqueidentifier] NOT NULL,
	[content] [nvarchar](255) NULL,
	[create_date] [datetime] NULL,
	[user_id] [uniqueidentifier] NULL,
	[url] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[post]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[user_comment]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[user_group_post]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[user_like]    Script Date: 14/3/2022 9:03:29 PM ******/
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
/****** Object:  Table [dbo].[user_tb]    Script Date: 14/3/2022 9:03:29 PM ******/
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
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'd1e12834-7c93-4b0e-b746-152e47dbe1f1', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-06T00:45:15.990' AS DateTime), CAST(N'2022-03-06T00:45:15.990' AS DateTime), N'Nguyễn Văn Mạnh', N'QTHT')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'57ca4063-e137-4cc7-9dff-1bfd487ba16b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'5e01483d-d93c-45a2-a04b-75d65866cc78', CAST(N'2022-03-14T13:36:52.013' AS DateTime), CAST(N'2022-03-14T13:36:52.013' AS DateTime), N'Bùi Trung Tú', N'Lê Thế Nam')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'159fcf3d-2af5-4821-820e-767288cf47f9', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-06T00:45:17.857' AS DateTime), CAST(N'2022-03-06T00:45:17.857' AS DateTime), N'Nguyễn Văn Mạnh', N'Bùi Trung Tú')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-05T13:48:01.237' AS DateTime), CAST(N'2022-03-05T13:48:01.237' AS DateTime), N'Bùi Trung Tú', N'QTHT')
INSERT [dbo].[chat_box] ([id], [user_id1], [user_id2], [create_date], [modified_date], [user_name_1], [user_name_2]) VALUES (N'd9737a97-2370-4cd6-b0ba-fb707f8b4f02', N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', CAST(N'2022-03-14T13:37:05.257' AS DateTime), CAST(N'2022-03-14T13:37:05.257' AS DateTime), N'Lê Thế Nam', N'Chu Việt Dũng')
GO
INSERT [dbo].[comment] ([id], [content], [create_date], [modified_date], [post_id], [user_name], [user_id]) VALUES (N'e1b01d00-4123-4626-9c39-20bcab33d62b', N'wowww', CAST(N'2022-03-14T13:17:02.787' AS DateTime), CAST(N'2022-03-14T13:17:02.787' AS DateTime), N'eee13175-f1ac-4331-ad56-8be519ab6d4b', N'Bùi Trung Tú', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
GO
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'Khối tài chính doanh nghiệp', CAST(N'2022-03-06T14:48:59.093' AS DateTime), CAST(N'2022-03-06T14:48:59.093' AS DateTime), 3, N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138')
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'Phòng abcd', CAST(N'2022-03-09T13:15:38.967' AS DateTime), CAST(N'2022-03-09T13:15:38.967' AS DateTime), 3, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'Phòng hành chính ', CAST(N'2022-03-07T12:55:14.373' AS DateTime), CAST(N'2022-03-07T12:55:14.373' AS DateTime), 3, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'cbc86614-41dc-4569-8617-a742ed43e290', N'Khối tài chính doanh nghiệp', CAST(N'2022-03-05T23:52:56.143' AS DateTime), CAST(N'2022-03-05T23:52:56.143' AS DateTime), 2, NULL)
INSERT [dbo].[group_post] ([id], [group_name], [create_date], [modified_date], [member_count], [user_id]) VALUES (N'5559dc0d-fcb6-45cd-8332-c704cb106dd4', N'Phòng nhân sự', CAST(N'2022-03-07T12:53:26.587' AS DateTime), CAST(N'2022-03-07T12:53:26.587' AS DateTime), 2, N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
GO
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'2f303b96-5439-41c5-aabe-098a671e1b72', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514_0.jpg', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'283eebb7-f8a0-4992-84c9-16799b84b516', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f_0.png', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'2a35131a-9a5a-4f03-a8ff-2556e353bca3', N'4bbd1849-17b4-4705-bf70-72e0577e1187_3.jpg', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'9a158727-8e45-40bd-a83e-312743b9094b', N'e915c198-de1d-44b4-9244-c4dbf259eb16_1.jpg', N'e915c198-de1d-44b4-9244-c4dbf259eb16')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'41fbb4d3-f3a7-4c66-bea5-470d5b0386a8', N'e915c198-de1d-44b4-9244-c4dbf259eb16_2.jpg', N'e915c198-de1d-44b4-9244-c4dbf259eb16')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'5a40bdcf-6610-4e52-a83b-49f6ed06a995', N'3679316c-75c6-4321-8e0b-0206b11ca4b9_1.jpg', N'3679316c-75c6-4321-8e0b-0206b11ca4b9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'c4e5ca21-0ffe-4183-b1dc-4b0eab278b1b', N'399c07ff-c804-4210-b8a1-59d44eda7367_1.png', N'399c07ff-c804-4210-b8a1-59d44eda7367')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'cf519b08-1728-4c9e-9f32-4c80a11a38d0', N'3679316c-75c6-4321-8e0b-0206b11ca4b9_0.png', N'3679316c-75c6-4321-8e0b-0206b11ca4b9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'56c466d1-ccc7-47a7-b283-56c5e702f3c2', N'08995335-f5f0-4325-ae4d-3383b21f2c4f_2.jpg', N'08995335-f5f0-4325-ae4d-3383b21f2c4f')
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
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'1fc58452-d06d-43f2-afe1-88bc23ffb3bf', N'90a0be5a-3174-4586-bab7-e2c43b0450e6_0.jpg', N'90a0be5a-3174-4586-bab7-e2c43b0450e6')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'f3d51137-47b6-4c43-bb6c-88c784b9ede0', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514_1.jpg', N'3a6eb67c-8ecc-47c5-82e5-d0f48be28514')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'ad8d00a6-10f3-4e18-917c-8a926cbf61cf', N'6f059565-af23-4fa1-ae03-479b7d5352fe_1.jpg', N'6f059565-af23-4fa1-ae03-479b7d5352fe')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'0dc19bd6-302f-4029-83b2-ba3ea30028ed', N'08995335-f5f0-4325-ae4d-3383b21f2c4f_1.jpg', N'08995335-f5f0-4325-ae4d-3383b21f2c4f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'82a2c708-3e0c-4669-8446-c5cec02b9109', N'4bbd1849-17b4-4705-bf70-72e0577e1187_2.jpg', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'55753a8e-6c5d-4689-ba8e-c5e722d38016', N'08995335-f5f0-4325-ae4d-3383b21f2c4f_0.jpg', N'08995335-f5f0-4325-ae4d-3383b21f2c4f')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'fb6da654-2eae-4a88-8d48-c64cd4605a08', N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796_0.png', N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'229e18a1-5986-48d0-bb70-c7466651f696', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1_0.jpg', N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e163d284-c7df-4d32-b328-da0bf4ca82ae', N'6f059565-af23-4fa1-ae03-479b7d5352fe_2.jpg', N'6f059565-af23-4fa1-ae03-479b7d5352fe')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'121c0aa9-da49-4a39-b93f-e1cb189d7e3f', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a_0.jpg', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'063460ca-cd2f-4f44-a90b-eaf37165ba09', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a_1.jpg', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'8dc9229e-34da-4fcf-b315-ed040d72556a', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a_2.jpg', N'd77fe1cd-9679-483c-952e-b2a9fea8f90a')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'e9a8cece-ee5b-4fe9-b04a-f1cf429786dd', N'3679316c-75c6-4321-8e0b-0206b11ca4b9_2.jpg', N'3679316c-75c6-4321-8e0b-0206b11ca4b9')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'34735006-9c1c-4e74-8f58-f681a451175e', N'90a0be5a-3174-4586-bab7-e2c43b0450e6_1.jpg', N'90a0be5a-3174-4586-bab7-e2c43b0450e6')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'24a789a0-e139-48b1-bb15-fceea2ab50df', N'4bbd1849-17b4-4705-bf70-72e0577e1187_1.jpg', N'4bbd1849-17b4-4705-bf70-72e0577e1187')
INSERT [dbo].[image] ([id], [url], [post_id]) VALUES (N'246a5ded-891e-4fe4-96f1-ff94db1f556f', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f_1.jpg', N'80a49e63-b7b4-4d0a-be8f-bccddc96467f')
GO
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'8c363fe4-7083-45fb-9b44-10c481f3fbb9', N'xin chào', CAST(N'2022-03-09T13:17:19.930' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'bd9377d7-d805-4d33-b988-1294a2df733d', N'2222', CAST(N'2022-03-07T12:52:16.983' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'4a5225c0-ffb8-4110-b4e4-17755e53dab5', N'Hello', CAST(N'2022-03-05T13:51:30.030' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'8eb37a92-16db-4e5f-ae13-3344f5003f03', N'hello', CAST(N'2022-03-14T13:37:14.537' AS DateTime), N'5e01483d-d93c-45a2-a04b-75d65866cc78', 0, N'Lê Thế Nam', N'57ca4063-e137-4cc7-9dff-1bfd487ba16b')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'67129472-d4e7-400c-b99f-463d1ccda877', N'chào bạn', CAST(N'2022-03-09T13:17:51.003' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'20abf4db-b588-490f-bf5d-503fbbd1ae91', N'efg', CAST(N'2022-03-07T13:13:00.740' AS DateTime), N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', 0, N'Nguyễn Văn Mạnh', N'159fcf3d-2af5-4821-820e-767288cf47f9')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'883d70de-ac96-467e-a5ef-5fa09a1e3352', N'3333', CAST(N'2022-03-07T13:30:01.043' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'3ac49553-1d95-4fb3-bd72-6c6c7a306582', N'1314', CAST(N'2022-03-07T12:48:24.430' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'a7cced11-d5f3-4d1e-a847-9151f522be94', N'789', CAST(N'2022-03-07T12:46:13.813' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'8b90d8ef-b245-420a-b3c9-92acb9e12c18', N'alo', CAST(N'2022-03-14T13:37:03.237' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'57ca4063-e137-4cc7-9dff-1bfd487ba16b')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'4619a9af-0298-4f5d-b8ce-a028ae58ca91', N'101112', CAST(N'2022-03-07T12:46:25.397' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'9b402317-8461-4b9c-abd6-b5b9e53482f2', N'abc', CAST(N'2022-03-07T12:59:50.760' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'159fcf3d-2af5-4821-820e-767288cf47f9')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'b824bc0f-9d83-43ff-9671-b7b89435a71a', N'Chao xìn', CAST(N'2022-03-05T13:52:01.683' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'9fd16eec-fc98-40d2-a526-deafbfd9813a', N'5555', CAST(N'2022-03-07T15:17:48.637' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'36b34327-ade9-4f6d-a3f3-df4587c1672b', N'xin chào', CAST(N'2022-03-09T11:12:40.887' AS DateTime), N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, N'Bùi Trung Tú', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'429dcaec-8207-4d6b-be80-e36d00677ec9', N'123456', CAST(N'2022-03-07T10:56:00.763' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'0a0dbbbe-9c75-48f9-90e5-f708f3224caa', N'4444', CAST(N'2022-03-07T13:40:49.220' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'6ce7468a-b194-494a-b343-f71e4a98f9e9', N'chào bạn', CAST(N'2022-03-09T11:12:48.393' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
INSERT [dbo].[message] ([id], [content], [create_date], [user_id], [is_like], [user_name], [chat_box_id]) VALUES (N'be8516af-5530-452a-b515-fc6aa4c6740f', N'1516', CAST(N'2022-03-07T12:48:42.430' AS DateTime), N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, N'QTHT', N'37db70ba-fc6b-4d34-8c3c-c14b1bb06d61')
GO
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'3679316c-75c6-4321-8e0b-0206b11ca4b9', N'Desktop image', CAST(N'2022-03-01T22:43:20.587' AS DateTime), CAST(N'2022-03-01T22:43:20.587' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Bùi Trung Tú')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'aa3ea50c-95d9-40b2-abe2-2ff2a2226796', N'Test post trong nhóm', CAST(N'2022-03-07T11:07:33.910' AS DateTime), CAST(N'2022-03-07T11:07:33.910' AS DateTime), N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Bùi Trung Tú')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'08995335-f5f0-4325-ae4d-3383b21f2c4f', N'abcd', CAST(N'2022-03-09T13:15:58.400' AS DateTime), CAST(N'2022-03-09T13:15:58.400' AS DateTime), N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Bùi Trung Tú')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'6f059565-af23-4fa1-ae03-479b7d5352fe', N'Post này của phòng nhân sự', CAST(N'2022-03-07T12:55:52.080' AS DateTime), CAST(N'2022-03-07T12:55:52.080' AS DateTime), N'5559dc0d-fcb6-45cd-8332-c704cb106dd4', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Bùi Trung Tú')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'eee13175-f1ac-4331-ad56-8be519ab6d4b', N'37 TUỔI 35 NGÀY LÀ SỐ TUỔI HIỆN TẠI CỦA ANH
Với ba bàn tối qua, Ronaldo chạm mốc 807 bàn trong 1.146 trận đấu chính thức cho CLB lẫn ĐTQG. Đưa anh trở thành cầu thủ ghi nhiều bàn nhất trong các trận chính thức của FIFA. Ở độ tuổi 37 cách anh thi đấu như cười vào mặt cái xương sống nhức mỏi của những thanh niên tuổi đôi mươi.
Thật sự trận đấu đêm qua của anh quá cháy. Cú sút ngoài vòng cấm của anh làm tôi nhớ đến những cú sút xé gió của tôi. Những cú sút đưa quả bóng nhựa bay ra ngoài khung thành dưới cái nắng hè oi ả. Nếu không phải vì cuộc sống nghiệt ngã tôi đã theo đuổi nghiệp quần đùi áo số chứ không phải ngồi đây.', CAST(N'2022-03-14T12:48:36.290' AS DateTime), CAST(N'2022-03-14T12:48:36.290' AS DateTime), NULL, N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 2, 1, N'Bùi Trung Tú')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'd77fe1cd-9679-483c-952e-b2a9fea8f90a', N'Test share', CAST(N'2022-03-07T12:53:06.840' AS DateTime), CAST(N'2022-03-07T12:53:06.840' AS DateTime), N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', 0, 0, N'Bùi Trung Tú')
INSERT [dbo].[post] ([id], [content], [create_date], [modified_date], [group_id], [user_id], [likes_count], [comment_count], [full_name]) VALUES (N'8c8b3ef7-6e26-4899-ab56-ea976a71ecc1', N'Meme', CAST(N'2022-03-02T00:17:23.337' AS DateTime), CAST(N'2022-03-02T00:17:23.340' AS DateTime), NULL, N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', 0, 0, N'QTHT')
GO
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'1a676581-5854-47a5-90e7-2aed24aefeb0', N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-07T12:55:14.380' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'6b0c11f6-9bc0-4ffc-a998-81841eed2dbf', N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-06T14:56:41.323' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'7bef7912-86f5-40bd-b2dc-865dcdd2bd64', N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-09T13:16:58.623' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'825e355b-81e8-4307-b26a-aacc8576e725', N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-07T12:55:14.380' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'c79c3052-d353-4f17-b5b4-bc8913935e09', N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-06T14:56:41.323' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'a2e1e6b0-f74a-4a9b-bb8f-cb79c16df3d1', N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-09T13:16:58.623' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'36371eab-2c59-4ed2-9c1b-e4ffdc4cbfe1', N'1cfd95a4-f4b8-40ab-9869-9213000eff8c', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-07T12:55:14.380' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'4442b652-3e82-4aab-8bb9-e8c47edff3b2', N'cc54d4ff-1348-4749-8c04-74b4434f52bc', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-09T13:16:58.623' AS DateTime), 1)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'28406c9d-3182-4842-93c1-f24b5604db0d', N'5559dc0d-fcb6-45cd-8332-c704cb106dd4', N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', CAST(N'2022-03-07T12:53:26.603' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'b05ed00c-ccfc-4451-953c-fbadf8c28775', N'16f66c80-2251-493e-bba0-4b9dbb63ca9d', N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', CAST(N'2022-03-06T14:56:41.323' AS DateTime), 0)
INSERT [dbo].[user_group_post] ([id], [group_post_id], [user_id], [create_date], [role_number]) VALUES (N'bfe21764-c6a7-437a-b549-fe61144ab244', N'5559dc0d-fcb6-45cd-8332-c704cb106dd4', N'ef355ba1-86e9-492b-a4b9-748138d81ed2', CAST(N'2022-03-07T12:53:26.593' AS DateTime), 1)
GO
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'41a27502-0c11-4990-a646-8f51b4da928e', N'eee13175-f1ac-4331-ad56-8be519ab6d4b', N'5e01483d-d93c-45a2-a04b-75d65866cc78')
INSERT [dbo].[user_like] ([id], [post_id], [user_id]) VALUES (N'5af4365c-f78a-49a4-86c5-e389cc85db7d', N'eee13175-f1ac-4331-ad56-8be519ab6d4b', N'ef355ba1-86e9-492b-a4b9-748138d81ed2')
GO
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'6dbe78f3-90a0-4a8b-ac08-03eb4d25c0a2', N'cvdung', N'123456', N'Chu Việt Dũng', N'dungviet@gmail.com', N'0966246311', N'Ha Noi', NULL, NULL, CAST(N'2000-03-08T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'ef355ba1-86e9-492b-a4b9-748138d81ed2', N'bttu', N'123456', N'Bùi Trung Tú', N'tudefttry@gmail.com', N'0966246311', N'Hà Nội', NULL, NULL, CAST(N'1998-06-29T17:00:00.877' AS DateTime), NULL, NULL)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'5e01483d-d93c-45a2-a04b-75d65866cc78', N'ltnam', N'123456', N'Lê Thế Nam', N'ltnam@gmail.com', N'0966246311', N'Tây Tựu - Hà Nội', N'Bảo Vệ', N'Lead', CAST(N'2000-03-29T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'd47aafe4-7f55-4810-b1a1-9f7a8c67b138', N'admin', N'admin', N'QTHT', N'qtht@gmail.com', N'0966246311', N'Hà Nội', NULL, NULL, CAST(N'1998-06-26T00:00:00.000' AS DateTime), NULL, 0)
INSERT [dbo].[user_tb] ([id], [user_name], [password], [full_name], [email], [phone_number], [address], [department], [position], [birthday], [create_date], [gender]) VALUES (N'e4d1a0d0-361a-43ca-9438-a067a6aaec97', N'nvmanh', N'123456', N'Nguyễn Văn Mạnh', N'nvmanh@gmail.com', N'093123218', N'Hà Nội', NULL, NULL, CAST(N'2000-03-16T00:00:00.000' AS DateTime), NULL, 0)
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
