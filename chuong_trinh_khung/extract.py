from bs4 import BeautifulSoup

with open('sv.html', 'r') as f:
    soup = BeautifulSoup(f.read(), 'html.parser')

data = soup.select('tbody > tr.hockytr, tbody > tr.HocPhanRowCls')

semester = {}

outlier = 'Học phần'

def hockytr(data):
    semester = data.td.text.split()[-1]
    return int(semester)

def hocphanrowcls(data):
    data = data.select('td')
    return {'name': data[2].text.replace('*', ' ').strip(), 'credit': int(data[5].text)}
now = 0
for tag in data:
    if (tag.get('class')[0] == 'hockytr'):
        now = hockytr(tag)
        semester[now] = []
    else:
        semester[now] += [hocphanrowcls(tag)]

import pickle

with open('../data/semester.pkl', 'wb') as f:
    pickle.dump(semester, f, pickle.HIGHEST_PROTOCOL)

# to open it
# with open('semester.pkl', 'rb') as f:
#     data = pickle.load(f)