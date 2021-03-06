#!/home/tuanio/anaconda3/bin/python3
import sys
import pandas as pd
import numpy as np
from math import nan
from app import *
import os
import pickle
# import scipy.stats as stats

def write_json(name, data):
    with open(name, 'wb') as f:
        pickle.dump(data, f, pickle.HIGHEST_PROTOCOL)

def read_json(name):
    with open(name, 'rb') as f:
        return pickle.load(f)

if len(sys.argv) == 1:
    print('No file name')
# elif len(sys.argv) > 2:
#     print('Too much file')
# if (len(sys.argv) != 2): sys.exit(0)

try:
    df = pd.read_excel(sys.argv[-1])
except:
    print('File not exist!')
    sys.exit(0)

temp = df['Unnamed: 1'][3:6].reset_index(drop=True)
names = temp[0].split('-')[0].split(':')[1].strip().split()

class_info = {
    'class_name': ' '.join(names),
    'class_name_abbr': 'DH' + ''.join([i[0] for i in names[2:-1]]) + names[-1],
    'class_code': temp[0].split('-')[1].strip(),
    'branch': temp[1].split(':')[1].strip(),
    'major': temp[2].split('-')[0].split(':')[1].strip(),
    'major_code': temp[2].split('-')[1].strip(),
    'current_semester': 3
}

write_json('data/class_info.pkl', class_info)

df = df.iloc[7:,]
df.columns = list(df.loc[7])
df = df.drop(7, axis=0).reset_index(drop=True).iloc[:61,]
# df.to_csv(class_info['class_name_abbr'] + '.csv', index=None, header=True)

df.to_csv('data.csv', index=None, header=True)

# ## Insights
# - một kì gặp giáo viên chủ nhiệm 2 lần: đầu kì và cuối kì
# - nên loại bỏ những môn học mà không có sinh viên nào học

# Loại bỏ dấu cách

df = pd.read_csv('data.csv')

# remove file, don't need anymore
os.remove('data.csv')

df = df.rename(columns={i : i.strip() for i in df.columns})

# Làm tròn mã số sv
df.loc[1:, 'Mã sinh viên'] = df.loc[1:, 'Mã sinh viên'].astype('int64')

try:
    # Xóa cột Unamed 90
    df.drop('Unnamed: 90', axis=1, inplace=True)
except:
    print('[Dropped]')
    
try:
    # Cột Hạnh kiểm chỉ có số 0, nên xóa đi
    df.drop('Hạnh kiểm', axis=1, inplace=True)
except:
    print('[Dropped]')

so_tin_chi = df.loc[0].to_list()
outlier = ['Giáo dục Quốc phòng và An ninh 1', 'Giáo dục thể chất 1', 'Tiếng anh 1', 'Giáo dục thể chất 2',
       'Giáo dục quốc phòng và an ninh 2', 'Tiếng Anh 2']
df = df.rename(columns={'Học lực': 'Số tín chỉ', 'Unnamed: 85' : 'Điểm 10', 'Unnamed: 86': 'Điểm 4', 'Unnamed: 87' : 'Điểm chữ', 'Unnamed: 88': 'Xếp loại'})

# thay thế tên cột Tiếng Anh 2 truyền thống bằng Tiếng Anh 2 tự viết (có sự khác nhau)
idx = [i for i, subj in enumerate(df.columns) if 'Anh' in subj][0]
df = df.rename({df.columns[idx]: 'Tiếng Anh 2'})

diem_xeploai = {
    (9, 10) : ['A+', 'Xuất sắc'],
    (8.5, 8.9) : ['A', 'Giỏi'],
    (8, 8.4) : ['B+', 'Khá'],
    (7, 7.9) : ['B', 'Khá'],
    (6, 6.9) : ['C+', 'Trung bình'],
    (5.5, 5.9) : ['C', 'Trung bình'],
    (5, 5.4) : ['D+', 'Trung bình yếu'],
    (4, 4.9) : ['D', 'Trung bình yếu'],
    (0, 3.9) : ['F', 'Kém']
}

diem_he4 = {
    'A+': 4, 'A': 3.8,
    'B+': 3.5, 'B': 3,
    'C+': 2.5, 'C': 2,
    'D+': 1.5, 'D': 1,
    'F': 0
}

def get_available_column(a, b): return [i for i in a if i in b]

def get_xeploai(diem):
    for i in diem_xeploai.items():
        if (i[0][0] <= diem <= i[0][1]):
            return i[1]
    ok = ['NO']
    if (diem >= 250):
        ok = ['Tiếng anh 1']
        if (diem >= 350):
            ok += ['Tiếng Anh 2']
        ok += ['kk', 'kk']
    return ok

