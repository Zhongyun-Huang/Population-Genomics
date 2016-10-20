### To detect whether a SNP is lying within a gene, and the closest gene to the SNP ###
### Originally made for FST scan ###


### created by Zhongyun 2015 Feb 22 ###
#localaddr = "~/Downloads"
sequence = read.csv(paste('annotation_TEincluded_BHAvsaus_2_overlap_0505.csv', sep = ""), header = TRUE)
#Fill the black as NA for later NA comparason
sequence$Fst[sequence$Fst==""] <- NA
sequence$MSU_locus[sequence$MSU_locus==""] <- NA
fst = sequence$Fst[!is.na(sequence$Fst)]
#empty data frame, waiting for rbind
output = data.frame(matrix(numeric(0), , 4))

for (i in 1:length(fst)){
  index = match(fst[i], sequence$Fst)
  #decide the index of left DNA
  indexleft = index - 1
  if(is.na(sequence$MSU_locus[indexleft])) {
    repeat {indexleft = indexleft - 1 
      if (!is.na(sequence$MSU_locus[indexleft])){
        break
      }
    } 
  }
  #decide the index of right DNA
  indexright = index + 1
  if(is.na(sequence$MSU_locus[indexright])) {
    repeat {indexright = indexright + 1 
      
            if (!is.na(sequence$MSU_locus[indexright])){
        break
      }
    } 
  }
  fstPos = sequence$Position_5[index]
  leftPos5 = sequence$Position_5[indexleft]
  leftPos3 = sequence$Position_3[indexleft]
  
  rightPos5 = sequence$Position_5[indexright]
  rightPos3 = sequence$Position_3[indexright]
  positions = c(leftPos5, leftPos3, rightPos5, rightPos3)
  
  distances = positions - fstPos
  
  
  inside = "N"
  insideTwo = 0
  if (distances[1]*distances[2] <= 0) {
    MSU_index = indexleft
    inside = "Y"
    insideTwo = insideTwo + 1
  }
  if (distances[3]*distances[4] <= 0) {
    if (insideTwo == 1) {
      
        MSU_index_two = indexright
      insideTwo = insideTwo + 1
    }
    else MSU_index = indexright
    inside = "Y"
    
  }
  if (inside == "N") { 
    MSU_index1 = match(min(abs(distances)), abs(distances)) 
    if (MSU_index1 <= 2) { MSU_index = indexleft }
    else MSU_index = indexright
  
  }
  ##a new row for the data frame
  
  
  fstTemp = matrix(0, 1, 4)
  fstTemp[1,1] = as.character(fst[i])
  fstTemp[1,2] = as.character(sequence$MSU_locus[MSU_index])
  fstTemp[1,3] = as.character(inside)
  fstTemp[1,4] = as.character(sequence$annotation[MSU_index])
  output = rbind(output, fstTemp) 
  
  
if (insideTwo == 2) {
    fstTemp = matrix(0, 1, 4)
    fstTemp[1,1] = as.character(fst[i])
    fstTemp[1,2] = as.character(sequence$MSU_locus[MSU_index_two])
    fstTemp[1,3] = as.character(inside)
    fstTemp[1,4] = as.character(sequence$annotation[MSU_index_two])
    output = rbind(output, fstTemp) 
  }
  
}

names(output) = c("FST","MSU_Locus","Inside","Annotation")

fExport = paste('Closest_genes_BHAvsaus_2_overlap_0505.csv',sep = "")
write.csv(output, file = fExport, row.names = FALSE)