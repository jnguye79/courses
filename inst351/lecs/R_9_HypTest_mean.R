



#first of all, let's set the working directory
#to be the same as the current file.
#if Run-ing, this:
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))
#if source-ing, this: 
#setwd(getSrcDirectory()[1])

library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)




marathon_Data=read_csv("marathon_results_2017.csv")



# two plotting functions from 
#previous sessions for better illusrtration:


plot_with_normal=function(input_vec,
                          xmin=.9*min(input_vec),
                          xmax=1.1*max(input_vec),
                          mu=mean(input_vec),
                          se=sd(input_vec),
                          bins=20)
{D=as.data.frame(input_vec)
b=(max(input_vec)-min(input_vec))/bins
xvals=seq(from=xmin,to=xmax,length.out=100)
ggplot()+
  geom_histogram(data = D,
                 aes(x=D[,1],y=..density..),
                 binwidth = b,color="black",
                 fill="lightblue",alpha=.7)+
  geom_vline(xintercept=mean(input_vec),color="black",
             size=2,linetype="dashed",alpha=.7)+
  geom_line(data=data.frame(x=c(xmin,xmax)),aes(x=x),
            stat="function",
            fun=dnorm,args=list(mean=mu,sd=se),
            color='darkorange2',size=1)+
  geom_vline(xintercept=qnorm(p=.5,mean=mu,sd=se),
             color='darkorange2',size=.7)
}





 
 






