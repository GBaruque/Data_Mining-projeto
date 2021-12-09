# -*- coding: utf-8 -*-
import pandas as pd 
from ReliefF import ReliefF
import numpy as np

# Read data from file 'filename.csv' 
# (in the same directory that your python process is based)
# Control delimiters, rows, column names with read_csv (see later) 
data = pd.read_csv("C:/Users/Gabriel/Documents/0-Estudos/Doutorado/Data Mining/Trabalho de curso/dados_cancer.csv") 
# Preview the first 5 lines of the loaded data 
data.head()


labels = data.columns
print(data.shape)

X = np.array(data.iloc[:,0:23])
print(X.shape)
print(X)
Y = np.array(data.iloc[:,23])
print(Y)


fs = ReliefF(n_neighbors=100, n_features_to_keep=10)
X_train = fs.fit_transform(X, Y)



print("(No. of tuples, No. of Columns before ReliefF) : "+str(data.shape)+
      "\n(No. of tuples, No. of Columns after ReliefF) : "+str(X_train.shape))

print(X_train)
print(fs.dict)

print(pd.DataFrame(X_train))
print(labels[fs.top_features])











