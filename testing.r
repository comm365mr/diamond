### Codes used in the hypothesis testing lecture

### Merge data to create a file to track the duration a diamond is sold
## create a data called sales, which contains the following variables
## 1. sku
## 2. number of days observed
## 3. whether the diamond is sold at the end of the day: 0, 1 variable


## change the date variable from string to dates
diamond$fetch_date = as.Date(diamond$fetch_date, "%d/%m/%Y")
price$fetch_date = as.Date(price$fetch_date, "%d/%m/%Y")

summary(diamond$fetch_date)
summary(price$fetch_date)
days = aggregate(fetch_date~sku, data=price, length)
names(days) = c("sku", "days")
last_day = aggregate(fetch_date~sku, data=price, max)
names(last_day) = c("sku", "last_day")
last_day$sold = as.numeric(last_day$last_day< as.Date("2012-09-04"))
summary(last_day)

days = merge(days, last_day)
summary(days)
summary(days$days[days$sold==1])

t.test(days$days, mu=20, alternative='greater')

mean(days$days)


