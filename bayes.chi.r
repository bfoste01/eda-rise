
addmargins(gender) # for freq table
bayes.fisher <- function(y1, n1, y2, n2) {
  # SIMULATION
  I = 10000 # simulations
  theta1 = rbeta(I, y1+1, (n1-y1)+1)  
  theta2 = rbeta(I, y2+1, (n2-y2)+1)
  diff = theta1-theta2  # simulated diffs
  
  # OUTPUT
  quantiles = quantile(diff,c(0.005,0.025,0.5,0.975,0.995))
  print(quantiles,digits=2)
  
  print("Probability % y1 than y2:")
  print(mean(theta1>theta2))
  
  print("Unbiased Bayes Estimate of Mean Difference between y1 and y2:")
  print(mean(theta1-theta2))
}
  
  # VISUALIZATION
  #png(file="bayesContingency.png")
       plot(density(diff),
       xlab="theta1 - theta2",
       ylab="p(theta1 - theta2 | y, n)",
       #main="Posterior Simulation of Male - Female Lefties",
       ylim=c(0,8),
       frame.plot=FALSE,cex.lab=1.5,lwd=3,yaxt="no")
  abline(v=quantiles[2], col="blue")
  abline(v=quantiles[4], col="blue")
  #dev.off()


boys<-bayes.fisher(y1 = 55, n1 = 107, y2 = 75, n2 = 135)
girls<-bayes.fisher(y1 = 50, n1 = 107, y2 = 58, n2 = 135)

library(BayesFactorPCL)