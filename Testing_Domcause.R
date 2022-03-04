# Cleaning up the Workspace
rm(list = ls())
dev.off()
cat("\014")

# Variation Data y300 and y200
variation <- read.csv("variation_sample.csv", header=T)

plot(variation$y300~variation$y200, main = "y300 and 200",
        col = "black")

summary(lm(variation$y300~variation$y200))

# Variation Data y200 and y100
variation <- read.csv("second_variation_sample.csv", header=T)

plot(variation$y200~variation$y100, main = "y200 and y100",
     col = "black")

summary(lm(variation$y200~variation$y100))