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
 
 
 

ggplot()+
  geom_histogram(data = SAT_Data,
                 aes(x=Crit_Reading,y=..density..),
                 binwidth = 20,color="black",fill="lightblue")+
  geom_density(data = SAT_Data,aes(x=Crit_Reading),
               color="sienna1",size=1.5)



ggplot()+
  geom_histogram(data = SAT_Data,
                 aes(x=Math,y=..density..),
                 binwidth = 20,color="black",fill="lightblue")+
  geom_density(data = SAT_Data,aes(x=Math),
               color="sienna1",size=1.5)




ggplot()+
  geom_histogram(data = SAT_Data,
                 aes(x=Writing,y=..density..),
                 binwidth = 20,color="black",fill="lightblue")+
  geom_density(data = SAT_Data,aes(x=Writing),
               color="sienna1",size=1.5)


ggplot()+
  geom_density(data=SAT_Data,aes(x=scale(Crit_Reading)))+
  geom_density(data=SAT_Data,aes(x=scale(Writing)))+
  geom_density(data=SAT_Data,aes(x=scale(Math)))
  












#olympic athletes:


olympicsData=read_csv("olympics_athlete_events.csv")
OD=subset(olympicsData,
         !is.na(olympicsData$Height)&
           !is.na(olympicsData$Weight)&
           !is.na(olympicsData$Age))  

ggplot()+
  geom_histogram(data = OD,
                 aes(x=Height,y=..density..),
                 binwidth = 3,color="black",fill="lightblue")+
  geom_density(data = OD,aes(x=Height),
               color="sienna1",size=1.5)


ggplot()+
  geom_histogram(data = OD,
                 aes(x=Weight,y=..density..),
                 binwidth = 3,color="black",fill="lightblue")+
  geom_density(data = OD,aes(x=Weight),
               color="sienna1",size=1.5)





ggplot()+
  geom_histogram(data = OD,
                 aes(x=Age,y=..density..),
                 binwidth = 3,color="black",fill="lightblue")+
  geom_density(data = OD,aes(x=Age),
               color="sienna1",size=1.5)



ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=OD,aes(x=scale(Age)))





rainData=read_csv("rain_ph.csv")

ggplot()+
  geom_density(data=rainData,aes(x=scale(pH)))  






ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=OD,aes(x=scale(Age)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue",size=1.5)+ 
  theme(axis.title.x=element_blank())











NBA_Data=read_csv("NBA_players_born_1970_onward.csv")

ggplot()+
  geom_density(data=NBA_Data,aes(x=scale(height)))  +
  geom_density(data=NBA_Data,aes(x=scale(weight)))  


WNBA_Data=read_csv("WNBA_Stats.csv")
ggplot()+
  geom_density(data=WNBA_Data,aes(x=scale(Height)))
ggplot()+
  geom_density(data=WNBA_Data,aes(x=scale(Weight)))





ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=OD,aes(x=scale(Age)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  theme(axis.title.x=element_blank())


 



marathon_Data=read_csv("marathon_results_2017.csv")
ggplot()+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)))
 


ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange",size=1)+
  theme(axis.title.x=element_blank())




UCLA_Data=read_csv("UCLA_admission.csv")
ggplot()+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)))+
  geom_density(data=UCLA_Data,aes(x=scale(gre)))


ggplot()+
  geom_density(data=OD,aes(x=scale(Height)))+
  geom_density(data=OD,aes(x=scale(Weight)))+
  geom_density(data=rainData,aes(x=scale(pH)),color="cornflowerblue")+
  geom_density(data=WNBA_Data,aes(x=scale(Height)),color="darkred")+
  geom_density(data=NBA_Data,aes(x=scale(height)),color="darkred") +
  geom_density(data=WNBA_Data,aes(x=scale(Weight)),color="darkseagreen")+
  geom_density(data=NBA_Data,aes(x=scale(weight)),color="darkseagreen")+
  geom_density(data=marathon_Data,aes(x=scale(`Official Time`)),color="orange")+
  geom_density(data=UCLA_Data,aes(x=scale(gpa)),color="deeppink",size=1)+
  geom_density(data=UCLA_Data,aes(x=scale(gre)),color="deeppink4",size=1)+
  theme(axis.title.x=element_blank())








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



#It's obviously different in nature.


 
# How do we measure "normal-ness" of a distribution?
#Let's begin with visual specualtions for initial cues.


# For normal distribution, we have: 
pnorm(0,mean=0,sd=1)
pnorm(-2,mean=0,sd=1)
pnorm(-1,mean=0,sd=1)
pnorm(0,mean=0,sd=1)
pnorm(1,mean=0,sd=1)
pnorm(2,mean=0,sd=1)


#  the famous 68-95-99.7 rule:
pnorm(1,mean=0,sd=1)-pnorm(-1,mean=0,sd=1)
pnorm(2,mean=0,sd=1)-pnorm(-2,mean=0,sd=1)
pnorm(3,mean=0,sd=1)-pnorm(-3,mean=0,sd=1)



#Let's visualize:

x= seq(from = -4, to = 4, by = .01)
D=data.frame(x = x, y = dnorm(x, mean =0, sd =1))

