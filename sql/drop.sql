-- Drop tables in reverse order of dependencies to avoid foreign key constraint issues
IF OBJECT_ID('attendance', 'U') IS NOT NULL DROP TABLE attendance;
IF OBJECT_ID('lesson_ratings', 'U') IS NOT NULL DROP TABLE lesson_ratings;
IF OBJECT_ID('enrollments', 'U') IS NOT NULL DROP TABLE enrollments;
IF OBJECT_ID('lessons', 'U') IS NOT NULL DROP TABLE lessons;
IF OBJECT_ID('courses_subjects', 'U') IS NOT NULL DROP TABLE courses_subjects;
IF OBJECT_ID('subjects', 'U') IS NOT NULL DROP TABLE subjects;
IF OBJECT_ID('courses', 'U') IS NOT NULL DROP TABLE courses;
IF OBJECT_ID('teachers', 'U') IS NOT NULL DROP TABLE teachers;
IF OBJECT_ID('students', 'U') IS NOT NULL DROP TABLE students;
