## Programming Assignement 2 in the course R Programming.
## Throstur Gudmundsson
## throsturg@gmail.com



# Creates a cache matrix object, that can cache a version of
# its inverse.
#
# Args:
#   x: A matrix
#
# Returns:
#   A Cache Matrix object.
makeCacheMatrix <- function(x = matrix()) {
   
  inv <- NULL  # inverse of the Matrix
  
  # Gets the matrix
  get <- function() {
    x
  }
  
  # Sets the Matrix. Resets the cached inverse.
  set <- function(y) {
    x <<- y
    inv <<- NULL
  }
  
  # Gets the inverse of the matrix.
  getInverse <- function() {
    inv
  }
  
  # Sets the inverse of the matrix.
  setInverse <- function(inverseMatrix) {
    inv <<- inverseMatrix
  }

  # Returns a list of the objects functions.  
  list(set = set, 
       get = get, 
       getInverse = getInverse, 
       setInverse = setInverse)
}


# Computes the inverse of given matrix and stores in its cache.
#
# Args:
#   x: A cachable matrix object (makeCacheMatrix)
#
# Returns:
#   If a cached inverse is avaliable, then it is returned.
#   Else the inverse is solved and cached.
cacheSolve <- function(x, ...) {
  inv <- x$getInverse() # Get the inverse of the matrix.
  
  # check if inverse is avaliable in cache
  # If avaliable then retun the cached matrix inverse.
  if (!is.null(inv)) {
    return(inv)
  }
  # The inverse is not avaliable in cache. 
  mat <- x$get() # Get the Matrix. 
  inv <- solve(mat) # Solve the matrix.
  x$setInverse(inv) # Cache the inverse.
  inv
}

