# Because we have data on an Exel file we need this package
install.packages("readxl")
# And the other we need
install.packages("multcomp")
install.packages("emmeans")

# Setting the working directory
setwd("/Users/Ricky/Documents/UNI/GCE & SDGs/LABORATORY OF PLANT CONSERVATION")

# Recalling the package to read the data
library(readxl)


# Saving the data
lamium <- read_excel("Reproductive strategies Lamium maculatum.xlsx")

summary(lamium)
attach(lamium)

# Now we plot everithing
ratio <- Seeds/4

boxplot((ratio[Test == "A"]), (ratio[Test == "SS"]), (ratio[Test == "PS"]), (ratio[Test == "N"]), +
names=c("Agamospermy", "Spontaneous selfing", "Pollen supplementation", "Natural"), main="Seeds/Tot seeds")


require(multcomp)


model1 <- glm(cbind(Seeds, Abortive_ovules) ~ Test, family = binomial, data = lamium)
summary(model1)

ods <- model1$deviance/model1$df.residual
ods    

# If ods > 1 than the model is overdispersed and we need to adjust it applying the family "quasibinomial"

model2 <- glm(cbind(Seeds, Abortive_ovules) ~ Test, family = quasibinomial, data = lamium)
summary(model2)

# If the model reports some significant result you than want to know where these differences are (between which pairs),
# so you apply a post hoc test

library(emmeans)
pairs(emmeans(model2, ~ Test)) 
# Use model1 or model2 according to the result of the ods
