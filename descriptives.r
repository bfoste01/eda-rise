# The following script will execute descriptive statistics on the selected varaibles
#------------------------------------------------------------------------------------
# Select out subsets of interest
#------------------------------------------------------------------------------------
# Lens
library(dplyr) # for easy 
dems <- select(rise, 56:158) # pull out all lens data
# Lens
lens <- select(rise, 56:158) # pull out all lens data
library(psych)
lens.desc <- describe(lens, na.rm = TRUE)
library(pander) # package for creating tables in knitr output
panderOptions('table.split.table', Inf) # option so table does not split
pander(as.data.frame(lens.desc))
numsum(var = LENSFall, group = RISEclas, df = rise)
catsum(var = CGender, group = RISEclas, df = rise)

