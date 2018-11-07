## sample size calculation for the objective 'estimating a proportion'

# Inputs:
P<-0.3         # estimated/expected proportion; should get from literature
d<-0.05        # desired precision (e.g. +/- 0.05 means "+/-5% in estimating a proportion")

# run the above 2 lines and the following 1 line:
round((qnorm(1-(1-0.95)/2)^2)*P*(1-P)/(d^2)+0.5,0)

#------------------------------------------------------------------
#------------------------------------------------------------------

## sample size calculation for the objective 'estimating a mean'
# Inputs:
sd<-2.2         # estimated/expected SD; should get from literature
d<-0.5           # desired precision(e.g. +/- 5 units means "+/-5 units in estimating a mean")

# run the above 2 lines and the following 1 line:
round((qnorm(1-(1-0.95)/2)^2)*(sd^2)/(d^2)+0.5,0)

#------------------------------------------------------------------
#------------------------------------------------------------------

install.packages("pwr")
library(pwr)

### COMPARING TWO MEANS (two independent groups) ("EQUAL" sample sizes)

## CALCULATING SAMPLE SIZE
# Inputs:
meandiff<- 5         # smallest difference that researchers consider practically important so that to be detected.
sd <- 12             # sd can be taken from literature
alpha <- 0.05        # Type I error is normally set at 0.05
power <- 0.80         # Type II error is normally set at 0.2, therefore power is 0.8

# run the above 4 lines and the following 4 lines:
d<-meandiff/sd
x<-pwr.t.test(d=d, sig.level=alpha, power=power, type="two.sample", alternative="two.sided")
n<-round(x$n+0.5,0); 
print(n)

## CALCULATING POWER
# Inputs:
meandiff<- 5         # smallest difference that researchers consider practically important so that to be detected.
sd <- 12             # sd can be taken from literature
alpha <- 0.05        # Type I error is normally set at 0.05
n = 100              # Sample size of each group (equal sample size)

# run the above 4 lines and the following 4 lines:
d<-meandiff/sd
x<-pwr.t.test(d=d, sig.level=alpha, n=n, type="two.sample", alternative="two.sided")
power<-round(x$power,3); 
print(power)

#------------------------------------------------------------------
#------------------------------------------------------------------

### COMPARING TWO MEANS (two independent groups) (two groups are "UNEQUAL" sample sizes)

## CALCULATING SAMPLE SIZE
# Inputs:
meandiff<- 1         # smallest difference that researchers consider practically important so that to be detected.
sd <- 2.2             # sd can be taken from literature
alpha <- 0.05        # Type I error is normally set at 0.05
power = 0.80         # Type II error is normally set at 0.2, therefore power is 0.8.  However, you may set higher power if you wish.
n1=50                # What is the sample size of the first group?

# run the above 5 lines and the following 4 lines:
d<-meandiff/sd
x<-pwr.t2n.test(d=d, n1=n1, power=power, alternative ="two.sided")
n2<-round(x$n2+0.5,0); 
print(n2)

## CALCULATING POWER
# Inputs:
meandiff<- 5         # smallest difference that researchers consider practically important so that to be detected.
sd <- 12             # sd can be taken from literature
alpha <- 0.05        # Type I error is normally set at 0.05
n1 = 100             # Sample size of the first group
n2 = 80              # Sample size of the second group

# run the above 5 lines and the following 4 lines:
d<-meandiff/sd
x<-pwr.t2n.test(d=d, n1=n1, n2=n2, alternative ="two.sided")
power<-round(x$power,3); 
print(power)

#------------------------------------------------------------------
#------------------------------------------------------------------


### COMPARING TWO MEANS (dependent samples or pre-post study)

## CALCULATING SAMPLE SIZE
# Inputs:
meandiff<- 5         # smallest difference that researchers consider practically important so that to be detected.
sd <- 12             # sd can be taken from literature
alpha <- 0.05        # Type I error is normally set at 0.05
power = 0.80         # Type II error is normally set at 0.2, therefore power is 0.8. However, you may set higher power if you wish.

