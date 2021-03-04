from app import db

# - one
# = many

# User   - -  Class
# Class  - =  Student
# Semester - =  Subject
# Student  = =  Subject

# back_populates trỏ đến các tham số của các các class khác
# db.relation(tham số đầu), tham số đầu tiên là tên của table 

class SubjectDetail(db.Model):
    __tablename__ = 'SubjectDetail'
    student_id = db.Column(db.Integer, db.ForeignKey('Student.id'), primary_key=True)
    subject_id = db.Column(db.Integer, db.ForeignKey('Subject.id'), primary_key=True)
    score_10 = db.Column(db.Float, nullable=True)

    subjects = db.relation('Subject', back_populates='students')
    students = db.relation('Student', back_populates='subjects')

    def __init__(self, student_id, subject_id, score_10=None):
        self.student_id = student_id
        self.subject_id = subject_id
        self.score_10 = score_10
    
    def __repr__(self):
        return '<SubjectDetail({}, {}, {})>'.format(self.student_id, self.subject_id, self.score_10)

class User(db.Model):
    __tablename__ = 'User'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password_hash = db.Column(db.String(200), unique=True, nullable=False)
    full_name = db.Column(db.String(200), nullable=False)

    # one class
    # uselist=False to set relationship to one one
    class_ = db.relationship('Class_', backref='User', lazy=True, uselist=False)

    def __init__(self, username, password_hash, full_name):
        self.username = username
        self.password_hash = password_hash
        self.full_name = full_name

    def __repr__(self):
        return "<User({}, {}, {})>".format(self.id, self.username, self.full_name)

class Class_(db.Model):
    __tablename__ = 'Class_'
    id = db.Column(db.Integer, primary_key=True)
    class_name = db.Column(db.String(50), nullable=False, unique=True)

    # one user
    user_id = db.Column(db.Integer, db.ForeignKey('User.id'), nullable=False)

    # many student
    students = db.relationship('Student', backref='Class_', lazy=True, uselist=True)

    def __init__(self, class_name, user_id):
        self.class_name = class_name
        self.user_id = user_id
    
    def __repr__(self):
        return "<Class_({}, {})>".format(self.id, self.class_name)

class Student(db.Model):
    __tablename__ = 'Student'
    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(200), nullable=False)
    student_code = db.Column(db.String(10), nullable=False, unique=True)
    course = db.Column(db.Integer, nullable=False)

    # one class
    class_id = db.Column(db.Integer, db.ForeignKey('Class_.id'), nullable=False)

    # many to many
    subjects = db.relationship(SubjectDetail, back_populates='students')

    def __init__(self, full_name, student_code, course, class_id):
        self.full_name = full_name
        self.student_code = student_code
        self.course = course
        self.class_id = class_id

    def __repr__(self):
        return "<Student({}, {}, {}, {})>".format(self.id, self.full_name, self.student_code, self.course)

class Subject(db.Model):
    __tablename__ = 'Subject'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False, unique=True)
    credit = db.Column(db.Integer, default=0, nullable=False)

    # one semester
    semester_id = db.Column(db.Integer, db.ForeignKey('Semester.id'), nullable=False)

    # many to many
    students = db.relationship(SubjectDetail, back_populates='subjects')

    def __init__(self, name, credit, semester_id):
        self.name = name
        self.credit = credit
        self.semester_id = semester_id

    def __repr__(self):
        return '<Subject({}, {}, {})>'.format(self.id, self.name, self.credit)

class Semester(db.Model):
    __tablename__ = 'Semester'
    id = db.Column(db.Integer, primary_key=True)
    number = db.Column(db.Integer, nullable=False, default=1)
    
    # many subjects
    subjects = db.relationship(Subject, backref='Semester', uselist=True)

    def __init__(self, number):
        self.number = number

    def __repr__(self):
        return '<Semester({}, {})>'.format(self.id, self.number)