-- Nadrzędne
CREATE TABLE students (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(50),
    city VARCHAR(255)
);

CREATE TABLE courses (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(MAX),
    course_type VARCHAR(255),
    is_online BIT,
    max_students_category VARCHAR(255)
);

CREATE TABLE [date] (
    id INT PRIMARY KEY,
    year INT,
    month INT,
    day INT
);

CREATE TABLE final_surveys_scd1 (
    id INT PRIMARY KEY,
    course_interest_rating INT,
    teacher_engagement_rating INT,
    positive_comments VARCHAR(MAX),
    negative_comments VARCHAR(MAX),
    continue_course VARCHAR(255),
    filled BIT
);

CREATE TABLE subjects (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(MAX)
);

CREATE TABLE teachers (
    id INT PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(50),
    specialization VARCHAR(255)
);

CREATE TABLE locations (
    id INT PRIMARY KEY,
    name VARCHAR(255),
    postal_code VARCHAR(20),
    city VARCHAR(255),
    street VARCHAR(255),
    building_number VARCHAR(50)
);

CREATE TABLE [time] (
    id INT PRIMARY KEY,
    hour INT,
    minute INT,
    time_of_day VARCHAR(50)
);

CREATE TABLE junk (
    id INT PRIMARY KEY,
    status VARCHAR(255)
);

-- Zależne
CREATE TABLE fact_enrollments (
    student_id INT,
    final_survey_id INT,
    course_id INT,
    date_id INT,
    status VARCHAR(255),
    price DECIMAL(10, 2),
    duration INT,
    grade INT,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (final_survey_id) REFERENCES final_surveys_scd1(id),
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (date_id) REFERENCES [date](id)
);

CREATE TABLE fact_attendance (
    subject_id INT,
    student_id INT,
    teacher_id INT,
    location_id INT,
    junk_id INT,
    date_id INT,
    start_time_id INT,
    course_id INT,
    rating INT,
    FOREIGN KEY (subject_id) REFERENCES subjects(id),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id),
    FOREIGN KEY (location_id) REFERENCES locations(id),
    FOREIGN KEY (junk_id) REFERENCES junk(id),
    FOREIGN KEY (date_id) REFERENCES [date](id),
    FOREIGN KEY (start_time_id) REFERENCES [time](id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);