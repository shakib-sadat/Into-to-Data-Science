
patientID <-c(1,2,3,4)
age <- c(25, 34, 28, 52)
diabetic <- c("Type1", "Type2", "Type1", "Type1")
status<- c("poor","improved","Excellent","good")
patientdata <- data.frame(patientID, age, diabetic,status)

newcol<- cbind(patientdata, "bloodgroup"=c("A+","B+","O+", "O-"))
patientdata = newcol
patientdata[c(2,3),c(2,3)]
patientdata$age

#Factors
#used for converting continous to categorical data. chi square.
age<-factor(c("young", "mid age", "young", "old"))
age[4] = "young"
age

#list
g <-"My first list"
h <- c(25,16,18,39)
j<- matrix(1:10,nrow=5)
k <-c("one","two","three")
mylist <- list(title=g, ages=h,j,k)
mylist

item <- list("mango","apple")
append(item,"orange",after = 1)

#data input from keyboard
mydata <- data.frame(age=numeric(0),
                     gender=character(0),weight=numeric(0))
mydata <- edit(mydata)
mydata
