
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
 

sample_size=10
num_samples=10^4
sample_means=rep(NA,num_samples)
for (i in 1:num_samples) {
  this_sample=sample(marathon_Data$Age,sample_size)
  sample_means[i]=mean(this_sample)
}

mu_pop=mean(marathon_Data$Age)
sigma_pop=sd(marathon_Data$Age)
se=sigma_pop/sqrt(sample_size)
 




D=data.frame(sample_means)

ggplot()+
  geom_histogram(data = D,
                 aes(x=D[,1],y=..density..),
                 binwidth = 1,color="black",fill="lightblue")+
  geom_density(data = D,aes(x=D[,1]),
               color="sienna1",size=1.5)







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

plot_with_normal(sample_means,mu=mu_pop,se=se)


#The distribution of sample means is not to be confused
#with the population distribution. They have the same 
#mean but difference variance. 
#more importantly, 
# the distribution of sample means is Normal, 
#but the population distribution can be anything:

plot_with_normal(sample_means,mu=mu_pop,se=se)+
  geom_density(data = marathon_Data,
               aes(x=Age),
               color="red",size=1)+
  geom_vline(xintercept=mean(marathon_Data$Age),
             color="purple",
             size=1,linetype="dotted")



#let's write a function that generates
#sampling distribution: 
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
                              mu= mu_pop,se= se)+
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





sampling_results=sampling_mean(population_vec=marathon_Data$Age,
                sample_size=4,
                num_samples=10^4,N_bins=50)
sampling_results$graph 
sd(sampling_results$sample_means)


#Now we can investigate the effect of sample size. 
#Intuitively, we know that larger sample is better. 



sampling_results=
  sampling_mean(population_vec=marathon_Data$Age,
                sample_size=15,
                num_samples=10^4,
                N_bins=50)
sampling_results$graph
sd(sampling_results$sample_means)


#this is the Central Limit Theorem: 
#the average of these sample means gets closer to 
#the true population average as the sample size
# gets bigger. 

#now let's make an artificial dataset 
 #to get a better understanding of
 # the central limit theorem and 
 #sampling distributions.
 #let's make a uniformly-distributed dataset. 
 #some hypothetical population in which
 #ages 1 to 80 are all equally populated, 
 #each age with 1000 people:
 a=rep(1:80,1000)
 a=sample(a)
  
 sampling_results=sampling_mean(population_vec=a,
               sample_size=5,
               num_samples=10^4,
               N_bins=79)
sampling_results$graph
mean(a)
mean(sampling_results$sample_means)
sd(sampling_results$sample_means)





sampling_results=sampling_mean(population_vec=a,
                sample_size=20,
                num_samples=10^4,
                N_bins=80)
sampling_results$graph
mean(a)
mean(sampling_results$sample_means)
sd(sampling_results$sample_means)











Zillow_Data=read_csv("Zillow_AllHomes.csv")

prices=Zillow_Data$`3/31/20`
sampling_results=
  sampling_mean(population_vec=prices,
                sample_size=10,
                num_samples=10^4,
                N_bins=100)
output_plot=sampling_results$graph
output_plot
output_plot+xlim(0,10^6)
mean(prices)
mean(sampling_results$sample_means)
sd(sampling_results$sample_means)






#Let's take bigger samples:


sampling_results=
  sampling_mean(population_vec=prices,
                sample_size=100,
                num_samples=10^4,
                N_bins=100)
output_plot=sampling_results$graph
output_plot
output_plot+xlim(0,10^6/2)
mean(prices)
mean(sampling_results$sample_means)
sd(sampling_results$sample_means)


#we see much less variance
#in the sampling distribution
#this means that 
#individual sampling results
#are more likely to be close to 
#the true mean. So as we expect
#from intuition, bigger
#sample gives better result.










#We can use this idea to also estimate
#PROPORTIONS of different groups within
# a population. For example, 
#let's focus on the dataset of 
#dog bites in NYC:

dogBite_data=read_csv("NYC_Dog_Bite_Data.csv")
 
  
g=dogBite_data$Gender
female_p=sum(g=="F")/length(g)
male_p=sum(g=="M")/length(g)
 
#how can we use our existing code to 
# estimate the fraction of females?
#define a binary variable, 
#femaleness=1 for females and 0 for others:
femaleness=as.numeric(g=="F")
femaleness[1:10]
mean(femaleness)

sample_size=50
sampling_results=
  sampling_mean(population_vec=femaleness,
                sample_size=sample_size,
                num_samples=10^4,
                N_bins=10)
output_plot=sampling_results$graph
output_plot
mean(femaleness)
mean(sampling_results$sample_means)
sd(sampling_results$sample_means)
p=mean(femaleness)
sqrt(p*(1-p)/sample_size)






 