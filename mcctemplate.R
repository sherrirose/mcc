library(tmle)
load("mcc.rdata") #this data is not available as it is proprietary
j<-1;colnames(mcc)[j]<-"A" #identifies the first column as the A variable in this template
Xdat<-subset(mcc, select= -c(totexp,A))
set.seed(45)
SL.library <- c("SL.glm", "SL.glmnet", "SL.nnet")
ate<-tmle(mcc$totexp, mcc[,j], Xdat, Q.SL.library=SL.library, g.SL.library=SL.library)
results<-cbind(ate$estimates$ATE$psi,ate$estimates$ATE$var.psi,ate$estimates$ATE$pvalue)

