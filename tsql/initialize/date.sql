DECLARE @start_date DATE = '2021-08-12';
DECLARE @end_date DATE = '2024-08-12';

WHILE @start_date <= @end_date
BEGIN
    INSERT INTO tytani.[dbo].[date]
        (year, month, day)
    VALUES
        (
            YEAR(@start_date),
            MONTH(@start_date),
            DAY(@start_date)
    );

    SET @start_date = DATEADD(DAY, 1, @start_date);
END;
