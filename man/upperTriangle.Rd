\name{upperTriangle}
\alias{upperTriangle}
\alias{upperTriangle<-}
\alias{lowerTriangle}
\alias{lowerTriangle<-}
\title{Extract or replace the upper/lower triangular portion of a matrix}
\description{
  Extract or replace the upper/lower triangular portion of a matrix
}
\usage{
upperTriangle(x, diag=FALSE, byrow=FALSE)
upperTriangle(x, diag=FALSE, byrow=FALSE) <- value
lowerTriangle(x, diag=FALSE, byrow=FALSE)
lowerTriangle(x, diag=FALSE, byrow=FALSE) <- value
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{Matrix}
  \item{diag}{Logical.  If \code{TRUE}, include the matrix diagonal.}
  \item{byrow}{Logical.  If \code{FALSE}, return/replace elements in 
    column-wise order. If \code{TRUE}, return/replace elements in 
    row-wise order.}
  \item{value}{Either a single value or a vector of length equal to that
    of the current upper/lower triangular.  Should be of a mode which 
    can be coerced to that of \code{x}.}
}

\value{
  \code{upperTriangle(x)} and \code{lowerTriangle(x)} return the upper
  or lower triangle of matrix x, respectively. The assignment forms
  replace the upper or lower triangular area of the
  matrix with the provided value(s).  
  }
\note{
  By default, the elements are returned/replaced in R's default column-wise order.  Thus 
  \preformatted{  lowerTriangle(x) <- upperTriangle(x)}
  will not yield a symmetric matrix.  Instead use:
  \preformatted{  lowerTriangle(x) <- upperTriangle(x, byrow=TRUE)} 
  or equivalently:
  \preformatted{  lowerTriangle(x, byrow=TRUE) <- upperTriangle(x)} 
}
  
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{ 
  \code{\link[base]{diag}},  
  \code{\link[base]{lower.tri}}, 
  \code{\link[base]{upper.tri}}
}
\examples{
  x <- matrix( 1:25, nrow=5, ncol=5)
  x
  upperTriangle(x)
  upperTriangle(x, diag=TRUE)
  upperTriangle(x, diag=TRUE, byrow=TRUE)


  lowerTriangle(x)
  lowerTriangle(x, diag=TRUE)
  lowerTriangle(x, diag=TRUE, byrow=TRUE)

  upperTriangle(x) <- NA
  x

  upperTriangle(x, diag=TRUE) <- 1:15
  x

  lowerTriangle(x) <- NA
  x

  lowerTriangle(x, diag=TRUE) <- 1:15
  x

  ## Copy lower triangle into upper triangle to make 
  ## the matrix (diagonally) symmetric
  x <- matrix(LETTERS[1:25], nrow=5, ncol=5, byrow=TRUE)
  x
  lowerTriangle(x) = upperTriangle(x, byrow=TRUE)
  x
}
\keyword{array}
