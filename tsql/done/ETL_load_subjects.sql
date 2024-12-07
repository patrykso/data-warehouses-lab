INSERT INTO [tytani].dbo.[subjects]
    (name, description)
SELECT name, description
FROM [tytani_db].dbo.subjects;
