matchcols <- function(object, with, without, method=c("and","or"), ...)
{
  method <- match.arg(method)
  cols <- colnames(object)

  # Include columns matching 'with' pattern(s)
  if(method == "and")
  {
    for(i in 1:length(with))
    {
      if(length(cols)>0)
        cols <- grep(with[i], cols, value=TRUE, ...)
    }
  }
  else if(!missing(with))
  {
    if(length(cols)>0)
      cols <- sapply(with, grep, x=cols, value=TRUE, ...)
  }

  # Exclude columns matching 'without' pattern(s)
  if(!missing(without))
  {
    for(i in 1:length(without))
    {
      if(length(cols) > 0)
      {
        omit <- grep(without[i], cols, ...)
        if(length(omit) > 0)
          cols <- cols[-omit]
      }
    }
  }

  cols
}
