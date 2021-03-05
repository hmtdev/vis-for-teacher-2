import pickle
from app import *
from app.models import *

def write_json(name, data):
    with open(name, 'wb') as f:
        pickle.dump(data, f, pickle.HIGHEST_PROTOCOL)

def read_json(name):
    with open(name, 'rb') as f:
        return pickle.load(f)

db.drop_all()
# drop database by order
# Subject.__table__.drop(db.engine)
# Semester.__table__.drop(db.engine)
# Student.__table__.drop(db.engine)
# SubjectDetail.__table__.drop(db.engine)
# Class_.__table__.drop(db.engine)
# User.__table__.drop(db.engine)

db.create_all() 

# tạo một user tạm
a_user = User(
    'tuanio',
    'passwordhashed',
    'Nguyễn Văn Anh Tuấn',
    'nvatuan3@gmail.com'
)
db.session.add(a_user)
db.session.commit()

# tạo 8 học kì
semesters = [Semester(i) for i in range(1, 9)]
for i in semesters: 
    db.session.add(i)
db.session.commit()

# Thêm các môn vào chương trình khung
subjects_of_semesters = read_json('data/subjects_of_semesters.pkl')
for semester, subjects in subjects_of_semesters.items():
    data = Semester.query.filter_by(id=semester).one()
    for subj in subjects:
        subject = Subject(
            name=subj['name'],
            credit=subj['credit'],
            semester_id=data.id
        )
        db.session.add(subject)
db.session.commit()

# đưa thông tin của lớp vào database
class_info = read_json('data/class_info.pkl')
a_class = Class_(
    class_name=class_info['class_name'],
    class_name_abbr=class_info['class_name_abbr'],
    class_code=class_info['class_code'],
    branch=class_info['branch'],
    major=class_info['major'],
    major_code=class_info['major_code'],
    current_semester_id=semesters[class_info['current_semester'] - 1].id,
    user_id=a_user.id
)
db.session.add(a_class)
db.session.commit()

# đưa thông tin từng sinh viên vào trong database
students_info = read_json('data/student_info.pkl')
for student in students_info:
    foo = Student(
        full_name=student['full_name'],
        student_code=student['student_code'],
        course=student['course'],
        passed_credit=student['passed_credit'],
        registered_credit=student['registered_credit'],
        cumulative_score_10=student['cumulative_score_10'],
        cumulative_score_4=student['cumulative_score_4'],
        graded=student['graded'],
        char_score=student['char_score'],
        class_id=a_class.id
    )
    db.session.add(foo)
db.session.commit()

# đưa dữ liệu subject detail vào database 
subject_detail = read_json('data/subject_detail.pkl')
for detail in subject_detail:
    student_id = Student.query.filter_by(full_name=detail['student_name']).first().id
    if ('Anh' in detail['subject_name']):
        subject_id = Subject.query.filter(Subject.name.contains('Anh')).first().id
    else:
        subject_id = Subject.query.filter_by(name=detail['subject_name']).first().id
    foo = SubjectDetail(
        student_id=student_id,
        subject_id=subject_id,
        final_score_10=detail['final_score_10'],
        final_score_4=detail['final_score_4']
    )
    db.session.add(foo)
# db.session.commit()

# đưa dữ liệu điểm tổng kết theo kì của từng sinh viên vào database
semester_detail = read_json('data/semester_detail.pkl')
for detail in semester_detail:
    student_id = Student.query.filter_by(full_name=detail['student_name']).first().id
    foo = SemesterDetail(
        student_id=student_id,
        semester_id=detail['semester_id'],
        semester_final_score_10=detail['semester_final_score_10'],
        semester_final_score_4=detail['semester_final_score_4']
    )
    db.session.add(foo)
db.session.commit()