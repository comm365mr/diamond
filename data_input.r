# Let us import data into R
# Method 1, you can use workspace ->import dataset 
# Method 2, type commands
diamond <- read.csv("diamond.csv")
price <- read.csv("price.csv")

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


# Do a two way table summary
table(diamond$color, diamond$clarity)

## section 102 stopped here on Oct 17th. 
## section 103 stopped here on Oct 17th. 


