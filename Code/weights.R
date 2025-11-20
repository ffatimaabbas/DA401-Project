A <- matrix(c(
  1,1,2/3,1/2,2,
  1,1,2/3,1/2,2,
  3/2,3/2,1,3/4,3,
  2,2,4/3,1,4,
  1/2,1/2,1/3,1/4,1
), 
nrow = 5, 
byrow = TRUE)

eig <- eigen(A)
principal_eigvec <- eig$vectors[,1] #get principal eigenvector 

weights <- principal_eigvec / sum(principal_eigvec) #normalize 

weights

#check for consistency 
eigen_values <- eig$values
principal_eigenvalue <- eigen_values[1]
c <- 5 #no. of criteria 
#plugging into the formula 
CIRI <- (principal_eigenvalue - c )/(c-1)
CI <- CI / 1.12
