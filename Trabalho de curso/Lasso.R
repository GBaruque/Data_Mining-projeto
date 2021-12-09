library(glmnet)

dados=read.csv2("C:/Users/Gabriel/Documents/0-Estudos/Doutorado/Data Mining/Trabalho de curso/dados_cancerv2.csv")


x = data.matrix(dados[,1:23])
y = dados[,24]

m0lasso = glmnet(x, y, family = "multinomial", type.multinomial = "ungrouped")
plot(m0lasso, xvar = "lambda", label = TRUE, type.coef = "2norm")

cvfit=cv.glmnet(x, y, family="multinomial", type.multinomial = "ungrouped", parallel = TRUE)
plot(cvfit)




m0lasso = glmnet(x, y, family = "multinomial", type.multinomial = "grouped")
plot(m0lasso, xvar = "lambda", label = TRUE, type.coef = "2norm")

cvfit=cv.glmnet(x, y, family="multinomial", type.multinomial = "grouped", parallel = TRUE)
plot(cvfit)


#----------------------------------------------------------------------------------------------------

library(knitr)

coefLasso <- cbind("LASSO-MIN" = coef(m0lasso, s = "lambda.min")[-2],
                   "LASSO-1SE" = coef(m0lasso, s = "lambda.1se")[-2])
coefLasso

compareCoefs <- cbind(coefLasso)

library(knitr)
knitr::kable(compareCoefs, align = rep("c", 2), digits = 3)

