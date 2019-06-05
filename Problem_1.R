## Exam 3 / Problem 1

trips <- read.csv('https://s3.eu-central-1.amazonaws.com/econometrics2018/data/taxis.csv', stringsAsFactors = FALSE)
str(trips)

## a)

trips <- within(trips, {
  short_trip <- trip_distance < mean(trip_distance)
})

## b)

## tip_amount_i = beta0 + beta1 * short_trip_i + u_i, i = 1,...,n
fit <- lm(tip_amount ~ short_trip, data = trips)
summary(fit)

## c)

## tip_amount_hat = 3.5 - 2.4 short_trip

## d)

# beta_1 = mu_short - mu_long
# beta_0 = mu_long
## => mu_short = beta0 + beta1
## mu_short_hat = beta0_hat + beta1_hat = 3.5 - 2.4

## e)
## mu_long_hat = beta0_hat = 3.5

## f) 
## mu_short - mu_long = beta1
## Confidence interval (95%) for beta1

## calculate the quantile
qt(0.025, df = 1991 - 2)
## Get the standard error of beta1_hat from the regresison output: 0.11

## CI lower limit:
-2.4 - 1.96 * 0.11
## CI upper limit
-2.4 + 1.96 * 0.11

## g)
## H_0: beta1 = 0
## H_1: beta1 != 0

## h)

## test-statistic (from regression output) -21.45
## p-value <2e-16 < 0.05 => reject H_0 at 95% significance level 
## (5% error probability)








