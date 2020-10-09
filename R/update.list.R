## this function updates the elements of list 'object' to contain all of the elements
## of 'new', overwriting elements with the same name, and (optionally) copying unnamed
## elements.
update.list <- function(object,
                        new,
                        unnamed=FALSE,
                        ...)
{
  retval <- object

  for(name in names(new))
    retval[[name]] <- new[[name]]

  if(unnamed)
  {
    if(is.null(names(new)))
      names(new) <- rep("", length=length(new))
    for(i in (1:length(new))[names(new)==""] )
        retval <- append(retval, new[[i]])
  }

  retval
}

