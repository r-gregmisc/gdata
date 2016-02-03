# This function replace rows in 'x' by corresponding rows in 'y' the have 
# the same value for 'by'
update.data.frame <- function(x, y, by, by.x=by, by.y=by, append=TRUE, verbose=TRUE, ...)
{
  retval <- x
  x.by <- x[[by.x]]
  y.by <- y[[by.y]]
  
  matches.x <- match(y.by, x.by)
  matches.y <- which(!is.na(matches.x))
  nomatch.y <- which(is.na(matches.x))
  matches.x <- matches.x[!is.na(matches.x)]
  
  if(length(matches.x)>0)
    retval[matches.x, ] <- y[matches.y,]
  
  if(length(nomatch.y) && append)  
    retval <- rbind(retval, y[nomatch.y,])
  
  if(verbose)
  {
    cat("\n")    
    cat("Number of rows in x     :", nrow(x),           "\n")
    cat("Number of rows in y     :", nrow(y),           "\n")
    cat("\n")
    cat("Number of rows replaced :", length(matches.x), "\n")
    cat("Number of rows appended :", length(nomatch.y), "\n")
    cat("\n")
    cat("Number of rows in result:", nrow(retval),      "\n")
    cat("\n")
  }
  retval
}
