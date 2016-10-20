###STRUCTURE result visualization###
### Save matrix output with individuals as rows and K as columns ###
### Name matrix as structure_output_Kx ###


### STRUCTURE instructions ###

#### Edit mainparams file:
####     - input file name
####     - output file name
####     - No. of individuals
####     - No. of loci

#### Type in: structure -K X -o XXX >logXXX


####R script for bars and ID marking:
barplot(t(structure_output_Kx[,2:X]),col=c("color1","color2"..."colorN"),border=NA, cex.names=0.5,space=0, names.arg=structure_output_Kx[,1], las=2)
