#import dataset
dataset = read.csv("new_data.csv",header = TRUE, sep=",")
#view attribute name
names(dataset)
#renaming attribute
names(dataset)[1] = "Lonee"

dataset = edit(dataset)

# dataset$gender = factor(dataset$gender,
#                         levels = c(1,2),
#                         labels = c('male','female'))


dataset$gender = factor(dataset$gender,
                        levels = c('male','female'),
                        labels = c(1,2))

# cat_to_num = factor(c())
# 
# unclass(cat_to_num)

str(dataset)

s = dataset$Loan
sd(s)

install.packages("dplyr")
library(dplyr)

dataset %>%summarise_if(is.numeric,sd)


#row-wise standard deviation
install.packages("matrixStats")
library(matrixStats)
dataset$score = rowSds(as.matrix(dataset[,c(2,3)]))
dataset

#select random row

sample_n(dataset,3)

dataset_2 = select(dataset,Loan)

#finding missing value

dataset =edit(dataset)

colSums(is.na(dataset))

#specific row of missing value 
which(is.na(dataset$interest_rate))

#Replacing missing value with mean

dataset$interest_rate = ifelse(is.na(dataset$interest_rate), 
                     ave(dataset$interest_rate, FUN = function(x) mean(x, na.rm = TRUE)),
                     dataset$interest_rate) 
#removing missing value rows
remove = na.omit(dataset)
dataset = remove
