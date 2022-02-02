# Cleaning up the Workspace
rm(list = ls())
dev.off()
cat("\014")


# Baseline Data
baseline <- read.csv("baseline_sample.csv", header=T)

hist(baseline$y300, breaks=30, main = "Histogram of Camshaft Straightness (y300)",
     xlab = "Straightness", col = "skyblue")
abline(v = c(-10, 10), lty = "dashed", col = "red")

boxplot(baseline$y300~baseline$daycount, main = "Boxplot of Camshaft Straightness by Day",
        xlab = "Day", ylab = "Camshaft Straightness", col = "coral1")

boxplot(baseline$y300~baseline$shift, main = "Boxplot of Camshaft Straightness by Shift",
        xlab = "Shift", ylab = "Camshaft Straightness", col="orchid")
