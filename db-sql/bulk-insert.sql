-- Note: Replace 'C:\Users\jozef\source...' with the actual path to CSV files.

-- 1. Teachers
SET IDENTITY_INSERT teachers ON;

BULK INSERT teachers
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\teachers.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT teachers OFF;

-- 2. Students
SET IDENTITY_INSERT students ON;

BULK INSERT students
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\students.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT students OFF;

-- 3. Courses
SET IDENTITY_INSERT courses ON;

BULK INSERT courses
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\courses.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT courses OFF;

-- 4. Subjects
SET IDENTITY_INSERT subjects ON;

BULK INSERT subjects
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\subjects.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT subjects OFF;

-- 5. Courses_Subjects
SET IDENTITY_INSERT courses_subjects ON;

BULK INSERT courses_subjects
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\courses_subjects.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT courses_subjects OFF;

-- 6. Lessons
SET IDENTITY_INSERT lessons ON;

BULK INSERT lessons
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\lessons.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT lessons OFF;

-- 7. Enrollments
SET IDENTITY_INSERT enrollments ON;

BULK INSERT enrollments
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\enrollments.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT enrollments OFF;

-- 8. Lesson_Ratings
SET IDENTITY_INSERT lesson_ratings ON;

BULK INSERT lesson_ratings
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\lesson_ratings.csv'
-- FROM 'C:\Users\jozef\source\fakerGenerator\lesson_ratings.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT lesson_ratings OFF;

-- 9. Attendance
SET IDENTITY_INSERT attendance ON;

BULK INSERT attendance
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\attendance.csv'
WITH (
    FORMAT='CSV',
    FIELDQUOTE='"',
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '0x0a',
    KEEPIDENTITY,
    TABLOCK,
    FIRSTROW = 1,
	CODEPAGE = '65001'
);

SET IDENTITY_INSERT attendance OFF;
