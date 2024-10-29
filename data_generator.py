import csv
import threading
import datetime
from faker import Faker
 
overwrite = True # dla False, dodaje dane do istniejacych juz plikow
modify = False # dla True, zmienia istniejace dane w plikach, dziala wylacznie gdy overwrite=False
headers = False # dla True, dodaje naglowki do plikow, dziala wylacznie gdy overwrite=True
rows_to_modify = 10 # liczba wierszy do zmodyfikowania w pliku, gdy overwrite=False
 
faker = Faker("pl_PL")
faker_latin = Faker("la") # lorem ipsum
 
students_rows = 20
teachers_rows = 10
courses_rows = 5
lessons_rows = courses_rows * 20
lesson_ratings_rows = 100
enrollments_rows = int(students_rows * 1.2)
subjects_rows = 30
courses_subjects_rows = courses_rows * subjects_rows
attendance_rows = enrollments_rows * lessons_rows
locations_rows = 20 # google sheets
final_surveys_rows = int(enrollments_rows * 0.6) # google sheets

def generate_id(i, used, filename):
    if overwrite:  # jezeli overwrite to id ustal na podstawie ostatniego w pliku
        courses_id = i
    elif modify:  # dla modify, wybierz losowy wiersz, usun go i dodaj nowy
        courses_id = faker.random_int(min=1, max=check_last_value_at_column(filename, 0))
        while courses_id in used:
            courses_id = faker.random_int(min=1, max=check_last_value_at_column(filename, 0))
        delete_row(filename, 0, courses_id)
    else:  # gdy plik jest pusty, zacznij iterowac od zera
        courses_id = i + check_last_value_at_column(filename, 0)
    
    used.append(courses_id)
    return courses_id
 
def generate_courses(rows): #todo used, 
    data = []
    used = []
    for i in range(1, rows+1):
        courses_id = generate_id(i, used, "courses.csv")
        name = faker_latin.text(max_nb_chars=30)
        description = faker_latin.text(max_nb_chars=200)
        course_type = faker.random_element(elements=("Diagnostyczny", "Roczny", "Semestralny", "Zajęcia dodatkowe", "Inne"))
        duration = faker.random_int(min=2, max=60)
        price = faker.random_int(min=0, max=duration*200)
        start_date = faker.date_between(start_date="-3y", end_date="-3m")
        end_date = faker.date_between(start_date=start_date, end_date="+3m")
        is_online = faker.boolean(chance_of_getting_true=50)
        max_students = faker.random_int(min=5, max=30)
        
        data.append([courses_id, name, description, course_type, duration, price, start_date, end_date, is_online, max_students])
        
    export_to_csv("courses.csv", ["courses_id", "name", "description", "course_type", 
                                  "duration", "price", "start_date", "end_date", 
                                  "is_online", "max_students"], data)
        
