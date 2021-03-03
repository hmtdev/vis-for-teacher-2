from app import *
from app.models import *
db.drop_all()
db.create_all()

a_class = Class_('DHKHDL15A')

a_user = User('trungbe', 'trumbquanxip', 'Phạm Thành Bưởi', class_=a_class)

db.session.add(a_class)
db.session.add(a_user)

fulls = ['toan', 'tuan', 'trung']
code = ['12', '13', '14']
course = [15, 15, 15]

a_class = Class_.query.all()[-1]

for i in range(len(code)):
    foo = Student(full_name=fulls[i], student_code=code[i], course=course[i], class_id=a_class.id)
    db.session.add(foo)
db.session.commit()