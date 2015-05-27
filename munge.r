#-----------------------------------------------------------------------------------------------
# Setting up the variable types
#-----------------------------------------------------------------------------------------------
colnames(rise) # check variables and see the column number for each variable
str(rise) # examine variable types for errors (there ar many)
# trying to keep code DRY with the 'apply' family of functions
factors <- c(2:3, 12, 14:15, 16) # these are references to column numbers
rise[,factors] <- data.frame(apply(rise[factors], 2, as.factor)) # stream-line and use apply family functions instead of for loops
numeric <- c(4:11, 16, 18:19, 50:232) # direct calls to column number vs. name
rise[,numeric] <- data.frame(apply(rise[numeric], 2, as.numeric))
str(rise) # check again and make sure everything looks correct

