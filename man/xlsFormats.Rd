\name{xlsFormats}
\Rdversion{1.1}
\alias{xlsFormats}
\title{
Check which file formats are supported by read.xls
}
\description{
Check which file formats are supported by read.xls
}
\usage{
xlsFormats(perl = "perl", verbose = FALSE)
}
\arguments{
  \item{perl}{Path to perl interpreter (optional).}
  \item{verbose}{If \code{TRUE}, show additional messages during
    processing.}
}
\value{
  Vector of supported formats, possible elements are 'XLS' and 'XLSX'.
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
   xlsFormats()
   }
}
\keyword{ misc }
