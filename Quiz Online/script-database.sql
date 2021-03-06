USE [master]
GO
/****** Object:  Database [Assignment2_HongDaiDuong]    Script Date: 2/7/2021 1:19:52 PM ******/
CREATE DATABASE [Assignment2_HongDaiDuong]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Assignment2_HongDaiDuong', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_HongDaiDuong.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Assignment2_HongDaiDuong_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Assignment2_HongDaiDuong_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Assignment2_HongDaiDuong].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET ARITHABORT OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET  MULTI_USER 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET QUERY_STORE = OFF
GO
USE [Assignment2_HongDaiDuong]
GO
/****** Object:  Table [dbo].[tblAccount]    Script Date: 2/7/2021 1:19:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblAccount](
	[email] [nvarchar](50) NOT NULL,
	[name] [nvarchar](50) NULL,
	[password] [nvarchar](max) NULL,
	[isAdmin] [int] NULL,
	[status] [nchar](10) NULL,
 CONSTRAINT [PK_tblAccount] PRIMARY KEY CLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblHistoryEdit]    Script Date: 2/7/2021 1:19:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblHistoryEdit](
	[id] [int] NOT NULL,
	[time] [nvarchar](50) NULL,
	[questionID] [int] NULL,
	[question] [nvarchar](max) NULL,
	[activity] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblHistoryEdit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblQuestion]    Script Date: 2/7/2021 1:19:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblQuestion](
	[id] [int] NOT NULL,
	[question] [nvarchar](max) NULL,
	[keyA] [nvarchar](max) NULL,
	[keyB] [nvarchar](max) NULL,
	[keyC] [nvarchar](max) NULL,
	[keyD] [nvarchar](max) NULL,
	[correct] [nvarchar](max) NULL,
	[createDate] [nvarchar](max) NULL,
	[subjectID] [int] NULL,
	[isDelete] [int] NULL,
 CONSTRAINT [PK_tblQuestion] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubject]    Script Date: 2/7/2021 1:19:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubject](
	[subjectID] [int] NOT NULL,
	[subjectCode] [nchar](10) NULL,
	[description] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSubject] PRIMARY KEY CLUSTERED 
(
	[subjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubmit]    Script Date: 2/7/2021 1:19:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubmit](
	[id] [int] NOT NULL,
	[subjectID] [int] NULL,
	[correct] [nvarchar](50) NULL,
	[point] [float] NULL,
	[startTime] [nvarchar](50) NULL,
	[endTime] [nvarchar](50) NULL,
	[email] [nvarchar](50) NULL,
 CONSTRAINT [PK_tblSubmit] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSubmitDetail]    Script Date: 2/7/2021 1:19:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSubmitDetail](
	[submitID] [int] NOT NULL,
	[questionID] [int] NOT NULL,
	[question] [nvarchar](max) NULL,
	[correctAnswer] [nvarchar](max) NULL,
	[studentAnswer] [nvarchar](max) NULL,
 CONSTRAINT [PK_tblSubmitDetail] PRIMARY KEY CLUSTERED 
(
	[submitID] ASC,
	[questionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[tblAccount] ([email], [name], [password], [isAdmin], [status]) VALUES (N'abc123@gmail.com', N'Nguyễn Văn A', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, N'new       ')
INSERT [dbo].[tblAccount] ([email], [name], [password], [isAdmin], [status]) VALUES (N'abc321@fpt.edu.vn', N'Trần Văn XX', N'dd130a849d7b29e5541b05d2f7f86a4acd4f1ec598c1c9438783f56bc4f0ff80', 0, N'new       ')
INSERT [dbo].[tblAccount] ([email], [name], [password], [isAdmin], [status]) VALUES (N'duong123@gmail.com', N'Hồng Đại Dương', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 1, N'new       ')
INSERT [dbo].[tblAccount] ([email], [name], [password], [isAdmin], [status]) VALUES (N'duong456@gmail.com', N'Nguyễn Thùy Dương', N'a320480f534776bddb5cdb54b1e93d210a3c7d199e80a23c1b2178497b184c76', 0, N'new       ')
INSERT [dbo].[tblAccount] ([email], [name], [password], [isAdmin], [status]) VALUES (N'xyz@fpt.edu.vn', N'Trần Văn X', N'8d969eef6ecad3c29a3a629280e686cf0c3f5d5a86aff3ca12020c923adc6c92', 0, N'new       ')
INSERT [dbo].[tblHistoryEdit] ([id], [time], [questionID], [question], [activity], [email]) VALUES (1, N'07/02/2021 12:50:43', 53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Delete', N'duong123@gmail.com')
INSERT [dbo].[tblHistoryEdit] ([id], [time], [questionID], [question], [activity], [email]) VALUES (2, N'07/02/2021 12:51:44', 52, N'According to the ISTQB Glossary, the
word ''bug'' is synonymous with which of the
following words?', N'Delete', N'duong123@gmail.com')
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (1, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (2, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (3, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (4, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (5, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (7, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (8, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (9, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (11, N'The ______ class is the primary class that has the driver information.', N'Driver', N'DriverManager', N'ODBCDriver', N'None of the other choices', N'DriverManager', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (12, N'JDBC supports ______ and ______ models.
choose one answer', N'Three-tier and four-tier', N'Two-tier and three-tier', N'None of the other choices', N'Single-tier and two-tier', N'Two-tier and three-tier', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (13, N'Data Integrity is the biggest issue for your web application. What will you do?', N'Use HTTPS instead of HTTP', N'Use LDAP to store user credentials', N'Use HTTP digest authentication', N'Use form-based authentication', N'Use form-based authentication', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (14, N'Which is true about JDBC?', N'The JDBC API is an extension of the ODBC API', N'All JDBC drivers are pure Java', N'JDBC is used to connect to MOM (Message-Oriented Middleware Product)', N'The JDBC API is included in J2SE', N'The JDBC API is included in J2SE', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (15, N'What is the purpose of JNDI?', N'To access various derictory services using a single interface', N'To register Java Web Start applications with a web server', N'To parse XML documents', N'To access native code from Java application', N'To access various derictory services using a single interface', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (16, N'Poor software characteristics are', N'Only Project risks', N'Only Product risks', N'Project risks and Product risks', N'Project risks or Product risks', N'Only Product risks', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (17, N'Reviews, static analysis and dynamic testing have the same objective', N'Identifying defects', N'Fixing defects', N'A and B', N'None of the above', N'Identifying defects', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (18, N'What is the name of a skeletal implementation of a software component that is used for testing?', N'Use case', N'Domain', N'Driver', N'Stub', N'Stub', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (19, N'Which of the following is a KEY test control task?', N'Initiating corrective actions', N'Determining the scope', N'Implementing the test policy', N'Scheduling test implementation', N'Initiating corrective actions', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (20, N'With which of the following categories is a test comparator tool USUALLY associated?', N'Tool support for performance and monitoring', N'Tool support for static testing', N'Tool support for test execution and logging', N'Tool support for the management of testing and tests', N'Tool support for test execution and logging', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (21, N'What is the purpose of exit criteria?', N'To define when a test level is complete', N'To determine when a test has completed', N'To identify when a software system should be retired', N'To determine whether a test has passed', N'To define when a test level is complete', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (22, N'Which test design technique relies heavily on prior thorough knowledge of the system?', N'Data driven testing technique', N'Experience-based technique', N'White-box technique', N'Structure-based technique', N'Experience-based technique', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (23, N'When should configuration management procedures be implemented?', N'During test planning', N'During test analysis', N'During test execution', N'When evaluating exit criteria', N'During test planning', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (24, N'Which activity in the fundamental test process creates test suites for efficient test execution?', N'Implementation and execution', N'Planning and control', N'Analysis and design', N'Test closure', N'Implementation and execution', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (25, N'Which of the following is a KEY test closure task?', N'Ensuring proper environment setup', N'Writing a test summary report', N'Assessing the need for additional tests', N'Finalizing and archiving testware', N'Finalizing and archiving testware', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (26, N'In software testing what is the main purpose of exit criteria?', N'To enhance the security of the system', N'To prevent the endless loops in code', N'To swerve as an alternative or Plan-B', N'To define when to stop testing', N'To define when to stop testing', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (27, N'Which of the following defines the expected results of a test?', N'Test case specification', N'Test design specification', N'Test procedure specification', N'Test results', N'Test case specification', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (28, N'Who would USUALLY perform debugging activities?', N'Developers', N'Analysts', N'Testers', N'Incident Managers', N'Developers', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (29, N'Who typically use static analysis tools?', N'Customers and users', N'Developers and designers', N'Business and systems analysts', N'System and acceptance testers', N'Developers and designers', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (30, N'Which is NOT provided by the EJB tier in a multitier JEE (J2EE) application?', N'XML Parsing', N'Concurrency control', N'Transaction management', N'Security', N'XML Parsing', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (31, N'Which of the following is NOT a standard technique for providing a sense of "state" to HTTP?', N'SSL Sessions', N'HTTP is already a stateful protocol.', N'Cookies', N'URL rewriting', N'HTTP is already a stateful protocol.', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (32, N'Which Java technology provides a unified interface to multiple naming and directory services?', N'JNI', N'JDBC', N'JNDI', N'EJB', N'JNDI', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (33, N'Which of the elements defined within the taglib element of taglib descriptor file are required?', N'taguri', N'info', N'taglib-location', N'display-name', N'taglib-location', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (34, N'Which JSP directive declares the usage of a tag library in a JSP page?', N'taglib', N'import', N'page', N'tag-lib', N'taglib', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (35, N'Which element defined within the taglib element of taglib descriptor file is required?', N'Tag', N'Description', N'Validator', N'Name', N'Tag', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (36, N'Which HTTP method is used in FORM based Authentication?', N'POST', N'GET', N'FORM', N'HEAD', N'POST', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (37, N'Which of the following JSP variable is not available within a JSP expression?', N'out', N'session', N'response', N'httpsession', N'httpsession', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (38, N'The session time-out value is controlled in which way(s)?', N'Application Server Global Default', N'Web Application Default', N'Individual Session Setting', N'All of the others', N'All of the others', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (39, N'A(n) _______ enables a web application to obtain a Connection to a database.', N'Web server', N'DataSource', N'Netbean', N'Eclipse', N'DataSource', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (40, N'Which of these is legal attribute of page directive?', N'include', N'scope', N'errorPage', N'debug', N'errorPage', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (41, N'is the well-known host name that refers to your own computer.', N'Computer Name', N'Ip', N'Localhost', N'DNS', N'Localhost', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (42, N'Which of the following is a MAJOR task of test planning?', N'Scheduling test analysis and design tasks', N'Initiating corrective actions', N'Monitoring progress and test coverage', N'Measuring and analyzing results', N'Scheduling test analysis and design tasks', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (46, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 20:39:38', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (47, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (48, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (49, N'______ is a set of java API for executing SQL statements.', N'ODBC', N'JAVADB', N'None of the other choices', N'JDBC', N'JDBC', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (50, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (51, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 20:39:38', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (52, N'According to the ISTQB Glossary, the
word ''bug'' is synonymous with which of the
following words?', N'Incident', N'Defect', N'Mistake', N'Error', N'Defect', N'25/01/2021 20:39:38', 2, 1)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Test principles only affect the preparation for
testing', N'Test principles only affect test execution activities', N'Test principles affect the early test activities such
as review', N'Test principles affect activities throughout the test
life cycle', N'Test principles affect activities throughout the test
life cycle', N'25/01/2021 21:19:55', 2, 1)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (54, N'Which is NOT Enterprise Beans?', N'Message-Driven Beans', N'Business Beans', N'Entity Beans', N'Session Beans', N'Business Beans', N'25/01/2021 22:41:46', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative feedback to the tester', N'Negative consequences that will occur', N'Negative consequences that could occur', N'Negative consequences for the test object', N'Negative consequences that could occur', N'25/01/2021 22:42:51', 2, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (56, N'How are you today ?', N'No, thanks', N'I''m fine thank you and you', N'I don''t know', N'Yes', N'I''m fine thank you and you', N'26/01/2021 21:48:40', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'scripting elements', N'HTML code', N'directives', N'actions', N'26/01/2021 22:21:00', 1, 0)
INSERT [dbo].[tblQuestion] ([id], [question], [keyA], [keyB], [keyC], [keyD], [correct], [createDate], [subjectID], [isDelete]) VALUES (58, N'Which of the following is the standard for the Software product quality', N'ISO 9126', N'ISO 829', N'ISO 1012', N'ISO 1028', N'ISO 9126', N'07/02/2021 12:36:55', 2, 0)
INSERT [dbo].[tblSubject] ([subjectID], [subjectCode], [description]) VALUES (1, N'PRJ321    ', N'Web-based Java Applications')
INSERT [dbo].[tblSubject] ([subjectID], [subjectCode], [description]) VALUES (2, N'SWT301    ', N'Software Testing')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (1, 2, N'6/10', 6, N'30/01/2021 20:10:08', N'30/01/2021 20:18:26', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (2, 1, N'8/10', 8, N'30/01/2021 21:14:37', N'30/01/2021 21:39:26', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (3, 1, N'1/10', 1, N'30/01/2021 22:25:52', N'30/01/2021 22:26:47', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (4, 1, N'1/10', 1, N'31/01/2021 11:55:33', N'31/01/2021 11:56:10', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (5, 1, N'8/10', 8, N'31/01/2021 11:56:27', N'31/01/2021 11:56:51', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (6, 1, N'0/10', 0, N'31/01/2021 11:57:16', N'31/01/2021 11:57:37', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (7, 1, N'1/10', 1, N'31/01/2021 11:58:00', N'31/01/2021 11:58:23', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (8, 2, N'10/10', 10, N'31/01/2021 13:48:43', N'31/01/2021 13:49:14', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (9, 1, N'6/10', 6, N'31/01/2021 14:09:00', N'31/01/2021 14:13:51', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (10, 2, N'10/10', 10, N'31/01/2021 14:14:43', N'31/01/2021 14:18:43', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (11, 1, N'8/10', 8, N'01/02/2021 20:10:20', N'01/02/2021 20:29:48', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (12, 2, N'8/10', 8, N'01/02/2021 20:57:05', N'01/02/2021 20:57:35', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (13, 2, N'8/10', 8, N'01/02/2021 21:02:57', N'01/02/2021 21:03:37', N'duong456@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (14, 1, N'7/10', 7, N'01/02/2021 21:04:36', N'01/02/2021 21:05:11', N'duong456@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (15, 2, N'2/10', 2, N'01/02/2021 21:06:32', N'01/02/2021 21:07:35', N'duong456@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (16, 2, N'4/10', 4, N'07/02/2021 12:41:47', N'07/02/2021 12:42:51', N'abc123@gmail.com')
INSERT [dbo].[tblSubmit] ([id], [subjectID], [correct], [point], [startTime], [endTime], [email]) VALUES (17, 1, N'9/10', 9, N'07/02/2021 12:55:20', N'07/02/2021 12:56:49', N'duong456@gmail.com')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 7, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 9, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 46, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Test principles affect activities throughout the test
life cycle', N'Test principles only affect test execution activities')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (1, 55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences for the test object')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'JAVADB')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (2, 56, N'How are you today ?', N'I''m fine thank you and you', N'I''m fine thank you and you')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'No Answer')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 47, N'Which is NOT Enterprise Beans?', N'Business Beans', N'No Answer')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 56, N'How are you today ?', N'I''m fine thank you and you', N'I''m fine thank you and you')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (3, 57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'scripting elements')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 47, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'ODBC')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 56, N'How are you today ?', N'I''m fine thank you and you', N'No, thanks')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (4, 57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'actions')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 47, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'JAVADB')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 56, N'How are you today ?', N'I''m fine thank you and you', N'I''m fine thank you and you')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (5, 57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'scripting elements')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 47, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'None of the other choices')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 56, N'How are you today ?', N'I''m fine thank you and you', N'I don''t know')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (6, 57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'HTML code')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'JDBC')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 56, N'How are you today ?', N'I''m fine thank you and you', N'Yes')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (7, 57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'directives')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 7, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 8, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 46, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 52, N'According to the ISTQB Glossary, the
word ''bug'' is synonymous with which of the
following words?', N'Defect', N'Defect')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (8, 55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Session Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'JAVADB')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Entity Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (9, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 7, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 8, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 9, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 46, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 52, N'According to the ISTQB Glossary, the
word ''bug'' is synonymous with which of the
following words?', N'Defect', N'Defect')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (10, 55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
GO
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 49, N'______ is a set of java API for executing SQL statements.', N'JDBC', N'JAVADB')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 54, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 56, N'How are you today ?', N'I''m fine thank you and you', N'I''m fine thank you and you')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (11, 57, N'Which is NOT the main type of JSP constructs that you embed in a page?', N'actions', N'scripting elements')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 7, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 9, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 52, N'According to the ISTQB Glossary, the
word ''bug'' is synonymous with which of the
following words?', N'Defect', N'Mistake')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Test principles affect activities throughout the test
life cycle', N'Test principles affect the early test activities such
as review')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (12, 55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 8, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 9, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 46, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Test principles affect activities throughout the test
life cycle', N'Test principles affect the early test activities such
as review')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (13, 55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 1, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 2, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 3, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 47, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 50, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (14, 56, N'How are you today ?', N'I''m fine thank you and you', N'I''m fine thank you and you')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that will occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 8, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that will occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 10, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that will occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 44, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that could occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 45, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that will occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 46, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that will occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 52, N'According to the ISTQB Glossary, the
word ''bug'' is synonymous with which of the
following words?', N'Defect', N'Mistake')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Test principles affect activities throughout the test
life cycle', N'Test principles only affect test execution activities')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (15, 55, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative consequences that will occur')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 6, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 8, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 9, N'According to the ISTQB Glossary, a risk
relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 16, N'Poor software characteristics are', N'Only Product risks', N'Only Project risks')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 21, N'What is the purpose of exit criteria?', N'To define when a test level is complete', N'To define when a test level is complete')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 27, N'Which of the following defines the expected results of a test?', N'Test case specification', N'Test case specification')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 42, N'Which of the following is a MAJOR task of test planning?', N'Scheduling test analysis and design tasks', N'Scheduling test analysis and design tasks')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 43, N'According to the ISTQB Glossary, a risk relates to which of the following?', N'Negative consequences that could occur', N'Negative feedback to the tester')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 53, N'Which of the statements below is the
best assessment of how the test principles apply
across the test life cycle?', N'Test principles affect activities throughout the test
life cycle', N'Test principles only affect the preparation for
testing')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (16, 58, N'Which of the following is the standard for the Software product quality', N'ISO 9126', N'ISO 9126')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 4, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 5, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Message-Driven Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 11, N'The ______ class is the primary class that has the driver information.', N'DriverManager', N'DriverManager')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 30, N'Which is NOT provided by the EJB tier in a multitier JEE (J2EE) application?', N'XML Parsing', N'XML Parsing')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 31, N'Which of the following is NOT a standard technique for providing a sense of "state" to HTTP?', N'HTTP is already a stateful protocol.', N'HTTP is already a stateful protocol.')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 34, N'Which JSP directive declares the usage of a tag library in a JSP page?', N'taglib', N'taglib')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 36, N'Which HTTP method is used in FORM based Authentication?', N'POST', N'POST')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 47, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 48, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
INSERT [dbo].[tblSubmitDetail] ([submitID], [questionID], [question], [correctAnswer], [studentAnswer]) VALUES (17, 51, N'Which is NOT Enterprise Beans?', N'Business Beans', N'Business Beans')
ALTER TABLE [dbo].[tblHistoryEdit]  WITH CHECK ADD  CONSTRAINT [FK_tblHistoryEdit_tblAccount] FOREIGN KEY([email])
REFERENCES [dbo].[tblAccount] ([email])
GO
ALTER TABLE [dbo].[tblHistoryEdit] CHECK CONSTRAINT [FK_tblHistoryEdit_tblAccount]
GO
ALTER TABLE [dbo].[tblHistoryEdit]  WITH CHECK ADD  CONSTRAINT [FK_tblHistoryEdit_tblQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([id])
GO
ALTER TABLE [dbo].[tblHistoryEdit] CHECK CONSTRAINT [FK_tblHistoryEdit_tblQuestion]
GO
ALTER TABLE [dbo].[tblQuestion]  WITH CHECK ADD  CONSTRAINT [FK_tblQuestion_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblQuestion] CHECK CONSTRAINT [FK_tblQuestion_tblSubject]
GO
ALTER TABLE [dbo].[tblSubmit]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmit_tblAccount] FOREIGN KEY([email])
REFERENCES [dbo].[tblAccount] ([email])
GO
ALTER TABLE [dbo].[tblSubmit] CHECK CONSTRAINT [FK_tblSubmit_tblAccount]
GO
ALTER TABLE [dbo].[tblSubmit]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmit_tblSubject] FOREIGN KEY([subjectID])
REFERENCES [dbo].[tblSubject] ([subjectID])
GO
ALTER TABLE [dbo].[tblSubmit] CHECK CONSTRAINT [FK_tblSubmit_tblSubject]
GO
ALTER TABLE [dbo].[tblSubmitDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmitDetail_tblQuestion] FOREIGN KEY([questionID])
REFERENCES [dbo].[tblQuestion] ([id])
GO
ALTER TABLE [dbo].[tblSubmitDetail] CHECK CONSTRAINT [FK_tblSubmitDetail_tblQuestion]
GO
ALTER TABLE [dbo].[tblSubmitDetail]  WITH CHECK ADD  CONSTRAINT [FK_tblSubmitDetail_tblSubmit] FOREIGN KEY([submitID])
REFERENCES [dbo].[tblSubmit] ([id])
GO
ALTER TABLE [dbo].[tblSubmitDetail] CHECK CONSTRAINT [FK_tblSubmitDetail_tblSubmit]
GO
USE [master]
GO
ALTER DATABASE [Assignment2_HongDaiDuong] SET  READ_WRITE 
GO