# Tạo một dataframe tín chỉ
tin_chi_mon_hoc = {}
for i in df.loc[[0]].items():
    dat = i[1].values[0]
    if (not type(dat) == str) and (not np.isnan(i[1].values[0])):
        tin_chi_mon_hoc[i[0]] = i[1].values[0]
tin_chi_mon_hoc_df = pd.DataFrame(tin_chi_mon_hoc.items()).T
tin_chi_mon_hoc_df.columns = tin_chi_mon_hoc_df.loc[0]
tin_chi_mon_hoc_df.drop(0, inplace=True)

# xóa hàng 0, do hàng 0 chứa tín chỉ của các môn, mà đã sử dụng rồi nên không cần nữa
df.drop(0, inplace=True)
df.reset_index(inplace=True)

# gán họ và tên vào một cột
for i in range(len(df)):
    df.loc[i, 'Họ và tên'] = ' '.join(df.loc[i, ['Họ đệm', 'Tên']].values)
    
# Lấy danh sách sinh viên trong lớp
classmate = list(df['Họ và tên'])

# # Loại bỏ những môn học mà không có sinh viên nào học
# list_subject_need_drop = [i for i in df.columns if df[i].isna().sum() == len(classmate)]
# # remove all column in list need remove
# try:
#     df = df.drop(list_subject_need_drop, axis=1)
# except:
#     print('[Drop Done]')
    
# lấy danh sách môn học
subjects = list(df.columns[5:-6])

# Tạo một dict trỏ từ tên đến index của người có tên đó (thường biết đến với biến num trong các hàm trên)
index_of = {}
for i in range(len(df)):
    index_of[df.loc[i, 'Họ và tên']] = i

# tính điểm hệ 10
def cal_10(num, data):
    s = 0
    tin_chi = 0
    # Vừa loại bỏ những môn không có trong df.columns, vừa loại bỏ các môn như quốc phòng, tiếng anh...
    data = [i for i in get_available_column(data, df.columns) if i not in outlier]
    for i in data:
        foo = df.loc[num, i]
        if (np.isnan(foo)):
            continue
        dat = tin_chi_mon_hoc_df[i]
        xeploai = get_xeploai(foo)
        if (xeploai[0] == 'NO' or len(xeploai) >= 3):
            continue
        tin_chi += dat.values[0]
        s += foo * dat.values[0]
    if (tin_chi == 0):
        return 0
    return round(s / tin_chi, 1)

# tính điểm hệ 4
# điểm hệ 4 thì tính các điểm mà không phải outlier
def cal_4(num, data):
    s = 0
    tin_chi = 0
    # Vừa loại bỏ những môn không có trong df.columns, vừa loại bỏ các môn như quốc phòng, tiếng anh...
    data = [i for i in get_available_column(data, df.columns) if i not in outlier]
    for i in data:
        foo = df.loc[num, i]
        if (np.isnan(foo)):
            continue
        dat = tin_chi_mon_hoc_df[i]
        xeploai = get_xeploai(foo)
        if (xeploai[0] == 'NO' or len(xeploai) >= 3):
            continue
        tin_chi += dat.values[0]
        s += diem_he4[xeploai[0]] * dat.values[0]
    if (tin_chi == 0):
        return 0
    return round(s / tin_chi, 2)

# số tín chỉ của sinh viên có index là num
def so_tin_chi_sv_da_hoc(num, data):
    tin_chi = 0
    data = get_available_column(data, df.columns)
    for i in df.loc[num, data].items():
        if np.isnan(i[1]):
            continue
        xeploai = get_xeploai(i[1])
        if (xeploai[0] not in ['NO', 'F']):
            flag = True
            if (len(xeploai) >= 3):
                flag = i[0] in xeploai
            tin_chi += tin_chi_mon_hoc_df[i[0]].values[0] * flag
    return int(tin_chi)

def so_tin_chi_sv_da_dang_ki(num, data):
    return sum([
        tin_chi_mon_hoc[subj] 
        for subj in data if not np.isnan(df.loc[num, subj])
    ])

def get_diem_4(score):
    return diem_he4[get_xeploai(score)[0]] if score < 11 else score

# Hàm compare dùng để sắp xếp
# -1 if o1 < o2
# 1 if o1 > o2
# 0 if o1 == o2
def compare(o1, o2):
    o1 = o1[0]
    o2 = o2[0]
    try:
        o1[0]
        o2[0]
    except:
        return 0
    if (o1[0] == o2[0]):
        return [1, -1][len(o1) == 2]
    return [1, -1][o1[0] < o2[0]]

