USE [master]
GO
/****** Object:  Database [PlantShop]    Script Date: 2022/10/13 16:56:55 ******/
CREATE DATABASE [PlantShop]
GO
ALTER DATABASE [PlantShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [PlantShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [PlantShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [PlantShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [PlantShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [PlantShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [PlantShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [PlantShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [PlantShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [PlantShop] SET  ENABLE_BROKER 
GO
ALTER DATABASE [PlantShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [PlantShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [PlantShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [PlantShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [PlantShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [PlantShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [PlantShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [PlantShop] SET RECOVERY FULL 
GO
ALTER DATABASE [PlantShop] SET  MULTI_USER 
GO
ALTER DATABASE [PlantShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [PlantShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [PlantShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [PlantShop] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [PlantShop] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [PlantShop] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'PlantShop', N'ON'
GO
ALTER DATABASE [PlantShop] SET QUERY_STORE = OFF
GO
USE [PlantShop]
GO
/****** Object:  Table [dbo].[Accounts]    Script Date: 2022/10/13 16:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Accounts](
	[accID] [int] IDENTITY(1,1) NOT NULL,
	[email] [varchar](30) NULL,
	[password] [varchar](30) NULL,
	[fullname] [varchar](30) NULL,
	[phone] [varchar](12) NULL,
	[status] [int] NULL,
	[role] [int] NULL,
	[token] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[accID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 2022/10/13 16:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[CateID] [int] IDENTITY(1,1) NOT NULL,
	[CateName] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[CateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 2022/10/13 16:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[DetailId] [int] IDENTITY(1,1) NOT NULL,
	[OrderID] [int] NULL,
	[FID] [int] NULL,
	[quantity] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[DetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Orders]    Script Date: 2022/10/13 16:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Orders](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrdDate] [date] NULL,
	[shipdate] [date] NULL,
	[status] [int] NULL,
	[AccID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Plants]    Script Date: 2022/10/13 16:56:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Plants](
	[PID] [int] IDENTITY(1,1) NOT NULL,
	[PName] [varchar](30) NULL,
	[price] [int] NULL,
	[imgPath] [varchar](50) NULL,
	[description] [text] NULL,
	[status] [int] NULL,
	[CateID] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[PID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Accounts] ON 
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (1, N'dang123@gmail.com', N'1234', N'seller1', N'1234567890', 1, 0, N'dang123@gmail.com')
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (2, N'nobody@gmail.com', N'1234', N'admin', N'3442535235', 1, 1, N'nobody@gmail.com')
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (4, N'minhdang12345c@gmail.com', N'1234', N'dang phan', N'1234567890', 1, 0, N'minhdang12345c@gmail.com')
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (7, N'minhdang123@gmail.com', N'1234', N'minh dang', N'0899384969', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (9, N'minhd2345c@gmail.com', N'1234', N'hello world', N'0899902371', 0, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (10, N'minhdang12345c@gmail.com.vn', N'123', N'hello', N'0899903369', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (11, N'minhdang12345c@gmail.co', N'1234', N'minhdang', N'1234567890', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (12, N'hdang12345c@gmail.com', N'1234', N'hdang', N'0899903369', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (13, N'mi12345c@gmail.com', N'1234', N'mi', N'0835903169', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (1003, N'test@gmail.com', N'1234', N'tester', N'0899903369', 0, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (1007, N'test2@gmail.com', N'1234', N'tester20', N'0899703329', 0, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (1016, N'test3@gmail.com', N'1234', N'tester3', N'0899903369', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (2006, N'test5@gmail.com', N'1234', N'tester5', N'0123456789', 0, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (2007, N'minhtri@gmail.com', N'1234', N'dang phan', N'0899903369', 0, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (2008, N'minhkhue@gmail.com', N'1234', N'minh khue', N'0232567890', 1, 0, NULL)
GO
INSERT [dbo].[Accounts] ([accID], [email], [password], [fullname], [phone], [status], [role], [token]) VALUES (3006, N'thanhtai123@gmail.com', N'1234', N'phan nguyen thanh tai', N'1234567890', 0, 0, NULL)
GO
SET IDENTITY_INSERT [dbo].[Accounts] OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1, N'orchild')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (2, N'roses')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (3, N'others')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1005, N'cuc')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1006, N'dam but')
GO
INSERT [dbo].[Categories] ([CateID], [CateName]) VALUES (1008, N'huong duong')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] ON 
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1, 1, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2, 1, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3, 2, 5, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (4, 3, 7, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (14, 3, 6, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (15, 6, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (16, 6, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (17, 6, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (18, 7, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (19, 7, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (20, 7, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (21, 7, 4, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (22, 8, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (23, 8, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (24, 9, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (25, 9, 3, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1002, 1002, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1003, 1002, 2, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (1004, 1003, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2002, 2002, 1, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (2003, 2002, 7, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3002, 3002, 1, 1)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3003, 3002, 2, 2)
GO
INSERT [dbo].[OrderDetails] ([DetailId], [OrderID], [FID], [quantity]) VALUES (3004, 3002, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[OrderDetails] OFF
GO
SET IDENTITY_INSERT [dbo].[Orders] ON 
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1, CAST(N'2021-01-11' AS Date), CAST(N'2021-10-11' AS Date), 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2, CAST(N'2021-11-23' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3, CAST(N'2021-10-01' AS Date), NULL, 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (4, CAST(N'2021-10-01' AS Date), CAST(N'2021-12-01' AS Date), 2, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (5, CAST(N'2022-06-05' AS Date), CAST(N'2022-10-11' AS Date), 2, 1003)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (6, CAST(N'2022-06-16' AS Date), NULL, 2, 4)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (7, CAST(N'2022-06-24' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (8, CAST(N'2022-06-24' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (9, CAST(N'2022-06-26' AS Date), NULL, 3, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1002, CAST(N'2022-07-02' AS Date), NULL, 1, 4)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (1003, CAST(N'2022-07-07' AS Date), NULL, 1, 1)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (2002, CAST(N'2022-07-09' AS Date), NULL, 2, 4)
GO
INSERT [dbo].[Orders] ([OrderID], [OrdDate], [shipdate], [status], [AccID]) VALUES (3002, CAST(N'2022-07-21' AS Date), NULL, 2, 7)
GO
SET IDENTITY_INSERT [dbo].[Orders] OFF
GO
SET IDENTITY_INSERT [dbo].[Plants] ON 
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1, N'vanda', 100, N'images/img1.jpg', N'this is a wanda', 1, 1)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (2, N'white rose', 90, N'images/img4.jpg', N'this is a rose', 1, 2)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (3, N'lan ho diep', 70, N'images/img2.jpg', N'hoa lan', 1, 1)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (4, N'lan hai', 140, N'images/img3.jpg', N'hoa lan', 1, 1)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (5, N'cay hoa hong cam', 200, N'images/img5.jpg', N'hoa hong', 1, 2)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (6, N'monstera', 80, N'images/img6.jpg', N'cay la kieng', 1, 3)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (7, N'var monstera', 400, N'images/img7.jpg', N'cay la kieng', 1, 3)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1002, N'lan canh', 100, N'images/img2.jpg', N'hoa lan', 0, 1)
GO
INSERT [dbo].[Plants] ([PID], [PName], [price], [imgPath], [description], [status], [CateID]) VALUES (1004, N'huong duong', 100, N'', N'hoa huong duong', 0, 1008)
GO
SET IDENTITY_INSERT [dbo].[Plants] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Accounts__AB6E61644F4DA5EA]    Script Date: 2022/10/13 16:56:56 ******/
ALTER TABLE [dbo].[Accounts] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([OrderID])
REFERENCES [dbo].[Orders] ([OrderID])
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD FOREIGN KEY([FID])
REFERENCES [dbo].[Plants] ([PID])
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD FOREIGN KEY([AccID])
REFERENCES [dbo].[Accounts] ([accID])
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD FOREIGN KEY([CateID])
REFERENCES [dbo].[Categories] ([CateID])
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([role]=(1) OR [role]=(0)))
GO
ALTER TABLE [dbo].[Accounts]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(0)))
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD CHECK  (([quantity]>=(1)))
GO
ALTER TABLE [dbo].[Orders]  WITH CHECK ADD CHECK  (([status]=(1) OR [status]=(2) OR [status]=(3)))
GO
ALTER TABLE [dbo].[Plants]  WITH CHECK ADD CHECK  (([price]>=(0)))
GO
USE [master]
GO
ALTER DATABASE [PlantShop] SET  READ_WRITE 
GO
