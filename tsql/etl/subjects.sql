MERGE INTO tytani.[dbo].[subjects] AS target
USING tytani_db.[dbo].[subjects] AS source
ON target.name = source.name
WHEN NOT MATCHED BY TARGET THEN
    INSERT (name, description)
    VALUES (source.name, source.description);
