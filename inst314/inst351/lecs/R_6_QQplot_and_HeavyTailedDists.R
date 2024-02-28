


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





SAT_Data = read_csv("SAT_Results.csv")

olympicsData=read_csv("olympics_athlete_events.csv")
OD=subset(olympicsData,
          !is.na(olympicsData$Height)&
            !is.na(olympicsData$Weight)&
            !is.na(olympicsData$Age))  
 



rainData=read_csv("rain_ph.csv")
   
NBA_Data=read_csv("NBA_players_born_1970_onward.csv")
  
marathon_Data=read_csv("marathon_results_2017.csv")
 
UCLA_Data=read_csv("UCLA_admission.csv")
 





Zillow_Data=read_csv("Zillow_AllHomes.csv")
ggplot()+
  geom_density(data=Zillow_Data,aes(x=scale(`3/31/20`)))
 

ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange")+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)),color="deeppink")+
  geom_density(data=UCLA_Data,aes(x=scale(gre)),color="deeppink")+
  geom_density(data=Zillow_Data,aes(x=scale(`3/31/20`)),color="green",size=1)+
  theme(axis.title.x=element_blank())



#It's obviously different in nature. What if we take the
# logarithm of prices?



ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange")+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)),color="deeppink")+
  geom_density(data=UCLA_Data,aes(x=scale(gre)),color="deeppink")+
  geom_density(data=Zillow_Data,aes(x=scale(log10(`3/31/20`))),color="green",size=1)+
  theme(axis.title.x=element_blank())
















classes_Data=read_csv("NYC_class_size.csv")
classes_Data= classes_Data %>%
  filter(GRADE==8) %>%
  filter(`PROGRAM TYPE`=="GEN ED")


ggplot()+
  geom_density(data=classes_Data,aes(x=scale(`NUMBER OF STUDENTS / SEATS FILLED`)))

ggplot()+
  geom_density(data=classes_Data,aes(x=scale(log10(`NUMBER OF STUDENTS / SEATS FILLED`))))





ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange")+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)),color="deeppink")+
  geom_density(data=UCLA_Data,aes(x=scale(gre)),color="deeppink")+
  geom_density(data=Zillow_Data,aes(x=scale(log10(`3/31/20`))),color="green")+
  geom_density(data=classes_Data,aes(x=scale(log10(`NUMBER OF STUDENTS / SEATS FILLED`))),color='coral2',size=1)+
  theme(axis.title.x=element_blank())







asteroid_Data=read_csv("Asteroid.csv")


ggplot()+
  geom_density(data=asteroid_Data,aes(x=scale(diameter)))

ggplot()+
  geom_density(data=asteroid_Data,aes(x=scale(log10(diameter))))




ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange")+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)),color="deeppink")+
  geom_density(data=UCLA_Data,aes(x=scale(gre)),color="deeppink")+
  geom_density(data=Zillow_Data,aes(x=scale(log10(`3/31/20`))),color="green")+
  geom_density(data=classes_Data,aes(x=scale(log10(`NUMBER OF STUDENTS / SEATS FILLED`))))+
  geom_density(data=asteroid_Data,aes(x=scale(log10(diameter))),color='gray40',size=1)+
  theme(axis.title.x=element_blank())














youtube_Data=read_csv("US_YouTube_videos.csv")


ggplot()+
  geom_density(data=youtube_Data,aes(x=scale(views)))


 

ggplot()+
  geom_density(data=youtube_Data,aes(x=scale(log10(views))))


ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange")+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)),color="deeppink")+
  geom_density(data=UCLA_Data,aes(x=scale(gre)),color="deeppink")+
  geom_density(data=Zillow_Data,aes(x=scale(log10(`3/31/20`))),color="green")+
  geom_density(data=classes_Data,aes(x=scale(log10(`NUMBER OF STUDENTS / SEATS FILLED`))))+
  geom_density(data=asteroid_Data,aes(x=scale(log10(diameter))),color='gray40')+
  geom_density(data=youtube_Data,aes(x=scale(log10(views))),color='purple',size=1)+
  theme(axis.title.x=element_blank())





#these are examples of "log-normal" distributions. 



ggplot() + 
  aes(sample = scale(log10(Zillow_Data$`3/31/20`))) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("log(price)")






ggplot() + 
  aes(sample = scale(log10(classes_Data$`NUMBER OF STUDENTS / SEATS FILLED`))) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("log(# students)")

 


 








ggplot() + 
  aes(sample = scale(log10(youtube_Data$views))) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("log(views)")
 








ggplot() + 
  aes(sample = scale(log10(asteroid_Data$diameter))) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("log(diameter)")








#  heavy-tailed distributions have many shapes, 
# rarely log-normal. 







