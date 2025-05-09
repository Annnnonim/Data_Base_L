﻿-- 1. Студенты факультета «ит»
SELECT С.Рег_номер, С.Фамилия, Сп.Направление, К.Название AS Кафедра
FROM Студент С
JOIN Специальность Сп ON С.Номер = Сп.Номер
JOIN Кафедра К ON Сп.Шифр = К.Шифр
WHERE К.Факультет = 'Ит';

-- 2. Выпускающие кафедры
SELECT К.Факультет, К.Шифр, К.Название, С.ФИО AS Зав_кафедрой
FROM Кафедра К
JOIN Специальность Сп ON К.Шифр = Сп.Шифр
JOIN Сотрудник С ON К.Шифр = С.Кафедра AND С.Должность = 'зав. кафедрой'
GROUP BY К.Факультет, К.Шифр, К.Название, С.ФИО;

-- 3. Сотрудники и их руководители
SELECT С1.Таб_номер, С1.ФИО AS Сотрудник, 
       CASE WHEN С1.Таб_номер = С1.Начальник THEN NULL ELSE С2.ФИО END AS Руководитель
FROM Сотрудник С1
LEFT JOIN Сотрудник С2 ON С1.Начальник = С2.Таб_номер;

-- 4. Студенты с ≥2 экзаменами
SELECT С.Рег_номер, С.Фамилия, COUNT(*) AS Количество_экзаменов
FROM Студент С
JOIN Экзамен Э ON С.Рег_номер = Э.Рег_номер
GROUP BY С.Рег_номер, С.Фамилия
HAVING COUNT(*) >= 2;

-- 5. Инженеры с зарплатой < 20000
SELECT И.Таб_номер, С.ФИО, С.Зарплата
FROM Инженер И
JOIN Сотрудник С ON И.Таб_номер = С.Таб_номер
WHERE С.Зарплата < 20000;

-- 6. Студенты, сдавшие экзамены в аудитории «т505»
SELECT DISTINCT С.Рег_номер, С.Фамилия
FROM Студент С
JOIN Экзамен Э ON С.Рег_номер = Э.Рег_номер
WHERE Э.Аудитория = 'т505';

-- 7. Студенты со средним баллом ≥4
SELECT С.Рег_номер, С.Фамилия, 
       COUNT(*) AS Количество_экзаменов, 
       AVG(Э.Оценка*1.0) AS Средний_балл
FROM Студент С
JOIN Экзамен Э ON С.Рег_номер = Э.Рег_номер
GROUP BY С.Рег_номер, С.Фамилия
HAVING AVG(Э.Оценка) >= 4;

-- 8. Заведующие кафедрами с зарплатой и степенью
SELECT З.Таб_номер, С.ФИО, С.Зарплата, П.Степень
FROM Зав_кафедрой З
JOIN Сотрудник С ON З.Таб_номер = С.Таб_номер
JOIN Преподаватель П ON З.Таб_номер = П.Таб_номер;

-- 9. Список профессоров
SELECT П.Таб_номер, С.ФИО, П.Звание
FROM Преподаватель П
JOIN Сотрудник С ON П.Таб_номер = С.Таб_номер
WHERE П.Звание = 'профессор';

-- 10. Экзамены в интервале дат 2015-06-01 — 2015-06-10
SELECT Д.Название AS Дисциплина, 
       С.ФИО AS Преподаватель, 
       Э.Дата, Э.Аудитория
FROM Экзамен Э
JOIN Дисциплина Д ON Э.Код = Д.Код
JOIN Сотрудник С ON Э.Таб_номер = С.Таб_номер
WHERE Э.Дата BETWEEN '2015-06-01' AND '2015-06-10'
ORDER BY Э.Дата;

-- 11. Преподаватели, принявшие >3 экзаменов
SELECT Э.Таб_номер, С.ФИО, COUNT(*) AS Экзамены
FROM Экзамен Э
JOIN Сотрудник С ON Э.Таб_номер = С.Таб_номер
GROUP BY Э.Таб_номер, С.ФИО
HAVING COUNT(*) > 3;

-- 12. Студенты, не сдавшие экзамены 2015-06-05
SELECT С.Рег_номер, С.Фамилия
FROM Студент С
WHERE С.Рег_номер NOT IN (
    SELECT Рег_номер 
    FROM Экзамен 
    WHERE Дата = '2015-06-05'
);