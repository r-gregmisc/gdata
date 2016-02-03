# Simply call 'first' or 'last' with a different default value for 'n'.
first <- function(x, n=1, ...) head(x, n=n, ...)
last  <- function(x, n=1, ...) tail(x, n=n, ...)

"first<-" <- function(x, n=1, ..., value )
{
  x[1:n] <- value[1:n]
  x
}

"last<-" <- function(x, n=1, ..., value )
{
  index <- seq( length(x)-n+1, length(x) )
  x[index] <- value[1:n]
  x
}
