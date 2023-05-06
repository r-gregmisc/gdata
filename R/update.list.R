update.list <- function(object, new, unnamed=FALSE, ...)
{
  retval <- object

  for(name in names(new))
    retval[[name]] <- new[[name]]

  if(unnamed)
  {
    if(is.null(names(new)))
      names(new) <- rep("", length=length(new))
    for(i in (1:length(new))[names(new)==""])
      retval <- append(retval, new[[i]])
  }

  retval
}
