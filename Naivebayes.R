library(caTools)
library(caret)
library(e1071)

# Database
base = read.csv('nassCD.csv')

# data treatment
base$X = NULL
base$dvcat = NULL
base$caseid = NULL
base$sex = NULL
base$yearacc = NULL


table(base$dead)
unique(base$dead)
base$dead = factor(base$dead, levels = c('dead', 'alive'), labels = c('morto','vivo'))

table(base$airbag)
unique(base$airbag)
base$airbag = factor(base$airbag, levels = c('none', 'airbag'), labels = c('sem','com'))

table(base$seatbelt)
unique(base$seatbelt)
base$seatbelt = factor(base$seatbelt, levels = c('none', 'belted'), labels = c('sem','com'))

table(base$sex)
unique(base$sex)
base$sex = factor(base$sex, levels = c('f', 'm'), labels = c('F','M'))

table(base$abcat)
unique(base$abcat)
base$abcat = factor(base$abcat, levels = c('unavail', 'nodeploy', 'deploy'), labels = c(0,1,2))

table(base$occRole)
unique(base$occRole)
base$occRole = factor(base$occRole, levels = c('pass', 'driver'), labels = c('passageiro','motorista'))

summary(base)

mean(base$weight, na.rm = TRUE)
base$weight = ifelse(base$weight > 14200.00, 462.8116, base$weight)


base$yearVeh = ifelse(is.na(base$yearVeh), mean(base$yearVeh,na.rm = TRUE), base$yearVeh)
base$injSeverity = ifelse(is.na(base$injSeverity), mean(base$injSeverity,na.rm = TRUE), base$injSeverity)

base[ ,1:1] = scale(base[ ,1:1])

base$weight = ifelse((base$weight < 0), mean(base$weight,na.rm = TRUE), base$weight)


#////////////////////////////////Naivebayes///////////////////////////////////////


# train/test split 

set.seed(1)
divisao = sample.split(base$dead, SplitRatio = 0.75)
base_treinamento = subset(base, divisao == TRUE)
base_teste = subset(base, divisao == FALSE)



# train model

classificador = naiveBayes(x = base_treinamento[-2], y = base_treinamento$dead)
print(classificador)

# forecast
previsao = predict(classificador, newdata = base_teste[-2])

matriz_confusao = table(base_teste[,2], previsao)
print(matriz_confusao)
confusionMatrix(matriz_confusao)







