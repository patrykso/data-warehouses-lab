WITH
    TimeHierarchy
    AS
    (
        SELECT
            hour,
            minute,
            CASE
            WHEN hour BETWEEN 0 AND 5 THEN 'Noc'
            WHEN hour BETWEEN 6 AND 9 THEN 'Rano'
            WHEN hour BETWEEN 10 AND 11 THEN 'Przedpołudnie'
            WHEN hour BETWEEN 12 AND 13 THEN 'Południe'
            WHEN hour BETWEEN 13 AND 15 THEN 'Popołudnie'
            WHEN hour BETWEEN 16 AND 20 THEN 'Wieczór'
            ELSE 'Noc'
        END AS time_of_day
        FROM (
        SELECT DISTINCT
                DATEPART(HOUR, start_time) AS hour,
                DATEPART(MINUTE, start_time) AS minute
            FROM [tytani_db].dbo.[lessons]
    ) t
    )
INSERT INTO [tytani].dbo.[time]
    (hour, minute, time_of_day)
SELECT
    hour,
    minute,
    time_of_day
FROM TimeHierarchy;
