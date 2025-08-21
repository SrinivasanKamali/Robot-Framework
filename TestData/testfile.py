import  pandas as pd

file="testdata.xlsx"
file1="testdata_1.xlsx"
#file1="validation.xlsx"

df=pd.read_excel(file)
df1=pd.read_excel(file1)
#data=(1,2,3,4,5,6)
#id={'a','b','c','d','e','f'}
#ser=pd.Series(data,index=id)
#ser.index=['x','y','z','o','p','t']
#s=ser.rename(index={'x':'m','y':'l','z':'i','o':'y','p':'f','t':'h'})

#update=ser.reset_index(name='sri')
#print(ser)
#print(s)
#print(update)
#print(update1)
data={'name':['sri','kamali','kutty','amir','gokul'],
      'age':[28,65,80,90,70],
      'salary':[250000,3500000,1000000,2000000,30000000]}
sheet1=pd.DataFrame(df)
sheet2=pd.DataFrame(df1)
dpt=pd.DataFrame(data)
s=dpt.set_index('salary')
print(s)
dpt.reset_index()
print(dpt)
print(dpt.loc[:,'salary'])
print(dpt.iat[2,2])
#print(sheet1.to_string())
#print(sheet2.to_string())

sheet3=sheet1.equals(sheet2)
print(sheet3)

dft1=sheet1.compare(sheet2)
print(dft1.to_string())
dft1.to_excel('difference.xlsx',index=True)

with pd.ExcelWriter('diff.xlsx') as writer:
      sheet1.to_excel(writer,sheet_name='sheet1',index=True)
      sheet2.to_excel(writer,sheet_name='sheet2',index=False)
      sheet3.to_excel(writer,sheet_name='sheet val3',index=True)

