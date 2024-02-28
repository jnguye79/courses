# Homework 1 - Analyzing Car Crashes

# Set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# Load packages
library(readr)
library(dplyr)

# Read data
data <- read_csv(file = "data1.csv")

# Question 1
# What is the size of the dataset? (how many datapoints do we have?)
nrow(data)

# Question 2
# What is the mean of this column?
mean(data$`Temperature(F)`)

# Question 3
# What is the standard deviation?
sd(data$`Temperature(F)`)

# Question 4
# What is the maximum value?
max(data$`Temperature(F)`)

# Question 5
# What is the minimum value?
min(data$`Temperature(F)`)

# Question 6
# What is the z-score of the largest value?


# Question 7
# What is the z-score of the smallest value?


# Question 8
# How many data points are within one standard deviation away from the mean? (that is, how many datapoints are less than mean + sd and greater than mean - sd?)


# Question 9
# What proportion of the datapoints are within one standard deviation away from the mean?


# Question 10
# What proportion of the datapoints are within two standard deviations away from the mean?

