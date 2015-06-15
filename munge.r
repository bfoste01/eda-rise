#-----------------------------------------------------------------------------------------------
# Setting up the variable types
#-----------------------------------------------------------------------------------------------
rise <- lowerCN2(rise)
#colnames(rise) # check variables and see the column number for each variable
#str(rise) # examine variable types for errors (there ar many)
# trying to keep code DRY with the 'apply' family of functions
factors <- c(2:4, 13, 15, 18, 21, 22) # these are references to column numbers
rise[,factors] <- data.frame(apply(rise[factors], 2, as.factor)) # stream-line and use apply family functions instead of for loops
numeric <- c(5:12, 16, 17, 19, 20 ) # direct calls to column number vs. name
rise[,numeric] <- data.frame(apply(rise[numeric], 2, as.numeric))
#str(rise) # check again and make sure everything looks correct
# recode missing
# Value labels
colnames(rise)
