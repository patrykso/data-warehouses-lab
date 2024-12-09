BULK INSERT [tytani].dbo.[final_surveys_scd1]
FROM 'C:\Users\jozef\OneDrive\Pulpit\tsql\data\data\T1\final_surveys.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2 -- Skip header row
);
