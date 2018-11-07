## Estimating means:

attach(os)
mean(os$ex_time)
mean(ex_time)
t.test(os$ex_time)$conf.int
round(t.test(ex_time)$conf.int, 2)        # if you want to round the decimals
#---------------------------------------------------

## Estimating proportions:

prop.test(sum(obesity=="1"), length(obesity))
prop.test(sum(obesity=="2"), length(obesity))   # we can calculate CI for any category
binom.test(sum(obesity=="1"), length(obesity))  # using binomial method
#---------------------------------------------------

# try a numerical variable: What is the percentage of population is age above 40?
prop.test(sum(os$age>40), length(os$age))


# Exercise:
# Estimate the mean family income:
# Estimate the prevalence of heart disease
# Estimate the proportion of Malay