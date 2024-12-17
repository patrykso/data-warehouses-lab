WITH
    Hours
    AS
    (
                    SELECT 0 AS hour
        UNION ALL
            SELECT hour + 1
            FROM Hours
            WHERE hour < 23
    ),
    Minutes
    AS
    (
                    SELECT 0 AS minute
        UNION ALL
            SELECT minute + 1
            FROM Minutes
            WHERE minute < 59
    ),
    TimeHierarchy
    AS
    (
        SELECT
            h.hour,
            m.minute,
            CASE
                WHEN h.hour BETWEEN 0 AND 5 THEN 'Noc'
                WHEN h.hour BETWEEN 6 AND 9 THEN 'Rano'
                WHEN h.hour BETWEEN 10 AND 11 THEN 'Przedpołudnie'
                WHEN h.hour BETWEEN 12 AND 13 THEN 'Południe'
                WHEN h.hour BETWEEN 14 AND 15 THEN 'Popołudnie'
                WHEN h.hour BETWEEN 16 AND 20 THEN 'Wieczór'
                ELSE 'Noc'
            END AS time_of_day
        FROM Hours h
        CROSS JOIN Minutes m
    )
SELECT
    ROW_NUMBER() OVER (ORDER BY hour, minute) AS id,
    hour,
    minute,
    time_of_day
INTO #TempTimeHierarchy
FROM TimeHierarchy
OPTION
(MAXRECURSION
0);

SET IDENTITY_INSERT tytani.[dbo].[time] ON;

INSERT INTO tytani.[dbo].[time]
    (id, hour, minute, time_of_day)
SELECT id, hour, minute, time_of_day
FROM #TempTimeHierarchy;

SET IDENTITY_INSERT tytani.[dbo].[time] OFF;

DROP TABLE #TempTimeHierarchy;
