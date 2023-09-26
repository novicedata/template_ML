---
title: "Untitled"
output:
  pdf_document: default
  html_document: default
date: "2023-09-26"
---
# Polynomial Regression 
## import data 
```{r}
data = read.csv('D:/Udemy/machine learning AZ/colab_notebook/Part 2 - Regression/Section 6 - Polynomial Regression/R/Position_Salaries.csv') 
data 
```

## 나누기. 
```{r}
data = data[2:3] 
data
```

## fitting linear regression to the dataset 
```{r}
lin_reg = lm(Salary~., data=data) 
summary(lin_reg)
```


## fitting Polynomial regression to the dataset 
```{r}
# 2차항 
data$Level2 = data$Level^2 
poly_reg = lm(Salary~., data=data)
summary(poly_reg)
```


## Visualising the Linear Regression results 
```{r}
library(ggplot2)
ggplot() + 
  geom_point(aes(x=data$Level, y=data$Salary), color='red') +
  geom_line(aes(x=data$Level, y=predict(lin_reg, newdata=data)),
            color='blue') + theme_bw()
```

## Visualising the Poly Regression results 
```{r}
ggplot() + 
  geom_point(aes(x=data$Level, y=data$Salary), color='red') +
  geom_line(aes(x=data$Level, y=predict(poly_reg, newdata=data)),
            color='blue') + theme_bw() 
```


## Predicting a new result with Linear Regression 
```{r}
y_pred = predict(lin_reg, newdata=data.frame(Level=6.5)) 
y_pred
```

## Predicting a new result with Poly 
```{r}
poly_pred = predict(poly_reg, newdata=data.frame(Level=6.5, Level2 = 6.5^2)) 
poly_pred
```