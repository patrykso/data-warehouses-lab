INSERT INTO tytani.[dbo].fact_attendance
    (
    subject_id,
    student_id,
    teacher_id,
    location_id,
    junk_id,
    date_id,
    start_time_id,
    course_id,
    rating
    )
SELECT
    cs.subject_id,
    a.student_id,
    l.teacher_id,
    loc.id AS location_id,
    j.id AS junk_id,
    d.id AS date_id,
    t.id AS start_time_id,
    l.course_id,
    NULL AS rating
FROM
    tytani_db.[dbo].[attendance] a
    JOIN
    tytani_db.[dbo].[lessons] l ON a.session_id = l.id
    JOIN
    tytani_db.[dbo].[courses_subjects] cs ON l.course_id = cs.course_id
    JOIN
    tytani.[dbo].[date] d ON d.year = YEAR(l.lesson_date)
        AND d.month = MONTH(l.lesson_date)
        AND d.day = DAY(l.lesson_date)
    JOIN
    tytani.[dbo].[time] t ON t.hour = DATEPART(HOUR, l.start_time)
        AND t.minute = DATEPART(MINUTE, l.start_time)
    LEFT JOIN
    tytani.[dbo].[locations] loc ON loc.id = l.location_id
    LEFT JOIN
    tytani.[dbo].[junk] j ON j.status = 'default';
