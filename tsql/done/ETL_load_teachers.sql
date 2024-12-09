INSERT INTO [tytani].dbo.[teachers]
    (first_name, last_name, email, phone_number, specialization)
SELECT first_name, last_name, email, phone_number, specialization
FROM [tytani_db].dbo.[teachers];
