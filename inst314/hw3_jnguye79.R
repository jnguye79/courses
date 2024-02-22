# R Exercise 3: Using R for Normal Distribution, T-Distribution, Confidence Intervals

# Set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Install packages
library(tidyverse)
library(readr)
library(dplyr)
library(ggplot2)

# Import dataset
data <- read_csv(file = "data1.csv")

# Question 19: What is the mean of the Temperature column?
print(mean(data$`Temperature(F)`))

# Question 20: What is the sample mean?
sample_data <- sample_n(data, 20)
sample_mean <- mean(sample_data$`Temperature(F)`)
print(sample_mean)

# Question 21: What is the 95% confidence interval of the mean?
sample_sd <- sd(sample_data$`Temperature(F)`)
print(t.test(sample_data$`Temperature(F)`, conf.level = 0.95)$conf.int)

# Question 22: What is the 99% confidence interval?
print(t.test(sample_data$`Temperature(F)`, conf.level = 0.99)$conf.int)

# Question 23: What is the 90% confidence interval?
print(t.test(sample_data$`Temperature(F)`, conf.level = 0.90)$conf.int)

# Now let's take the first 200 rows to be our sample...

# Question 24: What is the sample mean?
sample_data2 <- sample_n(data, 200)
sample_mean2 <- mean(sample_data2$`Temperature(F)`)
print(sample_mean2)

# Question 25: What is the 95% confidence interval?
sample_sd2 <- sd(sample_data2$`Temperature(F)`)
print(t.test(sample_data2$`Temperature(F)`, conf.level = 0.95)$conf.int)

