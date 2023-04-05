\name{mv}
\alias{mv}
\title{
  Rename an Object
}
\description{
  Rename an object.
}
\usage{
mv(from, to, envir = parent.frame())
}
\arguments{
  \item{from}{Character scalar giving the source object name}
  \item{to}{Character scalar giving the desination object name}
  \item{envir}{Environment in which to do the rename} 
}
\details{
  This function renames an object by the value of object \code{a} to the name \code{b}, and removing \code{a}.
}
\value{
  Invisibly returns the value of the object.
}
\author{
  Gregory R. Warnes \email{greg@warnes.net}
}
\seealso{
  \code{\link[base]{rm}}, \code{\link[base]{assign}}  
}
\examples{
  a <- 1:10
  a
  mv("a", "b")
  b
  exists("a")
}
\keyword{environment}
\keyword{data}
