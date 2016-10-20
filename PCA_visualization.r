### PCA output visualization ###
### Zhongyun ###
### PCA performed with smartPCA in eigensoft
### Save input matrix with the name PCAplot


library("car")
sp(PCAplot$PCA2~PCAplot$PCA1|PCAplot$poporigin,smooth=F,reg.line=F,grid=F,xlab="PC1",ylab="PC2"); abline(0,0,0,0)
idv <- identify(PCAplot$PCA1,PCAplot$PCA2,PCAplot$PCAIndivName,offset=0.05,cx=0.3) 
