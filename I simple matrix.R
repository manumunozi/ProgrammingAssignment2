
## I simply set the input x as a matrix
## and then set the solved value "m" as a null
## then I changed every reference to "mean" to "solve" this value
## look value of x is matrix
makeCacheMatrix <- function(x = matrix(sample(1:100,9),3,3)) {
  m <- NULL
  set <- function(y) {
    x <<- y
    m <<- NULL
  }
  get <- function() x
  setsolve <- function(solve) m <<- solve
  getsolve <- function() m
  list(set = set, get = get,
       setsolve = setsolve,
       getsolve = getsolve)
}
##
##In this line change the inverse value
cacheSolve <- function(x, ...) {
  s <- x$getsolve()
  if(!is.null(m)) {
    message("Inverse Matrix converting")
    return(m)
  }
  data <- x$get()
  s <- solve(data, ...)
  x$setsolve(s)
  s
} 