#############################################
##########  Sampling Distribution  ##########
#############################################

# Student's t Distribution
# Setup the x and y values
mean = 0
sd = 1
x <- seq(-4, 4, length = 10000) * sd + mean
y <- dt(x, df = 29)

# Plot the t distribution and labels
plot(x, y, type = "n", xlab = "t statistic score", ylab = "Density",
     main = "Student's t Distribution (df=29)", axes = FALSE)
lines(x, y)
abline(v = 2, col = "blue")
abline(v = -2, col = "blue")
axis(1, at = seq(-4, 4, 1), pos = 0)

#-------------------------------------------------------------------------#

# Calculate the Student's t Statistic:

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

#------------------------------------------------------------------------#

# Student's t Distribution Function:

# pt() function returns P(X < x) with given t statistic and sample size

# Calculate the probability of t distribution
# Given the population mean = 23.2, sample mean = 21.8,
# sample standard deviation = 5.8, and sample size = 36,
# What is the probability that we randomly select a 36 samples with mean <= 21.8?
# Step 1: Calculate the t statistic
t <- (21.8 - 23.2) / (5.8 / sqrt(36))
t
# Step 2: Calculate the p value (left tail)
pt(t, df = (36 - 1))


# Given the population mean = 155.7, sample mean = 160.6,
# sample standard deviation = 14.8, and sample size = 68,
# What is the probability randomly select 68 sample with mean >= 169.6
# Step 1: Calculate the t statistic
t <- (160.6 - 155.7) / (14.8 / sqrt(68))
t
# Step 2: Calculate the p value (right tail)
1 - pt(t, df = (68 - 1))


# What is the probability randomly select 68 sample with mean between 150 to 160?
# Step 1: Calculate the t statistics
upt <- (160 - 155.7) / (14.8 / sqrt(68))
lowt <- (150 - 155.7) / (14.8 / sqrt(68))

# Step 2: Calculate the p value between the two locations
up <- pt(upt, df = 67)
low <- pt(lowt, df = 67)
up - low


# qt() returns the inverse c.d.f. of the student t distribution
# Find the t-score of the 95th quantile of the student t distribution with df = 20
qt(0.95, df = 20, lower.tail = TRUE)

# Find the t-score of the 99th quantile of the student t distriubtion with df = 60
qt(0.99, df = 100, lower.tail = TRUE)

# Find the 95% confident intervals of the student t distribution with df = 45
qt(0.975, df = 45, lower.tail = TRUE)
qt(0.975, df = 45, lower.tail = FALSE)


# rt() function generates a vector of random variables that follow a student t distribution
# Generate a vector of 1000 random variables that follow t distribution with df = 40
narrow <- rt(1000, df = 40)

# Generate a vector of 1000 random variables that follow t distribution with df = 5
wide <- rt(1000, df = 5)

# Plot the two simulated data sets
par(mfrow = c(1, 2))
hist(narrow, breaks = 50, xlim = c(-6, 4), main = "t Distriubtion, df = 40")
hist(wide, breaks = 50, xlim = c(-6, 4), main = "t Distriubtion, df = 5")

# dt() function return the value of the probability density function (p.d.f.) of the student t distribution
# Find the value of the student t distribution pdf at t = 0 with 20 degrees of freedom
dt(0, df = 20)
