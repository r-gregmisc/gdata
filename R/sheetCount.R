sheetCount <- function(xls, verbose = FALSE, perl = "perl") {
  
  .Deprecated(old="gdata support for Excel files",
              new="other packages, such as openxlsx, readxl, XLConnect, or xlsx")
  perl <- if (missing(perl)) 
    findPerl(verbose = verbose)
  else 
    findPerl(perl, verbose = verbose)
  
  sheetCmd(xls, cmd="sheetCount.pl", verbose=verbose, perl=perl)
}

sheetNames <- function(xls, verbose = FALSE, perl = "perl") {
  
  .Deprecated(old="gdata support for Excel files",
              new="other packages, such as openxlsx, readxl, XLConnect, or xlsx")
  perl <- if (missing(perl)) 
    findPerl(verbose = verbose)
  else
    findPerl(perl, verbose = verbose)
  
  sheetCmd(xls, cmd="sheetNames.pl", verbose=verbose, perl=perl)
}

sheetCmd <- function(xls, cmd="sheetCount.pl", verbose=FALSE, perl="perl")
{
  
  ## Handle URLs 
  tf <- NULL
  if ( 
    startsWith(xls, "https://") ||
    startsWith(xls, "http://") ||
    startsWith(xls, "ftp://")
  )
  {
    tf <- paste(tempfile(), "xls", sep = ".")
    
    if(verbose)
      message("Downloading",
              dQuote(xls), " to ",
              dQuote(tf), "..")
    else
      message("Downloading...\n")
    
    download.file(xls, tf, mode = "wb")
    
    message("Done.\n")
    xls <- tf
  }
  
  ## Run Perl to do the translation
  if(verbose)
  {
    message("Extracting sheet information from ", dQuote(xls), ".." )
  }
  
  output <- runPerlScript(cmd, args=xls, perl=perl, verbose = verbose)
  
  ## Parse the output
  tc <- textConnection(output)
  results <- read.table(tc, as.is=TRUE, header=FALSE)
  close(tc)
  results <- unlist(results)
  names(results) <- NULL
  
  ##
  if (verbose) message("Done.")
  
  results
}


