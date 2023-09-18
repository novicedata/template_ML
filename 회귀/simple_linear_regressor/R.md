# R simple linear model
```
data = read.csv('C:/Users/atlsw/Desktop/data/Machine Learning A-Z (Codes and Datasets)/Part 2 - Regression/Section 4 - Simple Linear Regression/R/Salary_Data.csv')
```

# Splitting data
```
library(caTools)
set.seed(42)
split = sample.split(data$Salary, SplitRatio = 2/3)
train = subset(data, split==TRUE)
test = subset(data, split==FALSE)
```

# Fitting
```
regressor = lm(Salary~YearsExperience, data=train)
summary(regressor)
```
# predicting the test ser results
```
y_pred = predict(regressor, newdata=test)
y_pred
```

# visualising the train set results
# line그릴때 y값에 predict를 넣는게 중요
```
library(ggplot2)
ggplot() +
  geom_point(aes(train$YearsExperience, train$Salary),
             colour = 'red') +
  geom_line(aes(train$YearsExperience, predict(regressor, newdata=train)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (train)') +
  xlab('Years of experience') +
  ylab('Salary') +
  theme_bw()
```

# test line
# line 그릴 때 train 그대로 둬야 train으로 학습한게 나옴
```
ggplot() +
  geom_point(aes(test$YearsExperience, test$Salary),
             colour = 'red') +
  geom_line(aes(train$YearsExperience, predict(regressor, newdata=train)),
            colour = 'blue') +
  ggtitle('Salary vs Experience (test)') +
  xlab('Years of experience') +
  ylab('Salary') +
  theme_bw()
```
