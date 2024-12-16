-- Insert sample data into 'students'
INSERT INTO students
    (first_name, last_name, email, phone_number, parent_first_name, parent_last_name, parent_email, parent_phone_number, city, registration_date)
VALUES
    ('John', 'Doe', 'john.doe@example.com', '555-123-4567', 'Jane', 'Doe', 'jane.doe@example.com', '555-987-6543', 'Warsaw', '2024-12-01'),
    ('Anna', 'Smith', 'anna.smith@example.com', '555-234-5678', 'Mark', 'Smith', 'mark.smith@example.com', '555-876-5432', 'Gdańsk', '2024-12-10'),
    ('Mateusz', 'Kowalski', 'mateusz.kowalski@example.com', '555-345-6789', 'Ewa', 'Kowalska', 'ewa.kowalska@example.com', '555-567-1234', 'Kraków', '2024-12-05'),
    ('Piotr', 'Zielinski', 'piotr.zielinski@example.com', '555-456-7890', 'Agnieszka', 'Zielinska', 'agnieszka.zielinska@example.com', '555-678-2345', 'Wrocław', '2024-12-08'),
    ('Kasia', 'Nowak', 'kasia.nowak@example.com', '555-567-8901', 'Tomasz', 'Nowak', 'tomasz.nowak@example.com', '555-789-3456', 'Poznań', '2024-12-12'),
    ('Marcin', 'Lewandowski', 'marcin.lewandowski@example.com', '555-678-9012', 'Beata', 'Lewandowska', 'beata.lewandowska@example.com', '555-890-4567', 'Łódź', '2024-12-14'),
    ('Magdalena', 'Wojcik', 'magdalena.wojcik@example.com', '555-789-0123', 'Robert', 'Wojcik', 'robert.wojcik@example.com', '555-901-5678', 'Szczecin', '2024-12-18'),
    ('Paweł', 'Krawczyk', 'pawel.krawczyk@example.com', '555-890-1234', 'Justyna', 'Krawczyk', 'justyna.krawczyk@example.com', '555-012-6789', 'Lublin', '2024-12-20'),
    ('Ewelina', 'Dudek', 'ewelina.dudek@example.com', '555-901-2345', 'Marek', 'Dudek', 'marek.dudek@example.com', '555-123-7890', 'Katowice', '2024-12-22'),
    ('Michał', 'Jankowski', 'michal.jankowski@example.com', '555-012-3456', 'Urszula', 'Jankowska', 'urszula.jankowska@example.com', '555-234-8901', 'Białystok', '2024-12-24'),
    ('Sylwia', 'Zając', 'sylwia.zajac@example.com', '555-234-5679', 'Wojciech', 'Zając', 'wojciech.zajac@example.com', '555-345-9012', 'Gdynia', '2024-12-26'),
    ('Grzegorz', 'Szymański', 'grzegorz.szymanski@example.com', '555-345-6780', 'Elżbieta', 'Szymańska', 'elzbieta.szymanska@example.com', '555-456-0123', 'Bydgoszcz', '2024-12-28');


-- Insert sample data into 'teachers'
INSERT INTO teachers
    (first_name, last_name, email, phone_number, specialization, experience)
VALUES
    ('Alice', 'Johnson', 'alice.johnson@example.com', '555-345-6789', 'Python Programming', 5),
    ('Bob', 'Brown', 'bob.brown@example.com', '555-456-7890', 'Web Development', 8),
    ('Carol', 'White', 'carol.white@example.com', '555-567-8902', 'Data Science', 3),
    ('David', 'Green', 'david.green@example.com', '555-678-9013', 'Machine Learning', 6),
    ('Eva', 'Black', 'eva.black@example.com', '555-789-0124', 'UI/UX Design', 4),
    ('Frank', 'Wilson', 'frank.wilson@example.com', '555-890-1235', 'Cybersecurity', 7),
    ('Grace', 'Harris', 'grace.harris@example.com', '555-901-2346', 'Cloud Computing', 5),
    ('Henry', 'Martin', 'henry.martin@example.com', '555-012-3457', 'Mobile App Development', 2),
    ('Irene', 'Clark', 'irene.clark@example.com', '555-234-5670', 'Game Development', 9),
    ('Jack', 'Lewis', 'jack.lewis@example.com', '555-345-6781', 'Data Engineering', 10),
    ('Karen', 'Robinson', 'karen.robinson@example.com', '555-456-7892', 'DevOps', 4),
    ('Leo', 'Walker', 'leo.walker@example.com', '555-567-8903', 'AI Ethics', 1);


