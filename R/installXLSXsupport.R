installXLSXsupport <- function(perl="perl", verbose=FALSE)
{
  .Deprecated(old="gdata support for Excel files",
              new="other packages, such as openxlsx, readxl, XLConnect, or xlsx")
  if(verbose)
      message("Attempting to install Perl libraries to support XLSX (Excel 2007+) file format..")

  output <- runPerlScript("install_modules.pl", perl=perl, verbose=verbose)

  if( "XLSX" %in% xlsFormats(perl=perl, verbose=verbose) )
	{
		message("Perl XLSX support libraries successfully installed.")
		invisible(TRUE)
	}
  else
	{
	  stop("\nUnable to install Perl XLSX support libraries.\n\n")
		invisible(FALSE)                
	}		
  
}