# run the following 4 lines to calculate sample size for each group
d<-meandiff/sd
x<-pwr.t.test(d=d,power=power,sig.level=alpha,type="paired",alternative="two.sided")
n<-round(x$n+0.5,0); 
print(n)

## CALCULATING POWER
# Inputs:
meandiff<- 5         # smallest difference that researchers consider practically important so that to be detected.
sd <- 12             # sd can be taken from literature
alpha <- 0.05        # Type I error is normally set at 0.05
n = 100              # Sample size

# run the above 4 lines and the following 4 lines:
d <- meandiff/sd
x <- pwr.t.test(d=d, n=n, sig.level=alpha, type="paired", alternative="two.sided")
power<-round(x$power,3); 
print(power)

#------------------------------------------------------------------
#------------------------------------------------------------------

### COMPARING TWO PROPORTIONS (two independent groups) ("EQUAL" sample sizes)

## CALCULATING SAMPLE SIZE
# Inputs:
P1<- 0.3             # Proportion in base-line (or reference group)
P2 <- 0.25            # Considering important difference in proportions, P2 has to be set. It is not from literature.
alpha <- 0.05        # Type I error is normally set at 0.05
power <- 0.80        # Type II error is normally set at 0.2, therefore power is 0.8.  However, you may set higher power if you wish.

# run the above 4 lines and the following 3 lines:
x <- power.prop.test(power=power,p1=P1,p2=P2,alternative="two.sided")
n<-round(x$n+0.5,0); 
print(n)

## CALCULATING POWER
# Inputs:
P1<- 0.3             # Proportion in base-line (or reference group)
P2 <- 0.4            # Considering important difference in proportions, P2 has to be set. It is not from literature.
alpha <- 0.05        # Type I error is normally set at 0.05
n <- 356             # Sample size obtained for each group (equal sample size).

# run the above 4 lines and the following 3 lines:
x <- power.prop.test(n=n,p1=P1,p2=P2,alternative="two.sided")
power<-round(x$power,3); 
print(power)

#------------------------------------------------------------------
#------------------------------------------------------------------

### COMPARING TWO PROPORTIONS (two independent groups) ("UNEQUAL" sample sizes)

## CALCULATING SAMPLE SIZE
# Inputs:
P1<- 0.3             # Proportion in base-line (or reference group)
P2 <- 0.25            # Considering important difference in proportions, P2 has to be set. It is not from literature.
alpha <- 0.05        # Type I error is normally set at 0.05
power <- 0.80        # Type II error is normally set at 0.2, therefore power is 0.8.  However, you may set higher power if you wish.
n1 <- 800            # sample size for the first group (baseline or reference group)

# run the above 5 lines and the following 4 lines:
h <- abs(ES.h(P1, P2));h
x <- pwr.2p2n.test(h=h, n1=n1, power=power, sig.level=alpha, alternative="two.sided")
n2<-round(x$n2+0.5,0)
print(n2)

## CALCULATING POWER
# Inputs:
P1<- 0.3             # Proportion in base-line (or reference group)
P2 <- 0.4            # Considering important difference in proportions, P2 has to be set. It is not from literature.
alpha <- 0.05        # Type I error is normally set at 0.05
n1 <- 400            # sample size for the first group (baseline or reference group)
n2 <- 350            # sample size for the second group (interest or intervention group)

# run the above 5 lines and the following 4 lines:
h <- abs(ES.h(P1, P2));h
x<-pwr.2p2n.test(h=h, n1=n1, n2=n2, sig.level=alpha, alternative="two.sided")
power<-round(x$power,3); 
print(power)

#--------------------------------------------------------
# END.

# ref: https://rstudio-pubs-static.s3.amazonaws.com/223385_834484c22e2f41af9f515c8aa0c114d8.html
# ref: http://staff.pubhealth.ku.dk/~tag/Teaching/share/R-tutorials/Power.html

