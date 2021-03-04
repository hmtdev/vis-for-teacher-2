from app import *
from app.models import *

db.drop_all()
# drop database by order
# Subject.__table__.drop(db.engine)
# Semester.__table__.drop(db.engine)
# Student.__table__.drop(db.engine)
# SubjectDetail.__table__.drop(db.engine)
# Class_.__table__.drop(db.engine)
# User.__table__.drop(db.engine)

db.create_all() 

a_user = User(username='tuanio', password_hash='asdfasdfasfsaddf', full_name='Nguyễn Văn Anh Tuấn')


db.session.add(a_user)
db.session.commit()

print(a_user)

a_class = Class_('Đại Học Khoa Học Dữ Liệu 15A', user_id=a_user.id)

db.session.add(a_class)
db.session.commit()

student_fullname = ['Phạm Thành Trung', 'Huỳnh Minh Toàn', 'Nguyễn Bô Lão']
student_course = [15, 16, 15]
student_code = ['250880502', '66770289', '12345678']

students = []
for i in range(3):
    foo = Student(full_name=student_fullname[i], student_code=student_code[i], course=student_course[i], class_id=a_class.id)
    students += [foo]

for i in students:
    db.session.add(i)

semester1 = Semester(1)
semester2 = Semester(2)
semester3 = Semester(3)

db.session.add(semester1)
db.session.add(semester2)
db.session.add(semester3)
db.session.commit()

subjects = []
subjects += [Subject('Toán cao cấp 1', 3, semester_id=semester1.id)]
subjects += [Subject('Thống kê máy tính và ứng dụng', 3, semester_id=semester3.id)]
subjects += [Subject('Hệ thống máy tính', 3, semester_id=semester2.id)]

for i in subjects:
    db.session.add(i)
db.session.commit()

import random

data = []
for student in students:
    for subject in subjects:
        data += [SubjectDetail(student_id=student.id, subject_id=subject.id, score_10=random.randint(0, 10))]

for i in data:
    db.session.add(i)
db.session.commit()