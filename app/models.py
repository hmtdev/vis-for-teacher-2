from app import db

# - one
# = many

# User     - -  Class
# Class    - =  Student
# Student  = =  Subject
# Semester - =  Subject

class User(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    username = db.Column(db.String(100), unique=True, nullable=False)
    password_hash = db.Column(db.String(200), unique=True, nullable=False)
    full_name = db.Column(db.String(200), nullable=False)
    class_ = db.relationship('Class_', backref='User', uselist=False)

    def __init__(self, username, password_hash, full_name, class_=None):
        self.username = username
        self.password_hash = password_hash
        self.full_name = full_name
        self.class_ = class_

    def __repr__(self):
        return "<User({}, {}, {}, {})>".format(self.id, self.username, self.full_name, self.class_)

class Class_(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    class_name = db.Column(db.String(50), nullable=False, unique=True)
    user_id = db.Column(db.Integer, db.ForeignKey(User.id), unique=True)
    students = db.relationship('Student', backref='Person')

    def __init__(self, class_name, user_id = None):
        self.class_name = class_name
        self.user_id = user_id
    
    def __repr__(self):
        return "<Class_({}, {})>".format(self.class_name, self.user_id)

class Student(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    full_name = db.Column(db.String(200), nullable=False)
    student_code = db.Column(db.String(10), nullable=False, unique=True)
    course = db.Column(db.Integer, nullable=False)
    class_id = db.Column(db.Integer, db.ForeignKey(Class_.id))

class Subject(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    name = db.Column(db.String(200), nullable=False, unique=True)
    credit = db.Column(db.Integer, default=0, nullable=False)

class Semester(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    number = db.Column(db.Integer, nullable=False, default=1)
    