## Put comments here that give an overall description of what your
## functions do

## "makeCacheMatrix" creates a special object that caches its inverse. 

makeCacheMatrix <- function(x = matrix()) {m <- NULL
set <- function(y) {
  x <<- y
  m <<- NULL
}
get <- function() x
setinverse <- function(solve) m <<- solve
getinverse <- function() m
list(set = set, get = get,
     setinverse = setinverse,
     getinverse = getinverse)

}

## cacheSolve" computes the inverse of the special "matrix"  created with the above function. 
## If the inverse has already been calculated, then the cachesolve should retrieve the inverse from the cache. 
## Otherwise, it calculates the inverse of the data and sets the value of the inverse in the cache via the setinverse function.

cacheSolve <- function(x, ...) {
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

