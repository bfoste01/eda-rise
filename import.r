# Import the raw csv file
#  Note. The path to the final data will need to change once complete
rise <- read.csv("munge.csv", header = TRUE, sep = ",", na.strings = "NA")
