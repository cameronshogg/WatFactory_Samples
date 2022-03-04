# Cleaning up the Workspace
rm(list = ls())
dev.off()
cat("\014")

# Pulling In Data from the Assembly CSV
variation <- read.csv("Assembly_Test.csv", header=T)

main_model = lm(variation$y100 ~ variation$x16+variation$x17+variation$x19+
                variation$x20+variation$x21+variation$x22+variation$x23)

summary(main_model)

library(stats)

# Sigma is useful for extracting the RSD from the lm() summary. It is incorrectly identified in the summary as Residual
# Standard Error, but this value is correct for an RSD value

sigma(main_model, use.fallback = TRUE)

# RSD of over 4, with 5 as our baseline SD, so we do not have that much reduction of variation
# RSD basically tells us we have the wrong inputs here, so we can move on to testing x1 - x15 (components)

# Pulling in Data from the Components instead
variation <- read.csv("Components_Test.csv", header=T)

main_model = lm(variation$y100 ~ variation$x1+variation$x2+variation$x3+variation$x4+variation$x5+
                  variation$x6+variation$x7+variation$x8+variation$x9+variation$x10+
                  variation$x11+variation$x12+variation$x13+variation$x14+variation$x15)

summary(main_model)

# Now we see an RSD of 1.764, we have the dom cause of variation here 

# We can do some dumb manual search strategy now 

# Run a second main_model 

main_model = lm(variation$y100 ~ variation$x1+variation$x2+variation$x3+variation$x4+variation$x5+
                  variation$x6+variation$x7+variation$x8)

summary(main_model)

# We found it in 1-8

main_model = lm(variation$y100 ~ variation$x1+variation$x2+variation$x3+variation$x4)

summary(main_model)

# it's in 1-4. Let's just stop here and make some graphs in order to see what's up

# Plotting x1 against y100
plot(variation$y100~variation$x1, main = "y100 and x1",
     col = "black")

# Plotting x2 against y100
plot(variation$y100~variation$x2, main = "y100 and x2",
     col = "black")

# Plotting x3 against y100
plot(variation$y100~variation$x3, main = "y100 and x3",
     col = "black")

# Plotting x4 against y100
plot(variation$y100~variation$x4, main = "y100 and x4",
     col = "black")

#From the plots its clear that x1 is the dominant cause of variation

x1_model = lm(variation$y100 ~ variation$x1)
summary(x1_model)


