import pandas as pd
import numpy as np

data={'name':['srini','kamali','kutty','amir','gokul','srini'],'age':[30,65,90,90,80,np.nan],'salary':[100000,2000000,300000,4000000,5000000,np.nan]}
df=pd.DataFrame(data)
print(df)

print(df.set_index('age'))
print(df.reset_index())
print(df[['salary','age']])
#first=data.loc['srini']
print(df.loc[1,'age'])
print(df.iloc[4])
print(df.loc[1,'age'])
print(df.isnull())
print(df.notnull())

print(df.fillna('sri'))
print(df.dropna())


for i,j in df.iterrows():
    print(i,j)
    print()

column=list(df)

for i in column:
    print([i][0])


df1=pd.DataFrame({'A':[1,2,3],'B':[4,5,6]})
df1.insert(0,'C',[5,6,8])
print(df1)

data1=pd.read_excel('testdata_1.xlsx')
df2=pd.DataFrame(data1)
arr=df2["user"].unique()
arr1=df2.nunique()

print(arr)

print(arr1)

print(df['age'].count())
print(df['age'].isnull().sum())
print(df['age'].notnull().sum())


data2={'name':['srini','kamali','kutty','amir','amir','gokul'],'age':[30,65,90,90,90,90],'salary':[100000,2000000,300000,4000000,5000000,np.nan]}
df4=pd.DataFrame(data2)
#print(4)
print(df4.value_counts(dropna=False))
print(df4.fillna(0))
ser=df4.groupby('age')['name'].value_counts()
print(ser)

col=df4.columns
print(col)

print(df4.axes)
print(df4.dtypes)
res=df4.astype('string')
print(res)
print(df4.values)
print(data1.sort_values('mobile',ascending=True).to_string())
print(df4.sort_index())
data4=pd.read_excel("testdata_1.xlsx",index_col="user")
data4.rename(index={'Adminnnnn':'names'},inplace=True)
print(data4.to_string())
print(data4.drop(['names']))
print(df4.pop('age'))
print(df4.sample())
example=data4.nsmallest(4,"mobile")
print(data4.columns)
print(example)
data1=pd.read_excel('testdata_1.xlsx')
df2=pd.DataFrame(data1)
print(data1.nsmallest(4,"age"))
print(data1.nlargest(4,"salary"))
print(data1.size)
print(data1.shape)
print(data1['age'].ndim)

data={'name':['srini','kamali','kutty','amir','gokul','srini'],'age':[30,65,90,90,80,np.nan],'salary':[100000,2000000,300000,4000000,5000000,np.nan]}
df=pd.DataFrame(data)
print(df)

print(df.dropna(how='all'))
print(df.rank(method='average'))
print(df.rank(method='min'))

data5=data.copy()
print(data5)

print(df['name'].duplicated())
print(df['name'].drop_duplicates())
ed=df.where(df['age']>50)
print(ed)

date=pd.Timestamp('2025-8-16 20:08:55')
print(date.year)
print(date.month)
print(date.day)
print(date.hour)
print(date.minute)
print(date.second)
print(date.weekday())
print(date.quarter)

data={'name':['srini','kamali','kutty','amir','gokul','srini'],'age':[30,65,90,90,80,np.nan],'salary':[100000,2000000,300000,4000000,5000000,np.nan]}
df=pd.DataFrame(data)
print(df['name'].str.lower())
print(df['name'].str.upper())