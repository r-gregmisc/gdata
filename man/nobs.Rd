\name{nobs}
\alias{nobs}  % Now provided by stats
\alias{nobs.data.frame}
\alias{nobs.default}
\alias{nobs.lm}  % Now provided by stats
\title{Compute the Number of Non-missing Observations}
\description{
  Compute the number of non-missing observations. Provides a 'default'
  method to handle vectors, and a method for data frames.
}
\usage{
nobs(object, ...)
\method{nobs}{default}(object, ...)
\method{nobs}{data.frame}(object, ...)
\method{nobs}{lm}(object, ...)
}
\arguments{
  \item{object}{Target Object}
  \item{\dots}{Optional parameters (currently ignored)}
}
\details{
  Calculate the number of observations in \code{object}.

  \itemize{
    \item{For numeric vectors, this is simply the number of non-NA
      elements, as computed by \code{sum(!is.na(object))}.}
    \item{For dataframe objects, the result is a vector containing the
      number of non-NA elementes of each column.}
  }

  The \code{nobs} and \code{nobs.lm} functions defined in gtools are
  simply aliases for the functions in the base R \code{stats} package,
  provided for backwards compatibility.
}
\value{
  Either single numeric value (for vectors) or a vector of numeric
  values (for data.frames) giving the number of non-missing values.
}
\note{
  The base R package \code{stats} now provides a S3 dispatch function for
  \code{nobs}, and methods for for objects of classes "lm", "glm",
  "nls" and "logLik", as well as a default method.

  Since they provided a subset of the the functionality, the base
  method dispatch (\code{nobs}) function and method for "lm" objects
  (\code{nobs.lm}) are, as of \code{gdata} version 2.10.1, simply
  aliases for the equivalent functions in the base R \code{stats}
  package.

  Since \code{gdata}'s default method (\code{nobs.default}) processes
  vectors and hands any other data/object types to
  \code{stats:::nobs.default}.
}
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{\code{\link{is.na}}, \code{\link{length}}}
\examples{
x <- c(1,2,3,5,NA,6,7,1,NA )
length(x)
nobs(x)

df <- data.frame(x=rnorm(100), y=rnorm(100))
df[1,1] <- NA
df[1,2] <- NA
df[2,1] <- NA

nobs(df)

fit <- lm(y ~ x, data=df)
nobs(fit)
}
\keyword{attribute}
