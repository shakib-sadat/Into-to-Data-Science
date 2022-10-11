#Vector

# Important note: when encounter any function, to know about it press F1 while the curser on the function

# x <- c(9,7,5,1,2)
# x + 3
# sort(x) #sort asc
# order(x) #sorted index number
# sort(x, decreasing = TRUE) #sort in desc order
# sort(x, decreasing = FALSE) ##sort asc
# x[2:3] #access index 2 and 3 
# x[c(2,3)] #access index 2 and 3 
# y <- c(1,2,3,4)
# y +5

#Matrices
# mymatrix <- matrix(1:20, nrow = 4, ncol = 5) #create matrix
# cells <- c (1:4)
# rname <- c("R1", "R2")
# cname <- c("C1", "C2")
# mymatrix <- matrix(cells, nrow = 2, ncol = 2, byrow = TRUE, dimnames = list(rname,cname))
# 
# 
# mymatrix
# 
# mymatrix[1,]#access row
# mymatrix[,2]#access col 
# 
# newmat <- matrix(1:4,nrow = 2, ncol = 2)
# newmat
# 
# mymatrix_new_col <- cbind(mymatrix,c(10,9))
# mymatrix_new_row <- rbind(mymatrix,c(88,99))
# mymatrix_new_row
# mymatrix_new_col
# 
# mymatrix+newmat
# 
# myarray <- array(1:24, c(3,2,3)) #create 3 dimentional array
# 
# myarray
# 
# myarray[2,2,3]

#Data Frames
patientID <- c(1,2,3,4)
age <- c(25, 34, 28, 52)
diabetes <- c("Type1", "Type1", "Type2", "Type2")
patientdata <- data.frame(patientID, age, diabetes) #in data frame we can pass several vectors
patientdata
