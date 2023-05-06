\name{getYear}
\alias{getDateTimeParts}
\alias{getYear}
\alias{getYear.default}
\alias{getYear.Date}
\alias{getYear.POSIXct}
\alias{getYear.POSIXlt}
\alias{getMonth}
\alias{getMonth.default}
\alias{getMonth.Date}
\alias{getMonth.POSIXct}
\alias{getMonth.POSIXlt}
\alias{getDay}
\alias{getDay.default}
\alias{getDay.Date}
\alias{getDay.POSIXct}
\alias{getDay.POSIXlt}
\alias{getHour}
\alias{getHour.default}
\alias{getMin}
\alias{getMin.default}
\alias{getSec}
\alias{getSec.default}
\title{Get date/time parts from date and time objects}
\description{
  Experimental approach for
  extracting the date/time parts from objects of a date/time class.
  They are designed to be intiutive and thus lowering the learning
  curve for work with date and time classes in \R{}.}
\usage{
getYear(x, format, \dots)
getMonth(x, format, \dots)
getDay(x, format, \dots)
getHour(x, format, \dots)
getMin(x, format, \dots)
getSec(x, format, \dots)
}
\arguments{
  \item{x}{generic, date/time object}
  \item{format}{character, format}
  \item{\dots}{arguments pased to other methods}
}
\value{Character}
\author{Gregor Gorjanc}
\seealso{
  \code{\link{Date}},
  \code{\link{DateTimeClasses}},
  \code{\link{strptime}}
}
\examples{
## Date
tmp <- Sys.Date()
tmp
getYear(tmp)
getMonth(tmp)
getDay(tmp)

## POSIXct
tmp <- as.POSIXct(tmp)
getYear(tmp)
getMonth(tmp)
getDay(tmp)

## POSIXlt
tmp <- as.POSIXlt(tmp)
getYear(tmp)
getMonth(tmp)
getDay(tmp)
}
\keyword{manip}
\keyword{misc}
