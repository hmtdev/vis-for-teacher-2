from app import db

# - one
# = many

# User   - -  Class
# Class  - =  Student
# Semester - =  Subject
# Student  = =  Subject
# Class - - Semester # Một lớp có 1 học kì hiện tại

# back_populates trỏ đến các tham số của các các class khác
# db.relation(tham số đầu), tham số đầu tiên là tên của table 

class SubjectDetail(db.Model):
    __tablename__ = 'SubjectDetail'
    student_id = db.Column(db.Integer, db.ForeignKey('Student.id'), primary_key=True)
    subject_id = db.Column(db.Integer, db.ForeignKey('Subject.id'), primary_key=True)
    final_score_10 = db.Column(db.Float, nullable=True)
    final_score_4 = db.Column(db.Float, nullable=True)

    subjects = db.relation('Subject', back_populates='students')
    students = db.relation('Student', back_populates='subjects')

    def __init__(
        self,
        student_id,
        subject_id,
        final_score_10=None,
        final_score_4=None
    ):
        self.student_id = student_id
        self.subject_id = subject_id
        self.final_score_10 = final_score_10,
        self.final_score_4 = final_score_4
    
    def __repr__(self):
        return '<SubjectDetail({}, {}, {}, {})>'.format(
            self.student_id, 
            self.subject_id, 
            self.final_score_10,
            self.final_score_4
        )

class SemesterDetail(db.Model):
    __tablename__ = 'SemesterDetail'
    student_id = db.Column(db.Integer, db.ForeignKey('Student.id'), primary_key=True)
    semester_id = db.Column(db.Integer, db.ForeignKey('Semester.id'), primary_key=True)
    semester_average_score_10 = db.Column(db.Float, nullable=True)
    semester_average_score_4 = db.Column(db.Float, nullable=True)

    semesters_with_students = db.relationship('Semester', back_populates='students_with_semesters')
    students_with_semesters = db.relationship('Student', back_populates='semesters_with_students')

    def __init__(
        self,
        student_id,
        semester_id,
        semester_average_score_10=None,
        semester_average_score_4=None
    ):
        self.student_id = student_id
        self.semester_id = semester_id
        self.semester_average_score_10 = semester_average_score_10
        self.semester_average_score_4 = semester_average_score_4

    def __repr__(self):
        return '<SemesterDetail({}, {}, {}, {})>'.format(
            self.student_id,
            self.semester_id,
            self.semester_average_score_10,
            self.semester_average_score_4
        )

class User(db.Model):
    __tablename__ = 'User'
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password_hash = db.Column(db.String(200), unique=True, nullable=False)
    full_name = db.Column(db.String(200), nullable=False)
    email = db.Column(db.String(100), nullable=False)

    # one class
    # uselist=False to set relationship to one one
    class_ = db.relationship('Class_', backref='User', lazy=True, uselist=False)

    def __init__(
        self,
        username,
        password_hash,
        full_name,
        email
    ):
        self.username = username
        self.password_hash = password_hash
        self.full_name = full_name
        self.email = email

    def __repr__(self):
        return "<User({}, {}, {}, {})>".format(
            self.id,
            self.username,
            self.full_name,
            self.email
        )

