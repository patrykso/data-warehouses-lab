-- Tabela students
CREATE TABLE students (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    parent_first_name VARCHAR(255),
    parent_last_name VARCHAR(255),
    parent_email VARCHAR(255),
    parent_phone_number VARCHAR(255),
    city VARCHAR(255),
    registration_date DATE
);

-- Tabela teachers
CREATE TABLE teachers (
    id INT IDENTITY(1,1) PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    phone_number VARCHAR(255),
    specialization VARCHAR(255),
    experience INT
);

-- Tabela courses
CREATE TABLE courses (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    course_type VARCHAR(255),
    duration INT,
    price DECIMAL(10,2),
    start_date DATE,
    end_date DATE,
    is_online BIT,
    max_students INT CHECK (max_students BETWEEN 0 AND 999)
);

-- Tabela lessons
CREATE TABLE lessons (
    id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    lesson_date DATE,
    start_time TIME,
    end_time TIME,
    location_id INT NULL,
    teacher_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(id)
    -- 'location_id' pozostaje jako INT NULL bez klucza obcego
);

-- Tabela enrollments
CREATE TABLE enrollments (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    course_id INT NOT NULL,
    enrollment_date DATE,
    status VARCHAR(255),
    grade INT CHECK (grade BETWEEN 1 AND 5),
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (course_id) REFERENCES courses(id)
);

-- Tabela lesson_ratings
CREATE TABLE lesson_ratings (
    id INT IDENTITY(1,1) PRIMARY KEY,
    student_id INT NOT NULL,
    lesson_id INT NOT NULL,
    rating INT CHECK (rating BETWEEN 1 AND 5),
    comment VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (student_id) REFERENCES students(id),
    FOREIGN KEY (lesson_id) REFERENCES lessons(id)
);

-- Tabela attendance
CREATE TABLE attendance (
    id INT IDENTITY(1,1) PRIMARY KEY,
    session_id INT NOT NULL,
    student_id INT NOT NULL,
    status VARCHAR(255),
    FOREIGN KEY (session_id) REFERENCES lessons(id),
    FOREIGN KEY (student_id) REFERENCES students(id)
);

-- Tabela subjects
CREATE TABLE subjects (
    id INT IDENTITY(1,1) PRIMARY KEY,
    name VARCHAR(255),
    description VARCHAR(255),
    category VARCHAR(255)
);

-- Tabela courses_subjects
CREATE TABLE courses_subjects (
    id INT IDENTITY(1,1) PRIMARY KEY,
    course_id INT NOT NULL,
    subject_id INT NOT NULL,
    FOREIGN KEY (course_id) REFERENCES courses(id),
    FOREIGN KEY (subject_id) REFERENCES subjects(id)
);