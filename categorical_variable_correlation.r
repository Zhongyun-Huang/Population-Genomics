### correlation between two categorical variables ###
### Fisher's Exact Test ###
### GBS paper TableS1 ###

#null hypothesis: independent, pvalue<0.05, correlated

tb_species = matrix(data=c(1,1,10,3,0,1,0,25,2,1,0,1,2,1,0),nrow=4,ncol=5,byrow=T)
dimnames (tb_species) = list(subgroup=c('admixed','aus-like','indica-like','wild-like'),XX=c('ni','sa','ss','saXni','niXss'))

chi_species = chisq.test(tb_species,correct = F)
c(chi_species$statistic,chi_species$p.value)
sqrt(chi_species$statistic/sum(tb_species))
#### X-squared           
####9.963316  0.619179 (pvalue)
####0.3976781
#### Not enough to reject the hypothesis of independence
library("fifer")
chisq.post.hoc(tb_species)
##Adjusted p-values used the fdr method.

##comparison  raw.p  adj.p
##1      admixed vs. aus-like 0.2468 0.4935
##2   admixed vs. indica-like 0.7730 0.9276
##3     admixed vs. wild-like 1.0000 1.0000
##4  aus-like vs. indica-like 0.1422 0.4935
##5    aus-like vs. wild-like 0.2468 0.4935
##6 indica-like vs. wild-like 0.7730 0.9276


tb_species2 = matrix(data=c(1,10,4,0,25,4,1,2,1,0,4,6),nrow=4,ncol=3,byrow=T)
dimnames (tb_species2) = list(subgroup=c('admixed','aus-like','indica-like','wild-like'),Species=c('sa','ss','ni-related'))

chi_species2 = chisq.test(tb_species2,correct = F)
c(chi_species2$statistic,chi_species2$p.value)
sqrt(chi_species2$statistic/sum(tb_species2))

####X-squared             
####15.92452575  0.01416485 (Pvalue)
####X-squared 
####0.5239855
chisq.post.hoc(tb_species2)

####Adjusted p-values used the fdr method.

####comparison  raw.p  adj.p
####1      admixed vs. aus-like 0.2059 0.2528
####2   admixed vs. indica-like 0.7162 0.7162
####3     admixed vs. wild-like 0.2107 0.2528
####4  aus-like vs. indica-like 0.0565 0.1694
####5    aus-like vs. wild-like 0.0086 0.0514
####6 indica-like vs. wild-like 0.2098 0.2528


tb_country = matrix(data=c(5,4,3,1,2,0,10,12,0,0,0,7,1,2,1,0,0,1,0,9,0,0,0,1),nrow=4,ncol=6,byrow=T)
dimnames (tb_country) = list(subgroup=c('admixed','aus-like','indica-like','wild-like'),country=c('Bangladesh','India','Myanmar','Pakistan','Sri Lanka','Nepal'))

chi_country = chisq.test(tb_country,correct = F)
c(chi_country$statistic,chi_country$p.value)
sqrt(chi_country$statistic/sum(tb_species))
####   X-squared             
#### 29.87173265  0.01239251 (Pvalue)
#### X-squared 
#### 0.6885888 
#### reject hypothesis, correlated
chisq.post.hoc(tb_country)
##Adjusted p-values used the fdr method.

##comparison  raw.p  adj.p
##1      admixed vs. aus-like 0.0036 0.0127
##2   admixed vs. indica-like 0.6606 0.6606
##3     admixed vs. wild-like 0.0042 0.0127
##4  aus-like vs. indica-like 0.2633 0.3159
##5    aus-like vs. wild-like 0.0193 0.0385
##6 indica-like vs. wild-like 0.0769 0.1154


tb_time = matrix(data=c(0,4,4,6,0,4,5,20,2,0,2,1,0,0,5,5),nrow=4,ncol=4,byrow=T)
dimnames (tb_time) = list(subgroup=c('admixed','aus-like','indica-like','wild-like'),country=c('60s','70s','80s','90s'))

chi_time = chisq.test(tb_time,correct = F)
c(chi_time$statistic,chi_time$p.value)
sqrt(chi_time$statistic/sum(tb_time))

####   X-squared              
#### 3.127054e+01 2.659998e-04 (pvalue)
####  X-squared 
#### 0.7342664
#### reject hypothesis, correlated
chisq.post.hoc(tb_time)

##Adjusted p-values used the fdr method.

##comparison  raw.p  adj.p
##1      admixed vs. aus-like 0.2568 0.2568
##2   admixed vs. indica-like 0.0809 0.2428
##3     admixed vs. wild-like 0.2241 0.2568
##4  aus-like vs. indica-like 0.0073 0.0441
##5    aus-like vs. wild-like 0.1282 0.2564
##6 indica-like vs. wild-like 0.1725 0.2568