startsWith <- function(x, prefix, trim=FALSE, ignore.case=FALSE)
  {
    if(trim) x <- trim(x)

    if(ignore.case)

      {
        x <- toupper(x)
        prefix <- toupper(prefix)
      }

    base::startsWith(x, prefix)
  }
