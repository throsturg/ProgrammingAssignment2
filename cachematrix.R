## 


## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  # Creates a cache matrix object, that 
  #
  # Args:
  #   x: A matrix
  #
  # Returns:
  #   A Cache Matrix object. 
  inv <- NULL
  
  get <- function() {
    x
  }
  
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  getInverse <- function() {
    inv
  }
  
  setInverse <- function(inverseMatrix) {
    inv <<- inverseMatrix
  }
  
  list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  
  if (!is.null(inv)) {
    return(inv)
  }
  mat <- x$get()
  inv <- solve(mat)
  x$setInverse(inv)
  inv
}

