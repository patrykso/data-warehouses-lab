MERGE INTO [tytani].dbo.[students] AS Target
USING (SELECT
    first_name,
    last_name,
    email,
    phone_number,
    city
FROM [tytani_db].dbo.[students]) AS Source
       ON Target.email = Source.email
WHEN MATCHED THEN
    UPDATE SET 
        Target.first_name = Source.first_name,
        Target.last_name = Source.last_name,
        Target.phone_number = Source.phone_number,
        Target.city = Source.city
WHEN NOT MATCHED THEN
    INSERT (first_name, last_name, email, phone_number, city)
    VALUES (Source.first_name, Source.last_name, Source.email, Source.phone_number, Source.city);

PRINT 'Merge operation completed successfully.';
