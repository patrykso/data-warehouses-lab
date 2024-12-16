-- Insert sample data into 'students'
INSERT INTO students
    (first_name, last_name, email, phone_number, parent_first_name, parent_last_name, parent_email, parent_phone_number, city, registration_date)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-123-4567', 'Jane', 'Doe', 'jane.doe@example.com', '555-987-6543', 'Warsaw', '2024-12-01'),
    ('Anna', 'Smith', 'anna.smith@example.com', '555-234-5678', 'Mark', 'Smith', 'mark.smith@example.com', '555-876-5432', 'Gdańsk', '2024-12-10');

-- Insert sample data into 'teachers'
INSERT INTO teachers
    (first_name, last_name, email, phone_number, specialization, experience)
VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', '555-345-6789', 'Python Programming', 5),
    ('Bob', 'Brown', 'bob.brown@example.com', '555-456-7890', 'Web Development', 8);

-- Insert sample data into 'courses'
INSERT INTO courses
    (name, description, course_type, duration, price, start_date, end_date, is_online, max_students)
VALUES
    ('Python Basics', 'Introduction to Python', 'Annual', 30, 1500.00, '2024-01-15', '2024-06-30', 1, 20),
    ('Web Development Bootcamp', 'HTML, CSS, and JavaScript', 'Short Weekly', 10, 800.00, '2024-02-01', '2024-02-10', 0, 15);

-- Insert sample data into 'lessons'
INSERT INTO lessons
    (course_id, lesson_date, start_time, end_time, location_id, teacher_id)
VALUES
    (1, '2024-01-15', '10:00:00', '11:30:00', 1, 1),
    (2, '2024-02-01', '09:00:00', '12:00:00', 1, 2);

-- Insert sample data into 'enrollments'
INSERT INTO enrollments
    (student_id, course_id, enrollment_date, status, grade)
VALUES
    (1, 1, '2024-12-15', 'Aktywny', 2),
    (2, 2, '2024-12-16', 'Aktywny', 3);

-- Insert sample data into 'lesson_ratings'
INSERT INTO lesson_ratings
    (student_id, lesson_id, rating, comment, review_date)
VALUES
    (1, 1, 5, 'Great lesson!', '2024-12-16'),
    (2, 2, 4, 'Very informative.', '2024-12-17');

-- Insert sample data into 'attendance'
INSERT INTO attendance
    (session_id, student_id, status)
VALUES
    (1, 1, 'Nieobecny'),
    (2, 2, 'Obecny');

-- Insert sample data into 'subjects'
INSERT INTO subjects
    (name, description, category)
VALUES
    ('Loops', 'Understanding loops in programming', 'Programming Fundamentals'),
    ('HTML Basics', 'Introduction to HTML structure', 'Web Development');

-- Insert sample data into 'courses_subjects'
INSERT INTO courses_subjects
    (course_id, subject_id)
VALUES
    (1, 1),
    (2, 2);