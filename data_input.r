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

## Plot demostration
## par controls the output layout for plots
par(bg="lightgreen",fg="red")

plot(diamond$carat, log(diamond$price),
     main="Plot for Diamond Carat and Log Diamond Price",
     xlab="Carat", ylab="Log Price", col="blue")

## simple regression analysis

#model1 = lm(logprice~carat+cut+clarity+color, data=diamond)
## summarize the regression model
#summary(model1)
## plot the regression outputs
#plot(model1)


## Added Oct 23rd. 

## change the date variable from string to dates, using as.Date() function

diamond$fetch_date = as.Date(diamond$fetch_date, "%d/%m/%Y")
price$fetch_date = as.Date(price$fetch_date, "%d/%m/%Y")


### Merge data to create a file to track the duration a diamond is sold
## create a data called sales, which contains the following variables
## 1. sku
## 2. first day the diamond is on market
## 3. number of days observed
## 4. whether the diamond is sold at the end of the day: 0, 1 variable

## We use the aggregate() function:
days = aggregate(fetch_date~sku, data=price, length)
names(days) = c("sku", "days")
first_day = aggregate(fetch_date~sku, data=price, min)
names(first_day) = c("sku", "first_day")
last_day = aggregate(fetch_date~sku, data=price, max)
names(last_day) = c("sku", "last_day")

sales = merge(days, first_day)
sales = merge(sales, last_day)
## create the sold variable, 1 if sold before 2012-09-04, 0 otherwise
sales$sold = as.numeric(last_day$last_day< as.Date("2012-09-04"))
## summarize the data
summary(sales)
## save the data, by default it is saved in a file called ".RData" under the same folder
save.image()





