# Because we have data on an Exel file we need this package
install.packages("readxl")

# Setting the working directory
setwd("/Users/Ricky/Documents/UNI/GCE & SDGs/LABORATORY OF PLANT CONSERVATION")

# Recalling the package to read the data
library(readxl)

# Saving the data
lamium <- read_excel("Reproductive strategies Lamium maculatum.xlsx")

summary(lamium)
attach(lamium)

ratio <- Seeds/4

boxplot((ratio[Test == "A"]), (ratio[Test == "SS"]), (ratio[Test == "PS"]), (ratio[Test == "N"]),
+         names=c("Agamospermy", "Spontaneous selfing", "Pollen supplementation", "Natural"),
+         main="Seeds/Tot seeds")
