USE �������������;
BACKUP DATABASE �������������
TO DISK = 'C:\Users\Public\Documents\Uchebnaya.bak';
EXEC sp_addrole 'ADMIN';
EXEC sp_addrole 'TEACHER';
EXEC sp_addrole 'SECRETARY';

GRANT SELECT, INSERT, UPDATE, DELETE ON Discuplinu TO ADMIN;
GRANT EXECUTE TO ADMIN;

GRANT SELECT, UPDATE ON Discuplinu TO TEACHER;
GRANT EXECUTE TO TEACHER;

GRANT SELECT, INSERT ON Discuplinu TO SECRETARY;
EXEC sp_addlogin 'Buhalterov_Tea', 'Buhalterov', '�������������';
USE �������������;
EXEC sp_adduser 'Alecsandrov_Tea', 'Alexandrov_Tea';
EXEC sp_addrolemember 'TEACHER', 'Sidorov_Tea';

EXEC sp_addlogin 'Doritov_Sec', 'Doritov', '�������������';
USE �������������;
EXEC sp_adduser 'Doritov_Sec', 'Doritov_Sec';
EXEC sp_addrolemember 'SECRETARY', 'Nikitin_Sec';

EXEC sp_addlogin 'Bedarov_Adm', 'Bedarov', '�������������';
USE �������������;
EXEC sp_adduser 'Bedarov_Adm', 'Bedarov_Adm';
EXEC sp_addrolemember 'ADMIN', 'Bedarov_Adm';