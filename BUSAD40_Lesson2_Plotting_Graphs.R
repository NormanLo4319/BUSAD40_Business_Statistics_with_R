############################################
##########  Plotting Graphs in R  ##########
############################################

# Introduction to Plotting Graph in R

# Identify your current working directory
getwd()

# Setting the working directory for your project or work
setwd("Enter your working directory here!")

# Example to demonstrates teh base R plotting function
Fibonacci <- c(1, 1, 2, 3, 5, 8, 13)

# Plotting the vector, with its index
plot(Fibonacci)

# Customizing the titel and axis labels
plot(Fibonacci,                                # the data to plot
     main = "Plotting the Fibonacci Sequence", # the titel
     sub = "First 7 Fibonacci Numbers",        # the sub-title   
     xlab = "Index of the Sequence",           # x-axis label
     ylab = "Fibonacci Number")                # y-axis label

# Different types of graph
plot(Fibonacci, type = "o")  # draw the line oer the top of the points
plot(Fibonacci, type = "b")  # draw both poinnts and lines, but don't overplot
plot(Fibonacci, type = "h")  # draw histogram-like vertical bars
plot(Fibonacci, type = "s")  # draw a staircase, going horizontally then vertically
plot(Fibonacci, type = "S")  # draw a Staircase, going vertically then horizontally
plot(Fibonacci, type = "c")  # draw only the connecting lines from the "b" version
plot(Fibonacci, type = "n")  # draw nothing

# Change other features of a plot
plot(Fibonacci,      # the data set
     type = "b",     # plot both poins and lines
     col = "blue",   # change the plot color to blue
     pch = 19,       # plotting character is a solid circle
     cex = 5,        # plot it at 5x the usual size
     lty = 2,        # change line type to dashed
     lwd = 4)        # change line width to 4x the usual

## Histogram
# Loading the Australian Football League (AFL) data set
load("data/aflsmall.Rdata")

# Plotting the historgram 
hist(afl.margins,
     main = "Auto Breaks")

hist(afl.margins, breaks = 3,
     main = "With 3 Breaks")

hist(afl.margins, breaks = 0:116,
     main = "Define Vector for Placement")

hist(afl.margins,               # the data set
     main = "2010 AFL Margins", # title of the histogram
     xlab = "Margin",           # x-axis label
     density = 10,              # shading lines: 10 per inch
     angle = 40,                # set the angle of the shading lines is 40 degree
     border = "gray20",         # set the color of the borders of the bars
     col = "gray80",            # set the color of the shading lines
     labels = TRUE,             # add frequency labels to each bar
     ylim = c(0, 40))           # change the scale of the y-axis


## Boxplot 
# Take a look of the margins data set
summary(afl.margins)

# Plot the basic boxplot for the margins data set
boxplot(afl.margins)

# Change the plot features
boxplot(afl.margins,              # the data set
        xlab = "AFL Games, 2010", # x-axis label
        ylab = "Winning Margin",  # y-axis label
        border = "grey50",        # dim the border of the box
        frame.plot = FALSE,       # don't draw a frame
        staplewex = 0,            # don't draw staples
        whisklty = 1)             # solid line for wisker

# Boxplots by Categories
# Load the aflsmall2 data set
load("data/aflsmall2.Rdata")
who(TRUE)

# print the head of the data set
head(afl2)

# Plot the margin data across different years
boxplot(margin ~ year,
        data = afl2)

# Change the features of the plot
boxplot(margin ~ year,
        data = afl2,
        xlab = "AFL Season",      # x-axis label
        ylab = "Winning Margin",  # y-axis label
        frame.plot = FALSE,       # don't draw a frame
        Staplewex = 0,            # don't draw staples
        staplecol = "White",      # fixes a tiny display issue
        boxwex = 0.75,            # narrow the boxes slightly
        boxfill = "grey80",       # lightly shade the boxes
        whisklty = 1,             # solid line for whiskers
        whiskcol = "grey70",      # dim the whiskers
        boxcol = "grey70",        # dim the box borders
        outcol = "grey70",        # dim the outliers
        outpch = 20,              # outliers as solid dots
        outcex = 0.5,             # shrink the outliers
        medlty = "blank",         # no line for the medians
        medpch = 20,              # instead, draw solid dots
        sedlwd = 1.5)             # make them larger     


## Scatterplots
# Load the parenthood data set
load("data/parenthood.Rdata")
who()

# Print the head of the data
head(parenthood)

# Plot dan.sleep against dan.grump
plot(x = parenthood$dan.sleep,
     y = parenthood$dan.grump)

# Plot without explicitly calling the parameters
plot(parenthood$dan.sleep,
     parenthood$dan.grump)

# Changing the features of the plot
plot(parenthood$dan.sleep, parenthood$dan.grump,
     xlab = "My Sleep (hours)",         # x-axis label
     ylab = "My Grumpiness (0 - 100)",  # y-axis label
     xlim = c(0,12),                    # scale the x-axis
     ylim = c(0,100),                   # scale the y-axis
     pch = 20,                          # change the plot type
     col = "gray50",                    # dim the dots slightly
     frame.plot = FALSE)                # don't draw a box

# An alternative for scatterplot is to use the scatterplot() function in the "car" package
# load the car package
library(car)

# Plot the data with scatterplot() function
scatterplot(dan.grump ~ dan.sleep, data = parenthood, smooth = FALSE)

# Scatterplot Matrix (Pair Plots)
# Display the correlations matrix of the data
cor(parenthood)

# Create a scatterplot matrix by using the pairs() function
pairs(parenthood)


# Bar Graphs
# Load the afl data set
load("data/aflsmall.Rdata.")

# Create a simple numeric vector for finalists frequence
freq <- tabulate(afl.finalists)
print(freq)

# Create a new vector for all teams
teams <- levels(afl.finalists)
print(teams)

# Create a bar graph displays final frequency of each team
barplot(freq)

# Plot the bar graph with team names
barplot(freq, names.arg= teams)

# Change the graph features
barplot(freq,
        names.arg = teams,
        las= 2,                                    # rotate the label
        ylab = "Number of Finals",                 # y-axis label
        main = "Finals Played by Team, 1987-2010", # figure title
        density = 10,                              # shade the bars
        angle = 20)                                # shading lines angle

