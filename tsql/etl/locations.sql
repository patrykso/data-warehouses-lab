CREATE TABLE #StagingLocations
(
    id INT,
    name NVARCHAR(255),
    postal_code NVARCHAR(20),
    city NVARCHAR(255),
    street NVARCHAR(255),
    building_number NVARCHAR(50)
);

BULK INSERT #StagingLocations
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\data\T1\locations.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n', 
    FIRSTROW = 2         
);

INSERT INTO tytani.[dbo].[locations]
    (name, postal_code, city, street, building_number)
SELECT name, postal_code, city, street, building_number
FROM #StagingLocations;

DROP TABLE #StagingLocations;
