\name{sheetCount}
\Rdversion{1.1}
\alias{sheetCount}
\alias{sheetNames}
\title{
Count or list sheet names in Excel spreadsheet files.
}
\description{
Count or list sheet names in Excel spreadsheet files.
}
\usage{
sheetCount(xls, verbose = FALSE, perl = "perl")
sheetNames(xls, verbose = FALSE, perl = "perl")
}
\arguments{
  \item{xls}{File path to spreadsheet.  Supports "http://",
    "https://", and "ftp://" URLS.}
  \item{verbose}{If \code{TRUE}, show additional messages during
    processing.}
  \item{perl}{Path to perl interpreter.}
}
\value{
  \code{sheetCount} returns the number of sheets in the spreadsheet.
  \code{sheetNames} returns the names of sheets  in the spreadsheet.
}
\section{Warning}{
  Excel file support is deprecated in gdata version 2.19.0, to be
  removed in the near future. At the user level, the functions
  \code{installXLSXsupport}, \code{read.xls}, \code{sheetCount},
  \code{sheetNames}, \code{xls2csv}, \code{xls2sep}, \code{xls2tab},
  \code{xls2tsv}, and \code{xlsFormats} now raise a warning about the
  functionality being deprecated.

  Excel file support was first introduced in gregmisc/gdata 1.11.0 back
  in 2004, but today we have packages such as openxlsx, readxl,
  XLConnect, and xlsx offering dedicated Excel file support with more
  features. When Excel file support will be removed from the gdata
  package, it will result in lighter package maintenance and no more
  Perl warnings on the user side.
}
\seealso{
	\code{\link{read.xls}}, \code{\link{xls2csv}}.
}
\examples{
   \dontrun{
   xlsfile <- system.file("xls", "iris.xls", package = "gdata")
   xlsfile

   sheetCount(xlsfile)
   sheetNames(xlsfile) # no names, so numbers returned

   exampleFile <- system.file('xls', 'ExampleExcelFile.xls', package="gdata")
   sheetCount(exampleFile)
   sheetNames(exampleFile)

   if( 'XLSX' \%in\% xlsFormats() )  # if XLSX is supported..
   {
     exampleFile2007 <- system.file('xls','ExampleExcelFile.xlsx', package="gdata")
     print( sheetCount(exampleFile2007) )
     print( sheetNames(exampleFile2007) )
   }
   }
}
\keyword{ misc }
