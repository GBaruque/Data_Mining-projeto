lib="/data04/projects04/MarianaBoroni/inca-pucrio/lib/Rpackages"#,"/home/shalves/R/x86_64-pc-linux-gnu-library/3.5")
# lib=paste0(getwd(),'/lib/Rpackages')
print(lib)
.libPaths(lib)
library(TCGAbiolinks)

FPKM.BRCA <- GDCquery(project = "TCGA-BRCA",
                 data.category = "Transcriptome Profiling",
                 data.type = "Gene Expression Quantification",
                 workflow.type = 'HTSeq - FPKM',
                 legacy = F)
GDCdownload(FPKM.BRCA)
FPKM.BRCA.LRSE <- GDCprepare(FPKM.BRCA)

colData.BRCA <- colData(FPKM.BRCA.LRSE)
resultsdir=paste0("~/inca-pucrio/results/Colorretal_Sarah/")
write.csv(colData.BRCA,paste(resultsdir,"BRCA", ".csv", sep=""), row.names = TRUE)

