-- Create a temporary staging table for the locations.
-- This temporary table will hold the data loaded from the CSV file.
CREATE TABLE #StagingLocations
(
    id INT,
    -- Unique identifier for the location (if available).
    name NVARCHAR(255),
    -- Name of the location.
    postal_code NVARCHAR(20),
    -- Postal code of the location.
    city NVARCHAR(255),
    -- City where the location is situated.
    street NVARCHAR(255),
    -- Street name of the location.
    building_number NVARCHAR(50)
    -- Building number of the location.
);

-- Load data into the staging table from a CSV file.
-- BULK INSERT is used to efficiently load large amounts of data.
BULK INSERT #StagingLocations
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\locations.csv'
WITH (
    FIELDTERMINATOR = ',',            -- Specifies the delimiter used in the CSV file.
    ROWTERMINATOR = '\n',            -- Specifies the line break used in the CSV file.
    FIRSTROW = 1                    -- Skips the header row in the CSV file.
);

-- Merge staging data into the target table.
-- This ensures that only new or updated records are inserted or updated in the target table.
MERGE INTO tytani.[dbo].[locations] AS Target
USING #StagingLocations AS Source
ON (
    -- Match records between the source and target tables based on these fields.
    ISNULL(Target.name, '') = ISNULL(Source.name, '') AND
    ISNULL(Target.postal_code, '') = ISNULL(Source.postal_code, '') AND
    ISNULL(Target.city, '') = ISNULL(Source.city, '') AND
    ISNULL(Target.street, '') = ISNULL(Source.street, '') AND
    ISNULL(Target.building_number, '') = ISNULL(Source.building_number, '')
)
WHEN MATCHED THEN
    -- Update existing records if there are changes.
    UPDATE SET
        Target.name = Source.name,
        Target.postal_code = Source.postal_code,
        Target.city = Source.city,
        Target.street = Source.street,
        Target.building_number = Source.building_number

WHEN NOT MATCHED BY TARGET THEN
    -- Insert new records that do not already exist in the target table.
    INSERT (name, postal_code, city, street, building_number)
    VALUES (Source.name, Source.postal_code, Source.city, Source.street, Source.building_number);

-- Drop the temporary staging table to clean up resources.
DROP TABLE #StagingLocations;
