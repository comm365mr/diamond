# Let us import data into R
# Method 1, you can use workspace ->import dataset 
# Method 2, type commands
diamond <- read.csv("diamond.csv")
diamond_price <- read.csv("diamond-price.csv")

# simple data check
head(diamond)

# data transformation
logprice = log(diamond$price)
diamond$logprice = logprice


# data summary
summary(diamond$color)

# histogram
hist(diamond$carat, main="Histogram for Diamond Carat", xlab="Carat", col="lightblue")

## section 101 stopped here on Oct 17th. 


