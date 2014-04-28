###########################################
# Descriptive statistics on variables
###########################################
library(nortest)
library(ggplot2)
library(gridExtra)
# PPVT
a1 <- ggplot(FACES2006_missing, aes(x=A1PPVT4W))
a1 <- a1 + geom_histogram()
a2 <- ggplot(FACES2006_missing, aes(x=A2PPVT4W))
a2 <- a2 + geom_histogram()
a3 <- ggplot(FACES2006_missing, aes(x=A3PPVT4W))
a3 <- a3 + geom_histogram()
a4 <- ggplot(FACES2006_missing, aes(x=A4PPVT4W))
a4 <- a4 + geom_histogram()
grid.arrange(a1, a2, a3, a4)
# WJ Applied Problem
a1 <- ggplot(FACES2006_missing, aes(x=A1WJAPW))
a1 <- a1 + geom_histogram()
a2 <- ggplot(FACES2006_missing, aes(x=A2WJAPW))
a2 <- a2 + geom_histogram()
a3 <- ggplot(FACES2006_missing, aes(x=A3WJAPW))
a3 <- a3 + geom_histogram()
a4 <- ggplot(FACES2006_missing, aes(x=A4WJAPW))
a4 <- a4 + geom_histogram()
grid.arrange(a1, a2, a3, a4)
# WJ Letter Word Idenitfication
a1 <- ggplot(FACES2006_missing, aes(x=A1WJLWW))
a1 <- a1 + geom_histogram()
a2 <- ggplot(FACES2006_missing, aes(x=A2WJLWW))
a2 <- a2 + geom_histogram()
a3 <- ggplot(FACES2006_missing, aes(x=A3WJLWW))
a3 <- a3 + geom_histogram()
a4 <- ggplot(FACES2006_missing, aes(x=A4WJLWW))
a4 <- a4 + geom_histogram()
grid.arrange(a1, a2, a3, a4)
####################################################
# Tables for assessment
####################################################
library(psych)
library(xtable)
# Select out assessment data
assessments <- subset(FACES2006.subset, 
                      select = c(A1PPVT4W, A2PPVT4W, A3PPVT4W, A4PPVT4W, A1WJAPW, A2WJAPW, A3WJAPW, A4WJAPW, A1WJLWW, A2WJLWW, A3WJLWW, A4WJLWW))
row.names(assessments) <- NULL
assessments.descriptive <- describe(assessments)
print(assessments.descriptive)
#assessments.descriptive<-xtable(describe(assessments)) # For markdown
#print(assessments.descriptive, type="html", floating=FALSE)  # For markdown
# Note. Kurtosis ok (slightly platykurtic-flat); Skewness ok (mostly left skewed)
# Heat map for correlations
library(reshape2)
z <- cor(assessments, method="pearson", use="complete")
z.m <- melt(z)
ggplot(z.m, aes(Var1, Var2, fill = value)) + geom_tile() + 
  scale_fill_gradient2(low = "blue",  high = "yellow") + ggtitle("Heat Map for Assessment Correlations")
# Demographics for child
age <- subset(FACES2006.subset,
              select = c(A1CAGE, A2CAGE, A3CAGE, A4CAGE))
age.descriptive <- describe(age)
print(age.descriptive)
table(FACES2006.subset$CHGENDER)
table(FACES2006.subset$CRACE)
table(FACES2006.subset$PKYEAR)
table(FACES2006.subset$S08_GRADE)
table(FACES2006.subset$KGYEAR)
table(FACES2006.subset$COHORT)
table(FACES2006.subset$P1HHLAN2)
# Demogrpahic Data for Parent(s)
table(FACES2006.subset$P1RCAGE)
table(FACES2006.subset$MRACE) # Mother Race
table(FACES2006.subset$FRACE) # Father Race
table(FACES2006.subset$P1INCOME)  # Household Income
table(FACES2006.subset$P1MOMEMP)  # Mother's Employment Status
table(FACES2006.subset$P1POVRTO)  # Ratio of Income to Poverty
table(FACES2006.subset$P1POVRTY)  # Poverty Status
table(FACES2006.subset$P1NUMSIB)  # Number of siblings in house
table(FACES2006.subset$P1RHHLNG)  # Household Language
table(FACES2006.subset$P1RMARTL)  # Parent Marital Status
table(FACES2006.subset$P1RDADED)  # Father's Highest Level of Education
table(FACES2006.subset$P1RMOMED)  # Mother's Highest Level of Education
table(FACES2006.subset$P1ANYCCR)  # Care before HS
####################################################
# Correlation of predictors 
#################################################### 
plbs.t1 <- subset(FACES2006.subset, 
                  select = c(R1BAGGR, R1BHYPER, R1BWITH, R1BPROB, R1ATTUDE, R1MOTIVE, R1PRSIST, R1TPLBS, A1PPVT4W, A1WJAPW, A1WJLWW))
