
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


dogBite_data=read_csv("NYC_Dog_Bite_Data.csv")
g=dogBite_data$Gender
(female_p=sum(g=="F")/length(g))
(male_p=sum(g=="M")/length(g))

#how can we use our existing code to 
# estimate the fraction of females?
#define a binary variable, 
#femaleness=1 for females and 0 for others:
femaleness=as.numeric(g=="F")
femaleness[1:10]
mean(femaleness)

 





plot_with_normal=function(input_vec,
                          xmin=.9*min(input_vec),
                          xmax=1.1*max(input_vec),
                          mu,se,bins=20)
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




#let's begin from the point in the last session
#before we moved from Gaussian to t distribution, 
#because we don't know true sigma, and have to 
#estimate it from the sample.





sampling_proportion_CIs=function(population_vec,
                           sample_size=floor(length(data)/100),
                           num_samples=1000,N_bins=20,
                           alpha_val=.05)
{
  sample_ps=rep(NA,num_samples)
  sample_sds=rep(NA,num_samples)
  for (i in 1:num_samples) {
    this_sample=sample(population_vec,sample_size)
    sample_ps[i]=mean(this_sample)
    sample_sds[i]=sd(this_sample)
  }
  p_pop=mean(population_vec) 
  se_true=sd(population_vec)/sqrt(sample_size) 
  zstar=qnorm(1-alpha_val/2)
  inds=order(sample_ps)
  sample_ps=sample_ps[inds]
  sample_sds=sample_sds[inds]
  CI_upper= sample_ps + zstar*sample_sds/sqrt(sample_size)
  CI_lower= sample_ps - zstar*sample_sds/sqrt(sample_size)
  wins= p_pop>CI_lower & p_pop<CI_upper 
  
  
  D1=as.data.frame(population_vec)
  b=(max(population_vec)-min(population_vec))/N_bins
  
  p1= plot_with_normal(sample_ps,mu= p_pop,se= se_true)+
    geom_histogram(data = D1,
                   aes(x=D1[,1],y=..density..),
                   fill="purple",
                   alpha=.3,binwidth=b)+
    geom_vline(xintercept=mean(population_vec),
               color="purple",
               size=1,linetype="dotted")
  inds=c(which(wins),which(!wins))
  
  D2=data.frame("names"=1:num_samples,
                "centers"=sample_ps[inds],
                "upper_limits"=CI_upper[inds],
                "lower_limits"=CI_lower[inds],
                "successful"=wins[inds])
  
  
  
  p2=ggplot(data=D2, 
            aes(x=names,y=centers, 
                ymin=upper_limits,ymax=lower_limits)) +
    geom_pointrange(aes(col=successful),
                    fatten=.1,size=.5) + 
    geom_hline(yintercept=p_pop ) +
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
  
  
  
  
  
  return(list("sample_ps"=sample_ps,
              "sample_sds"=sample_sds,
              "samp_dist_graph"=p1,
              "CI_graph"=p2))
}




 

 sampling_results=
  sampling_proportion_CIs(population_vec=femaleness,
                          sample_size=8,
                          num_samples=10^4,
                          alpha_val = .05)
sampling_results$CI_graph
# poor performance. 
#it must be ~95% successful. 

sampling_results$samp_dist_graph
#what if we take bigger samples?






sampling_results=
  sampling_proportion_CIs(population_vec=femaleness,
                          sample_size=120,
                          num_samples=10^4,
                          alpha_val = .05)
sampling_results$CI_graph

#better... 
 


#for the mean, we used the t test
#for small sample sizes. 
#can we use the t-test for proportion as well?


sampling_proportion_CIs_t=function(population_vec,
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
  sampling_proportion_CIs(population_vec=femaleness,
                          sample_size=8,
                          num_samples=10^4,
                          alpha_val = .05)
sampling_results$CI_graph

#didn't work...
#the t-distribution only works for the mean. 
#for proportion, we only use the normal distribution. 
#rule of thumb is: 
#the sample size must be large enough such that
#there are >10 of each group in our sample








#we can use R to get CIs for proportions. 
#there are several other methods that don't rely
#on the normal approximation, and they can 
#be found in R, in different libraries. 
#here are two examples: 
wins=sum(femaleness)
prop.test(wins,length(femaleness),conf.level=0.95)

binom.test(wins,length(femaleness),conf.level=0.95)






 

