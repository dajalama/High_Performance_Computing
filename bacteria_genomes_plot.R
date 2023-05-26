install.packages("ggplot2")

setwd("~/LRZ Sync+Share/HPC")

# Load necessary libraries
library(ggplot2)
library(readr)

data <- read.csv("daja.csv", sep = "\t", header = F) # F?
colnames(data) <- c("id", "gene_count", "length", "ratio")

# Save in a pdf file
## pdf("plots/bacteria", width = 5, heigth = 5)
## ...
## dev.off()

ggplot(data, aes(x = length, y = gene_count, color = ratio)) +
  geom_point() +
  scale_color_gradient(low = "blue", high = "red") +
  labs(title = "Scatter plot: Genome Length vs Gene Count",
       x = "Genome Length",
       y = "Gene Count",
       color = "GC/AT Ratio")
