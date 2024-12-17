IF OBJECT_ID('tempdb..#StagingFinalSurveys') IS NOT NULL
    DROP TABLE #StagingFinalSurveys;

CREATE TABLE #StagingFinalSurveys
(
    survey_id INT NULL,
    student_id NVARCHAR(MAX) NULL,
    teacher_id NVARCHAR(MAX) NULL,
    date_of_survey DATE NULL,
    course_rating INT NULL,
    teacher_rating INT NULL,
    positive_feedback NVARCHAR(MAX) NULL,
    negative_feedback NVARCHAR(MAX) NULL,
    continue_learning NVARCHAR(50) NULL,
    additional_comments NVARCHAR(MAX) NULL
);

BULK INSERT #StagingFinalSurveys
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\T2\final_surveys.csv'
WITH (
    FIELDTERMINATOR = ',',           -- Columns separated by commas
    ROWTERMINATOR = '\n',            -- Rows separated by newline
    FIRSTROW = 1,                    -- Skip the header row
    FORMAT = 'CSV'
);

-- Perform a MERGE operation to match and merge data from the staging table into the target SCD1 table.
MERGE [tytani].[dbo].[final_surveys_scd1] AS Target
USING (
    SELECT
    survey_id,
    course_rating,
    teacher_rating,
    positive_feedback,
    negative_feedback,
    CASE
            WHEN LOWER(continue_learning) IN ('tak', 'nie', 'nie wiem') THEN continue_learning
            ELSE NULL
        END AS continue_course,
    CASE
            WHEN course_rating IS NOT NULL AND teacher_rating IS NOT NULL THEN 1
            ELSE 0
        END AS filled
FROM #StagingFinalSurveys
) AS Source
ON Target.db_id = Source.survey_id

-- When a match is found, update the existing row.
-- WHEN MATCHED THEN
--     UPDATE SET
--         Target.course_interest_rating = Source.course_rating,
--         Target.teacher_engagement_rating = Source.teacher_rating,
--         Target.positive_comments = Source.positive_feedback,
--         Target.negative_comments = Source.negative_feedback,
--         Target.continue_course = Source.continue_course,
--         Target.filled = Source.filled

-- When no match is found, insert a new record.
WHEN NOT MATCHED BY TARGET THEN
INSERT
    (
    db_id,
    course_interest_rating,
    teacher_engagement_rating,
    positive_comments,
    negative_comments,
    continue_course,
    filled
    )
VALUES
    (
        Source.survey_id,
        Source.course_rating,
        Source.teacher_rating,
        Source.positive_feedback,
        Source.negative_feedback,
        Source.continue_course,
        Source.filled
    );

DROP TABLE #StagingFinalSurveys;
