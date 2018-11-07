### Independent t test

## 1. Checking Assumptions
# Levene test (equal variance assumption)
# install.packages("car")

library(car)
leveneTest(os$ex_time, os$gender)

# checking two histograms if one or both sample sizes is/are less than 30 (normality assumption)
tapply(os$ex_time, os$obesity, hist)
hist(os$ex_time [os$obesity==1])
hist(os$ex_time [os$obesity==2])

## 2. Independent t test
t.test(os$ex_time~os$obesity, var.equal=TRUE)   # if variances are not significantly different.
t.test(os$ex_time~os$obesity, var.equal=FALSE)  # if variances are significantly different.
# In the output, SD and mean difference are not given. We need it for presentation.

# to obtain two SDs
tapply(os$ex_time, os$obesity, sd)
# Alternatively, you may do one-by-one
sd(os$ex_time [os$obesity==1])
sd(os$ex_time [os$obesity==2])

# mean difference
mean(os$ex_time [os$obesity==1])-mean(os$ex_time [os$obesity==2])

#-------------------------------------------------------------------
#-------------------------------------------------------------------

### One-way ANOVA
## 1. checking assumptions
# Levene's test
leveneTest(os$ex_time, os$ed_level)

## 2. One-way ANOVA
os$ed_level2 <- as.factor(os$ed_level)
levels(os$ed_level2)
summary (aov(os$ex_time ~ os$ed_level2))

# Pair-wise multiple comparison:
pairwise.t.test(os$ex_time, os$ed_level, p.adjust.method = "bonferroni")
# pairwise methods available: "holm", "hochberg", "hommel", "bonferroni", "BH", "BY", "fdr", "none"

# if you want scheffe
install.packages("DescTools")
library(DescTools)
PostHocTest(aov(os$ex_time ~ os$ed_level2, data = os), method = "scheffe")
# pairwise methods available: "hsd", "bonferroni", "lsd", "scheffe", "newmankeuls", "duncan"

# to obtain mean and sd
tapply(os$ex_time, os$ed_level, mean)
tapply(os$ex_time, os$ed_level, sd)

# to obtain two boxplots
boxplot(os$ex_time ~ os$ed_level)

#-------------------------------------------------------------------
#-------------------------------------------------------------------

### Paired t test
t.test(os$kallpost, os$kallpre, paired=TRUE)
mean(os$kallpre)
mean(os$kallpost)
sd(os$kallpre)
sd(os$kallpost)
print(c(mean(os$kallpre), sd(os$kallpre), mean(os$kallpost), sd(os$kallpost)))

#-------------------------------------------------------------------
#-------------------------------------------------------------------

## Non-parametric tests:
# Mann-Whitney test (independent t test)
os$ethnic2 <- ifelse(os$ethnic==1,1,2)
wilcox.test(os$f_income ~ as.factor(os$ethnic2), correct=FALSE)
tapply(os$f_income, os$ethnic2, median, na.rm=T)
tapply(os$f_income, os$ethnic2, IQR, na.rm=T)

# kruskal-Wallis test  (one-way ANOVA)
kruskal.test(os$f_income ~ os$ethnic3)
tapply(os$f_income, os$ethnic3, median, na.rm=T)
tapply(os$f_income, os$ethnic3, IQR, na.rm=T)

# Wilcoxin Signed-Ranks test (paired t est)
wilcox.test(os$kallpre, os$kallpost, paired=TRUE)
print(c(median(os$kallpre), IQR(os$kallpre), median(os$kallpost), IQR(os$kallpost)))

#-------------------------------------------------------------------
#-------------------------------------------------------------------

### Chi-square test:
install.packages("gmodels")
library(gmodels)
CrossTable(os$gender, os$obesity, digits=2, max.width = 5, expected=T, 
           prop.r=T, prop.c=F, prop.t=F, prop.chisq=F, chisq=T, format="SPSS")
CrossTable(os$gender, os$obesity, digits=2, max.width = 5, format="SPSS")
           # default is all 5 values will come out.

# to handle "expected count assumption"
CrossTable(os$ethnic, os$obesity, digits=2, max.width = 5, expected=T, prop.r=F, prop.c=F, prop.t=F, prop.chisq=F, chisq=T, format="SPSS")

# combine categories: Malay and non-Malay
# Exercise: recode ethnic variable to "Malay" and "others" (make it ethnic2)
?????
table(os$ethnic2)

CrossTable(os$ethnic2, os$obesity, digits=2, max.width = 5, expected=T, prop.r=T, prop.c=F, prop.t=F, prop.chisq=F, chisq=T, format="SPSS")
# if still have problem with EC count, go for Fisher's exact test
CrossTable(os$ethnic2, os$obesity, digits=2, max.width = 5, expected=T, prop.r=T, prop.c=F, prop.t=F, prop.chisq=F, chisq=F, fisher=T, format="SPSS")

#-------------------------------------------------------------------
#-------------------------------------------------------------------

## Simple correlation:
# scatter plot first:
plot(y = os$kallpre, x = os$age, type = 'p')
# simple correlation analysis:
cor.test(os$age, os$kallpre, method="pearson")

#-------------------------------------------------------------------
#-------------------------------------------------------------------

## Simple linear regression:
#1. scatter plot first (with regression line):
plot(y = os$kallpre, x = os$age, type = 'p')
abline(lm(os$kallpre~os$age), col="blue", lty=2)    # adding the regression line

#2. simple linear regression (y=knowledge; x=age):
kn_age <- lm(os$kallpre~os$age)   #make the model and save in a name 'kn-age'
summary(kn_age)
# to obtain 95% CI of b coefficient:
confint(kn_age, 'os$age', level=0.95)


# END.