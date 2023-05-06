frameApply <- function(x, by = NULL, on = by[1],
                       fun = function(xi) c(Count = nrow(xi)) , subset = TRUE,
                       simplify = TRUE, byvar.sep = "\\$\\@\\$", ...)
{
  subset <- eval(substitute(subset), x, parent.frame())
  x <- x[subset, , drop = FALSE]
  if(!is.null(by)) {
    x[by] <- drop.levels(x[by])
    for(i in seq(along = by))
      if(length(grep(byvar.sep, as.character(x[[by[i]]]))))
        stop("Choose a different value for byvar.sep.")
    byvars <- unique(x[by])
    BYVAR <- do.call("paste", c(as.list(x[by]), sep = byvar.sep))
    byvars <- byvars[order(unique(BYVAR)), , drop = FALSE]
    splx <- split(x[on], BYVAR)
    splres <- lapply(splx, fun, ...)
    if(!simplify) out <- list(by = byvars, result = splres)
    else {
      i <- 1 ; nres <- length(splres)
      while(inherits(splres[[i]], "try-error") & i < nres) i <- i + 1
      nms <- names(splres[[i]])
      splres <- lapply(splres, function(xi) {
        if(inherits(xi, "try-error")) {
          return(rep(NA, length(nms)))
        }
        else xi
      })
      res <- do.call("rbind", splres)
      res <- as.data.frame(res)
      names(res) <- nms
      if(length(intersect(names(byvars), names(res))))
        stop("names of 'by' variables are the same as names of result elements")
      out <- data.frame(byvars, res)
    }
  }
  else {
    out <- fun(x[on])
    if(simplify) out <- as.data.frame(as.list(out))
  }
  out
}
