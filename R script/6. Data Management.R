### RECODING

# recode ethnic (1,2,3,4) to ethnic2 (1,2 = Malay & others respectively)

attach(os2)
os2$ethnic2<-""
os2$ethnic2[ethnic==1] <- 1
os2$ethnic2[ethnic==2] <- 2
os2$ethnic2[ethnic==3] <- 2
os2$ethnic2[ethnic==4] <- 2

table(os2$ethnic2)

os2$ethnic2 <- factor(os2$ethnic2,
                     levels = c(1,2),
                     labels = c("Malay", "Others"))
detach(os2)

# Alternatively
os2$ethnic3 <- ifelse(os2$ethnic==1,1,2) # if 1, it will be 1. The rest will become 2.

library(car)
os2$ethnic3<-recode(as.numeric(os2$ethnic), "1='Malay'; 2:4='others'")
os2$ethnic3<-recode(os2$ethnic, "1='Malay'; 2:4='others'")
table(os2$ethnic3)

# delete or remove a variable
os2$ethnic3<-NULL
library("dplyr")
os2<-select(os2,-ethnic2)
os2<-select(os2,-c(age, ethnic))  # removing more than 1 variable

# Recode numerical variable to categorical variable

attach(os2)
os2$age2<-""
os2$age2[age<30] <- 1
os2$age2[age>=30 & age<40] <- 2
os2$age2[age>=40] <- 3
table(os2$age2)
os2$age2 <- factor(os2$age2,
                     levels = c(1,2,3),
                     labels = c("below 30", "30 & below 40", "40 & above"))
table(os2$age2)
detach(os2)

Alternatively
os2$agegp <- cut(os2$age, breaks=c(0, 29.9, 39.9, 100))
# below 30; 30 and below 40; 40 and above

table(os2$agegp)

#--------------------------------------------------------------
#--------------------------------------------------------------

### COMPUTATION
## Compute total score
attach(os2)
os2$ktotal <- (k1+k2+k3+k4+k5)
mean(os2$ktotal)
sd(os2$ktotal)
detach(os2)


## handling date format data
# date
Sys.Date()
format(Sys.Date(), format="%B %d, %Y")

# number of days after marriage
os2$days <- Sys.Date()-as.Date(os2$d_marriage, "%Y-%m-%d")
os2$days <- (as.numeric(os2$days))
mean(os2$days)
sd(os2$days)

# number of years after marriage
os2$years<-os2$days/365.25
mean(os2$years)
sd(os2$years)

#--------------------------------------------------------------
#--------------------------------------------------------------

### SELECT CASES

# Select only male (e.g. find out mean and SD of age of males)
mean(os2$age[os2$gender==1])
sd(os2$age[os2$gender==1])

# Alternatively:
# by creating new dataset os3
os3<-subset(os2, os2$gender==1)
mean(os3$age)
sd(os3$age)
length(os3$age)

# Select age below 50 (find out family income of those age below 50)
# by creating new dataset os3
os3<-subset(os2, os2$age<50)
mean(os3$f_income)
sd(os3$f_income)
length(os3$f_income)

#--------------------------------------------------------------
#--------------------------------------------------------------

### SPLIT FILE (tapply):

tapply(os2$age, os2$gender, mean)
tapply(os2$age, os2$gender, sd)

par(mfrow=c(1,2))
tapply(os2$age, os2$gender, hist)

#--------------------------------------------------------------
#--------------------------------------------------------------

# Remove all new variables created:
os2$ethnic2<-NULL
os2$age2<-NULL
os2$ktotal<-NULL
os2$dayxx<-NULL
os2$yearxx<-NULL

#--------------------------------------------------------------
#--------------------------------------------------------------

### MISSING DATA HANDLING

os2$age[1]<-NA
os2$gender[3]<-NA
os2$k1[5]<-NA
str(os2)
summary(os2)
table(os2$gender)   # it runs though having missing data
mean(os2$age)       # give you NA
mean(os2$age, na.rm=T)

# list rows of data that have missing values 
os2[!complete.cases(os2),]
os3<-os2[c("id_no", "age", "gender", "k1")]
os3[!complete.cases(os3),]


attach(os2)
os2$ktotal<-k1+k2+k3         # it runs though missing in k1 but gives NA
summary(ktotal)
mean(ktotal, na.rm=T)    # na.rm removes only variables involved  # na.omit removes the whole case
mean(os2$f_income)

os3<-na.omit(os2)        # the whole case is removed
summary(os3)             # left with 97 cases
nrow(os3)

# don't assign any action for missing data
# it will normally remove list-wise (variables involved)
# only if the command does not work, use "na.rm=T"

os2$id_no[!complete.cases(os2$ktotal)]


### not to accumulate warning message from the past:

warning()
assign("last.warning", NULL, envir = baseenv())


# End.




