library(fractional)
#creating a matrix using provided weights by ouma & tateishi 
w <- list(0.13,0.08,0.07,0.18,0.28,0.26) #Rainfall, Drainage, Elevation, Slope, Soil, Land-use
pairwise_matrix <- function(w) {
  n <- length(w)
  A <- matrix(0, n, n)
  
  for (i in 1:n) {
    for (j in 1:n) {
      A[i, j] <- w[i] / w[j]
    }
  }
  
  return(A)
}

w <- c(0.13, 0.08, 0.07, 0.18, 0.28, 0.26)
A <- pairwise_matrix(w)
A

#removing soil because that is not a relevant variable for our study 
A <- A[-5,-5]


#updated weights using eigenvectors after removing soil 
eig <- eigen(A)
principal_eigvec <- eig$vectors[,1] #get principal eigenvector 

weights <- principal_eigvec / sum(principal_eigvec) 

#check for consistency 
eigen_values <- eig$values
principal_eigenvalue <- eigen_values[1]
c <- 5 #no. of criteria 
#plugging into the formula 
CI <- (principal_eigenvalue - c )/(c-1)
CIRI <- CI / 1.12
CIRI

#to make sure our code is right, we check the following condition is true: 
all.equal(t(A%*%weights), 5%*%weights)