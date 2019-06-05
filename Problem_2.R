## Exam 3 / Problem 2

homeCredit <- read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/homeCredit.csv', stringsAsFactors = FALSE)
str(homeCredit)

## a)
homeCredit <- within(homeCredit, {
  credit1000 <- credit / 1000
  income1000 <- income / 1000
})

## b)
fit <- lm(credit1000 ~ income1000, data = homeCredit)

## c)
## Persons with higher income tend to receive larger credits (estimated coefficient is 1.7 > 0)
## because, probably because of lower default risk.

## d)

predict(fit, newdata = data.frame(income1000 = 100), se.fit = TRUE)

## Lower limit
481.8414 - 2*10.08382
## Upper limit
481.8414 + 2*10.08382

## e)
## Estimated expected amount of credit for a person with no income.

## f)
fit1 <- lm(credit1000 ~ income1000 + age, data = homeCredit)
summary(fit1)

## g)
## Estimated expected amount of credit for a person with no income and of zero years (age).
## This is not a meaningful quantity in this case.

## h)
predict(fit1, newdata = data.frame(income1000 = 0, age = 20))



