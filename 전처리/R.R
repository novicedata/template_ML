# Import data
data = read.csv('C:/Users/jin/Desktop/my/Udemy/machine learning AZ/colab_notebook/Part 1 - Data Preprocessing/Section 2 -------------------- Part 1 - Data Preprocessing --------------------/R/Data.csv')

# Missing data : transform to mean
data$Age = ifelse(is.na(data$Age),
                  ave(data$Age, FUN = function(x) mean(x, na.rm=T)),
                  data$Age)
data$Salary = ifelse(is.na(data$Salary),
                    ave(data$Salary, FUN = function(x) mean(x, na.rm=T)),
                    data$Salary)

# Encoding Categorical data
data$Country = factor(data$Country,
                      levels=c('France','Spain','Germany'),
                      labels=c(1,2,3))
data$Purchased = factor(data$Purchased,
                      levels=c('No', 'Yes'),
                      labels=c(0,1))

# Spliting data set to Train, Test set
install.packages('caTools')
library(caTools)
set.seed(42)
split = sample.split(data$Purchased, SplitRatio=0.8) # True라고 나오는게 test set

train = subset(data, split == T)
test = subset(data, split ==F)

# Feature Scailing (대부분 변수사이의 유클리드 거리로 계산하는 ML이 있기 때문에)
train[,2:3] = scale(train[,2:3])
test[,2:3] = scale(test[,2:3])
