library(olsrr)
model <- lm (mpg ~ disp + hp + wt + qsec, data=mtcars)
k <- ols_step_all_possible(model)
plot(k)
k

(m1= lm(mpg ~ wt, data=mtcars))
summary(m1)
(m2= lm(mpg ~ hp + wt + qsec, data=mtcars))
summary(m2)

anova(m1, m2) # analysis based on F-stats

AIC(m1, m2)
