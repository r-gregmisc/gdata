\name{update.list}
\alias{update.list}
\alias{update.data.frame}
\title{
  Update the elements of a list
}
\description{
 Function to update the elements of a list to contain all of the named elements
 of a new list, overwriting elements with the same name, and (optionally) copying unnamed
 elements.
 }
\usage{
update.list(object, new, unnamed=FALSE, ...)
\method{update}{list}(object, new, unnamed=FALSE, ...)
\method{update}{data.frame}(object, new, unnamed=FALSE, ...)
}
\arguments{
  \item{object}{List to be updated.}
  \item{new}{List containing new elements.}
  \item{unnamed}{Logical. If \code{TRUE}, unnamed elements of \code{new} will be appended to \code{object}}
  \item{...}{optional method arguments (ignored)}
}
\note{
  This method can be called directly, or as via the S3 base method for \code{update}.
}
\value{
A constructed from the elements of \code{object}, with named elements of \code{new} replacing corresponding named elements from \code{object}, and non-corresponding elements of \code{new} appended.   If \code{unnamed=TRUE}, unnamed elements of \code{new} will be appended.
}
\author{
Gregory R. Warnes \email{greg@warnes.net}
}
\seealso{
\code{\link[stats]{update}}, \code{\link[base]{merge}}
}
\examples{
old <- list(a=1,b="red",c=1.37)
new <- list(b="green",c=2.4)

update(old, new)
update.list(old,new)  # equivalent

older <- list(a=0, b="orange", 4, 5, 6)
newer <- list(b="purple", 7, 8, 9)
update(older, newer)               # ignores unnamed elements of newer
update(older, newer, unnamed=TRUE) # appends unnamed elements of newer
}
\keyword{data}
\keyword{manip}
