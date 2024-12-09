-- Truncate script for all tables
-- Drop foreign key constraints
DECLARE @sql NVARCHAR(MAX);
SET @sql = '';

-- Generate SQL to drop constraints for all tables
SELECT @sql = @sql + 'ALTER TABLE ' + QUOTENAME(OBJECT_NAME(f.parent_object_id)) + ' DROP CONSTRAINT ' + QUOTENAME(f.name) + ';'
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
INNER JOIN sys.columns AS c1 ON fc.parent_object_id = c1.object_id AND fc.parent_column_id = c1.column_id
INNER JOIN sys.columns AS c2 ON fc.referenced_object_id = c2.object_id AND fc.referenced_column_id = c2.column_id;

-- Execute the generated SQL to drop constraints
EXEC sp_executesql @sql;

-- Truncate all tables
TRUNCATE TABLE fact_enrollments;
TRUNCATE TABLE fact_attendance;
TRUNCATE TABLE students;
TRUNCATE TABLE courses;
TRUNCATE TABLE [date];
TRUNCATE TABLE final_surveys_scd1;
TRUNCATE TABLE subjects;
TRUNCATE TABLE teachers;
TRUNCATE TABLE locations;
TRUNCATE TABLE [time];
TRUNCATE TABLE junk;

-- Generate SQL to recreate foreign key constraints
SET @sql = '';
SELECT @sql = @sql + 'ALTER TABLE ' + QUOTENAME(OBJECT_NAME(f.parent_object_id)) + ' WITH CHECK ADD CONSTRAINT ' + QUOTENAME(f.name) + ' FOREIGN KEY (' + c1.name + ') REFERENCES ' + QUOTENAME(OBJECT_NAME(f.referenced_object_id)) + '(' + c2.name + ');'
FROM sys.foreign_keys AS f
INNER JOIN sys.foreign_key_columns AS fc ON f.object_id = fc.constraint_object_id
INNER JOIN sys.columns AS c1 ON fc.parent_object_id = c1.object_id AND fc.parent_column_id = c1.column_id
INNER JOIN sys.columns AS c2 ON fc.referenced_object_id = c2.object_id AND fc.referenced_column_id = c2.column_id;

-- Execute the generated SQL to recreate constraints
EXEC sp_executesql @sql;