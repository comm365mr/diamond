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


## Oct 31, 2012 Regression 2

## Why fit differnce? Look at the relationship between variables
par(mfrow=c(1,2)) ## make them plot on the same page
plot(price~carat, data=diamond[diamond$carat<4,])
abline(lm(price~carat, data=diamond), col="red")
plot(logprice~carat, data=diamond[diamond$carat<4,])
abline(lm(logprice~carat, data=diamond), col="red")
par(mfrow=c(1,1))


## Which variable has the largest explanatory power? use anova() function
anova(model2)

## Whether we should put a specific variable? use anova() to compare two models
model3 = lm(logprice~carat+color+clarity+cut+shape, data=diamond)
anova(model2, model3)

## Fitted value and residuals (error terms)
model2$fitted.values
model2$residual



## Predict Y based on new data
## assume we have a new data called diamond.new. 
## here we just use the last 100 data points as new data 
diamond.new = diamond[4901:5000,] 
predict(model2, diamond.new)



## simulate a keyword data
keyword = rep(c("flight tickets", "cheap international flight tickets"),each=500)
rank = c( floor(rbeta(500, 3, 5)*10)+1,  floor(rbeta(500, 2, 6)*10)+1)
impressions = floor(c(rgamma(500,18,0.0006), rgamma(500, 50,0.02)))

u1 = -2.1 - 1.5*log(rank[1:500])
u2 = -1.8 - 0.8*log(rank[501:1000])

u = c(u1, u2)
pr = exp(u)/(1+exp(u))
clicks = floor(impressions*pr)
ctr = clicks/impressions
day = c(1:500, 1:500)
keywordad = data.frame(keyword, day, impressions, clicks, rank,ctr)

keywordad = write.csv(keywordad, "keywordad.csv", row.names=F)
## read data
keywordad = read.csv("keywordad.csv")

## logistic model
## for logistic model with response variable to be proportion, you need to construct a 
## cbind(a, b), where a is the number of success, b is the number of failure 
admodel = glm(cbind(clicks, impressions-clicks)~keyword+rank-1, family=binomial(logit),data=keywordad)
summary(admodel)

## For logistic model with response variable to be binary 0 or 1, you can directly use the 
## variable as a response variable.
## For example:  glm(sold~days, family=binomial(logit),data=sales)

