\name{nobs}
\alias{nobs}
\alias{n_obs}
\alias{nobs.data.frame}
\alias{nobs.default}
\alias{nobs.lm}
\title{Compute the Number of Non-Missing Observations}
\description{
  Compute the number of non-missing observations. Provides a new default
  method to handle numeric and logical vectors, and a method for data frames.
}
\usage{
nobs(object, \dots)
\method{nobs}{default}(object, \dots)
\method{nobs}{data.frame}(object, \dots)
\method{nobs}{lm}(object, \dots)
n_obs(object, \dots)
}
\arguments{
  \item{object}{Numeric or logical vector, data frame, or a model object.}
  \item{\dots}{Further arguments to be passed to methods.}
}
\value{
  Either single numeric value (for vectors) or a vector of numeric
  values (for data frames) giving the number of non-missing values.
}
\note{
  The base R package \code{stats} provides a generic \code{nobs}
  function with methods for fitted model objects. The \code{gdata}
  package adds methods for numeric and logical vectors, as well as data
  frames.

  An alias function \code{n_obs} is also provided, equivalent to
  \code{gdata::nobs}. Using \code{n_obs} in scripts makes it explicitly
  clear that the \code{gdata} implementation is being used.
}
\author{Gregory R. Warnes \email{greg@warnes.net}}
\seealso{
  \code{\link[stats]{nobs}} in package 'stats' for the base R implementation,
  \code{\link{is.na}}, \code{\link{length}}
}
\examples{
x <- c(1, 2, 3, 5, NA, 6, 7, 1, NA)
length(x)
nobs(x)

df <- data.frame(x=rnorm(100), y=rnorm(100))
df[1,1] <- NA
df[1,2] <- NA
df[2,1] <- NA
nobs(df)

fit <- lm(y~x, data=df)
nobs(fit)
n_obs(fit)

# Comparison
# gdata
nobs(x)
nobs(df)
# stats
length(na.omit(x))
sapply(df, function(x) length(na.omit(x)))
}
\keyword{attribute}
