USE [master]
GO
/****** Object:  Database [TestDb]    Script Date: 3/17/2021 7:15:18 PM ******/
CREATE DATABASE [TestDb]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TestDb', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestDb.mdf' , SIZE = 4096KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'TestDb_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL11.MSSQLSERVER\MSSQL\DATA\TestDb_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [TestDb] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TestDb].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TestDb] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TestDb] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TestDb] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TestDb] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TestDb] SET ARITHABORT OFF 
GO
ALTER DATABASE [TestDb] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TestDb] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [TestDb] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TestDb] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TestDb] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TestDb] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TestDb] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TestDb] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TestDb] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TestDb] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TestDb] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TestDb] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TestDb] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TestDb] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TestDb] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TestDb] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TestDb] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TestDb] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TestDb] SET RECOVERY FULL 
GO
ALTER DATABASE [TestDb] SET  MULTI_USER 
GO
ALTER DATABASE [TestDb] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TestDb] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TestDb] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TestDb] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TestDb', N'ON'
GO
USE [TestDb]
GO
/****** Object:  StoredProcedure [dbo].[usp_StudentsAddStudent]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_StudentsAddStudent]
(
@FullName nvarchar(250),
@Email nvarchar(50),
@Mobile nvarchar(50),
@DateOfBirth DATETIME,
@Notes NVARCHAR(MAX)
)
As

Begin

Insert into Students
(
[FullName],
[Email],
[Mobile],
[DateOfBirth],
[Notes]
)
VALUES
(
@FullName ,
@Email,
@Mobile,
@DateOfBirth,
@Notes
)

End
GO
/****** Object:  StoredProcedure [dbo].[usp_StudentsDeleteStudent]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_StudentsDeleteStudent]

(



@StudentId int




)
AS


BEGIN

Delete from Students
where StudentId=@StudentId


END


GO
/****** Object:  StoredProcedure [dbo].[usp_StudentsGetAllStudents]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_StudentsGetAllStudents]
As

Begin

Select*from Students

End
GO
/****** Object:  StoredProcedure [dbo].[usp_StudentsGetStudentById]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[usp_StudentsGetStudentById]

(



@StudentId int




)
AS


BEGIN

SELECT*From Students
where StudentId=@StudentId


END


GO
/****** Object:  StoredProcedure [dbo].[usp_StudentsUpdateStudent]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create Procedure [dbo].[usp_StudentsUpdateStudent]
(
@StudentId INT,
@FullName nvarchar(250),
@Email nvarchar(50),
@Mobile nvarchar(50),
@DateOfBirth DATETIME,
@Notes NVARCHAR(MAX)
)
As

Begin
UPDATE [dbo].[Students]
   SET [FullName] = @FullName
      ,[Email] = @Email
      ,[Mobile] = @Mobile
      ,[DateOfBirth] = @DateOfBirth
      ,[Notes] = @Notes
 WHERE [StudentId]=@StudentId
End
GO
/****** Object:  Table [dbo].[Students]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Students](
	[StudentId] [int] IDENTITY(1,1) NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Email] [nvarchar](50) NOT NULL,
	[Mobile] [nvarchar](50) NOT NULL,
	[DateOfBirth] [datetime] NOT NULL,
	[Notes] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_Students] PRIMARY KEY CLUSTERED 
(
	[StudentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[StudentsFees]    Script Date: 3/17/2021 7:15:18 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentsFees](
	[StudentFeeId] [int] IDENTITY(1,1) NOT NULL,
	[StudentId] [int] NOT NULL,
	[Year] [int] NOT NULL,
	[Month] [int] NOT NULL,
 CONSTRAINT [PK_StudentFees] PRIMARY KEY CLUSTERED 
(
	[StudentFeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[Students] ON 

INSERT [dbo].[Students] ([StudentId], [FullName], [Email], [Mobile], [DateOfBirth], [Notes]) VALUES (2, N'Hafiz Umer Bin ', N'umernasir19@gmail.com', N'03333106310', CAST(0x0000ACEE00000000 AS DateTime), N'dsada')
SET IDENTITY_INSERT [dbo].[Students] OFF
ALTER TABLE [dbo].[StudentsFees]  WITH CHECK ADD  CONSTRAINT [FK_StudentsFees_Students] FOREIGN KEY([StudentId])
REFERENCES [dbo].[Students] ([StudentId])
GO
ALTER TABLE [dbo].[StudentsFees] CHECK CONSTRAINT [FK_StudentsFees_Students]
GO
USE [master]
GO
ALTER DATABASE [TestDb] SET  READ_WRITE 
GO
