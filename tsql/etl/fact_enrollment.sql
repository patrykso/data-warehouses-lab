MERGE tytani.[dbo].fact_enrollments AS Target
USING
(
    SELECT
    e.student_id,
    fs.id AS survey_id,
    e.course_id,
    d.id AS date_id,
    e.status,
    c.price,
    c.duration,
    e.grade
FROM tytani_db.[dbo].enrollments e
    JOIN tytani.[dbo].[date] d
    ON d.year = YEAR(e.enrollment_date)
        AND d.month = MONTH(e.enrollment_date)
        AND d.day = DAY(e.enrollment_date)
    JOIN tytani_db.[dbo].courses c
    ON c.id = e.course_id
    INNER JOIN tytani.[dbo].final_surveys_scd1 fs
    ON fs.id = e.id 
) AS Source
ON Target.final_survey_id = Source.survey_id

WHEN NOT MATCHED BY TARGET THEN
INSERT
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
VALUES
    (
        Source.student_id,
        Source.survey_id,
        Source.course_id,
        Source.date_id,
        Source.status,
        Source.price,
        Source.duration,
        Source.grade
    )
;
