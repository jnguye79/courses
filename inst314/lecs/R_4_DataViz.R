#first of all, let's set the working directory
#to be the same as the current file.
#if Run-ing, this:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#if source-ing, this: 
#setwd(getSrcDirectory()[1])

#install.packages("tidyverse")
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)



 

ourData = read_csv("SAT_Results.csv")
 
 
 

#ggplot, plotting layer by layer:
#Data:  
#Geometry: such as barplot, histogram, density, scatterplot, etc.
#Aesthetic mapping:  
#mapping data to vision (coordinates,color,etc.)


#First, empty canvas: 
p = ggplot(data = ourData)
p
p+aes(x=Crit_Reading)
p+aes(x=Crit_Reading)+geom_histogram()
p+aes(x=Crit_Reading)+geom_histogram(binwidth = 10)



ggplot(data = ourData)+aes(x=Crit_Reading)+
  geom_freqpoly(binwidth = 10)
 

ggplot(data = ourData)+aes(x=Crit_Reading,y=..density..)+
  geom_histogram(binwidth = 15)
 
ggplot(data = ourData)+aes(x=Crit_Reading)+
  geom_density()


ggplot()+
  geom_histogram(data = ourData,
                 aes(x=Crit_Reading,y=..density..),
                 binwidth = 15,
                 color="black",fill="lightblue")+
  geom_density(data = ourData,aes(x=Crit_Reading),
               color="mediumorchid",size=1.5)



#let's compare critical reading with writing and math
ggplot()+
  geom_freqpoly(data=ourData,aes(x=Crit_Reading),color="blue")+
  geom_freqpoly(data=ourData,aes(x=Writing),color="red")+
  geom_freqpoly(data=ourData,aes(x=Math),color="green")

















































#olympic athletes:


ourData=read_csv("olympics_athlete_events.csv")



ggplot(data = ourData)+
  aes(x=Height)+
  geom_histogram(binwidth=2)

 

#the warning message says that are rows with unclean data
# (can be missing values, etc.)
#inspecting, we see that some rows have "NA".
#Let's clean the dataset:
D=subset(ourData,
         !is.na(ourData$Height)&
         !is.na(ourData$Weight)&
         !is.na(ourData$Age))           
#or we could do: D=ourData[!is.na(ourData$Height)&... ,]
#or we could do: 
#D=ourData %>%
#  filter(!is.na(Height)&!is.na(Weight)&!is.na(Age))

  
ggplot(data = D)+aes(x=Height)+
  geom_histogram(binwidth=2)
 

ggplot()+
  geom_histogram(data = D,aes(x=Height),binwidth=2)+
  geom_freqpoly(data = D,aes(x=Height),binwidth=2,color="red")
  



ggplot(data = D)+aes(x=Height)+
  geom_density()


ggplot(data = D)+aes(x=Height)+
  stat_ecdf()

summary(D$Height)


ggplot(data = D)+aes(x=Height)+
  stat_ecdf()+
  geom_vline(xintercept = quantile(D$Height,.25),color="purple")
 



 




#Let's see the distribution for male and female separately:
ggplot(data = D)+aes(x=Height,color=Sex)+
  geom_density()
 
sd(D$Height[D$Sex=="M"])
sd(D$Height[D$Sex=="F"])

#let's see this together with the overall density:
ggplot()+
  geom_density(data=D,aes(x=Height,color=Sex))+
  geom_density(data=D,aes(x=Height))
 




#using boxplot for faster visual perception:
ggplot()+
  geom_boxplot(data=D,aes(x=Sex,y=Height)) 


ggplot()+
  geom_boxplot(data=D,aes(x=Sex,y=Weight)) 

 

ggplot()+
  geom_boxplot(data=D,aes(x=Season,y=Height)) 

ggplot()+
  geom_boxplot(data=D,aes(x=Medal,y=Height)) 


 





#violin plot encodes more visual information
#than the simple boxplot:
ggplot(data=D, aes(x=Sex,y=Weight)) +
  geom_violin(
    trim = FALSE,
    draw_quantiles = c(0.25, 0.5, 0.75)  )


install.packages("ggridges")
library(ggridges)
ggplot(data=D)+
  aes(x = Height, y = Medal) +
  geom_density_ridges()








#is there a difference between summer and winter olympics?
ggplot()+
  geom_boxplot(data=D,aes(x=Season,y=Height,fill=Sex)) 


ggplot(data=D, aes(x=Season,y=Age,fill=Sex)) +
  geom_violin(
    trim = FALSE,
    draw_quantiles = c(0.25, 0.5, 0.75)  )


ggplot()+
  geom_boxplot(data=D,aes(x=Season,y=Weight,fill=Sex))

 
ggplot()+
  geom_boxplot(data=D,aes(x=Season,y=Height,fill=Medal)) 


ggplot()+
  geom_boxplot(data=D,aes(x=Season,y=Age,fill=Medal)) 




#look at the outliers of age!

 

#all-time ranking: 
topTeams=D %>%
  filter(!is.na(Medal))%>%
  group_by(Team) %>%
  summarize(golds=sum(Medal=="Gold")) %>%
  filter(golds>100) %>%
  arrange(golds)

ggplot()+
  geom_col(data=topTeams,aes(x=Team,y=golds))+
  coord_flip()

#how to force the order in bar plot?

ggplot()+
  geom_col(data=topTeams,
           aes(x=factor(Team,levels=Team),y=golds))+
  coord_flip()







#sometimes visualization helps us find out
#problems in data gathering


Weather_Data <- read_csv(file="US_WeatherEvents_2016-2019.csv")

D= Weather_Data %>%
  filter(Type=="Rain") %>%
  mutate(duration=as.numeric(`EndTime(UTC)`-`StartTime(UTC)`)) %>%
  filter(duration>0) %>%
  select(1:4,duration,everything())

 

ggplot()+
  geom_density(data=D,aes(x=duration))

ggplot()+
  geom_density(data=D,aes(x=log10(duration)))

print(D[1:100,],n=Inf)

X=as.data.frame(table(D$duration))
X
X %>%
  arrange(-Freq)
sort(X$Var1) 

 





