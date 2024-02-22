#first of all, let's set the working directory
#to be the same as the current file.
#if Run-ing, this:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#if source-ing, this: 
#setwd(getSrcDirectory()[1])

library(readr)
library(dplyr)
library(ggplot2)

#first a synthetic example: 
# a single variable,  9 data points:
x=(1:9)*11
min(x)
max(x)
sum(x)
mean(x)
median(x)
summary(x)
# max-min is called "range"
var(x)
sd(x)

#linear transformation to data:
summary(10*x)
10*summary(x)

var(10*x)
10*var(x)
100*var(x)

sd(10*x)
10*sd(x)


summary(x+1)
summary(x)+1

mean(x-4)
mean(x)-4

m=mean(x)
mean(x-m)

var(x+7)
var(x)


sd(x+7)
sd(x)

var(10*x+3)
var(x)*100


sd(10*x+3)
sd(x)*10

sd(x/10)
sd(x)/10

a=sd(x)
sd(x/a)



#now a special transformation we'll use later:
a=mean(x)
b=sd(x)
z=(x-a)/b
z
mean(z)
sd(z)

scale(x)

sd(x) * z + mean(x)


#this scaling is commonly used in statistics. 
# we say things like "one sd away", 
#or "one sd change in this variable", etc. 
#the unit of measurement becomes sd, 
#and we can compare distributions of variables 
#that have different natures. 
#for example, mass and length have different units 
#of measurement, we can't add them or compare them. 
#but the scaled versions of a mass distribution and 
#a length distribution can be compared. 







# our previous data set:
ourData = read_csv(file="acs2017_county_data.csv")




# mean county population:
mean(ourData$TotalPop)
median(ourData$TotalPop)


#mean county population in Maryland:
mean(ourData$TotalPop[ourData$State=="Maryland"])

#pipeline approach:
ourData %>%
  filter(State=="Maryland") %>%
  summarize(mean(TotalPop))






#mean state population:
temp=aggregate(ourData$TotalPop,by=list(ourData$State),FUN=sum)
avepop=mean(temp[,2])
avepop

length(unique(ourData$State))
avepop*length(unique(ourData$State))

sum(ourData$TotalPop)


 
#with pipe approach of dplyr:
ourData %>%
  group_by(State) %>%
  summarize(temp=sum(TotalPop)) %>%
  print() %>%
  summarize(mean(temp))







#mean county population of different states:
temp=aggregate(ourData$TotalPop,by=list(ourData$State),FUN=mean)
temp



#with pipe approach of dplyr:
ourData %>%
  group_by(State) %>%
  summarize(mean(TotalPop))  






#mean vs median: county populations
(avePop=mean(ourData$TotalPop))
(medPop=median(ourData$TotalPop))


#why are they so different?

mean(c(11,22,33,44,55,66,77,88,99))
mean(c(11,22,33,44,55,66,77,88,99000000))

median(c(11,22,33,44,55,66,77,88,99))
median(c(11,22,33,44,55,66,77,88,99000000))


summary(ourData$TotalPop)

quantile(ourData$TotalPop,c(0,.25,.5,.75,1))
quantile(ourData$TotalPop,seq(from=0,to=1,by=.1))


h=barplot(ourData$TotalPop )
h=hist(ourData$TotalPop,breaks=50) 
 





#Better visible if we focus on one state:
D=subset(ourData,State=="Nevada")
(avePop=mean(D$TotalPop))
(medPop=median(D$TotalPop))
 barplot(D$TotalPop )
hist(D$TotalPop)








# What if we introduce a new variable, 
# equal to the logarithm of county population?
#how is that variable distributed?
x=log10(ourData$TotalPop)
hist(x,breaks=50)
summary(x)

 







#the distribution of number of 8graders within NYC schools
schoolData=read_csv("NYC_class_size.csv")
D=subset(schoolData,GRADE==8)
x=D$`NUMBER OF STUDENTS / SEATS FILLED`
hist(x,breaks=50)
summary(x)
 


# how are SAT scores distributed across NYC high schools?
D=read_csv("SAT_Results.csv")
glimpse(D)
tt=D$Num_SAT_test_takers
cra=D$Crit_Reading
m=D$Math
w=D$Writing

hist(tt,breaks=50)
hist(cra,breaks=50)
hist(m,breaks=50)
hist(w,breaks=50)

#let's analyze CRA scores a bit further:
hist(cra,breaks=50)
summary(cra)
sd(cra)
#instead of histogram, which gives frequencies, 
#we are usually interested in proportions, 
#that is, relative requencies. 
#This can be done, for example, with "density()":
d=density(cra) 
plot(d)


summary(cra)
summary(m)
summary(w)
sd(cra)
sd(m)
sd(w)




