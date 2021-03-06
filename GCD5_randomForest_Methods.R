# ce projet est r�aliser par une �quipe de ENSAH (Maroc)
# l'�quipe de projet : Mustapha Elhoussaini et Elhabib Fikri  
# set the work directory 
setwd("C:/Users/Admin/Documents/R/project")
# check the work directory 
getwd()

#lire les donn�es complete 1000 lignes
DF.data <-read.csv("R/project/german_credit.csv",header = TRUE, sep=",")
#lire a sample (proportion) des donn�es 98 lignes
View(DF.data)

#Random sample of 50% of row numbers created
indexes = sample(1:nrow(DF.data), size=0.5*nrow(DF.data))

#training data contient les donn�es index� par indexes
train50 <- DF.data[indexes,]
#test data contient le rest
test50 <- DF.data[-indexes,]
#Random sample of 50% of row numbers created
indexes = sample(1:nrow(DF.data), size=0.5*nrow(DF.data))
#training data contient les donn�es index� par indexes
train50 <- DF.data[indexes,]
#test data contient le rest
test50 <- DF.data[-indexes,]

#si le data Frame est est fix� alors les noms de colonnes peuvent �tre directement appel�s
attach(DF.data)

#install le packge randam forest
install.packages(randomForest)
library(randomForest)
#appliqu� la methode randomforest pour obtenir le module predict�
rf50 <- randomForest(Creditability ~., data = train50, ntree=200, importance=T, proximity=T)

#affiche le plot trees/errors
plot(rf50, main="")
#gerenre la prediction
Test50_rf_pred <- predict(rf50, test50, type="class")
#affiche le tableau
table(Test50_rf_pred, test50$Creditability)
#affich� l'imprtance des vars predict�
importance(rf50)
#affich� le plot
varImpPlot(rf50,  main="", cex=0.8)