shade_area=function(input_data, xleft, xright, fill = "darkseagreen",alpha=.5 ){
  temp_data=subset(input_data, x >= xleft & x < xright)
    geom_area(data = temp_data,
            aes(y=temp_data[,2]), fill = fill, color = NA, alpha = alpha)
}


ggplot(D, aes(x = x, y = y)) +
  geom_line() + 
  shade_area(D,xleft=-Inf,xright=+1,fill="lightgoldenrod2",alpha=.9)+
  geom_segment(x = 0, y=0,xend=0,yend=.5,color = 'black',linetype="dashed")  



ggplot(D, aes(x = x, y = y)) +
  geom_line() + 
  shade_area(D,xleft=-3,xright=+3,fill="lightgoldenrod1",alpha=.7)+
  shade_area(D,xleft=-2,xright=+2,fill="lightgoldenrod3",alpha=.9)+
  shade_area(D,xleft=-1,xright=+1,fill="lightgoldenrod4")+
  geom_segment(x = 0, y=0,xend=0,yend=.5,color = 'black',linetype="dashed")  
  


 #how much "probability mass" inside eash region?






#now let's investigate empirical distributions, 
#and how the 68-95-99.7 rule 


dist_shade=function(input_vec,xleft,xright,
                    fill=rep("orange",length(xleft)),
                             alpha=rep(.6,length(xleft))){
  p= ggplot()+ geom_density(data=as.data.frame(input_vec),
                            aes(x=input_vec))
  D=ggplot_build(p)$data[[1]] %>%
    select(x,y)
  p=ggplot(D, aes(x = x, y = y)) +  geom_line() 
  for (i in 1:length(xleft)){
    p=p+shade_area(D,xleft=xleft[i],xright=xright[i],fill=fill[i],alpha=alpha[i])
  }
  return(p)
}



rvals= rnorm(n=10000,mean=0,sd=1)
 
dist_shade(rvals,xleft=-1,xright=1)




qs=c(.5-.997/2, .5-.95/2, .5-.68/2, .5+.68/2, .5+.95/2, .5+.997/2)
quantile(rvals,qs)  





#Let's see how close to normal distribution 
#is the rain ph data:
r=rainData$pH

round(quantile(scale(r),qs),3)



xleft=mean(r)-sd(r)
xright=mean(r)+sd(r) 

dist_shade(r,xleft=xleft,xright=xright)+
  geom_vline(xintercept = quantile(r,.16))+
  geom_vline(xintercept = quantile(r,.84))+
  annotate(geom = 'text', x = (xleft+xright)/2, y = 0.4, color = 'brown', label = '68%',size=10)


#so far, very close match to the normal distribution. 
#what if we check one sd further?
  
xleft=c(mean(r)-sd(r),mean(r)-2*sd(r))
xright=c(mean(r)+sd(r),mean(r)+2*sd(r))

dist_shade(r,xleft=xleft,xright=xright)+
  geom_vline(xintercept = quantile(r,.025))+
  geom_vline(xintercept = quantile(r,.16))+
  geom_vline(xintercept = quantile(r,.84))+  
  geom_vline(xintercept = quantile(r,.975))




#sometimes the Q-Q plot is used for quick visual comparison:

ggplot() + 
  aes(sample = r) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  ylab("pH")
 

#or we can scale r:


ggplot() + 
  aes(sample = scale(r)) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("pH")

 






r=NBA_Data$height

round(quantile(scale(r),qs),3)

xleft=c(mean(r)-sd(r),mean(r)-2*sd(r))
xright=c(mean(r)+sd(r),mean(r)+2*sd(r))

dist_shade(r,xleft=xleft,xright=xright)+
  geom_vline(xintercept = quantile(r,.025))+
  geom_vline(xintercept = quantile(r,.16))+
  geom_vline(xintercept = quantile(r,.84))+  
  geom_vline(xintercept = quantile(r,.975))



ggplot() + 
  aes(sample = r) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  ylab("height")


 

ggplot() + 
  aes(sample = scale(r)) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("height")









r=marathon_Data$`Official Time`

round(quantile(scale(r),qs),3)

xleft=c(mean(r)-sd(r),mean(r)-2*sd(r))
xright=c(mean(r)+sd(r),mean(r)+2*sd(r))

dist_shade(r,xleft=xleft,xright=xright)+
  geom_vline(xintercept = quantile(r,.025))+
  geom_vline(xintercept = quantile(r,.16))+
  geom_vline(xintercept = quantile(r,.84))+  
  geom_vline(xintercept = quantile(r,.975))





ggplot() + 
  aes(sample = r) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  ylab("official time")


 

ggplot() + 
  aes(sample = scale(r)) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("official time")



#Now let's look at the non-normal data: house prices

r=Zillow_Data$`3/31/20`

round(quantile(scale(r),qs),3)

r=scale(r)
 



 

ggplot() + 
  aes(sample = r) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  ylab("price")







ggplot() + 
  aes(sample = scale(r)) + 
  geom_qq(distribution = qnorm) + 
  geom_qq_line(col = "black") +
  geom_abline(color="purple",linetype="dashed",size=1)+
  ylab("price")








#so far we relied on intuitive comparison to 
#normal distribution. More formal methods 
#will be covered later. Namely, the 
#chi-squared test, and also the
#Kolmogrov-Smirnov test (briefly).




