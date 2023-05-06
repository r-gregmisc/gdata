## findPerl attempts to locate a valid perl executable

findPerl <- function(perl, verbose = "FALSE")
{
  errorMsg <- c("perl executable not found; ",
                "use perl= argument to specify the correct path")

  if (missing(perl))
  {
    perl = "perl"
  }

  perl = Sys.which(perl)
  if (perl=="" || perl=="perl")
    stop(errorMsg)

  if (.Platform$OS == "windows") {
    if (length(grep("rtools", tolower(perl))) > 0) {
      perl.ftype <- shell("ftype perl", intern = TRUE)
      if (length(grep("^perl=", perl.ftype)) > 0) {
        perl <- sub('^perl="([^"]*)".*', "\\1", perl.ftype)
      }
    }
  }

  if (verbose)
    cat("Using perl at", perl, "\n")

  perl
}
