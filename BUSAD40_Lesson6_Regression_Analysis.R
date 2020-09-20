#############################################
##########   Regression Analysis   ##########
#############################################

### Simple Linear Regression

# Import dependencies
library(readr)
library(scatterplot3d)

# Loading the Advertising Data Set
advertise <- read_csv("data/advertising.csv")
head(advertise)

# Descriptive summary of the data set
summary(advertise)

# Pairs Plot
pairs(advertise)

# Plot the TV, radio, and newspaper against sales
par(mfrow=c(1,3))
plot(advertise$sales, advertise$TV, 
     main="Scatterplot of Sales vs. TV")
plot(advertise$sales, advertise$radio, 
     main="Scatterplot of Sales vs. Radio")
plot(advertise$sales, advertise$newspaper, 
     main="Scatterplot of Sales vs. Newspaper")

# Check the correlation between the three advertising expenditures with sales
cor(advertise$sales, advertise$TV)
cor(advertise$sales, advertise$radio)
cor(advertise$sales, advertise$newspaper)

# Fitting the simple linear regression model
fit1 <- lm(sales ~ TV, data = advertise)

# Print the model summary
summary(fit1)


# Extracting the estimated parameters from the regress model
intercept <- coef(fit1)[1]
slope <- coef(fit1)[2]
print(paste("Intercept is", round(intercept, digits = 3), 
            "and slope is", round(slope, digits = 3), "."))

# Extract the R square statistic from the summary table
r2 <- summary(fit1)$r.squared
print(paste("The R square of the model is ", r2))

# Creating a 95% confidence interval for the slope parameter
confint(fit1, level = 0.95)

# Find the range of TV budget spending in the data
range(advertise$TV)

# Calculate the predicted sales based on $200 spending on TV advertising
predSale <- intercept + slope * 200
print(paste("The predicted sales when spending $200 on TV advertisment is ", predSale))

# Using the predict.lm() function to predict the sales based on the given TV budget
predict.lm(fit1, newdata = data.frame(TV = 200))

# Make prediction for multiple TV budget values 
predict.lm(fit1, newdata = data.frame(TV = c(100, 150)))

# Combining the predictions and the given TV budget values
a <- data.frame(TV = c(80, 120, 160))
pred <- predict.lm(fit1, newdata = a)
cbind(a, pred)

# Create 95% confidence intervals for the prediction
predict.lm(fit1, newdata = data.frame(TV = 200), 
           interval = "confidence", level = 0.95)

# Create 99% confidence intervals for the prediction
predict.lm(fit1, newdata = data.frame(TV = 200), 
           interval = "prediction", level = 0.99)

# Plot the regression line with the data
par(mfrow=c(1,1))
plot(advertise$TV, advertise$sales,
     main = "TV Advertising Budget vs. Sales",
     xlab = "TV Advertising Budget Spending ($)",
     ylab = "Total Sales ($)",
     pch = 19,
     col = "blue") + 
  abline(fit1, lwd=3, col="orange", lty = 2)

# Divides the plotting region into a 2x2 grid of panels.
par(mfrow=c(2,2))

# Plot the residual fitted plots
plot(fit1)


### Multiple Linear Regression 

# Fitting the multiple regression model
fit2 <- lm(sales ~ TV + radio, data = advertise)

# Print the model summary 
summary(fit2)

# Plotting the data into a 3D graph
par(mfrow=c(1,1))
plot3d <- scatterplot3d(advertise$TV, advertise$radio, advertise$sales,
                        angle = 55, scale.y = 0.7, pch = 16, color = "red", 
                        main = "Regression Plane")

# Create the regression hyperplane on the graph
plot3d$plane3d(fit2, lty.box = "solid")

# Make a prediction of sales with 99% confidence intervals based on our fitted model.
sales_hat <- predict(fit2, interval = "confidence", level = 0.99)

# Print the first 3 predicted sales based on TV and Radio
head(sales_hat, 3)
