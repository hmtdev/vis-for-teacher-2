from app import *
from app.models import *
db.drop_all()
db.create_all()

class_ = Class_(class_name='DHKDL15A')
user = User(username='trungbe', full_name='Phạm Thành Bưởi', password_hash='hainamkhongtam', class_=class_)

db.session.add(class_)
db.session.add(user)
db.session.commit()

data = Class_.query.one()
foo = User.query.one()

bar = Class_.query.filter(Class_.user_id==user.id).one()

print(foo, bar)