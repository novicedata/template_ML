# Multiple Linear Regression

## import data
```
data = read.csv('C:/Users/atlsw/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 5 - Multiple Linear Regression/R/50_Startups.csv')
```

## encode categorical data
```
data$State =  factor(data$State,
                     levels=c('California', 'Florida','New York'),
                     labels=c(1,2,3))
```

## Split data set on Train, Test
```
library(caTools)
set.seed(42)
split = sample.split(data$Profit, SplitRatio = 0.8)
train = subset(data, split == T)
test = subset(data, split == F)
```

# Fitting Multiple linear Regression to the Training set
```
model = lm(Profit~., data=train)
```

# summary보면 알겠지만 알아서 더미변수중에 1개빼서 상수에 넣어줌
```
summary(model)
```

# p-value보고 알아서 빼던가 해보자
```
model_2 = lm(Profit~R.D.Spend+Administration+Marketing.Spend, data=train)
summary(model_2)

model_3 = lm(Profit~R.D.Spend+Administration, data=train)
summary(model_3)

model_final = lm(Profit~R.D.Spend, data=train)
summary(model_final)
```

# Predicting the TEst set results
```
y_pred = predict(model_final, newdata=test)
print(y_pred)
```
