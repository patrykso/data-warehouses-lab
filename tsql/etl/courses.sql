MERGE INTO [tytani].dbo.[courses] AS Target
USING (
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
FROM [tytani_db].dbo.[courses]
) AS Source
ON Target.name = Source.name -- Match on course name to identify existing records
WHEN MATCHED THEN
    UPDATE SET 
        Target.description = Source.description,
        Target.course_type = Source.course_type,
        Target.is_online = Source.is_online,
        Target.max_students_category = Source.max_students_category
WHEN NOT MATCHED THEN
    INSERT (name, description, course_type, is_online, max_students_category)
    VALUES (Source.name, Source.description, Source.course_type, Source.is_online, Source.max_students_category);

PRINT 'Merge operation for courses completed successfully.';
