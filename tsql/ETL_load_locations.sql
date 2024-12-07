BULK INSERT [tytani].dbo.locations
FROM 'PATH/locations.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\\n',
);
