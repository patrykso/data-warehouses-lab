IF OBJECT_ID('tempdb..#StagingLocations') IS NOT NULL
    DROP TABLE #StagingLocations;

CREATE TABLE #StagingLocations
(
    id INT NULL,
    name NVARCHAR(255) NULL,
    postal_code NVARCHAR(20) NULL,
    city NVARCHAR(255) NULL,
    street NVARCHAR(255) NULL,
    building_number NVARCHAR(50) NULL
);

BULK INSERT #StagingLocations
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\T2\locations.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 1
);

-- Use a CTE to select distinct rows and clean whitespace
WITH
    CleanedStaging
    AS
    (
        SELECT DISTINCT
            LTRIM(RTRIM(name)) AS name,
            LTRIM(RTRIM(postal_code)) AS postal_code,
            LTRIM(RTRIM(city)) AS city,
            LTRIM(RTRIM(street)) AS street,
            LTRIM(RTRIM(building_number)) AS building_number
        FROM #StagingLocations
    )

-- Merge distinct staging data into the target table
MERGE INTO tytani.[dbo].[locations] AS Target
USING CleanedStaging AS Source
ON (
    ISNULL(Target.name, '') = ISNULL(Source.name, '') AND
    ISNULL(Target.postal_code, '') = ISNULL(Source.postal_code, '') AND
    ISNULL(Target.city, '') = ISNULL(Source.city, '') AND
    ISNULL(Target.street, '') = ISNULL(Source.street, '') AND
    ISNULL(Target.building_number, '') = ISNULL(Source.building_number, '')
)
WHEN NOT MATCHED BY TARGET THEN
    INSERT (name, postal_code, city, street, building_number)
    VALUES (Source.name, Source.postal_code, Source.city, Source.street, Source.building_number);

-- Drop the temporary staging table
DROP TABLE #StagingLocations;
