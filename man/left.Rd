\name{left}
\alias{right}
\alias{left}
\alias{right.data.frame}
\alias{left.data.frame}
\alias{right.matrix}
\alias{left.matrix}
\title{Return the leftmost or rightmost columns of a matrix or data frame}
\description{
  Return the leftmost or rightmost or  columns of a matrix or data frame
}
\usage{
right(x, n = 6L, \dots)
left(x, n=6L, \dots)

\method{right}{matrix}(x, n=6L, add.col.nums=TRUE, \dots)
\method{left}{matrix}(x, n=6L, add.col.nums=TRUE, \dots)

\method{right}{data.frame}(x, n=6L, add.col.nums=TRUE, \dots)
\method{left}{data.frame}(x, n=6L, add.col.nums=TRUE, \dots)
}
\arguments{
  \item{x}{Matrix or data frame}
  \item{n}{If positive, number of columns to return. If negative, number
    of columns to omit. See examples.}
  \item{add.col.nums}{Logical. If no column names are present,
    add names giving original column number. (See example below.)}
  \item{\dots}{Additional arguments used by methods}
}
\value{
  An object consisting of the leftmost or rightmost  \code{n} columns
  of \code{x}.
}
\author{
  Gregory R. Warnes \email{greg@warnes.net}
}
\seealso{
  \code{\link{first}},
  \code{\link{last}},
  \code{\link[utils]{head}},
  \code{\link[utils]{tail}}
}
\examples{
m <- matrix(1:100, ncol=10)
colnames(m) <- paste("Col",1:10, sep="_")

left(m)
right(m)

# When no column names are present, they are added by default
colnames(m) <- NULL

left(m)
colnames(left(m))

right(m)
colnames(right(m))

# Prevent addition of column numbers
left(m, add.col.nums = FALSE)
colnames(left(m, add.col.nums = FALSE))

right(m, add.col.nums = FALSE)            # columns are labeled 1:6
colnames(right(m, add.col.nums = FALSE))  #   instead of 5:10

# Works for data frames too!
d <- data.frame(m)
left(d)
right(d)

# Use negative n to specify number of columns to omit
left(d, -3)
right(d, -3)
}
\keyword{manip}
