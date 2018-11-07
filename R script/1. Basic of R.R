### Basic datafile management

## 1 SET WORKING DIRECTORY

getwd()                
     # if you don't set, it is under "Documents" C:/Users/ayub.sadiq/Documents"

setwd("F:/MyRStudy")
     # you may go through "Session" -> "set working directory" in R studio

#=======================================================================

## 2 OPEN file
# Import "os" excel file (using "Import Dataset" in right upper window)

#=======================================================================

## 3 SAVE file; 

write.table(os, "mydata1.txt")
    # it will save in working directory; default is "Documents"
    # it will save by default, separated by a space

write.table(os, "mydata1.txt", sep=" ")   # same as above  # default
write.table(os, "mydata2.txt", sep=",")   # comma-separated values (csv)
write.table(os, "mydata3.txt", sep="\t")  # tab-space separated data

# you can choose where to save
write.table(os, sep=",", file.choose())


# you can try to open these new files through "Import Dataset"
mydata1 <- read.csv("~/mydata1.txt", sep="")          # default file
View(mydata1)
mydata2 <- read.csv("~/mydata2.txt")                  # csv file
View(mydata2)
mydata3 <- read.delim("~/mydata3.txt")                # tab separated file
View(mydata3)

#=======================================================================

## 4 To have a quick check on data:
summary(os)
str(os)         # checking the structure

#=======================================================================

## 5 install and use packages
# install packages (like additional programmes or addin)
install.packages("car")
library(car)

#=======================================================================

## 6 R is like a calculator and assign to objects (vector, matrix, dataframe)
# calculator
1+2
30-12
{(40-20)/2}*4

# assign to objects
x <- 50
y <- 20
x-y
x+y
print(x+y)
print(x-y)
list(x,y)

c(x,y)           # vector
c(1,3,8)
t(c(1,3,8))
t(t(c(1,3,8)))   # transpose

# matrix
matrix(c(1,2,3,11,12,13), nrow = 2, ncol = 3, byrow=T)
matrix(c(1,2,3,11,12,13), nrow = 2, byrow=F)
matrix(c(1,2,3,11,12,13), ncol = 3, byrow=T)
matrix(c(1,2,3,11,12,13), ncol = 3, byrow=T, dimnames=list(c(1:2), c("x", "y", "z")))
mymatrix <- matrix(c(1,2,3,11,12,13), ncol = 3, byrow=T, dimnames=list(c(1:2), c("x", "y", "z")))
mymatrix
mymatrix[,"z"]
mymatrix[2,]
t(mymatrix)     # transposing matrix

# data frame
os[,c("age","gender")]
t(os[,c("age","gender")])
os2var <- os[,c("age","gender")]    # create a new file (object) with age and gender variables only
os2var

#=======================================================================

## 7 log or save R console (output)
# sink function saves only results (not commands)
# however, using source (running a script file) will also save the commands and results

sink("myo.txt", split=T)
source("mlr.R", echo=T, max.deparse.length=10000)
sink()

#=======================================================================
# END.

