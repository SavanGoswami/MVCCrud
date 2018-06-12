USE [HotelDB]
GO
/****** Object:  UserDefinedFunction [dbo].[NvarcharToIntList]    Script Date: 12-06-2018 13:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    Create FUNCTION [dbo].[NvarcharToIntList] (@InStr VARCHAR(MAX))
    RETURNS @TempTab TABLE
       (id int not null)
    AS
    BEGIN
        ;-- Ensure input ends with comma
        SET @InStr = REPLACE(@InStr + ',', ',,', ',')
        DECLARE @SP INT
    DECLARE @VALUE VARCHAR(1000)
    WHILE PATINDEX('%,%', @INSTR ) <> 0 
    BEGIN
       SELECT  @SP = PATINDEX('%,%',@INSTR)
       SELECT  @VALUE = LEFT(@INSTR , @SP - 1)
       SELECT  @INSTR = STUFF(@INSTR, 1, @SP, '')
       INSERT INTO @TempTab(id) VALUES (@VALUE)
    END
        RETURN
    END
GO
/****** Object:  Table [dbo].[ErrorLog]    Script Date: 12-06-2018 13:18:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ErrorLog](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Type] [varchar](20) NULL,
	[FunctionName] [varchar](150) NULL,
	[InputData] [varchar](500) NULL,
	[OutputData] [varchar](500) NULL,
	[UserId] [int] NULL,
	[GroupType] [varchar](100) NULL,
	[FullErrorDescription] [varchar](max) NULL,
	[CreatedOn] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCity]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCity](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [varchar](50) NULL,
	[CountryId] [int] NOT NULL,
 CONSTRAINT [PK_tblCity] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblCountry]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblCountry](
	[CountryId] [int] IDENTITY(1,1) NOT NULL,
	[CountryName] [varchar](50) NULL,
 CONSTRAINT [PK_tblCountry] PRIMARY KEY CLUSTERED 
(
	[CountryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblHobby]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHobby](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nchar](20) NOT NULL,
 CONSTRAINT [PK_tblHobby] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[tblUser]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [varchar](50) NULL,
	[Lastname] [varchar](50) NULL,
	[Phone] [varchar](10) NULL,
	[EmailId] [varchar](50) NULL,
	[CountryId] [int] NULL,
	[CityId] [int] NULL,
	[Gender] [varchar](6) NULL,
	[PhotoUrl] [varchar](500) NULL,
	[Hobbies] [varchar](50) NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ErrorLog] ON 

INSERT [dbo].[ErrorLog] ([Id], [Type], [FunctionName], [InputData], [OutputData], [UserId], [GroupType], [FullErrorDescription], [CreatedOn]) VALUES (1, N'Error', N'DeleteUser', N'client_id: 25', N'Value cannot be null.
Parameter name: entity', 0, N'UserService', N'System.ArgumentNullException: Value cannot be null.
Parameter name: entity
   at System.Data.Entity.Utilities.Check.NotNull[T](T value, String parameterName)
   at System.Data.Entity.DbSet`1.Remove(TEntity entity)
   at MVCRegistration.BusinessAccess.Generic.GenericUnit`1.Delete(Int32 Id) in D:\Demo\MVCRegistration\MVCRegistration.BusinessAccess\Generic\GenericUnit.cs:line 83
   at MVCRegistration.BusinessAccess.Factory.Service.UserService.DeleteUser(Int32 id) in D:\Demo\MVCRegistration\MVCRegistration.BusinessAccess\Factory\Service\UserService.cs:line 123', CAST(N'2018-06-12T06:53:22.230' AS DateTime))
SET IDENTITY_INSERT [dbo].[ErrorLog] OFF
SET IDENTITY_INSERT [dbo].[tblCity] ON 

INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (2, N'Mumbai', 1)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (3, N'Delhi', 1)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (4, N'Chennai', 1)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (6, N'New York', 2)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (8, N'Los Angeles', 2)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (9, N'Chicago', 2)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (10, N'Bejing', 3)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (12, N'Wuhan', 3)
INSERT [dbo].[tblCity] ([CityId], [CityName], [CountryId]) VALUES (14, N'Dalian', 3)
SET IDENTITY_INSERT [dbo].[tblCity] OFF
SET IDENTITY_INSERT [dbo].[tblCountry] ON 

INSERT [dbo].[tblCountry] ([CountryId], [CountryName]) VALUES (1, N'India')
INSERT [dbo].[tblCountry] ([CountryId], [CountryName]) VALUES (2, N'USA')
INSERT [dbo].[tblCountry] ([CountryId], [CountryName]) VALUES (3, N'China')
SET IDENTITY_INSERT [dbo].[tblCountry] OFF
SET IDENTITY_INSERT [dbo].[tblHobby] ON 

INSERT [dbo].[tblHobby] ([ID], [Name]) VALUES (1, N'Cricket             ')
INSERT [dbo].[tblHobby] ([ID], [Name]) VALUES (2, N'Football            ')
INSERT [dbo].[tblHobby] ([ID], [Name]) VALUES (3, N'Chess               ')
INSERT [dbo].[tblHobby] ([ID], [Name]) VALUES (4, N'Reading             ')
INSERT [dbo].[tblHobby] ([ID], [Name]) VALUES (5, N'Painting            ')
SET IDENTITY_INSERT [dbo].[tblHobby] OFF
SET IDENTITY_INSERT [dbo].[tblUser] ON 

INSERT [dbo].[tblUser] ([Id], [Firstname], [Lastname], [Phone], [EmailId], [CountryId], [CityId], [Gender], [PhotoUrl], [Hobbies]) VALUES (21, N'<script>alert()</script>', N'test', N'6876435554', N'sgdjhsdjh@gmail.com', 3, 10, N'Female', NULL, N'1,2,5')
INSERT [dbo].[tblUser] ([Id], [Firstname], [Lastname], [Phone], [EmailId], [CountryId], [CityId], [Gender], [PhotoUrl], [Hobbies]) VALUES (26, N'wert', N'goswamo', N'8745123695', N'sadgsfdiu@gmail.com', 1, 3, N'Male', N'~\UploadFile\download - Copy (3).png', N'1,2,3,5')
SET IDENTITY_INSERT [dbo].[tblUser] OFF
ALTER TABLE [dbo].[tblCity]  WITH CHECK ADD  CONSTRAINT [FK_tblCity_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([CountryId])
GO
ALTER TABLE [dbo].[tblCity] CHECK CONSTRAINT [FK_tblCity_tblCountry]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblCity] FOREIGN KEY([CityId])
REFERENCES [dbo].[tblCity] ([CityId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblCity]
GO
ALTER TABLE [dbo].[tblUser]  WITH CHECK ADD  CONSTRAINT [FK_tblUser_tblCountry] FOREIGN KEY([CountryId])
REFERENCES [dbo].[tblCountry] ([CountryId])
GO
ALTER TABLE [dbo].[tblUser] CHECK CONSTRAINT [FK_tblUser_tblCountry]
GO
/****** Object:  StoredProcedure [dbo].[GetHobbyList]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Savan,,Name>
-- Create date: <11/06/2018,,>
-- Description:	<Getting hobby list,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetHobbyList]
	@UserId int 
AS
BEGIN
	SET NOCOUNT ON;
    declare @param varchar(max)
	declare @CSV varchar(max) = ''
	Select @param=Hobbies from tblUser where ID =@UserId
	SELECT @CSV = COALESCE(@CSV + ',', '') + RTRIM(hby.Name) from tblHobby hby where ID in (SELECT id FROM dbo.NvarcharToIntList(@param))
	select STUFF(@CSV,1,1,'') 
END

GO
/****** Object:  StoredProcedure [dbo].[GetHobbyListByIDForEdit]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Savan,,Name>
-- Create date: <11/06/2018,,>
-- Description:	<Getting hobby list,,>
-- =============================================
Create PROCEDURE [dbo].[GetHobbyListByIDForEdit]
	@UserId int 
AS
BEGIN
	SET NOCOUNT ON;
    declare @param varchar(max)
Select @param=Hobbies from tblUser where ID =@UserId
SELECT * , CAST(
             CASE 
                  WHEN ID in (SELECT id FROM dbo.NvarcharToIntList(@param)) 
                     THEN 1 
                  ELSE 0 
             END AS bit) as isSelected 
FROM tblHobby
END

GO
/****** Object:  StoredProcedure [dbo].[LogErrorOccured]    Script Date: 12-06-2018 13:18:50 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Create date: 07 FEB 2017
-- Description:	To log details about the exception/error occurred.
-- =============================================
CREATE PROCEDURE [dbo].[LogErrorOccured]
	@Type VARCHAR(20),
	@FunctionName VARCHAR(150),
	@InputData VARCHAR(500),
	@OutputData VARCHAR(500),	
	@UserID INT, 
	@GroupType VARCHAR(100), 
	@FullErrorDescription NVARCHAR(MAX)	
AS
BEGIN
	
	SET NOCOUNT ON;

    INSERT INTO ErrorLog ([Type], FunctionName, InputData, OutputData,  UserID, CreatedOn, GroupType, FullErrorDescription)
    VALUES (@Type, @FunctionName, @InputData, @OutputData, @UserID, GETUTCDATE(), @GroupType, @FullErrorDescription);
END
GO
