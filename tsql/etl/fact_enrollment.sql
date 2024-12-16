INSERT INTO tytani.[dbo].fact_enrollments
    (
    student_id,
    final_survey_id,
    course_id,
    date_id,
    status,
    price,
    duration,
    grade
    )
SELECT
    e.student_id,
    fs.id AS final_survey_id,
    e.course_id,
    d.id AS date_id,
    e.status AS status,
    c.price AS price,
    c.duration AS duration,
    e.grade
FROM tytani_db.[dbo].enrollments e
    JOIN tytani.[dbo].[date] d
    ON d.year = YEAR(e.enrollment_date)
        AND d.month = MONTH(e.enrollment_date)
        AND d.day = DAY(e.enrollment_date)
    JOIN tytani_db.[dbo].courses c
    ON c.id = e.course_id
    LEFT JOIN tytani.[dbo].final_surveys_scd1 fs
    ON fs.id = e.survey_id; -- Przyjęto, że kolumna survey_id istnieje w tabeli enrollments
