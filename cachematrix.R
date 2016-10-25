## So these two functions should basically do the similar thing as the example functions. They store a matrix
## and cache it´s inverse

## This function creates a special "matrix", which then the next function can calculate the inverse from.

makeCacheMatrix <- function(x = matrix()) {
    m <- NULL
    set <- function(y) {
        x <<- y
        m <<- NULL
    }
    get <- function() x
    setmatrix <- function(solve) m <<- solve
    getmatrix <- function() m
    list(set = set, get = get,
         setmatrix = setmatrix,
         getmatrix = getmatrix)
}


## This function first checks to see if the inverse has already been calculated. 
## If so, it gets the value from the cache and skips the computation. 
## Otherwise, it calculates the inverse of the special "matrix" and sets the value of the inverse in the cache via the setmatrix function.

cacheSolve <- function(x, ...) {
    m <- x$getmatrix()
    if(!is.null(m)) {
        message("getting those sweet cached data")
        return(m)
    }
    matrix <- x$get()
    m <- solve(matrix, ...)
    x$setmatrix(m)
    m
}
