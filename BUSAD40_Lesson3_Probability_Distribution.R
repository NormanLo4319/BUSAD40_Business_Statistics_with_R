################################################
##########  Probability Distribution  ##########
################################################

# Identify your current working directory
getwd()

# Setting the working directory for your project or work
setwd("Enter your working directory here!")

### Probability Distribution in R

# Plotting the Normal Distribution
# Simulating normal distributed data set
# Assign a sequence of numbers from -20 to 20 and increment by 0.1 to x
x <- seq(-20, 20, by = 0.1)

# Generate the density values with zero mean and standard deviation of 5
y <- dnorm(x, mean = 0, sd = 5)

# Plot the simulated normal distribution data
plot(x, y,
     main = "Probability Density Function",
     xlab = "X",
     ylab = "Density",
     type = "h")


# Plot the Standard Normal Distribution
# Create the x-axis scores
c <- seq(-4,4, length = 1000)

# Calcualte the density for each score on the x-axis
d <- dnorm(x)

# Plot the Standard Normal Distribution 
plot(c, d, 
     main = "Standard Normal Distriubtion",
     xlab = "z scores",
     ylab = "Density",
     type = "h",
     col = "grey50")
lines(c, d, col = "red")


# Plot the Normal Frequency Distrubtion
# Create a sample of 1000 numbers which are normally distributed
f <- rnorm(1000)

# By default, the rnorm() generate ramdom data with zero mean 
# and standard deviation = 1
mean(f)
sd(f)

# Plot the Normal Frequency Distribution 
hist(f, 
     main = "Normal Distribution",
     xlab = "")


# ---------------------------------------------------------------------#

# Normal Distribution Function
# pnorm() calculates P(X < x) with given mean and standard deviation

# e.g. P(X < 27.4) given X is normal with mean 50 and standard deviation 20
pnorm(27.4, mean = 50, sd = 20)

# Example:
# Suppose widgit weights produced at Acme Widgit Works have 
# weights that are normally distributed with mean 17.46 grams and variance 375.67 grams. 
# What is the probability that a randomly chosen widgit weighs more then 19 grams?
# P(X > 19) = 1 = P(X < 19)
1 - pnorm(19, mean = 17.64, sd = sqrt(375.67))

# qnorm() calculates the inverse c.d.f. of the normal distribution

# e.g. Score x that is at 80 percentile in a normal distribution with mean 10 and sd 1.75
qnorm(0.8, mean = 10, sd = 1.75)

# Example:
# Suppose IQ scores are normally distributed with mean 100 and standard deviation 15. 
# What is the 95th percentile of the distribution of IQ scores?
qnorm(0.95, mean = 100, sd = 15)


# rnorm() simulates random variates having a specific normal distribution
# dnorm() calculates the p.d.f. of the normal distribution (generally used for plotting the p.d.f)
# Generate 1000 i.i.d. normal random numbers with mean 100 and sd 15
x <- rnorm(1000, mean = 100, sd = 15)

# Plot the simulated data on a histogram 
h <- hist(x, color = "grey", xlab = "x scores",
          main = "Historgram with Normal Curve")

# Graphs the p.d.f. of the same normal distribution
xfit <- seq(min(x), max(x), length = 100)
yfit <- dnorm(xfit, mean = mean(x), sd = sd(x))
yfit <- yfit*diff(h$mids[1:2])*length(x)
lines(xfit, yfit, col = "blue", lwd = 2)

#-----------------------------------------------------------------------#


### Binomial Distribution Function

# Plotting the binomial distribution
# Create a sample of 50 which are incremented by 1
x <- seq(0, 50, by = 1)

# Calculate the binomial distribution density with p = 0.5
y <- dbinom(x, 50, 0.5)

# Plot the data
plot(x, y,
     main = "Binomial Distribution with p = 0.5",
     xlab = "Number of Success",
     ylab = "Density",
     type = "h",
     col = "gray50")

# Calculate the binomial distribution density with p = 0.2
y <- dbinom(x, 50, 0.2)

# Plot the data
plot(x, y,
     main = "Binomial Distribution with p = 0.2",
     xlab = "Number of Success",
     ylab = "Density",
     type = "h",
     col = "gray50")

# Calculate the binomial distribution density with p = 0.8
y <- dbinom(x, 50, 0.8)

# Plot the data
plot(x, y,
     main = "Binomial Distribution with p = 0.8",
     xlab = "Number of Success",
     ylab = "Density",
     type = "h",
     col = "gray50")

# Create a binomial frequency distribution histogram
# Create a simulate data with p = 0.5, 10 trials each time, and repeats 10000 times
z <- rbinom(10000, 10, 0.5)

# Plot the binomial frequency distribution with hist()
hist(z,
     main = "Binomial Frequency Distribution",
     xlab = "Number of Success",
     ylab = "Frequency",
     col = "chocolate",
     labels = TRUE)

#---------------------------------------------------------------------#

# Binomial Distribution Functions

# dbinom() calculates the p.d.f. of the binomial distribution

# e.g. P(X =27) when X has Binomial(100, 0.25) distribution
dbinom(27, size = 100, prob = 0.25)

# Example:
# Suppose widgits produced at Acme Widgit Works have probability 0.005 of being defective. 
# Suppose widgits are shipped in cartons containing 25 widgits. 
# What is the probability that a randomly chosen carton contains exactly one defective widgit?
# P(X = 1) given that X has the Binomial(25, 0.005) distribution
dbinom(1, size = 25, prob = 0.005)


# pbinom() calculates the c.d.f. of the binomial distribution.

# e.g. P(X <= 27) when X has Binomial(100, 0.25) distribution
pbinorm(27, size = 100, prob = 0.25)

# Example:
# Suppose widgits produced at Acme Widgit Works have probability 0.005 of being defective. 
# Suppose widgits are shipped in cartons containing 25 widgits. 
# What is the probability that a randomly chosen carton contains no more than one defective widgit?
# P(X <= 1) given X has the Binomial(25, 0.005) distribution
pbinom(1, size = 25, prob = 0.005)


# qbinom() calculates the inverse c.d.f. of hte binomial distribution.

# e.g. Calculate the 10th quantile of the Binomial(10, 0.25) distribution
pbinom(0.1, 10, 0.25)
