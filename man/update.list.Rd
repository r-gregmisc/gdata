\name{update.list}
\alias{update.list}
\alias{update.data.frame}
\title{Update the elements of a list, or rows of a data frame}
\description{
  For a list, update the elements of a list to contain all of the named elements
  of a new list, overwriting elements with the same name, and (optionally)
  copying unnamed elements. For a data frame, replace the rows of a data frame
  by corresponding rows in 'new' with the same value for 'by'.
}
\usage{
\method{update}{list}(object, new, unnamed=FALSE, \dots)
\method{update}{data.frame}(object, new, by, by.x=by, by.y=by,
       append=TRUE, verbose=FALSE, \dots)
}
\arguments{
  \item{object}{List or data frame to be updated.}
  \item{new}{List or data frame containing new elements/rows.}
  \item{unnamed}{Logical. If \code{TRUE}, unnamed list elements of \code{new}
    will be appended to \code{object}.}
  \item{by, by.x, by.y}{Character. Name of column to use for matching
    data frame rows.}
  \item{append}{Logical. If \code{TRUE}, items in \code{new} with no match
    in \code{object} will be appended to the data frame.}
  \item{verbose}{Logical. If \code{TRUE} progress messages will be displayed.}
  \item{\dots}{optional method arguments (ignored).}
}
\note{
  These methods can be called directly or as via the S3 base method for
  \code{update}.
}
\value{
  \item{update.list}{a list a constructed from the elements of \code{object},
    with named elements of \code{new} replacing corresponding named elements
    from \code{object}, and non-corresponding elements of \code{new} appended.
    If \code{unnamed=TRUE}, unnamed elements of \code{new} will be appended.}
  \item{update.data.frame}{a data frame constructed from the rows of
    \code{object} with rows where values in \code{by.x} equal the values
    in \code{by.y} replaced by the corresponding row in \code{new}. If
    \code{append=TRUE}, any elements of \code{new} without no matching
    rows in \code{object} will be appended.}
}
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{
  \code{\link[stats]{update}}, \code{\link[base]{merge}}
}
\examples{
# Update list
old <- list(a=1,b="red",c=1.37)
new <- list(b="green",c=2.4)

update(old, new)
update.list(old,new)  # equivalent

older <- list(a=0, b="orange", 4, 5, 6)
newer <- list(b="purple", 7, 8, 9)
update(older, newer)               # ignores unnamed elements of newer
update(older, newer, unnamed=TRUE) # appends unnamed elements of newer

# Update data frame
old <- data.frame(letter=letters[1:5], number=1:5)
new <- data.frame(letter=letters[c(5, 1, 7)], number=c(-5, -1, -7))

update(old, new, by="letter") # default is append=TRUE
update(old, new, by="letter", append=FALSE)
update(old, new, by="letter", verbose=FALSE)
}
\keyword{data}
\keyword{manip}
