import pandas as pd
data=pd.read_excel("testdata.xlsx")
data1=pd.read_excel("testdata_2.xlsx")
df=pd.DataFrame(data)
df1=pd.DataFrame(data1)

#comapre the files and get results overall
sheet=df.equals(df1)
print(sheet)

#compare each row and cell wise
sheet2=df.compare(df1)
print(sheet2.to_string())
sheet2.to_excel('compare.xlsx')