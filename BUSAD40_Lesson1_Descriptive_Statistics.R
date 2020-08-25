##############################################
##########  Descriptive Statistics  ##########
##############################################

# Identify your current working directory
getwd()

# Setting the working directory for your project or work
setwd("Enter your working directory here!")

# Import the lsr library
# install.packages("lsr")
library(lsr)

# Loading the Australian Football League (AFL) data set
load("data/aflsmall.Rdata")

# Check the variables in the file
who()

# Print the value of margins
print(afl.margins)


## Measures of Central Tendency

# Calcuate the mean value in R
mean(afl.margins)

# Find the median value in R
median(afl.margins)

# Find the mode value in R (Core R has no function for mode)
# Option 1:
table(afl.finalists)

# Option 2: (modeOf function from lsr package)
modeOf(afl.finalists)

# Trimmed mean
# The mean function in R has several intersting parameters, one of them is "trim"
dataSet <- c(-100, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Regular mean includes all values in the vector
mean(dataSet)

# Trimmed mean that trims the 10% outliners from the lower and higher ends
mean(dataSet, trim = 0.10)


## Measures of Variability

# Find the Range of the data
max(afl.margins)
min(afl.margins)
range(afl.margins)

# Find the Interquartile Range of the data
# quantile function in R
quantile(afl.margins)

# 50% quantile
quantile(afl.margins, probs = 0.5)

# Find the 25% and 75% quantile range
quantile(afl.margins, probs = c(0.25, 0.75))

# Calculate the interquartile range
IQR(afl.margins)


# Mean Absolute Deviation
# Create a new vector
x <- c(4, 7, 10, 5, 6)

# Step 1: Calculate the mean of the data
xBar <- mean(x)

# Step 2: Calculate the absolute deviations from the mean
ad <- abs(x - xBar)

# Step 3: Calculate the mean absolute deviation
mad <- mean(ad)
print(mad)

# Use the aad() function from lsr package
aad(x)


# Variance of the data
# Step 1: Calculate the mean of the data
xBar <- mean(x)

# Step 2: Calculate the absolute deviations from the mean
sqDev <- (x - xBar)^2

# Step 3: Calculate the mean absolute deviation
va <- mean(sqDev)
print(va)

# Use the var() function from base R
var(x)

# NOTE: the var() function in base R calculates the sample variance, not the population variance

# Standard Deviation of the data
# Option 1:
sqrt(var(x))

# Option 2: Use the sd() function in base R
sd(x)

# Note: the sd() function in base R calculates the sample standard devaition,not the population parameters


# Statistical Summary of the Data
# Summary of a vector
summary(afl.margins)
summary(afl.finalists)

# Summarizing a data frame
# load the clinicaltrial data frame
load("data/clinicaltrial.Rdata")
who(TRUE)

# Print the first 6 rows of the data
head(clin.trial)

# Summarize the data frame
summary(clin.trial)

# Aggregate the data by group and summarized with the mean value
aggregate(formula = mood.gain ~ drug + therapy, data = clin.trial, FUN = mean)

# Aggregate the data by group and summarized with the standard deviation
aggregate(formula = mood.gain ~ drug + therapy, data = clin.trial, FUN = sd)


# Crosstab
# Create the crosstab with base R
crosstab <- table(clin.trial$drug, clin.trial$therapy)
print(crosstab)

# Create frequency table
margin.table(crosstab, 1)  # drug freq. by summed over therapy
margin.table(crosstab, 2)  # therapy freq. by summed over drug

# Create proportion table
prop.table(crosstab, 1)
prop.table(crosstab, 2)

# Load the descr package
# install.packages("descr")
library(descr)
crosstab(clin.trial$drug, clin.trial$therapy, xlab = "Therapy", ylab = "Drug Used")

