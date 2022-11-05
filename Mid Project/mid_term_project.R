#importing the dataset_1
dataset = read.csv('Dataset_1.csv')
dataset

#finding the shape of the dataset_1
summary(dataset)
str(dataset)

#Show the attributes name
attributes(dataset) #deatailed attributes
ls(dataset) #only attribute names

#the types of data for all attributes
str(dataset)
typeof(dataset$Borrower)
typeof(dataset$Loan)
typeof(dataset$Interest_rate)
typeof(dataset$Credit_Score)


#mean,median and mode for Loan and Interest_rate attributes
mean(dataset$Loan)
mean(dataset$Interest_rate)
install.packages("DescTools")
library(DescTools)
modeValue_Loan <- Mode(dataset$Loan)
modeValue_Interest_rate <- Mode(dataset$Interest_rate)
median(dataset$Loan)
median(dataset$Interest_rate)
#all together
summary(dataset$Loan)
summary(dataset$Interest_rate)
dataset[,2:3] %>% summarise_if(is.numeric, mean)
dataset[,2:3] %>% summarise_if(is.numeric, median)
dataset[,2:3] %>% summarise_if(is.numeric, mode)

#range and standard Deviation for Loan and Interest_rate attributes
install.packages('dplyr')
library(dplyr)
dataset[,2:3] %>% summarise_if(is.numeric, sd)
range(dataset$Loan)
range(dataset$Interest_rate)

#mode for credit score
install.packages("DescTools")
library("DescTools")
modeValue <- Mode(dataset$Credit_Score)


#.............................................................................

#importing dataset_2
dataset2 = read.csv('Dataset_2.csv')
#finding missing value for all attributes
dataset2$Type[dataset2$Type==""] <- NA

colSums(is.na(dataset2))


#detecting oulier as missing values
dataset2$Price[dataset2$Price<=300000] <- NA
plot(dataset2$Price,dataset2$Rooms)

#factor categorical data
dataset2$Type = factor(dataset2$Type,
                       levels = c("h","m","l"),
                       labels = c(1,2,3))

#deleting rows
ms = na.omit(dataset2[,-2])
remove_row = dataset2[complete.cases(dataset2$Rooms,dataset2$Price), ]
print(dataset2[complete.cases(dataset2$Price), ])





#Replacing missing value with mean

dataset2$Rooms = ifelse(is.na(dataset2$Rooms), 
                               ave(dataset2$Rooms, FUN = function(x) mean(x, na.rm = TRUE)),
                               dataset2$Rooms) 
dataset2$Price = ifelse(is.na(dataset2$Price), 
                        ave(dataset2$Price, FUN = function(x) mean(x, na.rm = TRUE)),
                        dataset2$Price)

dataset2$Rooms[is.na(dataset2$Rooms)] = mean(dataset2$Rooms, na.rm = TRUE)
dataset2$Price[is.na(dataset2$Price)] = mean(dataset2$Price, na.rm = TRUE)

#Replacing missing value with median
median(dataset2$Rooms, na.rm = TRUE)
median(dataset2$Price, na.rm = TRUE)
dataset2$Price[is.na(dataset2$Price)] = median(dataset2$Price, na.rm = TRUE)
dataset2$Rooms[is.na(dataset2$Rooms)] = median(dataset2$Rooms, na.rm = TRUE)


#Replacing missing value with mode
Mode(dataset2$Rooms, na.rm = TRUE)
Mode(dataset2$Price, na.rm = TRUE)
dataset2$Rooms[is.na(dataset2$Rooms)] <- Mode(dataset2$Rooms, na.rm = TRUE)
dataset2$Price[is.na(dataset2$Price)] <- Mode(dataset2$Price, na.rm = TRUE)