plbs.t1.descriptive <- describe(plbs.t1)
print(plbs.t1.descriptive)
hist(plbs.t1$R1BAGGR)
hist(plbs.t1$R1BHYPER)
hist(plbs.t1$R1BWITH)
hist(plbs.t1$R1BPROB)
plbs.t2 <- subset(FACES2006.subset, 
                  select = c(R2BAGGR, R2BHYPER, R2BWITH, R2BPROB, R2ATTUDE, R2MOTIVE, R2PRSIST, R2TPLBS, A2PPVT4W, A2WJAPW, A2WJLWW))
plbs.t2.descriptive <- describe(plbs.t2)
print(plbs.t2.descriptive)
hist(plbs.t2$R2BAGGR)
hist(plbs.t2$R2BHYPER)
hist(plbs.t2$R2BWITH)
hist(plbs.t2$R2BPROB)
plbs.t3 <- subset(FACES2006.subset, 
                  select = c(R3BAGGR, R3BHYPER, R3BWITH, R3BPROB, R3ATTUDE, R3MOTIVE, R3PRSIST, R3TPLBS, A3PPVT4W, A3WJAPW, A3WJLWW))
plbs.t3.descriptive <- describe(plbs.t3)
print(plbs.t3.descriptive)
plbs.t4 <- subset(FACES2006.subset, 
                  select = c(KR4BAGGR, KR4BHYPE, KR4BWITH, KR4BPROB, KR4ATUDE, KR4MOTIV, KR4PRSST, KR4TPLBS, A4PPVT4W, A4WJAPW, A4WJLWW))
plbs.t4.descriptive <- describe(plbs.t4)
print(plbs.t4.descriptive)
# Heat PLBS Time 1
z.1 <- cor(plbs.t1, method="pearson", use="complete")
z.m.1 <- melt(z.1)
ggplot(z.m.1, aes(Var1, Var2, fill = value)) + geom_tile() + 
  scale_fill_gradient2(low = "purple",  high = "green") + ggtitle("Heat Map for PLBS Time1 and Dependent Variables Correlations")
# Heat Map PLBS Time 2
z.2 <- cor(plbs.t2, method="pearson", use="complete")
z.m.2 <- melt(z.2)
ggplot(z.m.2, aes(Var1, Var2, fill = value)) + geom_tile() + 
  scale_fill_gradient2(low = "purple",  high = "green") + ggtitle("Heat Map for PLBS Time2 and Dependent Variables Correlations")
# Heat Map PLBS Time 3
z.3 <- cor(plbs.t3, method="pearson", use="complete")
z.m.3 <- melt(z.3)
ggplot(z.m.3, aes(Var1, Var2, fill = value)) + geom_tile() + 
  scale_fill_gradient2(low = "purple",  high = "green") + ggtitle("Heat Map for PLBS Time3 and Dependent Variables Correlations")
# Heat Map PLBS Time 4
z.4 <- cor(plbs.t4, method="pearson", use="complete")
z.m.4 <- melt(z.4)
ggplot(z.m.4, aes(Var1, Var2, fill = value)) + geom_tile() + 
  scale_fill_gradient2(low = "purple",  high = "green") + ggtitle("Heat Map for PLBS Time4 and Dependent Variables Correlations")
