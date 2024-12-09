DECLARE @start_date DATE = '2020-01-01';
DECLARE @end_date DATE = '2030-12-31';

WHILE @start_date <= @end_date
BEGIN
    INSERT INTO date
        (
        full_date,
        year,
        quarter,
        month,
        day,
        day_of_week,
        week,
        is_weekend
        )
    SELECT
        @start_date AS full_date,
        YEAR(@start_date) AS year,
        DATEPART(QUARTER, @start_date) AS quarter,
        MONTH(@start_date) AS month,
        DAY(@start_date) AS day,
        DATEPART(WEEKDAY, @start_date) AS day_of_week,
        DATEPART(WEEK, @start_date) AS week,
        CASE WHEN DATEPART(WEEKDAY, @start_date) IN (1, 7) THEN 1 ELSE 0 END AS is_weekend;

    SET @start_date = DATEADD(DAY, 1, @start_date);
END;
