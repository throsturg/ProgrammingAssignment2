## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function

makeCacheMatrix <- function(x = matrix()) {
  inv <- NULL
  
  get <- function()
  {
    x
  }
  
  set <- function(y)
  {
    x <<- y
    inv <<- NULL
  }
  
  getInverse <- function()
  {
    inv
  }
  setInverse <- function(inverseMatrix)
  {
    inv <<- inverseMatrix
  }
  
  list(set = set, get = get, getInverse = getInverse, setInverse = setInverse)
}


## Write a short comment describing this function

cacheSolve <- function(x, ...) {
  inv <- x$getInverse()
  if(!is.null(inv)) 
  {
    message("Using Cache")
    return(inv)
  }
  message("Crate Cache")
  mat <- x$get()
  inv <- solve(mat)
  x$setInverse(inv)
  inv
}