######################################
# Testing for multivariate normality
#####################################
# library(energy)
# all.assessments <- subset(FACES2006.subset,
#   select = c(A1PPVT4W, A2PPVT4W, A3PPVT4W, A4PPVT4W, A1WJAPW, A2WJAPW, A3WJAPW, A4WJAPW, A1WJLWW, A2WJLWW, A3WJLWW, A4WJLWW,
# R1ATTUDE, R1BAGGR, R1BHYPER, R1BPROB, R1BWITH, R1MOTIVE, R1PRSIST, R1SSRS, R1TPELS, R1TPLBS,
# R2ATTUDE, R2BAGGR, R2BHYPER, R2BPROB, R2BWITH, R2MOTIVE, R2PRSIST, R2SSRS, R2TPELS, R2TPLBS, 
# R3ATTUDE, R3BAGGR, R3BHYPER, R3BPROB, R3BWITH, R3MOTIVE, R3PRSIST, R3SSRS, R3TPELS, R3TPLBS
# ))
# row.names(all.assessments) <- NULL  # Knocks out the row.names column in viewer 
# # Need to use MissMech because we have missing data.s
# library(MissMech)
# out <- TestMCARNormality(data = all.assessments, alpha = 0.1, imputation.number = 10, imputation.method = "Dist.Free")
# summary(out)
# mcar <- TestMCARNormality(all.assessments, del.lesscases = 6, imputation.number = 1, 
#   method = "Auto", imputation.method = "Dist.Free", nrep = 10000,
#   n.min = 30, seed = 110, alpha = 0.05, imputed.data = NA)
# summary(mcar)
# # Note. Data is not multivariate normal or MCAR.
# # Power analysis turn to Preacher QuantPsych
# for(i in 1:ncol(all.assessments)){
#   print(c(max(all.assessments[,i],na.rm=TRUE), min(all.assessments[,i], na.rm=TRUE)))
# }
all.assessments <- subset(FACES2006.subset,
                          select = c(A1PPVT4W, A2PPVT4W, A3PPVT4W, A4PPVT4W, A1WJAPW, A2WJAPW, A3WJAPW, A4WJAPW, A1WJLWW, A2WJLWW, A3WJLWW, A4WJLWW,
                                     R1ATTUDE, R1BAGGR, R1BHYPER, R1BPROB, R1BWITH, R1MOTIVE, R1PRSIST, R1BPROB, R1TPLBS,
                                     R2ATTUDE, R2BAGGR, R2BHYPER, R2BPROB, R2BWITH, R2MOTIVE, R2PRSIST, R2BPROB, R2TPLBS, 
                                     R3ATTUDE, R3BAGGR, R3BHYPER, R3BPROB, R3BWITH, R3MOTIVE, R3PRSIST, R3BPROB, R3TPLBS,
                                     KR4ATUDE, KR4BAGGR, KR4BHYPE, KR4BPROB, KR4BWITH, KR4MOTIV, KR4PRSST, KR4TPLBS
                          ))
# Testing for normality
shapiro.a <- lapply(all.assessments, shapiro.test)  # run shapiro on whole dataframe
str(shapiro.a[[1]])  # what's in shapiro.2?
shapiro.b <- sapply(shapiro.a, '[', c("statistic", "p.value")) # 
shapiro.b  # looks messy, so transpose for visibility
t.shapiro.b <- t(shapiro.b)  # flipped
# Examining 3d Scatter Plots
# take a random sample of size 50 from a dataset mydata 
# sample without replacement
mysample1 <- FACES2006.subset[sample(1:nrow(FACES2006.subset), 500,
                                     replace=FALSE),]
