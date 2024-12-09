INSERT INTO [tytani].dbo.[students]
    (
    first_name,
    last_name,
    email,
    phone_number,
    city
    )
SELECT
    first_name,
    last_name,
    email,
    phone_number,
    city
FROM [tytani_db].dbo.[students];
