USE [CREADB]
GO
/****** Object:  Table [dbo].[Agent]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Agent](
	[AgentID] [int] IDENTITY(1,1) NOT NULL,
	[AgentDetailsID] [int] NULL,
	[Name] [nvarchar](256) NULL,
	[OfficeID] [int] NULL,
	[Position] [nvarchar](50) NULL,
 CONSTRAINT [PK_Agent] PRIMARY KEY CLUSTERED 
(
	[AgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Building]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Building](
	[BuildingID] [int] IDENTITY(1,1) NOT NULL,
	[BathroomTotal] [int] NULL,
	[BedroomsTotal] [int] NULL,
	[CoolingType] [nvarchar](50) NULL,
	[FireplacePresent] [bit] NULL,
	[HeatingFuel] [nvarchar](50) NULL,
	[HeatingType] [nvarchar](20) NULL,
	[SizeInterior] [nvarchar](50) NULL,
	[Type] [nvarchar](20) NULL,
 CONSTRAINT [PK_Building] PRIMARY KEY CLUSTERED 
(
	[BuildingID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Land]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Land](
	[LandID] [int] IDENTITY(1,1) NOT NULL,
	[SizeTotal] [decimal](18, 2) NULL,
	[SizeTotalText] [nvarchar](50) NULL,
	[Acreage] [bit] NULL,
 CONSTRAINT [PK_Land] PRIMARY KEY CLUSTERED 
(
	[LandID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Office]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Office](
	[OfficeID] [int] NOT NULL,
	[Name] [nvarchar](256) NULL,
	[City] [nvarchar](50) NULL,
 CONSTRAINT [PK_Office] PRIMARY KEY CLUSTERED 
(
	[OfficeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Photo]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Photo](
	[PhotoID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NULL,
	[SequenceID] [int] NULL,
	[LastUpdated] [datetime] NULL,
	[Url] [nvarchar](500) NULL,
 CONSTRAINT [PK_Photo] PRIMARY KEY CLUSTERED 
(
	[PhotoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Property]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Property](
	[PropertyID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyDetailsID] [int] NULL,
	[ListingID] [nvarchar](30) NULL,
	[Board] [nvarchar](50) NULL,
	[Business] [nvarchar](50) NULL,
	[BuildingID] [int] NULL,
	[LandID] [int] NULL,
	[StreatAddress] [nvarchar](256) NULL,
	[AddressLine1] [nvarchar](256) NULL,
	[City] [nvarchar](50) NULL,
	[Province] [nvarchar](50) NULL,
	[PostalCode] [nvarchar](50) NULL,
	[Country] [nvarchar](50) NULL,
	[Features] [nvarchar](400) NULL,
	[FarmType] [nvarchar](50) NULL,
	[OwnershipType] [nvarchar](30) NULL,
	[Price] [money] NULL,
	[PropertyType] [nvarchar](50) NULL,
	[PublicRemarks] [nvarchar](500) NULL,
	[TransactionType] [nvarchar](20) NULL,
	[UtilitiesAvailable] [nvarchar](400) NULL,
	[ViewType] [nvarchar](20) NULL,
	[WaterFrontType] [nvarchar](50) NULL,
	[AnalyticsClick] [text] NULL,
	[AnalyticsView] [text] NULL,
	[MoreInformationLink] [nvarchar](400) NULL,
	[AddDate] [datetime] NULL CONSTRAINT [DF_Property_Added]  DEFAULT (getdate()),
	[LastUpdated] [datetime] NULL,
 CONSTRAINT [PK_Property] PRIMARY KEY CLUSTERED 
(
	[PropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PropertyAgent]    Script Date: 28-Sep-15 9:51:13 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PropertyAgent](
	[PropertyAgentID] [int] IDENTITY(1,1) NOT NULL,
	[PropertyID] [int] NOT NULL,
	[AgentID] [int] NULL,
 CONSTRAINT [PK_PropertyAgent] PRIMARY KEY CLUSTERED 
(
	[PropertyAgentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Agent] ON 

INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (1, 1937465, N'Alex Drow', 270564, N'Broker Owner')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (2, 1937466, N'Deborah James', 270565, N'Broker Owner')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (3, 1937467, N'Richard Silver', 270566, N'Broker Owner')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (4, 1937468, N'Blair Peters', 270567, N'Broker Owner')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (5, 1937469, N'Peter Richardson', 270568, N'Broker Owner')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (6, 1937470, N'Michelle Otterby', 270564, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (7, 1937471, N'Christina Vaillancourt', 270564, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (8, 1937472, N'Phil Carson', 270565, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (9, 1937473, N'Annette Brown', 270565, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (10, 1937474, N'Elliot Zuckerman', 270566, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (11, 1937475, N'Caterina Parker', 270566, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (12, 1937476, N'Bobby Naismith', 270567, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (13, 1937477, N'Charles Armstrong', 270567, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (14, 1937478, N'Chad Ngota', 270568, N'Salesperson')
INSERT [dbo].[Agent] ([AgentID], [AgentDetailsID], [Name], [OfficeID], [Position]) VALUES (15, 1937479, N'Lucy Liu', 270568, N'Salesperson')
SET IDENTITY_INSERT [dbo].[Agent] OFF
SET IDENTITY_INSERT [dbo].[Building] ON 

INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (1, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (2, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (3, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (4, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (5, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (7, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (8, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (9, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (10, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (11, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (12, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (13, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (14, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (15, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (16, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (17, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (18, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (19, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (20, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (21, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (22, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (23, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (24, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (25, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (26, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (27, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (28, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (29, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (30, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (31, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (32, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (33, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (34, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (35, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (36, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (37, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (38, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (39, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (40, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (41, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (42, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (43, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (44, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (45, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (46, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (47, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (48, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (49, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (50, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (51, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (52, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (53, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (54, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (55, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (56, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (57, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (58, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (59, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (60, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (61, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (62, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (63, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (64, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (65, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (66, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (67, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (68, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (69, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (70, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (71, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (72, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (73, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (74, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (75, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (76, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (77, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
INSERT [dbo].[Building] ([BuildingID], [BathroomTotal], [BedroomsTotal], [CoolingType], [FireplacePresent], [HeatingFuel], [HeatingType], [SizeInterior], [Type]) VALUES (78, 2, 3, N'Central air conditioning', 0, N'Natural gas', N'Air circulation heat', N'1685 sqft', N'House')
SET IDENTITY_INSERT [dbo].[Building] OFF
SET IDENTITY_INSERT [dbo].[Land] ON 

INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (1, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (2, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (3, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (4, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (5, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (7, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (8, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (9, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (10, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (11, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (12, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (13, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (14, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (15, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (16, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (17, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (18, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (19, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (20, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (21, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (22, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (23, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (24, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (25, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (26, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (27, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (28, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (29, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (30, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (31, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (32, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (33, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (34, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (35, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (36, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (37, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (38, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (39, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (40, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (41, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (42, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (43, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (44, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (45, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (46, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (47, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (48, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (49, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (50, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (51, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (52, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (53, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (54, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (55, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (56, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (57, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (58, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (59, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (60, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (61, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (62, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (63, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (64, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (65, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (66, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (67, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (68, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (69, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (70, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (71, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (72, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (73, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (74, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (75, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (76, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (77, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
INSERT [dbo].[Land] ([LandID], [SizeTotal], [SizeTotalText], [Acreage]) VALUES (78, CAST(2355.00 AS Decimal(18, 2)), N'2355 sqft', 1)
SET IDENTITY_INSERT [dbo].[Land] OFF
INSERT [dbo].[Office] ([OfficeID], [Name], [City]) VALUES (270564, N'Consumer Housing Inc.', N'Kentville')
INSERT [dbo].[Office] ([OfficeID], [Name], [City]) VALUES (270565, N'CanCom Real Estate', N'Kentville')
INSERT [dbo].[Office] ([OfficeID], [Name], [City]) VALUES (270566, N'Rancher''s Dream', N'Kentville')
INSERT [dbo].[Office] ([OfficeID], [Name], [City]) VALUES (270567, N'Market Chance Real Estate', N'Wolfville')
INSERT [dbo].[Office] ([OfficeID], [Name], [City]) VALUES (270568, N'Houses 4 U', N'Wolfville')
SET IDENTITY_INSERT [dbo].[Photo] ON 

INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (1, 7, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (2, 7, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (3, 7, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (4, 7, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (5, 7, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (6, 7, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (7, 7, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (8, 7, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (9, 7, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (10, 7, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (11, 9, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (12, 9, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (13, 9, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (14, 9, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (15, 9, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (16, 9, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (17, 9, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (18, 9, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (19, 9, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (20, 9, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (21, 10, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (22, 10, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (23, 10, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (24, 10, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (25, 10, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (26, 10, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (27, 10, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (28, 10, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (29, 10, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (30, 10, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (31, 11, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (32, 11, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (33, 11, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (34, 11, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (35, 11, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (36, 11, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (37, 11, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (38, 11, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (39, 11, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (40, 11, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (41, 12, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (42, 12, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (43, 12, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (44, 12, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (45, 12, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (46, 12, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (47, 12, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (48, 12, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (49, 12, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (50, 12, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (51, 13, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (52, 13, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (53, 13, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (54, 13, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (55, 13, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (56, 13, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (57, 13, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (58, 13, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (59, 13, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (60, 13, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (61, 14, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (62, 14, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (63, 14, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (64, 14, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (65, 14, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (66, 14, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (67, 14, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (68, 14, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (69, 14, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (70, 14, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (71, 15, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (72, 15, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (73, 15, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (74, 15, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (75, 15, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (76, 15, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (77, 15, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (78, 15, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (79, 15, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (80, 15, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (81, 16, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (82, 16, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (83, 16, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (84, 16, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (85, 16, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (86, 16, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (87, 16, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (88, 16, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (89, 16, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (90, 16, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (91, 17, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (92, 17, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (93, 17, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (94, 17, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (95, 17, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (96, 17, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (97, 17, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (98, 17, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (99, 17, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (100, 17, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (101, 18, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (102, 18, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (103, 18, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (104, 18, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (105, 18, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (106, 18, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (107, 18, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (108, 18, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (109, 18, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (110, 18, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (111, 19, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (112, 19, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (113, 19, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (114, 19, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (115, 19, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (116, 19, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (117, 19, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (118, 19, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (119, 19, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (120, 19, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (121, 20, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (122, 20, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (123, 20, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (124, 20, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (125, 20, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (126, 20, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (127, 20, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (128, 20, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (129, 20, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (130, 20, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (131, 21, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (132, 21, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (133, 21, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (134, 21, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (135, 21, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (136, 21, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (137, 21, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (138, 21, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (139, 21, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (140, 21, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (141, 22, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (142, 22, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (143, 22, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (144, 22, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (145, 22, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (146, 22, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (147, 22, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (148, 22, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (149, 22, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (150, 22, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (151, 23, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (152, 23, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (153, 23, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (154, 23, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (155, 23, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (156, 23, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (157, 23, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (158, 23, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (159, 23, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (160, 23, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (161, 24, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (162, 24, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (163, 24, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (164, 24, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (165, 24, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (166, 24, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (167, 24, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (168, 24, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (169, 24, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (170, 24, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (171, 25, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (172, 25, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (173, 25, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (174, 25, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (175, 25, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (176, 25, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (177, 25, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (178, 25, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (179, 25, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (180, 25, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (181, 26, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (182, 26, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (183, 26, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (184, 26, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (185, 26, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (186, 26, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (187, 26, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (188, 26, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (189, 26, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (190, 26, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (191, 27, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (192, 27, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (193, 27, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (194, 27, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (195, 27, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (196, 27, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (197, 27, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (198, 27, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (199, 27, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (200, 27, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (201, 28, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (202, 28, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (203, 28, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (204, 28, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (205, 28, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (206, 28, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (207, 28, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (208, 28, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (209, 28, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (210, 28, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (211, 29, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (212, 29, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (213, 29, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (214, 29, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (215, 29, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (216, 29, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (217, 29, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (218, 29, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (219, 29, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (220, 29, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (221, 30, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (222, 30, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (223, 30, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (224, 30, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (225, 30, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (226, 30, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (227, 30, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (228, 30, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (229, 30, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (230, 30, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (231, 31, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (232, 31, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (233, 31, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (234, 31, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (235, 31, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (236, 31, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (237, 31, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (238, 31, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (239, 31, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (240, 31, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (241, 32, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (242, 32, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (243, 32, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (244, 32, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (245, 32, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (246, 32, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (247, 32, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (248, 32, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (249, 32, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (250, 32, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (251, 33, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (252, 33, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (253, 33, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (254, 33, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (255, 33, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (256, 33, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (257, 33, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (258, 33, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (259, 33, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (260, 33, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (261, 34, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (262, 34, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (263, 34, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (264, 34, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (265, 34, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (266, 34, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (267, 34, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (268, 34, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (269, 34, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (270, 34, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (271, 35, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (272, 35, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (273, 35, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (274, 35, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (275, 35, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (276, 35, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (277, 35, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (278, 35, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (279, 35, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (280, 35, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (281, 36, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (282, 36, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (283, 36, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (284, 36, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (285, 36, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (286, 36, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (287, 36, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (288, 36, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (289, 36, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (290, 36, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (291, 37, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (292, 37, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (293, 37, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (294, 37, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (295, 37, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (296, 37, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (297, 37, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (298, 37, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (299, 37, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
GO
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (300, 37, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (301, 38, 1, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (302, 38, 2, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (303, 38, 3, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (304, 38, 4, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (305, 38, 5, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (306, 38, 6, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (307, 38, 7, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (308, 38, 8, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (309, 38, 9, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
INSERT [dbo].[Photo] ([PhotoID], [PropertyID], [SequenceID], [LastUpdated], [Url]) VALUES (310, 38, 10, CAST(N'2012-07-09 15:53:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[Photo] OFF
SET IDENTITY_INSERT [dbo].[Property] ON 

INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (1, 11937196, N'DDF106RES001', N'106', N'', 4, 4, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (3, 11937196, N'DDF106RES001', N'106', N'', 8, 8, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (4, 11937196, N'DDF106RES001', N'106', N'', 10, 10, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (5, 11937196, N'DDF106RES001', N'106', N'', 12, 12, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (6, 11937196, N'DDF106RES001', N'106', N'', 14, 14, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (7, 11937196, N'DDF106RES001', N'106', N'', 16, 16, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (8, 11937197, N'DDF106RES002', N'106', N'', 18, 18, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold Condo/Strata', 123000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on lake', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937197,3,[1937466],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937197''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937197,3,[1937466],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937197', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (9, 11937196, N'DDF106RES001', N'106', N'', 20, 20, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937196,3,[1937465],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:57.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (10, 11937197, N'DDF106RES002', N'106', N'', 22, 22, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold Condo/Strata', 123000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on lake', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937197,3,[1937466],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937197''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937197,3,[1937466],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937197', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (11, 11937198, N'DDF106RES003', N'106', N'', 24, 24, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Freehold', 322000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on ocean', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937198,3,[1937467],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937198''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937198,3,[1937467],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937198', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (12, 11937199, N'DDF106RES004', N'106', N'', 26, 26, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold', 500000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on river', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937199,3,[1937468],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937199''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937199,3,[1937468],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937199', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (13, 11937200, N'DDF106RES005', N'106', N'', 28, 28, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Timeshare/Fractional', 125000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on pond', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937200,3,[1937469],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937200''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937200,3,[1937469],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937200', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (14, 11937201, N'DDF106RES006', N'106', N'', 30, 30, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Shares in Co-operative', 450000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on stream', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937201,3,[1937470],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937201,3,[1937470],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (15, 11937202, N'DDF106RES007', N'106', N'', 32, 32, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Partial', 825000.0000, N'Single Family', N'This is the general description field in English', N'For sale', N'', N'City view', N'Waterfront on creek', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937202,3,[1937471],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937202,3,[1937471],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (16, 11937203, N'DDF106RES008', N'106', N'', 34, 34, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Unknown', 638000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront nearby', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937203,3,[1937472],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937203,3,[1937472],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (17, 11937204, N'DDF106REC001', N'106', N'', 36, 36, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Undivided Co-ownership', 183000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on canal', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937204,3,[1937473],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937204,3,[1937473],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (18, 11937205, N'DDF106REC002', N'106', N'', 38, 38, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Life Lease', 113254.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Deeded water access', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937205,3,[1937474],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937205''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937205,3,[1937474],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937205', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (19, 11937197, N'DDF106RES002', N'106', N'', 40, 40, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold Condo/Strata', 123000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on lake', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937197,3,[1937466],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937197''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937197,3,[1937466],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937197', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (20, 11937198, N'DDF106RES003', N'106', N'', 42, 42, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Freehold', 322000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on ocean', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937198,3,[1937467],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937198''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937198,3,[1937467],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937198', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (21, 11937199, N'DDF106RES004', N'106', N'', 44, 44, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold', 500000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on river', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937199,3,[1937468],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937199''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937199,3,[1937468],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937199', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (22, 11937200, N'DDF106RES005', N'106', N'', 46, 46, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Timeshare/Fractional', 125000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on pond', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937200,3,[1937469],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937200''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937200,3,[1937469],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937200', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (23, 11937201, N'DDF106RES006', N'106', N'', 48, 48, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Shares in Co-operative', 450000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on stream', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937201,3,[1937470],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937201,3,[1937470],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:58.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (24, 11937202, N'DDF106RES007', N'106', N'', 50, 50, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Partial', 825000.0000, N'Single Family', N'This is the general description field in English', N'For sale', N'', N'City view', N'Waterfront on creek', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937202,3,[1937471],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937202,3,[1937471],[270564],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (25, 11937203, N'DDF106RES008', N'106', N'', 52, 52, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Unknown', 638000.0000, N'Single Family', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront nearby', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937203,3,[1937472],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937203,3,[1937472],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (26, 11937204, N'DDF106REC001', N'106', N'', 54, 54, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Undivided Co-ownership', 183000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on canal', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937204,3,[1937473],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937204,3,[1937473],[270565],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (27, 11937205, N'DDF106REC002', N'106', N'', 56, 56, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Life Lease', 113254.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Deeded water access', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937205,3,[1937474],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937205''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937205,3,[1937474],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937205', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (28, 11937206, N'DDF106REC003', N'106', N'', 58, 58, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Freehold Condo', 268000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937206,3,[1937475],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937206''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937206,3,[1937475],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937206', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (29, 11937206, N'DDF106REC003', N'106', N'', 60, 60, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Freehold Condo', 268000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937206,3,[1937475],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937206''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937206,3,[1937475],[270566],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937206', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (30, 11937207, N'DDF106REC004', N'106', N'', 62, 62, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 551000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Restricted waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937207,3,[1937476],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937207''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937207,3,[1937476],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937207', NULL, CAST(N'2012-06-14 22:09:59.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (31, 11937208, N'DDF106REC005', N'106', N'', 64, 64, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold Condo/Strata', 250000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Unknown', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937208,3,[1937477],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937208''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937208,3,[1937477],[270567],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937208', NULL, CAST(N'2012-06-14 22:10:00.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (32, 11937209, N'DDF106REC006', N'106', N'', 66, 66, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Freehold', 723000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront, Road Between', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937209,3,[1937478],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937209,3,[1937478],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:10:00.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (33, 11937210, N'DDF106REC007', N'106', N'', 68, 68, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold', 323000.0000, N'Recreational', N'This is the general description field in English', N'For sale', N'', N'City view', N'Island', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937210,3,[1937479],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937210,3,[1937479],[270568],[1937465],[0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:10:00.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (34, 11937211, N'DDF106REC008', N'106', N'', 70, 70, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Timeshare/Fractional', 83000.0000, N'Recreational', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Other', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937211,3,[1937470,1937472],[270564,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937211,3,[1937470,1937472],[270564,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:10:00.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (35, 11937212, N'DDF106LAND001', N'106', N'', 72, 72, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Condominium/Strata', 215000.0000, N'Vacant Land', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937212,3,[1937471,1937473],[270564,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937212,3,[1937471,1937473],[270564,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca', NULL, CAST(N'2012-06-14 22:10:00.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (36, 11937213, N'DDF106LAND002', N'106', N'', 74, 74, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold Condo/Strata', 123000.0000, N'Vacant Land', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on lake', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937213,3,[1937472,1937473],[270565,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937213''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937213,3,[1937472,1937473],[270565,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937213', NULL, CAST(N'2012-06-14 22:10:01.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (37, 11937214, N'DDF106LAND003', N'106', N'', 76, 76, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Freehold', 322000.0000, N'Vacant Land', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on ocean', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937214,3,[1937465,1937466],[270564,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937214''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937214,3,[1937465,1937466],[270564,270565],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937214', NULL, CAST(N'2012-06-14 22:10:01.000' AS DateTime))
INSERT [dbo].[Property] ([PropertyID], [PropertyDetailsID], [ListingID], [Board], [Business], [BuildingID], [LandID], [StreatAddress], [AddressLine1], [City], [Province], [PostalCode], [Country], [Features], [FarmType], [OwnershipType], [Price], [PropertyType], [PublicRemarks], [TransactionType], [UtilitiesAvailable], [ViewType], [WaterFrontType], [AnalyticsClick], [AnalyticsView], [MoreInformationLink], [AddDate], [LastUpdated]) VALUES (38, 11937215, N'DDF106LAND004', N'106', N'', 78, 78, N'1102 Ward Road', N'1102 Ward Road', N'Aylesford', N'Nova Scotia', N'B0P1C0', N'Canada', N'Acreage, Beach property, Central location', N'Animal', N'Leasehold', 500000.0000, N'Vacant Land', N'This is the general description field in English', N'For sale or rent', N'', N'City view', N'Waterfront on river', N'<![CDATA[<script type=''text/javascript''>
 function redirect() { 
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937215,3,[1937474,1937476],[270566,270567],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''click'');
event.record();
setTimeout("window.location = ''http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937215''",500);}
</script>]]>', N'<![CDATA[<script src=''http://analytics.crea.ca/crearl.js'' type=''text/javascript''></script>
<script type=''text/javascript''>
var event = new RlEvent(''crealocation'');
event.viewedProperty(11937215,3,[1937474,1937476],[270566,270567],[1937465,1937465],[0,0]);
event.set(''event'', ''type'', ''view'');
event.record();
</script>]]>', N'http://www.realtor.ca/PropertyDetails.aspx?PropertyId=11937215', NULL, CAST(N'2012-06-14 22:10:01.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Property] OFF
SET IDENTITY_INSERT [dbo].[PropertyAgent] ON 

INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (1, 7, 1)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (2, 9, 1)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (3, 10, 2)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (4, 11, 3)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (5, 12, 4)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (6, 13, 5)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (7, 14, 6)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (8, 15, 7)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (9, 16, 8)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (10, 17, 9)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (11, 18, 10)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (12, 19, 2)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (13, 20, 3)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (14, 21, 4)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (15, 22, 5)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (16, 23, 6)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (17, 24, 7)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (18, 25, 8)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (19, 26, 9)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (20, 27, 10)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (21, 28, 11)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (22, 29, 11)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (23, 30, 12)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (24, 31, 13)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (25, 32, 14)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (26, 33, 15)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (27, 34, 6)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (28, 34, 8)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (29, 35, 7)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (30, 35, 9)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (31, 36, 8)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (32, 36, 9)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (33, 37, 1)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (34, 37, 2)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (35, 38, 10)
INSERT [dbo].[PropertyAgent] ([PropertyAgentID], [PropertyID], [AgentID]) VALUES (36, 38, 12)
SET IDENTITY_INSERT [dbo].[PropertyAgent] OFF
ALTER TABLE [dbo].[Agent]  WITH CHECK ADD  CONSTRAINT [FK_Agent_Office] FOREIGN KEY([OfficeID])
REFERENCES [dbo].[Office] ([OfficeID])
GO
ALTER TABLE [dbo].[Agent] CHECK CONSTRAINT [FK_Agent_Office]
GO
ALTER TABLE [dbo].[Photo]  WITH CHECK ADD  CONSTRAINT [FK_Photo_Property] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([PropertyID])
GO
ALTER TABLE [dbo].[Photo] CHECK CONSTRAINT [FK_Photo_Property]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Building] FOREIGN KEY([BuildingID])
REFERENCES [dbo].[Building] ([BuildingID])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Building]
GO
ALTER TABLE [dbo].[Property]  WITH CHECK ADD  CONSTRAINT [FK_Property_Land] FOREIGN KEY([LandID])
REFERENCES [dbo].[Land] ([LandID])
GO
ALTER TABLE [dbo].[Property] CHECK CONSTRAINT [FK_Property_Land]
GO
ALTER TABLE [dbo].[PropertyAgent]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAgent_Agent] FOREIGN KEY([AgentID])
REFERENCES [dbo].[Agent] ([AgentID])
GO
ALTER TABLE [dbo].[PropertyAgent] CHECK CONSTRAINT [FK_PropertyAgent_Agent]
GO
ALTER TABLE [dbo].[PropertyAgent]  WITH CHECK ADD  CONSTRAINT [FK_PropertyAgent_PropertyAgent] FOREIGN KEY([PropertyID])
REFERENCES [dbo].[Property] ([PropertyID])
GO
ALTER TABLE [dbo].[PropertyAgent] CHECK CONSTRAINT [FK_PropertyAgent_PropertyAgent]
GO