# 3d scatter plots
library(scatterplot3d)
with(mysample1, {
  scatterplot3d(A1PPVT4W, R1TPLBS, R1BPROB,        # x y and z axis
                highlight.3d=TRUE, pch=19, # filled blue circles
                type="h",             # lines to the horizontal plane
                main="3-D Scatterplot PPVT by PLBS & Problem Behavior for Time 1",
                xlab="PPVT W Score",
                ylab="Total PLBS",
                zlab="Total Problem BeH",
                cex.axis=1)
})
# Time 2
with(mysample1, {
  scatterplot3d(A2PPVT4W, R2TPLBS, R2BPROB,        # x y and z axis
                highlight.3d=TRUE, pch=19, # filled blue circles
                type="h",             # lines to the horizontal plane
                main="3-D Scatterplot PPVT by PLBS & Problem Behavior for Time 2",
                xlab="PPVT W Score",
                ylab="Total PLBS",
                zlab="Total Problem BeH",
                cex.axis=1)
})
# Time 3
with(mysample1, {
  scatterplot3d(A3PPVT4W, R3TPLBS, R3BPROB,        # x y and z axis
                highlight.3d=TRUE, pch=19, # filled blue circles
                type="h",             # lines to the horizontal plane
                main="3-D Scatterplot PPVT by PLBS & Problem Behavior for Time 3",
                xlab="PPVT W Score",
                ylab="Total PLBS",
                zlab="Total Problem BeH",
                cex.axis=1)
})
# Time 4
with(mysample1, {
  scatterplot3d(A4PPVT4W, KR4TPLBS, KR4BPROB,        # x y and z axis
                highlight.3d=TRUE, pch=19, # filled blue circles
                type="h",             # lines to the horizontal plane
                main="3-D Scatterplot PPVT by PLBS & Problem Behavior for Time 4",
                xlab="PPVT W Score",
                ylab="Total PLBS",
                zlab="Total Problem BeH",
                cex.axis=1)
})

library(rgl)
plot3d(FACES2006.subset$A3PPVT4W, FACES2006.subset$R3TPLBS, FACES2006.subset$R3BPROB, col="red", size=3)
library(Rcmdr)
scatter3d(FACES2006.subset$A3PPVT4W, FACES2006.subset$R3TPLBS, FACES2006.subset$R3BPROB)
#-------------------------------
# outlier
# http://www.r-bloggers.com/using-apply-sapply-lapply-in-r/
# http://stackoverflow.com/questions/12866189/calculating-the-outliers-in-r
# created a function to identify outlier
all.assessments <- subset(FACES2006.subset,
                          select = c(A1PPVT4W, A2PPVT4W, A3PPVT4W, A4PPVT4W, A1WJAPW, A2WJAPW, A3WJAPW, A4WJAPW, A1WJLWW, A2WJLWW, A3WJLWW, A4WJLWW,
                                     R1ATTUDE, R1BAGGR, R1BHYPER, R1BPROB, R1BWITH, R1MOTIVE, R1PRSIST, R1SSRS, R1TPELS, R1TPLBS,
                                     R2ATTUDE, R2BAGGR, R2BHYPER, R2BPROB, R2BWITH, R2MOTIVE, R2PRSIST, R2SSRS, R2TPELS, R2TPLBS, 
                                     R3ATTUDE, R3BAGGR, R3BHYPER, R3BPROB, R3BWITH, R3MOTIVE, R3PRSIST, R3SSRS, R3TPELS, R3TPLBS
                          ))
tukey.outlier <- function(x) {
  lowerq = quantile(x, na.rm=TRUE)[2]
  upperq = quantile(x, na.rm=TRUE)[4]
  iqr = upperq - lowerq
  mild.threshold.upper = (iqr * 1.5) + upperq
  mild.threshold.lower = lowerq - (iqr * 1.5)
  extreme.threshold.upper = (iqr * 3) + upperq
  extreme.threshold.lower = lowerq - (iqr * 3)
  return(c(extreme.threshold.upper, extreme.threshold.lower))
}
apply(all.assessments, 2, tukey.outlier)
apply(all.assessments, 2, min, na.rm = TRUE)
apply(all.assessments, 2, max, na.rm = TRUE)


remove_outliers <- function(x, na.rm = TRUE) {
  qnt <- quantile(x, probs=c(.25, .75))
  H <- 1.5 * IQR(x)
  y <- x
  y[x < (qnt[1] - H)] <- NA
  y[x > (qnt[2] + H)] <- NA
  y
}
y1 <- remove_outliers(assessments)

