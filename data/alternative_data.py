import pandas as pd
df = pd.read_excel('./data.xls')

temp = df['Unnamed: 1'][3:6].reset_index(drop=True)
names = temp[0].split('-')[0].split(':')[1].strip().split()

class_info = {
    'ClassName': 'DH' + ''.join([i[0] for i in names[2:-1]]) + names[-1],
    'ClassCode': temp[0].split('-')[1].strip(),
    'Dept': temp[1].split(':')[1].strip(),
    'Majors': temp[2].split('-')[0].split(':')[1].strip(),
    'MajorsCode': temp[2].split('-')[1].strip()
}

df = df.iloc[7:,]
df.columns = list(df.loc[7])
df.drop(7, axis=0).reset_index(drop=True).iloc[:61,].to_csv(class_info['ClassName'] + '.csv', index=None, header=True)