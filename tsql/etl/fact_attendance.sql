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
    CASE 
        WHEN c.is_online = 1 THEN 
            (SELECT TOP 1
        id
    FROM tytani.[dbo].[locations]
    WHERE name = 'Online')
        ELSE COALESCE(loc.id, 1)
    END AS location_id,
    COALESCE(j.id, 1) AS junk_id,
    d.id AS date_id,
    t.id AS start_time_id,
    l.course_id,
    3 AS rating
FROM
    tytani_db.[dbo].[attendance] a
    JOIN tytani_db.[dbo].[lessons] l ON a.session_id = l.id
    JOIN tytani_db.[dbo].[courses] c ON l.course_id = c.id
    JOIN tytani_db.[dbo].[courses_subjects] cs ON l.course_id = cs.course_id
    JOIN tytani.[dbo].[date] d ON d.year = YEAR(l.lesson_date)
        AND d.month = MONTH(l.lesson_date)
        AND d.day = DAY(l.lesson_date)
    JOIN tytani.[dbo].[time] t ON t.hour = DATEPART(HOUR, l.start_time)
        AND t.minute = DATEPART(MINUTE, l.start_time)
    LEFT JOIN tytani.[dbo].[locations] loc ON loc.id = l.location_id
    LEFT JOIN tytani.[dbo].[junk] j ON j.status = a.status
WHERE NOT EXISTS (
    SELECT 1
FROM tytani.[dbo].fact_attendance fa
WHERE fa.student_id = a.student_id
    AND fa.teacher_id = l.teacher_id
    AND fa.date_id = d.id
    AND fa.start_time_id = t.id
    AND fa.course_id = l.course_id
    AND fa.subject_id = cs.subject_id
);
