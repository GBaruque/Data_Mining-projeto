library(writexl)

dados_clinicos = clinical.BCRtab.all[["clinical_patient_brca"]]
subtipos = PanCancerAtlas_subtypes()


merged = data.frame()

for (i in 1:nrow(dados_clinicos)){
  for (j in 1:nrow(subtipos)){
    
    if (substr(dados_clinicos[i,2], 1, 12) == substr(subtipos[j,1], 1, 12)){
      merged = rbind(merged, c(subtipos[j,], dados_clinicos[i,]))
      break
      
    }
    
  }
  print(paste("Linha", i , "terminada!"))
}

#colnames(merged) = c(colnames(subtipos), colnames(dados_clinicos))

write_xlsx(merged,"C:\\Users\\Gabriel\\Documents\\0-Estudos\\Doutorado\\Data Mining\\Trabalho de curso\\base-fusao.xlsx")
