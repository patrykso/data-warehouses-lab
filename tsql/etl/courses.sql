INSERT INTO [tytani].dbo.[courses]
    (
    name,
    description,
    course_type,
    is_online,
    max_students_category
    )
SELECT
    name,
    description,
    course_type,
    is_online,
    CASE
        WHEN max_students <= 10 THEN 'Small'
        WHEN max_students BETWEEN 11 AND 30 THEN 'Medium'
        WHEN max_students > 30 THEN 'Large'
        ELSE 'Unknown'
    END AS max_students_category
FROM [tytani_db].dbo.[courses];
