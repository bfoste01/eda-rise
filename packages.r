wants <- c("gdata", "dplyr", "lme4", "ggplot2", "sjPlot", "pander","rstan")
has   <- wants %in% rownames(installed.packages())
if(any(!has)) install.packages(wants[!has])
