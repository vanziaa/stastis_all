library(irr)
library(ggplot2)

gage <- read_excel("C:/Users/=/Desktop/gpt/age1.xlsx")
gsex <- read_excel("C:/Users/=/Desktop/gpt/sex1.xlsx")

kappa_result <- kappam.fleiss(gsex)
print(kappa_result$value)

icc_result <- icc(gage[,1:4], model = "oneway", type = "agreement",unit = "single")
print(icc_result$value)


gage2 <- read_excel("C:/Users/=/Desktop/gpt/age2.xlsx")
gsex2 <- read_excel("C:/Users/=/Desktop/gpt/sex2.xlsx")


kappa_result <- kappam.fleiss(gsex2)
print(kappa_result$value)

icc_result <- icc(gage2[,1:4], model = "oneway", type = "agreement",unit = "single")
print(icc_result$value)

gage$Average <- rowMeans(gage[, c("m1", "m2", "m3")])
gage$mean <- rowMeans(gage[, c("standard", "Average")])
gage$Difference <- gage$Average - gage$standard
blandr.output.text(gage$standard, gage$Average, sig.level = 0.95)




