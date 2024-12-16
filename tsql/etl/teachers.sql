MERGE INTO tytani.[dbo].[teachers] AS target
USING tytani_db.[dbo].[teachers] AS source
ON target.email = source.email
WHEN NOT MATCHED BY TARGET THEN
    INSERT (first_name, last_name, email, phone_number, specialization)
    VALUES (source.first_name, source.last_name, source.email, source.phone_number, source.specialization);