sampling_mean=function(population_vec,
                       sample_size=floor(length(data)/100),
                       num_samples=1000,N_bins=20)
{
  sample_means=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_means[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  mu_pop=mean(population_vec) 
  se=sd(population_vec)/sqrt(sample_size) 
  
  #Also let's plot   
  #(1) the distribution of sample means along with 
  #(2) theoretical Normal curve and   
  #(3) the population distribution
  D=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  output_plot= plot_with_normal(sample_means,
                                mu= mu_pop,se= se,
                                bins=N_bins)+
    geom_histogram(data = D,
                   aes(x=D[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  
  return(list("sample_means"=sample_means,
              "sample_sds"=sample_sds,
              "graph"=output_plot))
}


#Let's recall the sampling distribution
#of the sample mean:



sampling_results=sampling_mean(population_vec=marathon_Data$Age,
                               sample_size=4,
                               num_samples=10^4,
                               N_bins=30)
sampling_results$graph 
sd(sampling_results$sample_means)


#concepts: 
#null hypothesis
#alternative hypothesis
# P-value, significance level




#suppose we have a hypothesis about the 
#age of participants, and we want to 
#investigate how the hypothesis 
#relates to the data. 
#suppose our hypothesis is this: 
# "the mean age of participants is 
# greater than 35 years old".
#Here we have the full dataset so we know the
#true answer. But in practice, we rely only
#on a small sample at hand.



#illustrative example to build intuition:
#if it was a fair coin toss, and we had data
#on 100 throws, we wouldn't expect to see
#necessarily exactly 50 heads and 50 tails, 
#but we definitely would expect to see 
#something close to it, allowing some
#chance fluctuations. 
#But if it was, say, 97 heads and 3 tails, 
#we would get suspicious that, 
#it appears unlikely that the coin is fair.
#It is possible to get 97-3, but unlikely. 
#the further the result is from 50-50, 
#the less likely it appears to us 
#that the coin is a fair one. 
#here, also, our judgement depends 
#on the distance between 
#observed sample mean and 
#the hypothesized value.





sample_size=50
sample_1=sample(marathon_Data$Age,sample_size)
results=t.test(sample_1,
               mu=35,
               alternative="greater",
               conf.level = .95)
results 


#let's take another sample:

sample_size=50
sample_2=sample(marathon_Data$Age,sample_size)
results=t.test(sample_2,
               mu=35,
               alternative="greater",
               conf.level = .95)
results 






























olympicsData=read_csv("olympics_athlete_events.csv")
OD=subset(olympicsData,
          !is.na(olympicsData$Height)&
            !is.na(olympicsData$Weight)&
            !is.na(olympicsData$Age)) 
OD_men=OD %>%
  filter(Sex=="M")

OD_women=OD %>%
  filter(Sex=="F")




















































sampling_mean_CIs=function(population_vec,
                           sample_size=floor(length(data)/1000),
                           num_samples=1000,N_bins=20,
                           alpha_val=.05)
{
  sample_means=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_means[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  mu_pop=mean(population_vec) 
  se=sd(population_vec)/sqrt(sample_size) 
  zstar=abs(qnorm(1-alpha_val/2))
  CI_upper= sample_means + zstar*se
  CI_lower= sample_means - zstar*se
  wins= mu_pop>CI_lower & mu_pop<CI_upper 
  
  
  D1=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  
  p1= plot_with_normal(sample_means,mu= mu_pop,se= se)+
    geom_histogram(data = D1,
                   aes(x=D1[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  
  D2=data.frame("names"=1:num_samples,
                "centers"=sample_means,
                "upper_limits"=CI_upper,
                "lower_limits"=CI_lower,
                "successful"=wins)
  p2=ggplot(data=D2, 
            aes(x=names,y=centers, 
                ymin=upper_limits,ymax=lower_limits)) +
    geom_pointrange(aes(col=successful),
                    fatten=2,size=.5) + 
    geom_hline(yintercept=mu_pop ) +
    ggtitle(label = paste0(paste(mean(wins),
                                 "% successful")))+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(hjust = 0.5))+
    coord_flip()  
  
  return(list("sample_means"=sample_means,
              "sample_sds"=sample_sds,
              "samp_dist_graph"=p1,
              "CI_graph"=p2))
}





sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=8,
                    num_samples=10^2 )
sampling_results$samp_dist_graph
sampling_results$CI_graph







#Let's change the plotting of CIs for better visibility: 
#put all the loser CIs up, winner CIs down:


sampling_mean_CIs=function(population_vec,
                           sample_size=floor(length(data)/100),
                           num_samples=1000,N_bins=20,
                           alpha_val=.05)
{
  sample_means=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_means[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  mu_pop=mean(population_vec) 
  se=sd(population_vec)/sqrt(sample_size) 
  zstar=qnorm(1-alpha_val/2)
  
  CI_upper= sample_means + zstar*se
  CI_lower= sample_means - zstar*se
  wins= mu_pop>CI_lower & mu_pop<CI_upper 
  
  
  D1=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  
  p1= plot_with_normal(sample_means,mu= mu_pop,se= se)+
    geom_histogram(data = D1,
                   aes(x=D1[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  inds=c(which(wins),which(!wins))
  
  D2=data.frame("names"=1:num_samples,
                "centers"=sample_means[inds],
                "upper_limits"=CI_upper[inds],
                "lower_limits"=CI_lower[inds],
                "successful"=wins[inds])
  
  
  
  p2=ggplot(data=D2, 
            aes(x=names,y=centers, 
                ymin=upper_limits,ymax=lower_limits)) +
    geom_pointrange(aes(col=successful),
                    fatten=1,size=.5) + 
    geom_hline(yintercept=mu_pop ) +
    ggtitle(label = paste0(paste(mean(wins),
                                 "% successful")))+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(hjust = 0.5))+
    coord_flip()  
  
  return(list("sample_means"=sample_means,
              "sample_sds"=sample_sds,
              "samp_dist_graph"=p1,
              "CI_graph"=p2))
}




sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=8,
                    num_samples=10^2 )
sampling_results$CI_graph































#let's refine more. Let's sort the attempts
#in terms of mean:


sampling_mean_CIs=function(population_vec,
                           sample_size=floor(length(data)/100),
                           num_samples=1000,N_bins=20,
                           alpha_val=.05)
{
  sample_means=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_means[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  mu_pop=mean(population_vec) 
  se=sd(population_vec)/sqrt(sample_size) 
  zstar=qnorm(1-alpha_val/2)
  inds=order(sample_means)
  sample_means=sample_means[inds]
  sample_sds=sample_sds[inds]
  CI_upper= sample_means + zstar*se
  CI_lower= sample_means - zstar*se
  wins= mu_pop>CI_lower & mu_pop<CI_upper 
  
  
  D1=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  
  p1= plot_with_normal(sample_means,mu= mu_pop,se= se)+
    geom_histogram(data = D1,
                   aes(x=D1[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  inds=c(which(wins),which(!wins))
  D2=data.frame("names"=1:num_samples,
                "centers"=sample_means[inds],
                "upper_limits"=CI_upper[inds],
                "lower_limits"=CI_lower[inds],
                "successful"=wins[inds])
  
  
  
  p2=ggplot(data=D2, 
            aes(x=names,y=centers, 
                ymin=upper_limits,ymax=lower_limits)) +
    geom_pointrange(aes(col=successful),
                    fatten=.1,size=.5) + 
    geom_hline(yintercept=mu_pop ) +
    geom_point(aes(x=names,y=centers),
               color="black",size=.2)+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank())+
    ggtitle(label = paste0(paste(mean(wins),
                                 "% successful")))+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(hjust = 0.5))+
    coord_flip()  
  
  
  
  
  
  return(list("sample_means"=sample_means,
              "sample_sds"=sample_sds,
              "samp_dist_graph"=p1,
              "CI_graph"=p2))
}




sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=8,
                    num_samples=10^4 )
sampling_results$CI_graph

#note that all CIs have the same width, 
#because we used the same se for all of them. 






#now let's look at 50% confidence intervals

sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=8,
                    num_samples=10^4,
                    alpha_val = .5)
sampling_results$CI_graph

# the CIs are narrower than before. 
# more confidence, wider CI.
#(give a 100% CI for the height of people on earth...)



#it's common to use 95% intervals
sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=8,
                    num_samples=10^4,
                    alpha_val = .05)
sampling_results$CI_graph



#In practice, the population 
#mean and variance is unkown to us. 
#That's why we're trying to estimate the mean
# snf variance from  samples. 
#so we don't have the population variance to 
#use in the s.e. formula:
#  point_estimate +- zstar * se
#we need to estimate se
#can we just simply estimate se by sample sd?


sampling_mean_CIs=function(population_vec,
                           sample_size=floor(length(data)/100),
                           num_samples=1000,N_bins=20,
                           alpha_val=.05)
{
  sample_means=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_means[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  mu_pop=mean(population_vec) 
  se=sd(population_vec)/sqrt(sample_size) 
  zstar=qnorm(1-alpha_val/2)
  inds=order(sample_means)
  sample_means=sample_means[inds]
  sample_sds=sample_sds[inds]
  CI_upper= sample_means + zstar*sample_sds/sqrt(sample_size)
  CI_lower= sample_means - zstar*sample_sds/sqrt(sample_size)
  wins= mu_pop>CI_lower & mu_pop<CI_upper 
  
  
  D1=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  
  p1= plot_with_normal(sample_means,mu= mu_pop,se= se)+
    geom_histogram(data = D1,
                   aes(x=D1[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  inds=c(which(wins),which(!wins))
  D2=data.frame("names"=1:num_samples,
                "centers"=sample_means[inds],
                "upper_limits"=CI_upper[inds],
                "lower_limits"=CI_lower[inds],
                "successful"=wins[inds])
  
  
  
  p2=ggplot(data=D2, 
            aes(x=names,y=centers, 
                ymin=upper_limits,ymax=lower_limits)) +
    geom_pointrange(aes(col=successful),
                    fatten=.1,size=.5) + 
    geom_hline(yintercept=mu_pop ) +
    geom_point(aes(x=names,y=centers),
               color="black",size=.2)+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank())+
    ggtitle(label = paste0(paste(mean(wins),
                                 "% successful")))+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(hjust = 0.5))+
    coord_flip()  
  
  
  
  
  
  return(list("sample_means"=sample_means,
              "sample_sds"=sample_sds,
              "samp_dist_graph"=p1,
              "CI_graph"=p2))
}





sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=8,
                    num_samples=10^4,
                    alpha_val = .05)
sampling_results$CI_graph

#suddenly a drop in performance. 
#it used to be ~95% successful. 

sampling_results$samp_dist_graph
#what if we take bigger samples?





sampling_results=
  sampling_mean_CIs(population_vec=marathon_Data$Age,
                    sample_size=80,
                    num_samples=10^4,
                    alpha_val = .05)
sampling_results$CI_graph

#better... 
#so our (1-alpha)%CI is only reliable for 
#large sample sizes because the 
#variance estimation becomes better. 




#what to do for GENERAL case,
#not necessarily large sample sizes?
#use t distribution.

# (xbar-true_mean)/(true_sigma/sqrt(n)) 
#is Normally distributed
#
# (xbar-true_mean)/(sample_sigma/sqrt(n)) has
# t distribution











sampling_mean_CIs_t=function(population_vec,
                             sample_size=floor(length(data)/100),
                             num_samples=1000,N_bins=20,
                             alpha_val=.05)
{
  sample_means=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_means[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  mu_pop=mean(population_vec) 
  se_true=sd(population_vec)/sqrt(sample_size) 
  tstar=qt(1-alpha_val/2,df=sample_size-1)
  inds=order(sample_means)
  sample_means=sample_means[inds]
  sample_sds=sample_sds[inds]
  CI_upper= sample_means + tstar*sample_sds/sqrt(sample_size)
  CI_lower= sample_means - tstar*sample_sds/sqrt(sample_size)
  wins= mu_pop>CI_lower & mu_pop<CI_upper 
  
  
  D=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  
  p1= plot_with_normal(sample_means,mu= mu_pop,se= se_true)+
    geom_histogram(data = D,
                   aes(x=D[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  inds=c(which(wins),which(!wins))
  D=data.frame("names"=1:num_samples,
               "centers"=sample_means[inds],
               "upper_limits"=CI_upper[inds],
               "lower_limits"=CI_lower[inds],
               "successful"=wins[inds])
  
  
  
  p2=ggplot(data=D, 
            aes(x=names,y=centers, 
                ymin=upper_limits,ymax=lower_limits)) +
    geom_pointrange(aes(col=successful),
                    fatten=.1,size=.5) + 
    geom_hline(yintercept=mu_pop ) +
    geom_point(aes(x=names,y=centers),
               color="black",size=.2)+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank())+
    ggtitle(label = paste0(paste(mean(wins),
                                 "% successful")))+
    theme(axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(hjust = 0.5))+
    coord_flip()  
  
  
  
  
  
  return(list("sample_means"=sample_means,
              "sample_sds"=sample_sds,
              "samp_dist_graph"=p1,
              "CI_graph"=p2))
}





sampling_results=
  sampling_mean_CIs_t(population_vec=marathon_Data$Age,
                      sample_size=8,
                      num_samples=10^4,
                      alpha_val = .05)
sampling_results$CI_graph



#R calculates the CI for us: 
sample_size=8
this_sample=sample(marathon_Data$Age,sample_size)
results=t.test(this_sample)
results
typeof(results)
ls(results)
results$"conf.int"
mean(marathon_Data$Age)
t.test(this_sample,conf.level=.90)$"conf.int"





#difference between two means...




olympicsData=read_csv("olympics_athlete_events.csv")
OD=subset(olympicsData,
          !is.na(olympicsData$Height)&
            !is.na(olympicsData$Weight)&
            !is.na(olympicsData$Age)) 
OD_men=OD %>%
  filter(Sex=="M")

OD_women=OD %>%
  filter(Sex=="F")

sample_size=50
sample_w=sample(OD_women$Height,sample_size)
sample_m=sample(OD_men$Height,sample_size)
results=t.test(sample_m,sample_w,conf.level = .95)
results$"conf.int"



sample_size=50
sample_w=sample(OD_women$Weight,sample_size)
sample_m=sample(OD_men$Weight,sample_size)
t.test(sample_m,sample_w,conf.level = .95)

sample_size=10
sample_w=sample(OD_women$Weight,sample_size)
sample_m=sample(OD_men$Weight,sample_size)
t.test(sample_m,sample_w,conf.level = .95)

sample_size=200
sample_w=sample(OD_women$Weight,sample_size)
sample_m=sample(OD_men$Weight,sample_size)
t.test(sample_m,sample_w,conf.level = .95)










#In all these cases, we had the "ground truth"
#as benchmark, because we had the population.
#In actual applications, we only have a sample. 




#Question: is the following meaningful?
t.test(OD_men$Height,OD_women$Height,conf.level = .95)










