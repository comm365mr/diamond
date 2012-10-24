### Codes used in the hypothesis testing lecture (lecture 12)
## please run codes in data_input.r first, you can choose "source" option to run all of them
## this is important, as we are going to use data created in data_input.r file

# 1. t-test for single mean

t.test(sales$days, mu=10, alternative="greater")
# sales$days is the data to use
# mu=10: you specify the hypothesized mu
# alternative="greater": specify the direction for alternative
t.test(sales$days, mu=19, alternative="two.sided")


# 2. t-test for difference between means
## create a variable called "month" on diamond data using months() function
diamond$month = months(diamond$fetch_date)
## testing for independent samples
t.test(diamond$price[diamond$month=="July"], diamond$price[diamond$month=="August"])
## diamond$price[diamond$month=="July"] means get the subset of diamond$price based on the condition 
## that diamond$month equals "July". 

## testing for paired samples
## create price.day1 and price.day11 data
## first merge the sales data back to price data
price = merge(price, sales)
## extract price information for the first day observations
price.day1 = price[price$fetch_date==price$first_day, c("sku", "price")]
## extract price information for the 11th day
price.day11 = price[price$fetch_date==as.Date(price$first_day+10), c("sku", "price")]
## get common observations for both day 1 and day 11
price.day1 = price.day1[price.day1$sku %in% price.day11$sku, ]
dim(price.day1)
## sort to make sure they are in the same order
price.day1 = price.day1[order(price.day1$sku),]
price.day11 = price.day11[order(price.day11$sku), ]
## Results in 2692 diamonds

t.test(price.day1$price, price.day11$price, paired=T, alternative="greater")


###testing for proportion
with(sales[sales$first_day<as.Date("2012-08-25"), ],
     prop.test(sum(days<=10), length(days), p=0.3))
# use with() function to select the subsample
# sum(days<=0) is the total number of observations sold within 10 days 



### Chisq test: presidential votes
# create the votes data
votes = matrix(c(110, 230, 160, 185, 150, 165, 265, 115, 120), 3,3)
# chi-square test
chisq.test(votes)






