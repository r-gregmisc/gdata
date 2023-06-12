\name{startsWith}
\alias{startsWith}
\alias{starts_with}
\title{Does String Start or End With Another String?}
\description{
  Determines if entries of \code{x} start with a string \code{prefix},
  where strings are recycled to common lengths.
}
\usage{
startsWith(x, prefix, trim=FALSE, ignore.case=FALSE)
}
\arguments{
  \item{x}{character vector whose \dQuote{starts} are considered.}
  \item{prefix}{character vector, typicall of length one, i.e., a string.}
  \item{trim}{whether leading and trailing spaces should be removed from
    \code{x} before testing for a match.}
  \item{ignore.case}{whether case should be ignored when testing for a
    match.}
}
\value{
  A logical vector, of \dQuote{common length} of \code{x} and
  \code{prefix}, i.e., of the longer of the two lengths unless one of
  them is zero when the result is also of zero length.  A shorter input
  is recycled to the output length.
}
\note{
  The \code{base} package provides the underlying \code{startsWith}
  function that performs the string comparison. The \code{gdata} package
  adds the \code{trim} and \code{ignore.case} features.

  An alias function \code{starts_with} is also provided, equivalent to
  \code{gdata::startsWith}. Using \code{starts_with} in scripts makes it
  explicitly clear that the \code{gdata} implementation is being used.
}
\author{
  Gregory R. Warnes \email{greg@warnes.net}
}
\seealso{
  \code{\link[base]{startsWith}} for the 'base' package implementation,
  \code{\link[base]{grepl}}, \code{\link{substring}}
}
\examples{
## Simple example
startsWith("Testing", "Test")

## Vector examples
s <- c("Testing", " Testing", "testing", "Texting")
names(s) <- s

startsWith(s, "Test")        # " Testing", "testing", and "Texting" do not match
startsWith(s, "Test", trim=TRUE)        # Now " Testing" matches
startsWith(s, "Test", ignore.case=TRUE) # Now "testing" matches

# Comparison
# gdata
startsWith(s, "Test", trim=TRUE)
startsWith(s, "Test", ignore.case=TRUE)
# base
startsWith(trimws(s), "Test")
startsWith(tolower(s), tolower("Test"))
}
\keyword{character}
