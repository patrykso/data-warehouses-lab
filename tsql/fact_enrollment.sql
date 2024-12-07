INSERT INTO fact_enrollment
    (
    student_id,
    course_id,
    date_id,
    enrollment_status,
    grade
    )
SELECT
    e.student_id,
    e.course_id,
    d.id AS date_id,
    e.status AS enrollment_status,
    e.grade
FROM enrollments e
    JOIN date d
    ON d.full_date = e.enrollment_date;