USE [master]
GO
/****** Object:  Database [УчебнаяВласов]    Script Date: 17.05.2025 10:13:32 ******/
CREATE DATABASE [УчебнаяВласов]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'УчебнаяВласов', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\УчебнаяВласов.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'УчебнаяВласов_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SQLEXPRESS\MSSQL\DATA\УчебнаяВласов_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [УчебнаяВласов] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [УчебнаяВласов].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [УчебнаяВласов] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET ARITHABORT OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [УчебнаяВласов] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [УчебнаяВласов] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET  DISABLE_BROKER 
GO
ALTER DATABASE [УчебнаяВласов] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [УчебнаяВласов] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [УчебнаяВласов] SET  MULTI_USER 
GO
ALTER DATABASE [УчебнаяВласов] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [УчебнаяВласов] SET DB_CHAINING OFF 
GO
ALTER DATABASE [УчебнаяВласов] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [УчебнаяВласов] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [УчебнаяВласов] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [УчебнаяВласов] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [УчебнаяВласов] SET QUERY_STORE = ON
GO
ALTER DATABASE [УчебнаяВласов] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [УчебнаяВласов]
GO
/****** Object:  User [Proba]    Script Date: 17.05.2025 10:13:32 ******/
CREATE USER [Proba] FOR LOGIN [Proba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [Doritov_Sec]    Script Date: 17.05.2025 10:13:32 ******/
CREATE USER [Doritov_Sec] FOR LOGIN [Doritov_Sec] WITH DEFAULT_SCHEMA=[Doritov_Sec]
GO
/****** Object:  User [Bedarov_Adm]    Script Date: 17.05.2025 10:13:32 ******/
CREATE USER [Bedarov_Adm] FOR LOGIN [Bedarov_Adm] WITH DEFAULT_SCHEMA=[Bedarov_Adm]
GO
/****** Object:  DatabaseRole [TEACHER]    Script Date: 17.05.2025 10:13:33 ******/
CREATE ROLE [TEACHER]
GO
/****** Object:  DatabaseRole [SECRETARY]    Script Date: 17.05.2025 10:13:33 ******/
CREATE ROLE [SECRETARY]
GO
/****** Object:  DatabaseRole [ADMIN]    Script Date: 17.05.2025 10:13:33 ******/
CREATE ROLE [ADMIN]
GO
ALTER ROLE [db_owner] ADD MEMBER [Proba]
GO
ALTER ROLE [ADMIN] ADD MEMBER [Bedarov_Adm]
GO
/****** Object:  Schema [ADMIN]    Script Date: 17.05.2025 10:13:33 ******/
CREATE SCHEMA [ADMIN]
GO
/****** Object:  Schema [Bedarov_Adm]    Script Date: 17.05.2025 10:13:33 ******/
CREATE SCHEMA [Bedarov_Adm]
GO
/****** Object:  Schema [Doritov_Sec]    Script Date: 17.05.2025 10:13:33 ******/
CREATE SCHEMA [Doritov_Sec]
GO
/****** Object:  Schema [SECRETARY]    Script Date: 17.05.2025 10:13:33 ******/
CREATE SCHEMA [SECRETARY]
GO
/****** Object:  Schema [TEACHER]    Script Date: 17.05.2025 10:13:33 ******/
CREATE SCHEMA [TEACHER]
GO
/****** Object:  Table [dbo].[Академики]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Академики](
	[Фамилия] [nvarchar](255) NULL,
	[Имя] [nvarchar](255) NULL,
	[Отчество] [nvarchar](255) NULL,
	[Дата_рождения] [datetime] NULL,
	[Специализация] [nvarchar](255) NULL,
	[Год_присвоения_звания] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Дисциплина]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Дисциплина](
	[Код] [int] NOT NULL,
	[Объем] [int] NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
	[Исполнители] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Дисципли__AE76132EB2AFD899] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Зав_кафедрой]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Зав_кафедрой](
	[Таб_номер] [int] NOT NULL,
	[Стаж] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заявка]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заявка](
	[Код] [int] NOT NULL,
	[Номер] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Код] ASC,
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Инженер]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Инженер](
	[Таб_номер] [int] NOT NULL,
	[Специальность] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Кафедра]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Кафедра](
	[Шифр] [nvarchar](255) NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
	[Факультет] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Кафедра__6900EEE6C99ABF9B] PRIMARY KEY CLUSTERED 
(
	[Шифр] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Преподаватель]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Преподаватель](
	[Таб_номер] [int] NOT NULL,
	[Звание] [nvarchar](255) NOT NULL,
	[Степень] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Преподав__9398F8D9A8B88257] PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Сотрудник]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Сотрудник](
	[Таб_номер] [int] NOT NULL,
	[Кафедра] [nvarchar](255) NULL,
	[ФИО] [nvarchar](255) NULL,
	[Должность] [nvarchar](255) NULL,
	[Зарплата] [decimal](10, 2) NULL,
	[Начальник] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Специальность]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Специальность](
	[Номер] [nvarchar](255) NOT NULL,
	[Направление] [nvarchar](255) NOT NULL,
	[Шифр] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Специаль__063C4BF66E9B2C1B] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Страны]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Страны](
	[Название] [nvarchar](255) NULL,
	[Столица] [nvarchar](255) NULL,
	[Площадь] [float] NULL,
	[Население] [float] NULL,
	[Континент] [nvarchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Студент]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Студент](
	[Рег_номер] [int] NOT NULL,
	[Номер] [nvarchar](255) NOT NULL,
	[Фамилия] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Студент__7C2075B918EE6AAD] PRIMARY KEY CLUSTERED 
(
	[Рег_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Факультет]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Факультет](
	[Аббревиатура] [nvarchar](255) NOT NULL,
	[Название] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK__Факульте__FDFD878688973C4E] PRIMARY KEY CLUSTERED 
(
	[Аббревиатура] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Экзамен]    Script Date: 17.05.2025 10:13:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Экзамен](
	[Код_Экзамена] [int] NOT NULL,
	[Дата] [date] NOT NULL,
	[Код] [int] NOT NULL,
	[Рег_номер] [int] NOT NULL,
	[Таб_номер] [int] NOT NULL,
	[Аудитория] [nvarchar](4) NOT NULL,
	[Оценка] [int] NOT NULL,
 CONSTRAINT [PK__Экзамен__327441B58168560D] PRIMARY KEY CLUSTERED 
(
	[Код_Экзамена] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Аничков', N'Николай', N'Николаевич', CAST(N'1885-11-03T00:00:00.000' AS DateTime), N'медицина', 1939)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Бартольд', N'Василий', N'Владимирович', CAST(N'1869-11-15T00:00:00.000' AS DateTime), N'историк', 1913)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Белопольский', N'Аристарх', N'Аполлонович', CAST(N'1854-07-13T00:00:00.000' AS DateTime), N'астрофизик', 1903)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Бородин', N'Иван', N'Парфеньевич', CAST(N'1847-01-30T00:00:00.000' AS DateTime), N'ботаник', 1902)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Вальден', N'Павел', N'Иванович', CAST(N'1863-07-26T00:00:00.000' AS DateTime), N'химик-технолог', 1910)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Вернадский', N'Владимир', N'Иванович', CAST(N'1863-03-12T00:00:00.000' AS DateTime), N'геохимик', 1908)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Виноградов', N'Павел', N'Гаврилович', CAST(N'1854-11-30T00:00:00.000' AS DateTime), N'историк', 1914)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Ипатьев', N'Владимир', N'Николаевич', CAST(N'1867-11-21T00:00:00.000' AS DateTime), N'химик', 1916)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Истрин', N'Василий', N'Михайлович', CAST(N'1865-02-22T00:00:00.000' AS DateTime), N'филолог', 1907)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Карпинский', N'Александр', N'Петрович', CAST(N'1847-01-07T00:00:00.000' AS DateTime), N'геолог', 1889)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Коковцов', N'Павел', N'Константинович', CAST(N'1861-07-01T00:00:00.000' AS DateTime), N'историк', 1906)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Курнаков', N'Николай', N'Семёнович', CAST(N'1860-12-06T00:00:00.000' AS DateTime), N'химик', 1913)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Марр', N'Николай', N'Яковлевич', CAST(N'1865-01-06T00:00:00.000' AS DateTime), N'лингвист', 1912)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Насонов', N'Николай', N'Викторович', CAST(N'1855-02-26T00:00:00.000' AS DateTime), N'зоолог', 1906)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Ольденбург', N'Сергей', N'Фёдорович', CAST(N'1863-09-26T00:00:00.000' AS DateTime), N'историк', 1903)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Павлов', N'Иван', N'Петрович', CAST(N'1849-09-26T00:00:00.000' AS DateTime), N'физиолог', 1907)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Перетц', N'Владимир', N'Николаевич', CAST(N'1870-01-31T00:00:00.000' AS DateTime), N'филолог', 1914)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Соболевский', N'Алексей', N'Иванович', CAST(N'1857-01-07T00:00:00.000' AS DateTime), N'лингвист', 1900)
INSERT [dbo].[Академики] ([Фамилия], [Имя], [Отчество], [Дата_рождения], [Специализация], [Год_присвоения_звания]) VALUES (N'Стеклов', N'Владимир', N'Андреевич', CAST(N'1864-01-09T00:00:00.000' AS DateTime), N'математик', 1912)
GO
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (101, 320, N'Математика', N'вм')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (102, 160, N'Информатика', N'пи')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (103, 160, N'Физика', N'оф')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (202, 120, N'Базы данных', N'ис')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (204, 160, N'Электроника', N'эф')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (205, 80, N'Программирование', N'пи')
INSERT [dbo].[Дисциплина] ([Код], [Объем], [Название], [Исполнители]) VALUES (209, 80, N'Моделирование', N'мм')
GO
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (101, 15)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (201, 18)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (301, 20)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (401, 10)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (501, 18)
INSERT [dbo].[Зав_кафедрой] ([Таб_номер], [Стаж]) VALUES (601, 8)
GO
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (101, N'01.03.04')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (101, N'09.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (101, N'09.03.03')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (101, N'14.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (101, N'38.03.05')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (102, N'09.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (102, N'09.03.03')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (102, N'14.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (103, N'09.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (103, N'09.03.03')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (103, N'14.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (103, N'38.03.05')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (202, N'09.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (202, N'09.03.03')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (202, N'38.03.05')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (204, N'14.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (205, N'01.03.04')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (205, N'09.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (205, N'09.03.03')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (209, N'01.03.04')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (209, N'09.03.02')
INSERT [dbo].[Заявка] ([Код], [Номер]) VALUES (209, N'38.03.05')
GO
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (153, N'электроник')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (241, N'электроник')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (242, N'программист')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (435, N'электроник')
INSERT [dbo].[Инженер] ([Таб_номер], [Специальность]) VALUES (614, N'программист')
GO
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'вм', N'Высшая математика', N'Ен')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'ис', N'Информационные системы', N'Ит')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'мм', N'Математическое моделирование', N'Фм')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'оф', N'Общая физика', N'Ен')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'пи', N'Прикладная информатика', N'Ит')
INSERT [dbo].[Кафедра] ([Шифр], [Название], [Факультет]) VALUES (N'эф', N'Экспериментальная физика', N'Фм')
GO
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (101, N'профессор', N'д. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (102, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (105, N'доцент', N'к. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (201, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (202, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (301, N'профессор', N'д. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (302, N'доцент', N'к. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (401, N'профессор', N'д. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (402, N'доцент', N'к. т.н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (403, N'ассистент', N'–')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (501, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (502, N'профессор', N'д. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (503, N'доцент', N'к. ф.-м. н.')
INSERT [dbo].[Преподаватель] ([Таб_номер], [Звание], [Степень]) VALUES (601, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (101, N'пи', N'Прохоров П.П.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 101)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (102, N'пи', N'Семенов С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 101)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (105, N'пи', N'Петров П.П.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 101)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (153, N'пи', N'Сидорова С.С.', N'инженер', CAST(15000.00 AS Decimal(10, 2)), 102)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (201, N'ис', N'Андреев А.А.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 201)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (202, N'ис', N'Борисов Б.Б.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 201)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (241, N'ис', N'Глухов Г.Г.', N'инженер', CAST(20000.00 AS Decimal(10, 2)), 201)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (242, N'ис', N'Чернов Ч.Ч.', N'инженер', CAST(15000.00 AS Decimal(10, 2)), 202)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (301, N'мм', N'Басов Б.Б.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 301)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (302, N'мм', N'Сергеева С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 301)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (401, N'оф', N'Волков В.В.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 401)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (402, N'оф', N'Зайцев З.З.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 401)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (403, N'оф', N'Смирнов С.С.', N'преподаватель', CAST(15000.00 AS Decimal(10, 2)), 401)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (435, N'оф', N'Лисин Л.Л.', N'инженер', CAST(20000.00 AS Decimal(10, 2)), 402)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (501, N'вм', N'Кузнецов К.К.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 501)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (502, N'вм', N'Романцев Р.Р.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 501)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (503, N'вм', N'Соловьев С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 501)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (601, N'эф', N'Зверев З.З.', N'зав. кафедрой', CAST(35000.00 AS Decimal(10, 2)), 601)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (602, N'эф', N'Сорокина С.С.', N'преподаватель', CAST(25000.00 AS Decimal(10, 2)), 601)
INSERT [dbo].[Сотрудник] ([Таб_номер], [Кафедра], [ФИО], [Должность], [Зарплата], [Начальник]) VALUES (614, N'эф', N'Григорьев Г.Г.', N'инженер', CAST(20000.00 AS Decimal(10, 2)), 602)
GO
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'01.03.04', N'Прикладная математика', N'мм')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'09.03.02', N'Информационные системы и технологии', N'ис')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'09.03.03', N'Прикладная информатика', N'пи')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'14.03.02', N'Ядерные физика и технологии', N'эф')
INSERT [dbo].[Специальность] ([Номер], [Направление], [Шифр]) VALUES (N'38.03.05', N'Бизнес-информатика', N'ис')
GO
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Австрия', N'Вена', 83858, 8741753, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Азербайджан', N'Баку', 86600, 9705600, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Албания', N'Тирана', 28748, 2866026, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Алжир', N'Алжир', 2381740, 39813722, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Ангола', N'Луанда', 1246700, 25831000, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Аргентина', N'Буэнос-Айрес', 2766890, 43847000, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Афганистан', N'Кабул', 647500, 29822848, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бангладеш', N'Дакка', 144000, 160221000, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бахрейн', N'Манама', 701, 1397000, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Белиз', N'Бельмопан', 22966, 377968, N'Северная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Белоруссия', N'Минск', 207595, 9498400, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бельгия', N'Брюссель', 30528, 11250585, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бенин', N'Порто-Ново', 112620, 11167000, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Болгария', N'София', 110910, 7153784, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Боливия', N'Сукре', 1098580, 10985059, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Ботсвана', N'Габороне', 600370, 2209208, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бразилия', N'Бразилиа', 8511965, 206081432, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Буркина-Фасо', N'Уагадугу', 274200, 19034397, N'Африка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Бутан', N'Тхимпху', 47000, 784000, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Великобритания', N'Лондон', 244820, 65341183, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Венгрия', N'Будапешт', 93030, 9830485, N'Европа')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Венесуэла', N'Каракас', 912050, 31028637, N'Южная Америка')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Восточный Тимор', N'Дили', 14874, 1167242, N'Азия')
INSERT [dbo].[Страны] ([Название], [Столица], [Площадь], [Население], [Континент]) VALUES (N'Вьетнам', N'Ханой', 329560, 91713300, N'Азия')
GO
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (10101, N'09.03.03', N'Николаева Н. Н.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (10102, N'09.03.03', N'Иванов И. И.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (10103, N'09.03.03', N'Крюков К. К.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (20101, N'09.03.02', N'Андреев А. А.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (20102, N'09.03.02', N'Федоров Ф. Ф.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (30101, N'14.03.02', N'Бондаренко Б. Б.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (30102, N'14.03.02', N'Цветков К. К.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (30103, N'14.03.02', N'Петров П. П.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (50101, N'01.03.04', N'Сергеев С. С.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (50102, N'01.03.04', N'Кудрявцев К. К.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (80101, N'38.03.05', N'Макаров М. М.')
INSERT [dbo].[Студент] ([Рег_номер], [Номер], [Фамилия]) VALUES (80102, N'38.03.05', N'Яковлев Я. Я.')
GO
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Гн', N'Гуманитарные науки')
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Ен', N'Естественные науки')
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Ит', N'Информационные технологии')
INSERT [dbo].[Факультет] ([Аббревиатура], [Название]) VALUES (N'Фм', N'Физико-математический')
GO
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (1, CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (2, CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (3, CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (4, CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (5, CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (6, CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (7, CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (8, CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (9, CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (10, CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (11, CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (12, CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (13, CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (14, CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (15, CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (16, CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (17, CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (18, CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (19, CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
INSERT [dbo].[Экзамен] ([Код_Экзамена], [Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (20, CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
GO
ALTER TABLE [dbo].[Дисциплина]  WITH CHECK ADD  CONSTRAINT [FK__Дисциплин__Испол__6D0D32F4] FOREIGN KEY([Исполнители])
REFERENCES [dbo].[Кафедра] ([Шифр])
GO
ALTER TABLE [dbo].[Дисциплина] CHECK CONSTRAINT [FK__Дисциплин__Испол__6D0D32F4]
GO
ALTER TABLE [dbo].[Зав_кафедрой]  WITH CHECK ADD FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD FOREIGN KEY([Код])
REFERENCES [dbo].[Дисциплина] ([Код])
GO
ALTER TABLE [dbo].[Заявка]  WITH CHECK ADD FOREIGN KEY([Номер])
REFERENCES [dbo].[Специальность] ([Номер])
GO
ALTER TABLE [dbo].[Инженер]  WITH CHECK ADD FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Кафедра]  WITH CHECK ADD  CONSTRAINT [FK__Кафедра__Факульт__6754599E] FOREIGN KEY([Факультет])
REFERENCES [dbo].[Факультет] ([Аббревиатура])
GO
ALTER TABLE [dbo].[Кафедра] CHECK CONSTRAINT [FK__Кафедра__Факульт__6754599E]
GO
ALTER TABLE [dbo].[Преподаватель]  WITH CHECK ADD  CONSTRAINT [FK__Преподава__Таб_н__7D439ABD] FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Преподаватель] CHECK CONSTRAINT [FK__Преподава__Таб_н__7D439ABD]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD  CONSTRAINT [FK__Сотрудник__Кафед__73BA3083] FOREIGN KEY([Кафедра])
REFERENCES [dbo].[Кафедра] ([Шифр])
GO
ALTER TABLE [dbo].[Сотрудник] CHECK CONSTRAINT [FK__Сотрудник__Кафед__73BA3083]
GO
ALTER TABLE [dbo].[Сотрудник]  WITH CHECK ADD FOREIGN KEY([Начальник])
REFERENCES [dbo].[Сотрудник] ([Таб_номер])
GO
ALTER TABLE [dbo].[Специальность]  WITH CHECK ADD  CONSTRAINT [FK__Специально__Шифр__6A30C649] FOREIGN KEY([Шифр])
REFERENCES [dbo].[Кафедра] ([Шифр])
GO
ALTER TABLE [dbo].[Специальность] CHECK CONSTRAINT [FK__Специально__Шифр__6A30C649]
GO
ALTER TABLE [dbo].[Экзамен]  WITH CHECK ADD  CONSTRAINT [FK__Экзамен__Код__02FC7413] FOREIGN KEY([Код])
REFERENCES [dbo].[Дисциплина] ([Код])
GO
ALTER TABLE [dbo].[Экзамен] CHECK CONSTRAINT [FK__Экзамен__Код__02FC7413]
GO
ALTER TABLE [dbo].[Экзамен]  WITH CHECK ADD  CONSTRAINT [FK__Экзамен__Рег_ном__03F0984C] FOREIGN KEY([Рег_номер])
REFERENCES [dbo].[Студент] ([Рег_номер])
GO
ALTER TABLE [dbo].[Экзамен] CHECK CONSTRAINT [FK__Экзамен__Рег_ном__03F0984C]
GO
ALTER TABLE [dbo].[Экзамен]  WITH CHECK ADD  CONSTRAINT [FK__Экзамен__Таб_ном__04E4BC85] FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[Преподаватель] ([Таб_номер])
GO
ALTER TABLE [dbo].[Экзамен] CHECK CONSTRAINT [FK__Экзамен__Таб_ном__04E4BC85]
GO
USE [master]
GO
ALTER DATABASE [УчебнаяВласов] SET  READ_WRITE 
GO
