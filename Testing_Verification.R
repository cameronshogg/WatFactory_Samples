# Cleaning up the Workspace
rm(list = ls())
dev.off()
cat("\014")

# Pulling In Data from the Verification Experiment
variation <- read.csv("verification.csv", header=T)

plot(variation$y300~variation$x1, main = "Plot of Straightness by x1",
        xlab = "x1", ylab = "Camshaft Straightness", col = "coral1")