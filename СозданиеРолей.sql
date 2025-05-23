USE [УчебнаяВласов]
GO
/****** Object:  User [Bedarov_Adm]    Script Date: 16.05.2025 14:42:48 ******/
CREATE USER [Bedarov_Adm] FOR LOGIN [Bedarov_Adm] WITH DEFAULT_SCHEMA=[Bedarov_Adm]
GO
/****** Object:  User [Doritov_Sec]    Script Date: 16.05.2025 14:42:48 ******/
CREATE USER [Doritov_Sec] FOR LOGIN [Doritov_Sec] WITH DEFAULT_SCHEMA=[Doritov_Sec]
GO
/****** Object:  User [Proba]    Script Date: 16.05.2025 14:42:48 ******/
CREATE USER [Proba] FOR LOGIN [Proba] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  DatabaseRole [ADMIN]    Script Date: 16.05.2025 14:42:48 ******/
CREATE ROLE [ADMIN]
GO
/****** Object:  DatabaseRole [SECRETARY]    Script Date: 16.05.2025 14:42:48 ******/
CREATE ROLE [SECRETARY]
GO
/****** Object:  DatabaseRole [TEACHER]    Script Date: 16.05.2025 14:42:48 ******/
CREATE ROLE [TEACHER]
GO
ALTER ROLE [ADMIN] ADD MEMBER [Bedarov_Adm]
GO
ALTER ROLE [db_owner] ADD MEMBER [Proba]
GO
