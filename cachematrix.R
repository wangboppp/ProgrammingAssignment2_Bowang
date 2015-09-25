## Put comments here that give an overall description of what your
## functions do

## Write a short comment describing this function
## This function is used to define how to calculate the inverse of 
## a function and it output a list of function including set, get, 
## setsolve and getsolve.

makeCacheMatrix <- function(x = matrix()) {
        m <- NULL
        set <- function(y) {
                x <<- y
                m <<- NULL
        }
        get <- function() x
        setsolve <- function(solve) m <<-solve
        getsolve <- function() m
        list(set = set, get = get,
             setsolve = setsolve,
             getsolve = getsolve)
}


## Write a short comment describing this function
## This function is called to test if the result is still in the 
## cache, if yes the value in the cache is returned; and if no it
## will call the function get from the makeCacheMatrix and return
## the inverse of the original matrix.

cacheSolve <- function(x, ...) {
        ## Return a matrix that is the inverse of 'x'
        m <- x$getsolve()
        if(!is.null(m)) {
                message("getting cached data")
                return(m)
        }
        data <- x$get()
        m <- solve(data)
        x$setsolve(m)
        m
}
