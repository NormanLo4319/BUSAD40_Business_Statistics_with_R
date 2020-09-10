############################################
##########   Hypothesis Testing   ##########
############################################

# Hypothesis Testing

# Simulate a population data for sales of a company.
sales <- rnorm(1000, mean = 1250, sd = 158)
sample.sales <- sample(sales, 100)

# Null Hypothesis: Sample Mean = Population Mean
# Alternative Hypothesis: Sample mean not equal population mean
# Alpha: 0.05

# Calculate the mean and sd for the population and sample
salesMean <- mean(sales)
sample.salesMean <- mean(sample.sales)
sample.salessd <- sd(sample.sales)
n <- length(sample.sales)

# What is the probability that the sample mean differs from the population mean

# Step 1: Calculate the t statistic
t <- (sample.salesMean - salesMean) / (sample.salessd / sqrt(n))

# Step 2: Calculate the p value
p <- 2 * (1 - pt(t, df=(n-1)))
p

# Conclusion: At 5% significant level, we failed to reject the null hypothesis,
# so the sample mean is not statisticall significantly differs to the population mean

# Alternative Solution: t.test() function
t.test(sample.sales, mu = salesMean)


# Create Inference Graph
# Import the library MASS
# install.packages("MASS")
library(MASS)
# install.packages("gginference")
library(gginference)

# Calculate the mean of Height from the survey data set
h <- na.omit(survey$Height)
mu <- mean(h)

# Draw 30 random samples from the Height data
h.sample <- sample(h, 30)
sm <- mean(h.sample)

# Perform a two tails t test on the random samples
result <- t.test(h.sample, mu = mu)
result

# Plot the result
ggttest(result)

# Perform an one tail test on the random samples
result <- t.test(h.sample, mu = mu, alternative = "greater", conf.level = 0.95)
result

# Plot the result
ggttest(result)