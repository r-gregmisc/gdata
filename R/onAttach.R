.onAttach <- function(libname, pkgname)
{
  showMessage <- function(...)
    packageStartupMessage(
      paste(
        strwrap(x = list(...), 
                prefix = "gdata: "), 
        collapse="\n",
        sep="\n"
      )
    ) 
  
  try(
    {
      ## 1 - Can we access perl?
      hasPerl <- try( findPerl(), silent=TRUE)
      if(inherits(hasPerl, "try-error"))
        showMessage(
          "
        Unable to locate valid perl interpreter
        \n
        \n
        read.xls() will be unable to read Excel XLS and XLSX files
        unless the 'perl=' argument is used to specify the location of
        a valid perl intrpreter.
        \n
        \n
        (To avoid display of this message in the future, please ensure perl
         is installed and available on the executable search path.)
        ")
      
      ## 2 - Are the libraries for XLS present?
      formats <- try(xlsFormats(),silent=TRUE)
      showInstMsg <- FALSE
      if( !("XLS" %in% formats) )
      {
        showMessage(
          "Unable to load perl libaries needed by read.xls()",
          " to support 'XLX' (Excel 97-2004) files."
        )
        showInstMsg <- TRUE
      }
      else
      {
        showMessage(
          "read.xls support for 'XLS'  (Excel 97-2004) files ENABLED.")
      }
      
      ## 3 - Are the libraries for XLSX present?
      if( !("XLSX" %in% formats) )
      {
        showMessage(
          "Unable to load perl libaries needed by read.xls()",
          " to support 'XLSX' (Excel 2007+) files."
        )
        showInstMsg <- TRUE
      }
      else
      {
        showMessage(
          "read.xls support for 'XLSX' (Excel 2007+)   files ENABLED."
        )
      }

      if(showInstMsg)
      {
        showMessage(
          " Run the function 'installXLSXsupport()'",
          " to automatically download and install the perl",
          " libaries needed to support Excel XLS and XLSX formats."
        )
      }
      
    })
  
}