class Class_(db.Model):
    __tablename__ = 'Class_'
    id = db.Column(db.Integer, primary_key=True)
    class_name = db.Column(db.String(100), nullable=False, unique=True)
    class_name_abbr = db.Column(db.String(50), nullable=False, unique=True)
    class_code = db.Column(db.String(50), nullable=False, unique=True)
    branch = db.Column(db.String(100), nullable=False)
    major = db.Column(db.String(100), nullable=False)
    major_code = db.Column(db.String(50), nullable=False, unique=True)

    current_semester_id = db.Column(db.Integer, db.ForeignKey('Semester.id'), nullable=False)

    # one user
    user_id = db.Column(db.Integer, db.ForeignKey('User.id'), nullable=False)

    # many student
    students = db.relationship('Student', backref='Class_', lazy=True, uselist=True)

    def __init__(
        self,
        class_name,
        class_name_abbr,
        class_code,
        branch,
        major,
        major_code,
        current_semester_id,
        user_id
    ):
        self.class_name = class_name
        self.class_name_abbr = class_name_abbr
        self.class_code = class_code
        self.branch = branch
        self.major = major
        self.major_code = major_code
        self.current_semester_id = current_semester_id
        self.user_id = user_id
    
    def __repr__(self):
        return "<Class_({}, {}, {}, {}, {}, {}, {}, {}, {})>".format(
            self.id,
            self.class_name,
            self.class_name_abbr,
            self.class_code,
            self.branch,
            self.major,
            self.major_code,
            self.current_semester_id,
            self.user_id
        )

class Student(db.Model):
    __tablename__ = 'Student'
    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(200), nullable=False)
    student_code = db.Column(db.String(10), nullable=False, unique=True)
    course = db.Column(db.Integer, nullable=False)
    passed_credit = db.Column(db.Integer, nullable=False, default=0)
    registered_credit = db.Column(db.Integer, nullable=False, default=0)
    cumulative_score_10 = db.Column(db.Float, default=0, nullable=True)
    cumulative_score_4 = db.Column(db.Float, default=0, nullable=True)
    graded = db.Column(db.String(20), nullable=True)
    char_score = db.Column(db.String(5), nullable=True)

    # one class
    class_id = db.Column(db.Integer, db.ForeignKey('Class_.id'), nullable=False)

    # many to many
    subjects = db.relationship(SubjectDetail, back_populates='students')

    semesters_with_students = db.relationship(SemesterDetail, back_populates='students_with_semesters')

    def __init__(
        self, 
        full_name, 
        student_code, 
        course, 
        passed_credit, 
        registered_credit, 
        cumulative_score_10, 
        cumulative_score_4,
        graded,
        char_score,
        class_id, 
    ):
        self.full_name = full_name
        self.student_code = student_code
        self.course = course
        self.passed_credit = passed_credit
        self.registered_credit = registered_credit
        self.cumulative_score_10 = cumulative_score_10
        self.cumulative_score_4 = cumulative_score_4
        self.graded = graded
        self.char_score = char_score
        self.class_id = class_id

    def __repr__(self):
        return "<Student({}, {}, {}, {}, {}, {}, {}, {})>".format(
            self.id,
            self.full_name,
            self.student_code,
            self.course,
            self.passed_credit,
            self.registered_credit,
            self.cumulative_score_10, 
            self.cumulative_score_4
        )

class Subject(db.Model):
    __tablename__ = 'Subject'
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False, unique=True)
    credit = db.Column(db.Integer, default=0, nullable=False)

    # one semester
    semester_id = db.Column(db.Integer, db.ForeignKey('Semester.id'), nullable=False)

    # many to many
    students = db.relationship(SubjectDetail, back_populates='subjects')

    def __init__(
        self,
        name,
        credit,
        semester_id
    ):
        self.name = name
        self.credit = credit
        self.semester_id = semester_id

    def __repr__(self):
        return '<Subject({}, {}, {})>'.format(
            self.id,
            self.name,
            self.credit
        )

class Semester(db.Model):
    __tablename__ = 'Semester'
    id = db.Column(db.Integer, primary_key=True)
    number = db.Column(db.Integer, nullable=False, default=1)
    
    # many subjects
    subjects = db.relationship(Subject, backref='Semester', uselist=True)

    students_with_semesters = db.relationship(SemesterDetail, back_populates='semesters_with_students')

    class_ = db.relationship('Class_', backref='Semester', lazy=True, uselist=False)

    def __init__(
        self, 
        number=1
    ):
        self.number = number

    def __repr__(self):
        return '<Semester({}, {})>'.format(
            self.id,
            self.number
        )