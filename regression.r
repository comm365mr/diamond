### codes for lectures 13 and 14, regression analysis

## Apple product line data creation
months = c(12.0, 16.0, 12, 8, 12, 11, 12, 26, 19, 8, 8, 10)
generation = rep(c("current","current-1", "current-2"),4)
product = rep(c("iPhone", "iPad", "iMac", "Macbook Pro"), each=3)
upgrades = data.frame(months, generation, product)
## To view the data
head(upgrades)
    
## ANOVA model, using aov() function
## test the difference between product lines
aov1 = aov(months~product, data=upgrades)
summary(aov1)
aov2 = aov(months~generation, data=upgrades)
summary(aov2)



## For correlation analysis
## correlation test between price and carat
cor.test(diamond$price, diamond$carat)

## Regression analysis
## plot between carat and carat, with a smooth line
plot(diamond$width, diamond$carat, main="Diamond Carat and Diamond Width", xlab="width", ylab="carat")
abline(lm(diamond$carat~diamond$width), col="red")

## Regression on diamond price and log price
model1 = lm(price~carat+color+clarity+cut, data=diamond)
model2 = lm(logprice~carat+color+clarity+cut, data=diamond)
summary(model1)
summary(model2)





