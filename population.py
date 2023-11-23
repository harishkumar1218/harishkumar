#importing 
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.linear_model import LinearRegression
from sklearn.metrics import mean_squared_error, r2_score
import numpy as np


#importing dataset
data = pd.read_csv('/content/sample_data/PopulationGrowth.csv')#import from https://www.kaggle.com/datasets/omarsobhy14/population-growth-from-1950

x = [x for x in data['Year'] ]
y = [x for x in data['Population Growth Rate'] ]

X_train, X_test, y_train, y_test = train_test_split(x, y, test_size=0.2, random_state=42)
X_train=np.array(X_train)
X_test=np.array(X_test)

#convering string to float
X_train=X_train.astype("float")
X_test=X_test.astype("float")
y_train=np.array([float(str(x).replace(',', '')) for x in y_train])#convertin str "1,00,000" to 100000.0
y_test=np.array([float(str(x).replace(',', '')) for x in y_test])#convertin str "1,00,000" to 100000.0

#reshaping
X_train=X_train.reshape(-1,1)
y_train=y_train.reshape(-1,1)
X_test=X_test.reshape(-1,1)
y_test=y_test.reshape(-1,1)


#LinearRegression from sklearn
model = LinearRegression()
model.fit(X_train, y_train)


y_pred = model.predict(X_test)
mse = mean_squared_error(y_test, y_pred)
r2 = r2_score(y_test, y_pred)

print(f"Mean Squared Error: {mse}")
print(f"R-squared Score: {r2}")
print(model.predict(np.array([2024]).reshape(-1,1))) 


# output
# Mean Squared Error: 1.6107328272876634e+16
# R-squared Score: 0.9953609519587924
# [[8.07090182e+09]]
# model predicted good for year 2024, there would be 8.07090182e+09 population










