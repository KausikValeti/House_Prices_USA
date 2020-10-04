# Group 8 - Sarah Hayes, Sean Lei, Kausik Valeti
# STAT 515 - Applied Statistics and Visualization for Analytics
# Redesign Project - The Most (and Least) Valuable States in America

# Import required packages
library(micromapST)

# Read in dataset
dataset = read.csv(
  file="value of states.csv",
  header=T, as.is=TRUE)
colnames(dataset) = c("State", "Value per acre ($)", "Total value ($ bln)", "Total acres (mln)", "GDP per capita ($)", "Median home value ($)")
head(dataset)

# Panel description for linked micromap
panelDesc = data.frame(
  type=c('maptail','id','bar','bar'),
  lab1=c(NA,NA,'Median Housing Price ($)','Value Per Acre ($)'),
  lab2=c(NA,NA,' ',' '),
  col1=c(NA,NA,'Median home value ($)','Value per acre ($)')
  )

# Create linked micromap
fName = "homeValues.pdf"
pdf(file=fName,width=7.5,height=10)
micromapST(dataset, panelDesc,
           rowNamesCol='State',
           rowNames='full',
           plotNames='full',
           sortVar='Median home value ($)',
           ascend=FALSE,
           title=c("Median Housing Prices and Land Valuations Across the U.S. in 2015"),
           ignoreNoMatches=TRUE,
           axisScale="sn",
           #staggerLab = TRUE
)

dev.off()