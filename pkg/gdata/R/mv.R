mv <- function(from, to, envir=parent.frame())
{
  if( !is.character(from) || !exists(from, envir=envir, inherits = TRUE) )
    stop("`from` must be a character string specifying the name of an object.") 
  if( !is.character(to)   ) 
    stop("`to` must be a characater string.")
  value <- get(from, envir=envir) 
  assign(x=to, value=value, envir=envir)
  rm(list=from, envir=envir)
}