import pandas as pd

file=pd.read_excel('testdata.xlsx')

df=pd.Series(file['pass'])

print(df.to_string())

data=pd.Series([1,-2,-3],index=['A','B','C'])
data1=pd.Series([2,3,4,1],index=['A','B','C','D'])
print(data.abs())
print(data1.mean())
sum=data.add(data1)
print(sum)