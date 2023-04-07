keep <- function(..., list=character(), all=FALSE, sure=FALSE)
{
  if(missing(...) && missing(list))
  {
    warning("keep something, or use rm(list=ls()) to clear workspace - ",
            "nothing was removed")
    return(invisible(NULL))
  }
  names <- as.character(substitute(list(...)))[-1]
  list <- c(list, names)
  keep.elements <- match(list, ls(1,all.names=all))
  if(any(is.na(keep.elements)))
  {
    warning("you tried to keep '", list[which(is.na(keep.elements))[1]],
            "' which doesn't exist in workspace - nothing was removed")
    return(invisible(NULL))
  }

  obj <- ls(1, all.names=all)[-keep.elements]
  if(sure)
  {
    rm(list=obj, pos=1)
    invisible(obj)
  }
  else
  {
    obj
  }
}
