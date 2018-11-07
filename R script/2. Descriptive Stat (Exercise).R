## Descriptive Statistics:

os <- read_excel("os.xls")

# describing a numerical variable
mean(os$age)
sd(os$age)
median(os$age)
IQR(os$age)

# Alternatively,
attach(os)      # specify the data file
mean(age)
sd(age)
median(age)
IQR(age)
detach(os)

# Graphic presentation
attach(os)
hist(age)
boxplot(age)

# add titles (main and axis label)
hist(age, freq=TRUE, main="Histogram of Age", xlab="Age in year")
hist(age, freq=F, main="Histogram of Age", xlab="Age in year")

# try boxplot with adding main title and ylab!!
boxplot(age, freq=T, main="Histogram of Age", xlab="Age in year")
# can you try this:
x <- os$age
mean(x); sd(x); median(x); IQR(x)
c(mean(x), sd(x), median(x), IQR(x))
rm(x)


#-------------------------------------------------
# describing a categorical variable

table(gender)                                
prop.table(table(gender))             
barplot(table(gender))
pie(table(gender))

# convert gender to categorical and label
os$gender2 <- factor(os$gender)              # it becomes categorical but not labelled.
os$gender2 <- factor(os$gender, levels=c(1,2), labels =c("male", "female"))
table(os$gender2)

# perform all over analysis:
table(os$gender2)                                
prop.table(table(os$gender2))             
barplot(table(os$gender2))
pie(table(os$gender2))

barplot(table(os$gender2), main="Gender Distribution", 
        xlab="Gender", ylab="Count")      

pie(table(os$gender2), 
    labels = c("Male", "Female"), 
    main="Gender Distribution")

#-------------------------------------------------
# You may try this:
x <- table(os$gender2)
x
prop.table(x)
barplot(x, main="Gender Distribution", 
        xlab="Gender", ylab="Count")      

pie(x, labels = c("Male", "Female"), 
    main="Gender Distribution")

rm(x)

#-------------------------------------------------
# You may also try (numerical to categorical):
table(os$age>40)
prop.table(table(age>40))
barplot(table(age>40), 
        names.arg = c("age<=40", "Age>40"), 
        main="Age Distribution",
        xlab="Age", ylab="Count")

table(os$age<25 | os$age>50)

## If there are missing data and the command doesn't run, add "na.rm=True")
mean(os2$age, na.rm=TRUE)  #if there is missing data

## Exercise:
# Can you categorise and label "smoke" variable?  1=smoker and 2=non-smoker
# Can you also do for ed_level, ethnic, obesity

#----------------------------------------------------------------------

# a quick check on dataset:
summary(os)
str(os)         # checking the structure

#-------------------------------------------------


#----------------------------------------------------------------------

## subgroup analysis
hist(age[gender==1])
hist(age[gender==2])

mean(age[gender==1])
mean(age[gender==2])

mean(subset(age, gender==1))
mean(subset(age, gender==2))

tapply(age, gender, mean)      # results for both groups (like split file in SPSS)
tapply(age, age>30, mean)      
tapply(age, ethnic==1, mean)   # Malay and the rest

detach(os)

# =================================================
#### END ####


# Normality check
skewness(age)    # zero as normal
kurtosis(age)          # zero as normal
qqnorm(age); qqline(age)

# Shapiro-Wilk normality test
shapiro.test(age)
ks.test(age, "pnorm", mean(age), sd(age))

# ================================================
# Your own program:

## npct gives n (count) and percentage.
## variable should be categorised and labeled.
npct<-function(x) matrix(c(table(x), round(prop.table(table(x))*100,2)), 
                         ncol=2, dimnames=list(levels(x), c("n","%")))
npct(os$gender2)
npct(os$gender)
npct(os$ethnic)
npct(os$ed_level)

# ================================================