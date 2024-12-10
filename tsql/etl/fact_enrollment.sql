INSERT INTO tytani.[dbo].fact_enrollments
    (
    student_id,
    course_id,
    date_id,
    status,
    price,
    duration,
    grade
    )
SELECT
    e.student_id,
    e.course_id,
    d.id AS date_id,
    e.status AS status,
    c.price AS price, -- Fetch price from the courses table
    c.duration AS duration, -- Fetch duration from the courses table
    e.grade
FROM tytani_db.[dbo].enrollments e
    JOIN tytani.[dbo].[date] d
    ON d.year = YEAR(e.enrollment_date)
        AND d.month = MONTH(e.enrollment_date)
        AND d.day = DAY(e.enrollment_date)
    JOIN tytani_db.[dbo].courses c
    ON c.id = e.course_id;
