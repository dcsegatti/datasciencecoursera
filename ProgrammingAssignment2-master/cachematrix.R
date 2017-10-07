## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function


# makeCacheMatrix creates a list containing a function to

# 1. set the value of the matrix

# 2. get the value of the matrix

# 3. set the value of inverse of the matrix

# 4. get the value of inverse of the matrix


makeCacheMatrix <- function(x = matrix()) {
   
     m <- NULL
     set <- function(y) {
       x <<- y
       m <<- NULL
     }
       get <- function() x
       setinverse <- function(inverse) m <<- inverse
       getinverse <- function() m
       list(set = set, get = get, setinverse = setinverse,  getinverse = getinverse)
       
    }


## Write a short comment describing this function

##cacheSolve returns inverse of a matrix. 
## checks for previously stored inverse first, if none found, computes.


cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'

  
  m <- x$getinverse()
  if(!is.null(m)) {
    message("getting cached data")
    return(m)
  }
  data <- x$get()
  m <- solve(data, ...)
  x$setinverse(m)
  m
  
  
  }


## TEST:
## x = rbind(c(5, 10), c(10, 5))
## m = makeCacheMatrix(x)
## cacheSolve(m)
##      [,1]        [,2]
## [1,] -0.06666667  0.13333333
## [2,]  0.13333333 -0.06666667
## cacheSolve(m)
## getting cached data
##        [,1]        [,2]
##  [1,] -0.06666667  0.13333333
##  [2,]  0.13333333 -0.06666667

