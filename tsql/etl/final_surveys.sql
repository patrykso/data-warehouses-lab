IF OBJECT_ID('tempdb..#StagingFinalSurveys') IS NOT NULL
    DROP TABLE #StagingFinalSurveys;

CREATE TABLE #StagingFinalSurveys
(
    survey_id NVARCHAR(MAX) NULL,
    student_id NVARCHAR(MAX) NULL,
    teacher_id NVARCHAR(MAX) NULL,
    date_of_survey NVARCHAR(10) NULL,
    course_rating NVARCHAR(MAX) NULL,
    teacher_rating NVARCHAR(MAX) NULL,
    positive_feedback NVARCHAR(MAX) NULL,
    negative_feedback NVARCHAR(MAX) NULL,
    continue_learning NVARCHAR(50) NULL,
    additional_comments NVARCHAR(MAX) NULL
);

BULK INSERT #StagingFinalSurveys
FROM 'C:\Users\jozef\source\PG-HD-LAB2-DATA-GENERATOR\tsql\etl\data\final_surveys.csv'
WITH (
    FIELDTERMINATOR = ',',           -- Columns separated by commas
    ROWTERMINATOR = '\n',            -- Rows separated by newline
    FIRSTROW = 1                     -- Skip the header row
);

INSERT INTO [tytani].[dbo].[final_surveys_scd1]
    (course_interest_rating, teacher_engagement_rating, positive_comments, negative_comments,
    continue_course, filled, db_id)
SELECT
    CASE
        WHEN ISNUMERIC(course_rating) = 1 THEN CAST(course_rating AS INT)
        ELSE NULL
    END AS course_interest_rating, -- Validate and cast course_rating
    CASE
        WHEN ISNUMERIC(teacher_rating) = 1 THEN CAST(teacher_rating AS INT)
        ELSE NULL
    END AS teacher_engagement_rating, -- Validate and cast teacher_rating
    positive_feedback AS positive_comments,
    negative_feedback AS negative_comments,
    CASE
        WHEN LOWER(continue_learning) IN ('tak', 'nie', 'nie wiem') THEN continue_learning
        ELSE NULL
    END AS continue_course, -- Retain original values for continue_learning
    CASE
        WHEN ISNUMERIC(course_rating) = 1 AND ISNUMERIC(teacher_rating) = 1 THEN 1
        ELSE 0
    END AS filled, -- Mark as filled if both ratings are valid
    CASE
        WHEN ISNUMERIC(survey_id) = 1 THEN CAST(survey_id AS INT)
        ELSE NULL
    END AS db_id
FROM #StagingFinalSurveys
WHERE
    ISNUMERIC(survey_id) = 1 AND LEN(survey_id) <= 10;

DROP TABLE #StagingFinalSurveys;
