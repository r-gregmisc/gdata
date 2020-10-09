runPerlScript <- function(script, args=NULL, perl="perl", verbose=FALSE)
{
  ## determine proper path to perl executable
  perl <- if (missing(perl))
    findPerl(verbose = verbose)
  else
    findPerl(perl, verbose = verbose)
  
  # system.file can't be used to to generate the full path when
  # the script may be a soft-link to a file with a different name
  # because it gets the name of the target of the link.  In particular
  # 5 of the perl scripts in this package are actually links to 
  # only two perl files, which use the name of the executed script
  # to decide how to act.
  script_path <- file.path(
    system.file("perl", package='gdata'),
    script
    )
  
  if(length(script_path)==0)
    stop("Unable to locate perl script '", script, "'" )

  if(missing(args) || length(args)==0)
    args <- NULL
  else 
    args <- paste(
      sapply(args, shQuote),
      sep=" "
    )

  cmd <- paste(shQuote(perl), shQuote(script_path), args, sep=" ")
  
  if(verbose)
  {
    if(length(args)==0)
      message("Executing perl script '", script_path ,"'.")
    else
      message("Executing perl script '", script_path ,"'")
      message("with arguments ", paste0(args, collapse=", "), ".")
  }
  
  output <- system(cmd, intern=TRUE)
  
  if(verbose) 
    message("Results: '", output, "'\n")

  output  
}