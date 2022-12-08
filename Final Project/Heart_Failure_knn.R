
dataset = read.csv('heart.csv')
dataset
str(dataset)
ls(dataset)

unique(dataset$Sex)
unique(dataset$ChestPainType)
unique(dataset$RestingECG)
unique(dataset$ExerciseAngina)
unique(dataset$ST_Slope)

dataset$Sex = factor(dataset$Sex,
                       levels = c("M","F"),
                       labels = c(0,1))

dataset$ChestPainType = factor(dataset$ChestPainType,
                        levels = c("ATA","NAP","ASY","TA"),
                        labels = c(1,2,3,4))


dataset$RestingECG = factor(dataset$RestingECG,
                        levels = c("Normal","ST","LVH"),
                        labels = c(1,2,3))

dataset$ExerciseAngina = factor(dataset$ExerciseAngina,
                              levels = c("N","Y"),
                              labels = c(0,1))

dataset$ST_Slope = factor(dataset$ST_Slope,
                           levels = c("Up","Flat","Down"),
                           labels = c(1,2,3))

colSums(is.na(dataset))

install.packages("caret")
library(caret)
process = preProcess(as.data.frame(dataset), method=c("range"))

dataset = predict(process, as.data.frame(dataset))


dataset[,1] = scale(dataset[,1])
dataset[,4] = scale(dataset[,4])
dataset[,5] = scale(dataset[,5])
dataset[,8] = scale(dataset[,8])
dataset[,10] = scale(dataset[,10])

install.packages("Hmisc")
library(Hmisc)
hist.data.frame(dataset)

hist(dataset$HeartDisease,xlab = 'Heart Disease(0 = "No", 1 = "Yes")',main = paste("Histogram of Heart Disease"), col=("lightblue"))

summary(dataset)


boxplot(dataset)
summary(dataset$RestingBP)
Iqr_restingbp = .70-.60
upfen_restingbp = .70+1.5*Iqr_restingbp
low_restingbp = .60-1.5*Iqr_restingbp
upfen_restingbp
low_restingbp

summary(dataset$Cholesterol)
Iqr_Cholesterol = 0.4428-0.2873 
upfen_Cholesterol = .4428+1.5*Iqr_Cholesterol
low_Cholesterol = 0.2873 -1.5*Iqr_Cholesterol
upfen_Cholesterol
low_Cholesterol

summary(dataset$Oldpeak)
Iqr_Oldpeak = 0.4659-0.2955 
upfen_Oldpeak = 0.4659+1.5*Iqr_Oldpeak
low_Oldpeak = 0.2955 -1.5*Iqr_Oldpeak
upfen_Oldpeak
low_Oldpeak

dataset_rm_outlier = subset(dataset, dataset$RestingBP > low_restingbp & dataset$RestingBP < upfen_restingbp & dataset$Cholesterol > low_Cholesterol & dataset$Cholesterol < upfen_Cholesterol 
                            & dataset$Oldpeak > low_Oldpeak & dataset$Oldpeak < upfen_Oldpeak )
boxplot(dataset_rm_outlier)
dataset = dataset_rm_outlier




install.packages("caTools")
library(caTools)
set.seed(123)
split = sample.split(dataset$HeartDisease, SplitRatio = 0.80)
training_set = subset(dataset, split==TRUE)
test_set = subset(dataset, split==FALSE)
split

install.packages("class")
library(class)

y_pred = knn(train = training_set[,-12],
             test = test_set[,-12],
             cl = training_set[,12],
             k = 7)

cm = table(test_set[,12], y_pred)
cm

accuracy = sum(diag(cm))/nrow(test_set)
accuracy
