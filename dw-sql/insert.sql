INSERT INTO date (id, year, month, day) VALUES
(20231101, 2023, 11, 1),
(20231105, 2023, 11, 5),
(20231108, 2023, 11, 8),
(20231115, 2023, 11, 15),
(20231120, 2023, 11, 20);

INSERT INTO students (id, first_name, last_name, email, phone_number, city) VALUES
(1, 'Jan', 'Kowalski', 'jan.kowalski@gmail.com', '+48500123456', 'Warszawa'),
(2, 'Anna', 'Nowak', 'anna.nowak@yahoo.com', '+48500987654', 'Kraków'),
(3, 'Piotr', 'Zieliński', 'piotr.zielinski@onet.pl', '+48785432100', 'Gdańsk'),
(4, 'Katarzyna', 'Wiśniewska', 'kasia.w@gmail.com', '+48600111222', 'Poznań'),
(5, 'Tomasz', 'Lewandowski', 'tom.lew@wp.pl', '+48771234567', 'Łódź');

INSERT INTO courses (id, name, description, course_type, is_online, max_students_category) VALUES
(1, 'Python dla początkujących', 'Nauka podstaw języka Python', 'Roczny', 1, 'Do 20'),
(2, 'Zaawansowana Java', 'Kurs dla programistów Java', 'Warsztat', 0, 'Do 10'),
(3, 'SQL w praktyce', 'Praktyczne podejście do SQL', 'Diagnostyczny', 1, 'Do 30'),
(4, 'Machine Learning', 'Wstęp do uczenia maszynowego', 'Roczny', 0, 'Do 15'),
(5, 'Web Development', 'Budowanie stron internetowych', 'Warsztat', 1, 'Kurs indywidualny');

INSERT INTO teachers (id, first_name, last_name, email, phone_number, specialization) VALUES
(1, 'Adam', 'Malinowski', 'adam.m@edu.pl', '+48555123456', 'Python'),
(2, 'Barbara', 'Kwiatkowska', 'b.kwiatkowska@edu.pl', '+48500987677', 'Java'),
(3, 'Michał', 'Domański', 'michal.d@edu.com', '+48785222200', 'SQL'),
(4, 'Ewa', 'Białas', 'e.bialas@edu.pl', '+48600111888', 'Machine Learning'),
(5, 'Karol', 'Gajewski', 'k.gajewski@edu.net', '+48771234123', 'Web Development');

INSERT INTO locations (id, name, postal_code, city, street, building_number) VALUES
(301, 'Politechnika Gdańska', '80-233', 'Gdańsk', 'Narutowicza', '11/12'),
(302, 'Centrum Edukacyjne', '30-001', 'Kraków', 'Wielicka', '5A'),
(303, 'Sala Konferencyjna', '00-001', 'Warszawa', 'Nowy Świat', '15/5'),
(304, 'Instytut Matematyki', '90-001', 'Łódź', 'Piotrkowska', '100/1'),
(305, 'Akademia Online', 'N/A', 'Online', 'N/A', 'N/A');

INSERT INTO [date] (id, year, month, day) VALUES
(20231101, 2023, 11, 1),
(20231105, 2023, 11, 5),
(20231108, 2023, 11, 8),
(20231115, 2023, 11, 15),
(20231120, 2023, 11, 20),
(20231201, 2023, 12, 1), -- Grudzień 2023
(20231215, 2023, 12, 15), -- Grudzień 2023
(20231010, 2023, 10, 10), -- Październik 2023
(20231020, 2023, 10, 20), -- Październik 2023
(20231031, 2023, 10, 31); -- Październik 2023

INSERT INTO [time] (id, hour, minute, time_of_day) VALUES
(401, 9, 0, 'morning'),
(402, 14, 30, 'afternoon'),
(403, 18, 0, 'evening'),
(404, 11, 15, 'morning'),
(405, 20, 45, 'night');

INSERT INTO subjects (id, name, description) VALUES
(201, 'Typy danych w Pythonie', 'Wprowadzenie do typów danych w Pythonie'),
(202, 'Pętle i warunki', 'Zastosowanie pętli i warunków w Pythonie'),
(203, 'Zaawansowane zapytania SQL', 'Tworzenie i optymalizacja złożonych zapytań SQL'),
(204, 'Regresja liniowa', 'Podstawy regresji liniowej w uczeniu maszynowym'),
(205, 'HTML i CSS', 'Tworzenie struktur i stylizacja stron internetowych');

INSERT INTO junk (id, status) VALUES
(1, 'Obecny'),
(2, 'Nieobecny'),
(3, 'Spóźniony'),
(4, 'Usprawiedliwiony'),
(5, 'Nieznany');

INSERT INTO final_surveys_scd1 (id, course_interest_rating, teacher_engagement_rating, positive_comments, negative_comments, continue_course, filled) VALUES
(101, 5, 5, 'Świetny kurs!', NULL, 'tak', 1),
(102, 4, 3, 'Dobry, ale trudny materiał.', 'Za mało przykładów.', 'nie', 1),
(103, 5, 5, 'Bardzo wartościowy kurs.', NULL, 'tak', 1),
(104, 4, 4, 'Super kurs :)', NULL, 'nie wiem', 0),
(105, 3, 4, 'Treściwe zajęcia.', 'Czasami za szybkie tempo.', 'tak', 1);


INSERT INTO fact_enrollments (student_id, course_id, final_survey_id, date_id, status, grade, duration, price) VALUES
(1, 1, 101, 20231101, 'aktywny', 5, 40, 1200.00),
(2, 3, 102, 20231105, 'zakończony', 4, 30, 900.00),
(3, 4, 103, 20231108, 'aktywny', 5, 60, 1500.00),
(4, 2, 104, 20231115, 'anulowany', 4, 10, 0.00),
(5, 5, 105, 20231120, 'aktywny', 3, 20, 800.00),
(1, 1, 101, 20231201, 'aktywny', 5, 40, 1200.00),
(2, 3, 102, 20231215, 'zakończony', 4, 30, 900.00),
(3, 4, 103, 20231010, 'aktywny', 5, 60, 1500.00),
(4, 2, 104, 20231020, 'anulowany', 4, 10, 0.00),
(5, 5, 105, 20231031, 'aktywny', 3, 20, 800.00);

INSERT INTO fact_attendance (student_id, subject_id, teacher_id, location_id, start_time_id, date_id, course_id, rating) VALUES
(1, 201, 1, 301, 401, 20231101, 1, 5),
(2, 202, 2, 302, 402, 20231105, 3, 4),
(3, 203, 3, 303, 403, 20231108, 4, 5),
(4, 204, 4, 304, 404, 20231115, 2, 4),
(5, 205, 5, 305, 405, 20231120, 5, 3);