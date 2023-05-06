\name{interleave}
\alias{interleave}
\title{Interleave Rows of Data Frames or Matrices}
\description{
  Interleave rows of data frames or matrices.
}
\usage{
interleave(\dots, append.source=TRUE, sep=": ", drop=FALSE)
}
\arguments{
  \item{\dots}{objects to be interleaved.}
  \item{append.source}{boolean flag. When \code{TRUE} (the default) the
    argument name will be appended to the row names to show the source of
    each row.}
  \item{sep}{separator between the original row name and the object name.}
  \item{drop}{boolean flag - when TRUE, matrices containing one column
    will be converted to vectors.}
}
\details{
  This function creates a new matrix or data frame from its arguments.

  The new object will have all of the rows from the source objects
  interleaved. Starting with row 1 of object 1, followed by row 1
  of object 2, \ldots, row 1 of object 'n', row 2 of object 1, row 2 of
  object 2, \ldots, row 2 of object 'n', etc.
}
\value{
  Matrix containing the interleaved rows of the function arguments.
}
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{\code{\link{cbind}}, \code{\link{rbind}}, \code{\link{combine}}}
\examples{
# Simple example
a <- matrix(1:10,ncol=2,byrow=TRUE)
b <- matrix(letters[1:10],ncol=2,byrow=TRUE)
c <- matrix(LETTERS[1:10],ncol=2,byrow=TRUE)
interleave(a,b,c)

# Create a 2-way table of means, standard errors, and nobs
g1 <- sample(letters[1:5], 1000, replace=TRUE)
g2 <- sample(LETTERS[1:3], 1000, replace=TRUE)
dat <- rnorm(1000)

stderr <- function(x) sqrt(var(x,na.rm=TRUE) / nobs(x))

means   <- tapply(dat, list(g1, g2), mean)
stderrs <- tapply(dat, list(g1, g2), stderr)
ns      <- tapply(dat, list(g1, g2), nobs)
blanks <- matrix(" ", nrow=5, ncol=3)

tab <- interleave("Mean"=round(means,2),
                  "Std Err"=round(stderrs,2),
                  "N"=ns, " "=blanks, sep=" ")
print(tab, quote=FALSE)

# Using drop to control coercion to a lower dimensions
m1 <- matrix(1:4)
m2 <- matrix(5:8)

interleave(m1, m2, drop=TRUE)   # this will be coerced to a vector
interleave(m1, m2, drop=FALSE)  # this will remain a matrix
}
\keyword{category}
\keyword{array}
