#############################################
##########  Sampling Distribution  ##########
#############################################

# Student's t Distribution
# Setup the x and y values
mean=0
sd=1
x <- seq(-4,4,length=10000)*sd+mean
y <- dt(x,df=29)

# Plot the t distribution and labels
plot(x, y, type="n", xlab="t statistic score", ylab="Density",
     main="Student's t Distribution (df=29)", axes=FALSE)
lines(x, y)
abline(v=2, col="blue")
abline(v=-2, col="blue")
axis(1, at=seq(-4, 4, 1), pos=0)


# Calculate the t statistic score
# Given the population mean = 23.2, sample mean = 21.8,
# sample standard deviation = 5.8, and sample size = 36
t <- (21.8 - 23.2) / (5.8 / sqrt(36))
t

# Given the population mean = 155.7, sample mean = 160.6,
# sample standard deviation = 14.8, and sample size = 68
t <- (160.6 - 155.7) / (14.8 / sqrt(68))
t

# Suppose we want to calculate the sample mean that is at location
# t = 2.5 given the population mean = 55, sample standard deviation = 8.2,
# and sample size = 40
m <- 2.5 * (8.2 / sqrt(40)) + 55
m

# Calculate the probability of t distribution
# Given the population mean = 23.2, sample mean = 21.8,
# sample standard deviation = 5.8, and sample size = 36,
# What is the probability that we randomly select a 36 samples with mean <= 21.8?
# Step 1: Calculate the t statistic
t <- (21.8 - 23.2) / (5.8 / sqrt(36))
t
# Step 2: Calculate the p value (left tail)
pt(t, df=(36-1))


# Given the population mean = 155.7, sample mean = 160.6,
# sample standard deviation = 14.8, and sample size = 68,
# What is the probability randomly select 68 sample with mean >= 169.6
# Step 1: Calculate the t statistic
t <- (160.6 - 155.7) / (14.8 / sqrt(68))
t
# Step 2: Calculate the p value (right tail)
1 - pt(t, df=(68-1))

# What is the probability randomly select 68 sample with mean between 150 to 160?
# Step 1: Calculate the t statistics
upt <- (160 - 155.7) / (14.8 / sqrt(68))
lowt <- (150 - 155.7) / (14.8 / sqrt(68))

# Step 2: Calculate the p value between the two locations
up <- pt(upt, df=67)
low <- pt(lowt, df=67)
up - low


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
pm <- mean(h)

# Draw 30 random samples from the Height data
h.sample <- sample(h, 30)
sm <- mean(h.sample)

# Perform a two tails t test on the random samples
result <- t.test(h.sample, mu = pm)
result

# Plot the result
ggttest(result)

# Perform an one tail test on the random samples
result <- t.test(h.sample, mu=avg, alternative="greater", conf.level=0.95)
result

# Plot the result
ggttest(result)