def generate_teachers(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        teacher_id = generate_id(i, used, "teachers.csv")
        first_name = faker.first_name()
        last_name = faker.last_name()
        email = faker.email()
        phone_number = faker.phone_number()
        specialization = faker.random_element(elements=("Python", "Java", "C#", "C++", "Unity", "Machine Learning"))
        experience = faker.random_int(min=1, max=10)
        
        data.append([teacher_id, first_name, last_name, email, phone_number, specialization, experience])
        
    export_to_csv("teachers.csv", ["teacher_id", "first_name", "last_name", "email", 
                                   "phone_number", "specialization", "experience"], data)
    
def generate_subjects(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        subject_id = generate_id(i, used, "subjects.csv")
        name = faker_latin.text(max_nb_chars=35)
        description = faker_latin.text(max_nb_chars=150)
        category = faker.random_element(elements=("Podstawy", "Zaawansowane", "Specjalistyczne", "Ogólne", "Inne"))
        
        data.append([subject_id, name, description, category])
        
    export_to_csv("subjects.csv", ["subject_id", "name", "description", "category"], data)
 
def generate_lessons(rows):
    data = []
    used = []
    for i in range(1,rows+1):
        lesson_id = generate_id(i, used, "lessons.csv")
        course_id = faker.random_int(min=1, max=courses_rows)
        lesson_date = faker.date_between(start_date="-3y", end_date="today")
        start_date = faker.time(pattern="%H:%M:%S", end_datetime=None)
        end_date = faker.time(pattern="%H:%M:%S", end_datetime=None) # to fix
        location_id = faker.random_int(min=1, max=locations_rows)
        teacher_id = faker.random_int(min=1, max=teachers_rows)
        
        data.append([lesson_id, course_id, lesson_date, start_date, end_date, location_id, teacher_id])
        
    export_to_csv("lessons.csv", ["lesson_id", "course_id", "lesson_date", "start_date", 
                                  "end_date", "location_id", "teacher_id"], data)
 
def generate_enrollments(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        enrollment_id = generate_id(i, used, "enrollments.csv")
        student_id = faker.random_int(min=1, max=check_last_value_at_column("students.csv", 0))
        course_id = faker.random_int(min=1, max=check_last_value_at_column("courses.csv", 0))
        enrollment_date = faker.date_between(start_date="-3y", end_date="today")
        status = faker.random_element(elements=("Aktywny", "Zakończony", "Anulowany"))
        grade = faker.random_int(min=1, max=5)
        
        data.append([enrollment_id, student_id, course_id, enrollment_date, status, grade])
        
    export_to_csv("enrollments.csv", ["enrollment_id", "student_id", "course_id", 
                                      "enrollment_date", "status", "grade"], data)
 
def generate_lesson_ratings(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        lesson_ratings_id = generate_id(i, used, "lesson_ratings.csv")
        student_id = faker.random_int(min=1, max=check_last_value_at_column("students.csv", 0))
        FK_lesson_id = faker.random_int(min=1, max=check_last_value_at_column("lessons.csv", 0))
        rating = faker.random_int(min=1, max=5)
        comment = faker_latin.text(max_nb_chars=200)
        review_date = faker.date_between(start_date="-3y", end_date="today")
        
        data.append([lesson_ratings_id, student_id, FK_lesson_id, rating, comment, review_date])
 
    export_to_csv("lesson_ratings.csv", ["session_id", "student_id", "status"], data)
    
def generate_attendance(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        attendance_id = generate_id(i, used, "attendance.csv")
        session_id = faker.random_int(min=1, max=check_last_value_at_column("lessons.csv", 0))
        student_id = faker.random_int(min=1, max=check_last_value_at_column("students.csv", 0))
        status = faker.random_element(elements=("Obecny", "Nieobecny", "Spóźniony", "Usprawiedliwione"))
        
        data.append([attendance_id, session_id, student_id, status])
        
    export_to_csv("attendance.csv", ["attendance_id", "session_id", "student_id", "status"], data)
 
def generate_courses_subjects(rows):
    data = []
    used = []
    for i in range(1, rows + 1):
        courses_subject_id = generate_id(i, "courses_subjects.csv", used)
        course_id = faker.random_int(min=1, max=check_last_value_at_column("courses.csv", 0))
        subject_id = faker.random_int(min=1, max=check_last_value_at_column("subjects.csv", 0))
        
        data.append([courses_subject_id, course_id, subject_id])
        
    export_to_csv("courses_subjects.csv", ["courses_subject_id", "course_id", "subject_id"], data)
    
def generate_students(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        student_id = generate_id(i, used, "students.csv")
        first_name = faker.first_name()
        last_name = faker.last_name()
        email = faker.email()
        phone_number = faker.phone_number()
        parent_first_name = faker.first_name()
        parent_last_name = last_name
        parent_email = faker.email()
        parent_phone_number = faker.phone_number()
        city = faker.city()
        registration_date = faker.date_between(start_date="-3y", end_date="today")
        
        data.append([student_id, first_name, last_name, email, phone_number, parent_first_name, parent_last_name, 
                     parent_email, parent_phone_number, city, registration_date])
    
    export_to_csv("students.csv", ["student_id", "first_name", "last_name", "email", 
                                   "phone_number", "parent_first_name", "parent_last_name", "parent_email", 
                                   "parent_phone_number", "city", "registration_date"], data)
        
def generate_locations(rows):
    data = []
    used = []
    for i in range(1, rows+1):
        location_id = generate_id(i, used, "locations.csv")
        name = faker.company()
        postal_code = faker.postcode()
        miejscowosc = faker.city()
        adres = faker.street_address().split(" ")
        while adres[0] == "pl.":
            adres = faker.street_address().split(" ")
        ulica = adres[0] + " " + adres[1]
        numer = adres[-1]
        
        data.append([location_id, name, postal_code, miejscowosc, ulica, numer])
    
    export_to_csv("locations.csv", ["location_id", "name", "postal_code", "miejscowosc", "ulica", "numer"], data)
    
def generate_final_surveys(rows):
    data = []
    for i in range(1, rows+1):
        student_id = faker.random_int(min=1, max=check_last_value_at_column("students.csv", 0))
        teacher_id = faker.random_int(min=1, max=check_last_value_at_column("teachers.csv", 0))
        date_of_survey = faker.date_between(start_date="-2y", end_date="today")
        course_rating = faker.random_int(min=1, max=5)
        teacher_rating = faker.random_int(min=1, max=5)
        positive_feedback = faker.random_element(elements=("Świetnie zorganizowany", "Bardzo pomocny", "Dobrze przekazana wiedza", # losowe pozytywne uwagi, w ogolnosci moga byc dowolne
                                                    "Inspirujący", "Praktyczne przykłady", "Wartościowy materiał", 
                                                    "Profesjonalny prowadzący", ""))
        negative_feedback = faker.random_element(elements=("Zbyt ogólny", "Słaba organizacja", "Mało praktycznych przykładów", # losowe negatywne uwagi, w ogolnosci moga byc dowolne
                                                    "Brak interakcji", "Nieprzydatny materiał", "Zbyt długi", "Niejasne wyjaśnienia", ""))
        continue_learning = faker.random_element(elements=("tak", "nie", "nie wiem")) # wylacznie te wartosci dozwolone
        additional_comments = faker_latin.text(max_nb_chars=200)
        
        data.append([student_id, teacher_id, date_of_survey, course_rating, teacher_rating, positive_feedback, negative_feedback, continue_learning, additional_comments])
        
    export_to_csv("final_surveys.csv", ["student_id", "teacher_id", "date_of_survey", 
                                        "course_rating", "teacher_rating", "positive_feedback", 
                                        "negative_feedback", "continue_learning", "additional_comments"], data)
    
def check_last_value_at_column(filename, column):
    try:
        with open(filename, mode="r", newline="", encoding="utf-8") as file:
            reader = csv.reader(file)
            rows = list(reader)
            if len(rows) == 0:
                return 1
            return int(rows[-1][column])
    except Exception as e:
        return 1
 
def export_to_csv(filename, headers, data):
    try:
        mode = "w" if overwrite else "a"
        with open(filename, mode=mode, newline="", encoding="utf-8") as file:
            writer = csv.writer(file)
            if overwrite and globals().get('headers', False):  
                writer.writerow(headers)
            writer.writerows(data)
            print(f"data written to file {filename}, time: {datetime.datetime.now()}")
    except Exception as e:
        print(f"Error writing to file: {e}")

def delete_row(filename, column, value):
    try:
        rows = []
        with open(filename, mode="r", newline="", encoding="utf-8") as file:
            reader = csv.reader(file)
            rows = list(reader)
                
            rows = [rows[0]] + [row for row in rows[1:] if row[column] != str(value)]

        with open(filename, mode="w", newline="", encoding="utf-8") as file:
            writer = csv.writer(file)
            writer.writerows(rows)
        
        print(f"Deleted value '{value}' at column {column} from file '{filename}'")
    
    except Exception as e:
        print(f"Error deleting row from file: {e}")

        
if __name__ == "__main__":
    put_modify_on_hold = False
    
    modify_functions = { # co powinno zostac zapisane
        generate_locations: rows_to_modify,
        #generate_final_surveys: rows_to_modify,
        generate_courses: rows_to_modify,
        #generate_teachers: rows_to_modify,
        #generate_subjects: rows_to_modify,
        #generate_students: rows_to_modify,
        #generate_lessons: rows_to_modify,
        #generate_enrollments: rows_to_modify,
        #generate_lesson_ratings: rows_to_modify,
        #generate_courses_subjects: rows_to_modify,
        #generate_attendance: rows_to_modify,
    }
    
    generate_functions = { # co powinno zostac wygenerowane
        generate_locations: locations_rows,
        generate_final_surveys: final_surveys_rows,
        generate_courses: courses_rows,
        generate_teachers: teachers_rows,
        generate_subjects: subjects_rows,
        generate_students: students_rows,
        generate_lessons: lessons_rows,
        generate_enrollments: enrollments_rows,
        generate_lesson_ratings: lesson_ratings_rows,
        generate_courses_subjects: courses_subjects_rows,
        generate_attendance: attendance_rows,
    }
    
    if modify:
        put_modify_on_hold = True
        modify = False
    
    threads = []
    for func in generate_functions:
        thread = threading.Thread(target=func, args=(generate_functions[func],))
        thread.start()
        threads.append(thread)
 
    for thread in threads:
        thread.join()
        
    print("-----DATA GENERATED-----")
    
    if put_modify_on_hold:
        modify = True
        threads = []
        if modify and not overwrite:
            for func, rows in modify_functions.items():
                thread = threading.Thread(target=func, args=(modify_functions[func],))
                thread.start()
                threads.append(thread)
        
            for thread in threads:
                thread.join()
        
        print("-----DATA MODIFIED-----")
        
    
    