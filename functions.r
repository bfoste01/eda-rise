# the following script contains any functions made critical for stream lining the analytic process
#   Note. This script needs to be run before any other scripts. 
tab2 = function(x, useNA =FALSE) {
  if(!useNA) if(any(is.na(x))) x = na.omit(x)
  n = length(x)
  out = data.frame(x,1) %>%
    group_by(x) %>%
    dplyr::summarise(
      Freq    = length(X1),
      Percent = Freq/n
    ) %>%
    dplyr::arrange(x)
  ids = as.character(out$x)
  ids[is.na(ids)] = '<NA>'
  out = select(out, Freq, Percent)
  out$cum = cumsum(out$Percent)
  class(out)="data.frame"
  out = rbind(out,c(n,1,NA))
  rownames(out) = c(ids,'')
  out
}