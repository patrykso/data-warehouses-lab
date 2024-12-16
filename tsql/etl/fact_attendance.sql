INSERT INTO tytani.dbo.fact_attendance
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
    lr.student_id,
    l.teacher_id,
    ISNULL(l.location_id, 1),
    ISNULL(j.id, 1) AS junk_id,
    d.id AS date_id,
    t.id AS start_time_id,
    l.course_id,
    lr.rating
FROM tytani_db.dbo.lessons l
    INNER JOIN tytani_db.dbo.lesson_ratings lr
    ON l.id = lr.lesson_id
    INNER JOIN tytani_db.dbo.courses_subjects cs
    ON l.course_id = cs.course_id
    INNER JOIN tytani_db.dbo.attendance a
    ON l.id = a.session_id
        AND lr.student_id = a.student_id
    INNER JOIN tytani.dbo.junk j
    ON a.junk_id = j.id -- Połączenie po junk_id
    INNER JOIN [tytani].[dbo].[date] d
    ON YEAR(l.lesson_date) = d.year
        AND MONTH(l.lesson_date) = d.month
        AND DAY(l.lesson_date) = d.day
    INNER JOIN [tytani].[dbo].[time] t
    ON DATEPART(hour, l.start_time) = t.hour
        AND DATEPART(minute, l.start_time) = t.minute;
