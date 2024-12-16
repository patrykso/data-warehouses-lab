USE tytani;
GO

-- 1. Drop all foreign key constraints dynamically
DECLARE @sql NVARCHAR(MAX) = '';

SELECT @sql += 
    'ALTER TABLE ' + QUOTENAME(OBJECT_NAME(f.parent_object_id)) 
    + ' DROP CONSTRAINT ' + QUOTENAME(f.name) + ';' + CHAR(13)
FROM sys.foreign_keys AS f;

PRINT 'Dropping Foreign Keys...';
EXEC sp_executesql @sql;

-- 2. Truncate all specified tables
PRINT 'Truncating Tables...';

TRUNCATE TABLE fact_enrollments;
TRUNCATE TABLE fact_attendance;
TRUNCATE TABLE students;
TRUNCATE TABLE courses;
TRUNCATE TABLE final_surveys_scd1;
TRUNCATE TABLE subjects;
TRUNCATE TABLE teachers;
TRUNCATE TABLE locations;

-- 3. Recreate all foreign key constraints dynamically
SET @sql = '';

SELECT @sql += 
    'ALTER TABLE ' + QUOTENAME(OBJECT_NAME(f.parent_object_id)) 
    + ' WITH CHECK ADD CONSTRAINT ' + QUOTENAME(f.name) 
    + ' FOREIGN KEY (' + QUOTENAME(c1.name) + ') '
    + 'REFERENCES ' + QUOTENAME(OBJECT_NAME(f.referenced_object_id)) 
    + '(' + QUOTENAME(c2.name) + ');' + CHAR(13)
FROM sys.foreign_keys AS f
    INNER JOIN sys.foreign_key_columns AS fc
    ON f.object_id = fc.constraint_object_id
    INNER JOIN sys.columns AS c1
    ON fc.parent_object_id = c1.object_id AND fc.parent_column_id = c1.column_id
    INNER JOIN sys.columns AS c2
    ON fc.referenced_object_id = c2.object_id AND fc.referenced_column_id = c2.column_id;

PRINT 'Recreating Foreign Keys...';
EXEC sp_executesql @sql;

PRINT 'Operation Completed Successfully.';