-- Insert sample data into 'courses'
INSERT INTO courses
    (name, description, course_type, duration, price, start_date, end_date, is_online, max_students)
VALUES
    ('Python Basics', 'Introduction to Python', 'Annual', 30, 1500.00, '2024-01-15', '2024-06-30', 1, 20),
    ('Web Development Bootcamp', 'HTML, CSS, and JavaScript', 'Short Weekly', 10, 800.00, '2024-02-01', '2024-02-10', 0, 15),
    ('Advanced Python', 'In-depth Python programming', 'Annual', 40, 2000.00, '2024-03-01', '2024-08-30', 1, 25),
    ('Data Science Fundamentals', 'Introduction to Data Science', 'Short Weekly', 12, 1800.00, '2024-03-15', '2024-04-10', 1, 20),
    ('Machine Learning Basics', 'Basic ML concepts and techniques', 'Annual', 35, 2500.00, '2024-04-01', '2024-09-30', 1, 20),
    ('UI/UX Fundamentals', 'Principles of user interface and experience', 'Short Weekly', 8, 1200.00, '2024-05-05', '2024-05-20', 0, 15),
    ('Cybersecurity Essentials', 'Introductory cybersecurity course', 'Annual', 30, 2100.00, '2024-06-01', '2024-11-30', 1, 20),
    ('Cloud Computing Basics', 'Cloud providers and deployment', 'Short Weekly', 10, 1600.00, '2024-07-10', '2024-07-20', 1, 15),
    ('Mobile App Development', 'Building mobile apps for Android/iOS', 'Annual', 50, 3000.00, '2024-08-15', '2025-01-30', 1, 30),
    ('Game Development Intro', 'Basic game development concepts', 'Annual', 20, 1400.00, '2024-09-01', '2024-12-31', 0, 20),
    ('Data Engineering Bootcamp', 'Data pipelines and ETL processes', 'Short Weekly', 15, 2500.00, '2024-09-15', '2024-10-01', 1, 12),
    ('DevOps Practices', 'CI/CD and automation', 'Annual', 25, 2200.00, '2024-10-01', '2025-03-31', 1, 18);


-- Insert sample data into 'lessons'
-- Assuming course_id and teacher_id values match those inserted above
INSERT INTO lessons
    (course_id, lesson_date, start_time, end_time, location_id, teacher_id)
VALUES
    (1, '2024-01-15', '10:00:00', '11:30:00', 1, 1),
    (2, '2024-02-01', '09:00:00', '12:00:00', 1, 2),
    (3, '2024-03-01', '10:00:00', '11:30:00', 1, 1),
    (3, '2024-03-08', '10:00:00', '11:30:00', 1, 1),
    (4, '2024-03-15', '09:00:00', '10:30:00', 1, 3),
    (4, '2024-03-22', '09:00:00', '10:30:00', 1, 3),
    (5, '2024-04-01', '11:00:00', '12:30:00', 1, 4),
    (5, '2024-04-08', '11:00:00', '12:30:00', 1, 4),
    (6, '2024-05-05', '13:00:00', '14:30:00', 1, 5),
    (6, '2024-05-12', '13:00:00', '14:30:00', 1, 5),
    (7, '2024-06-01', '10:00:00', '11:30:00', 1, 6),
    (7, '2024-06-08', '10:00:00', '11:30:00', 1, 6),
    (8, '2024-07-10', '09:30:00', '11:00:00', 1, 7),
    (9, '2024-08-15', '10:00:00', '11:30:00', 1, 8),
    (9, '2024-08-22', '10:00:00', '11:30:00', 1, 8),
    (9, '2024-08-29', '10:00:00', '11:30:00', 1, 8),
    (10, '2024-09-01', '14:00:00', '15:30:00', 2, 9),
    (10, '2024-09-08', '14:00:00', '15:30:00', 2, 9),
    (11, '2024-09-15', '15:00:00', '16:30:00', 2, 10),
    (11, '2024-09-22', '15:00:00', '16:30:00', 2, 10),
    (12, '2024-10-01', '09:00:00', '10:30:00', 2, 11),
    (12, '2024-10-08', '09:00:00', '10:30:00', 2, 11);


