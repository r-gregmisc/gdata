centerText <- function(x, width=getOption("width"))
{
  retval <- vector(length=length(x), mode="character")
  for(i in 1:length(x))
  {
    text <- trim(x[i])
    textWidth  <- nchar(text)
    nspaces <- floor((width - textWidth)/2)
    spaces <- paste(rep(" ",nspaces), sep="", collapse="")
    retval[i] <- paste(spaces, text, sep="", collapse="\n")
  }
  retval
}
