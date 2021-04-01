import pandas as pd

dt = pd.read_csv('temp', sep='\t')
print(dt.groupby('K0').mean())
print(dt.groupby('K0').sum())