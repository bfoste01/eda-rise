numeric <- c("NumAdult", "NumChild", "SSaysFall", "AShowFall", "PLTotalFall", "SSaysSp", "AShowSp",
             "AgeFallYPL", "CAgeFallLENS",  "CAgeFallYLENS",  "CAgeSpPL",  "CAgeSpYPL", "CAgeSpLENS",	
             "CAgeSpYLENS", "PLTotalSp", "LENSFall", "LENSSp", "LENSdiff", "LTLSF_1", "LTLSF_2", "LTLSF_3", "LTLSF_4", 
             "LTLSF_5", "LTLSF_6", "LTLSF_7", "LTLSF_8", "LTLSF_9", "LTLSF_10", "LTLSF_11", "LTLSF_22",	
             "LTLSF_23", "LTLSF_24", "LTLSF_25", "LTLSF_26", "LTLSF_27", "LTLSF_28",	"LTLSF_29",	"LTLSF_30",	
             "LTLSF_31", "LTLSF_12", "LTLSF_13", "LTLSF_14", "LTLSSF_15", "LTLSSF_16", "LTLSF_17", "LTLSF_18",	
             "LTLSF_19", "LTLSF_20", "LTLSF_21", "LTLSF_32", "LTLSF_33", "LTLSF_34",	"LTLSF_35",	"LTLSF_36",	
             "LTLSF_37", "LTLSF_38", "LTLSF_39", "LTLSF_40", "LTLSF_41", "LTLSF_42")
factors <- c("CCEmp", "CCEmpHr", "CCHPpl", "CCLang",  "CCLangO", "CCRace", "CCRaceO", 
             "CCReg", "CDOB", "CGender", "ColNum", "EBEmp", "EBEmp1", "EBEng", "EBEngProf", 
             "EBEthn", "EBFam", "EBFamO", "EBLang", "EBLangO", "EBO",  "EBOIf", "EBOProf", 
             "EBRace", "EBRaceO", "EBSp")
"AgeFallYPL", "CAgeFallLENS",  "CAgeFallYLENS",  "CAgeSpPL",	"CAgeSpYPL", "CAgeSpLENS",	"CAgeSpYLENS"


tabdt(rise$PEduc)


fnl2 <- iris %>%
  group_by(Species, Petal.Width) %>%
  summarize(n=n(),mn=mean(Sepal.Length),sd=sd(Sepal.Length)) %>%
  mutate(se=sd/sqrt(n),LCI=mn+qnorm(0.025)*se,UCI=mn+qnorm(0.975)*se)
fnl2

library(dplyr)
library(ggplot2)
iris %>%
  group_by(Species) %>%
  summarize(meanSepLength=mean(Sepal.Length)) %>%
  ggplot(aes(Species, meanSepLength)) + geom_bar(stat="identity")


  not.uniq.per.group <- function(df, grp.var, uniq.var) {
    df %>%
        group_by_(grp.var) %>%
        summarise_( n_uniq=interp(~n_distinct(v), v=as.name(uniq.var)) ) %>%
        filter(n_uniq > 1)
}

not.uniq.per.group(iris, "Sepal.Length", "Sepal.Width")

iris %>%
  head(10)


fnl2 <- iris %>%
  group_by(Species, Petal.Width) %>%
  summarize(n=n(),mn=mean(Sepal.Length),sd=sd(Sepal.Length)) %>%
  mutate(se=sd/sqrt(n),LCI=mn+qnorm(0.025)*se,UCI=mn+qnorm(0.975)*se) %>%
  ggplot(iris, aes(factor(Species), Sepal.Length)) + geom_boxplot
fnl2

# Works
p <- ggplot(iris, aes(factor(Species), Sepal.Length))
p + geom_boxplot()



testplot <- function(df, var, condition) {
      .e <- environment
      ggplot(df,
      aes(condition, var), environment = .e) + geom_boxplot()
}
t <- testplot(iris, "Sepal.Length", "Species")
t

plotfun2 <- function(number) {
  .e <- environment()
  ggplot(data = testdata, aes(x = factor(group, levels = c(0:number)), y = value), environment = localenv ) + 
    geom_boxplot(color = 'red') 
}


p <- ggplot(mtcars, aes(factor(cyl), mpg))

# getting there
testplot <- function(df, var = "variable", group = "group") {
  p <- ggplot(df, aes_string(factor(group), var)) 
  p + geom_boxplot()
}


qplot(factor(RISEclas), LENSFall, data = rise, geom = "boxplot",
      colour = I("#3366FF"))

qplot(factor(RISEclas), LENSFall, data = rise, geom = "boxplot",
      colour = I("#3366FF"))
library(psych)
describe(rise$LENSFall)
describeBy(rise$LENSFall, rise$RISEclas)
t.test(rise$LENSFall~rise$RISEclas)

numsum <- function(var, group, df) {
  with(df, var, group)
  z1 <- describe(var)
  z2 <- describeBy(var, group)
  z3 <- t.test(var~group)
  return(data.frame(z1))
}
numsum(var = LENSFall, group = RISEclas, df = rise)
data.frame(test)

x  <- with(theta, c(one, two, three))

catsum <- function(var, group, df) {
  with(df, var, group)
  z1 <- summary(var)
  z2 <- prop.table(z1)
  z3 <- chisq.test(var, group)
  final <- list(z1, z2, z3)
  return(final)
}
catsum(var = CGender, group = RISEclas, df = rise)
test<-summary(rise$RISEclas)
prop.table(test)
chisq.test(rise$CGender, rise$RISEclas)

a <- c(1,4,5,6,7,9)
b <- c(0,1,0,1,0,1)
b <- factor(b, levels = c(0:1), labels = c("Control", "Treatment"))
df <- rbind(a,b)
