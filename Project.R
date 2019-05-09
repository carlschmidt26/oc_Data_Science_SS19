# set working directory:
setwd("C:/Users/Carl/Desktop/Master/Data Science/")

# import red_biom:
#library(git2r)
#library(githubinstall)
#githubinstall("joey711/biomformat")

library(biomformat)
library(ggplot2)

data <- read_biom("./BIOM/441_otu_table.biom")
otu_table <- as.data.frame(as.matrix(biom_data(data)))
taxonomy <- observation_metadata(data)

for (i in c(1:1359)) {
 cols[i] <- data$columns[[i]]$id
  }
