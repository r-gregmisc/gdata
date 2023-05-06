\name{ls.funs}
\alias{ls.funs}
\title{List function objects}
\description{
  Return a character vector giving the names of function objects in the
  specified environment.
}
\usage{
ls.funs(\dots)
}
\arguments{
  \item{\dots}{Arguments passed to \code{ls}. See the help for
    \code{\link[base]{ls}} for details.}
}
\details{
  This function calls \code{ls} and then returns a character vector
  containing only the names of only function objects.
}
\value{
  character vector
}
\author{
  Gregory R. Warnes \email{greg@warnes.net}
}
\seealso{
  \code{\link[base]{ls}}, \code{\link[base]{is.function}}
}
\examples{
## List functions defined in the global environment:
ls.funs()

## List functions available in the base package:
ls.funs("package:base")
}
\keyword{misc}
\keyword{environment}
