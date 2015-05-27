# The following script is for the ANCOVA analyses
#	Data Screening Assumptions: 
# Analysis
library(dplyr)
data.ancova <- select(rise, X, Y, Z)
# boxplot
pre_test = Y1 # set outcomes as a new variable name
post_test = Y2
treatment = RISEcl # set indeendent variable (e.g., treatment)
plot(pre_test ~ treatment, data = rise, main = "Pre-Test Scores Per Treatment")
plot(post_test ~ treatment, data = rise, main = "Post-Test Scores Per Treatment")

# http://www.gmw.rug.nl/~boomsma/apstatdata/ANCOVA_R.pdf
# http://www.clayford.net/statistics/
# http://www.uni-kiel.de/psychologie/rexrepos/posts/ancova.html

# Gelman Approach Regression of the Treatment
#	What would happen to an outcome Y given exposure to the treatment/intervention?
#	Applied: What would have happened to a given child had he/she received or not received the treatment?
#	Bayesian Approach
# https://github.com/stan-dev/example-models/blob/master/ARM/Ch.9/9.4_TreatmentInteractionsAndPoststratification.R