-- Insert sample data into 'enrollments'
-- student_id and course_id should exist; use NULL for grade if not graded yet
INSERT INTO enrollments
    (student_id, course_id, enrollment_date, status, grade)
VALUES
    (1, 1, '2024-12-15', 'Aktywny', 2),
    (2, 2, '2024-12-16', 'Aktywny', 3),
    (3, 1, '2024-12-16', 'Aktywny', 4),
    (4, 3, '2024-12-17', 'Aktywny', NULL),
    (5, 4, '2024-12-18', 'Aktywny', NULL),
    (6, 5, '2024-12-19', 'Zakończony', 5),
    (7, 6, '2024-12-20', 'Aktywny', 3),
    (8, 7, '2024-12-21', 'Aktywny', NULL),
    (9, 8, '2024-12-22', 'Zakończony', 4),
    (10, 9, '2024-12-23', 'Aktywny', NULL),
    (11, 10, '2024-12-24', 'Aktywny', 2),
    (12, 11, '2024-12-25', 'Zakończony', 5);


-- Insert sample data into 'lesson_ratings'
-- Ensure that student_id and lesson_id exist
INSERT INTO lesson_ratings
    (student_id, lesson_id, rating, comment, review_date)
VALUES
    (1, 1, 5, 'Great lesson!', '2024-12-16'),
    (2, 2, 4, 'Very informative.', '2024-12-17'),
    (3, 3, 5, 'Excellent explanation', '2024-12-17'),
    (4, 4, 4, 'Good pace', '2024-12-18'),
    (5, 5, 3, 'Average', '2024-12-19'),
    (6, 6, 5, 'Very clear examples', '2024-12-20'),
    (7, 7, 4, 'Informative', '2024-12-21'),
    (8, 8, 5, 'Great course material', '2024-12-22'),
    (9, 9, 3, 'Could be better', '2024-12-23'),
    (10, 10, 5, 'Loved it', '2024-12-24'),
    (11, 11, 4, 'Good interaction', '2024-12-25'),
    (12, 12, 5, 'Perfect session', '2024-12-26');


-- Insert sample data into 'attendance'
-- Assuming session_id corresponds to lesson_id
INSERT INTO attendance
    (session_id, student_id, status)
VALUES
    (1, 1, 'Nieobecny'),
    (2, 2, 'Obecny'),
    (3, 3, 'Obecny'),
    (4, 4, 'Obecny'),
    (5, 5, 'Nieobecny'),
    (6, 6, 'Obecny'),
    (7, 7, 'Obecny'),
    (8, 8, 'Nieobecny'),
    (9, 9, 'Obecny'),
    (10, 10, 'Obecny'),
    (11, 11, 'Nieobecny'),
    (12, 12, 'Obecny');


-- Insert sample data into 'subjects'
INSERT INTO subjects
    (name, description, category)
VALUES
    ('Loops', 'Understanding loops in programming', 'Programming Fundamentals'),
    ('HTML Basics', 'Introduction to HTML structure', 'Web Development'),
    ('Data Types', 'Basic data types and variables', 'Programming Fundamentals'),
    ('CSS Styling', 'Cascading Style Sheets basics', 'Web Development'),
    ('Functions', 'Creating and using functions', 'Programming Fundamentals'),
    ('JavaScript Basics', 'Intro to JS and DOM manipulation', 'Web Development'),
    ('OOP Concepts', 'Introduction to Object-Oriented Programming', 'Programming Fundamentals'),
    ('Security Basics', 'Basic cybersecurity practices', 'Cybersecurity'),
    ('Databases 101', 'Intro to relational databases', 'Data Management'),
    ('Cloud Deployment', 'Deploying apps on the cloud', 'Cloud Computing'),
    ('DevOps Tools', 'Common DevOps tools and CI/CD pipelines', 'DevOps');


-- Insert sample data into 'courses_subjects'
-- Ensure course_id and subject_id exist
INSERT INTO courses_subjects
    (course_id, subject_id)
VALUES
    (1, 1),
    (2, 2),
    (2, 4),
    (2, 6),
    (3, 1),
    (3, 3),
    (4, 1),
    (4, 3),
    (5, 3),
    (5, 7),
    (6, 5),
    (7, 8),
    (8, 10),
    (9, 11),
    (10, 7),
    (11, 9),
    (12, 11);