# số tín chỉ của sinh viên có tên là name
def so_tin_chi_sv_by_name(name):
    tin_chi = 0
    for i in df.loc[df['Họ và tên'] == name, subjects].items():
        if np.isnan(i[1].values[0]):
            continue
        xeploai = get_xeploai(i[1].values[0])
        if (xeploai[0] not in ['NO', 'F']):
            flag = True
            if (len(xeploai) >= 3):
                flag = i[0] in xeploai
            tin_chi += tin_chi_mon_hoc_df[i[0]].values[0] * flag
    return int(tin_chi)

# Lấy ra được danh sách tên người có học bổng
def scholarship(stc, data):
    data = get_available_column(data, df.columns)
    scholarship_members = []
    for i in range(len(df)):
        if (so_tin_chi_sv_da_hoc(i, data) >= stc and cal_4(i, data) >= 3.2):
            scholarship_members += [' '.join(df.loc[i, ['Họ đệm', 'Tên']].values)]
    return scholarship_members

# Tạo một dic các môn đã học của từng sinh viên
monhoc_cua_sv = {}
for i in range(len(df)):
    name = df.loc[i, 'Họ và tên']
    monhoc_cua_sv[name] = []
    for subj in subjects:
        if (np.isnan(df.loc[i, subj]) or subj in outlier):
            continue
        monhoc_cua_sv[name] += [subj]

# Thay đổi điểm 10, 4, điểm chữ và xếp loại cho đúng
for i in range(len(df)):
    df.loc[i, 'Điểm 10'] = cal_10(i, monhoc_cua_sv[df.loc[i, 'Họ và tên']])
    df.loc[i, 'Điểm 4'] = cal_4(i, monhoc_cua_sv[df.loc[i, 'Họ và tên']])
    df.loc[i, ['Điểm chữ', 'Xếp loại']] = get_xeploai(int(df.loc[i, 'Điểm 10']))

xeploai_df = pd.DataFrame(columns=['STT', 'Mã sinh viên', 'Họ và tên', 'Họ đệm', 'Tên'] + subjects)
for i in range(len(df)):
    sv_info = []
    for name in list(xeploai_df.columns):
        need = nan
        if (name in subjects and np.isnan(df.loc[i, name])):
            need = nan
        else:
            need = get_xeploai(df.loc[i, name])[0] if name in subjects and df.loc[i, name] <= 10 else df.loc[i, name]
        sv_info += [need]
    xeploai_df = pd.concat([xeploai_df, pd.DataFrame([sv_info], columns=list(xeploai_df.columns))], ignore_index=True)

student_info = []
# tạm thời cứ để class_id là 1, cập nhật lại sau
# course được lấy 2 số đầu trừ đi 4
for i in range(len(df)):
    name = df.loc[i, 'Họ và tên']
    foo = {
        'full_name': df.loc[i, 'Họ và tên'],
        'student_code': str(int(df.loc[i, 'Mã sinh viên'])),
        'course': int(df.loc[i, 'Mã sinh viên']) // 10**6 - 4,
        'passed_credit': so_tin_chi_sv_da_hoc(i, subjects),
        'registered_credit': int(so_tin_chi_sv_da_dang_ki(i, subjects)),
        'cumulative_score_10': df.loc[i, 'Điểm 10'],
        'cumulative_score_4': df.loc[i, 'Điểm 4'],
        'graded': df.loc[i, 'Xếp loại'],
        'char_score': df.loc[i, 'Điểm chữ'],
        'class_id': 1
    }
    student_info += [foo]
write_json('data/student_info.pkl', student_info)

# lấy điểm hệ 4 và hệ 10 của từng môn với từng sinh viên
subject_detail = []
for i in range(len(df)):
    for subj in subjects:
        foo = {
            'student_name': df.loc[i, 'Họ và tên'],
            'subject_name': subj,
            'final_score_10': df.loc[i, subj],
            'final_score_4': get_diem_4(df.loc[i, subj])
        }
        subject_detail += [foo]
write_json('data/subject_detail.pkl', subject_detail)

# tạo một dict là các môn học của từng kì (chỉ của khoa học dữ liệu thôi)
subjects_of_semester = {}
semester = read_json('data/subjects_of_semesters.pkl')
for i in range(1, 9):
    subjects_of_semester[i] = [subj['name'] for subj in semester[i]]

# 
semester_detail = []
for semester_id in range(1, 9):
    subject_of_semester = subjects_of_semester[semester_id]
    for i in range(len(df)):
        foo = {
            'semester_id': semester_id,
            'student_name': df.loc[i, 'Họ và tên'],
            'semester_final_score_10': cal_10(i, subject_of_semester),
            'semester_final_score_4': cal_4(i, subject_of_semester)
        }
        semester_detail += [foo]
write_json('data/semester_detail.pkl', semester_detail)