\name{ll}
\alias{ll}
\title{Describe Objects or Elements}
\description{
  Display name, class, size, and dimensions of each object in a given
  environment. Alternatively, if the main argument is an object, its
  elements are listed and described.
}
\usage{
ll(pos=1, unit="KB", digits=0, dim=FALSE, sort=FALSE, class=NULL,
   invert=FALSE, ...)
}
\arguments{
  \item{pos}{environment position number, environment name, data frame,
    list, model, S4 object, or any object that \code{is.list}.}
  \item{unit}{unit for displaying object size: "B", "KB", "MB", "GB", or
    first letter (case-insensitive).}
  \item{digits}{number of decimals to display when rounding object
    size.}
  \item{dim}{whether object dimensions should be returned.}
  \item{sort}{whether elements should be sorted by name.}
  \item{class}{character vector for limiting the output to specified
    classes.}
  \item{invert}{whether to invert the \code{class} filter, so specified
    classes are excluded.}
  \item{...}{passed to \code{ls}.}
}
\value{
  A data frame with named rows and the following columns:
  \item{Class}{object class.}
  \item{KB}{object size \emph{(see note)}.}
  \item{Dim}{object dimensions \emph{(optional)}.}
}
\note{The name of the object size column is the same as the unit used.}
\author{Arni Magnusson, with contributions by Jim Rogers and Michael
  Chirico.}
\seealso{
  \code{ll} is a verbose alternative to \code{\link{ls}} (objects in an
  environment), \code{\link{names}} (elements in a list-like object),
  and \code{\link{slotNames}} (S4 object).

  \code{\link{str}} and \code{\link{summary}} also describe elements in
  a list-like objects.

  \code{\link{env}} is a related function that describes all loaded
  environments.
}
\examples{
ll()
ll(all=TRUE)
ll("package:base")
ll("package:base", class="function", invert=TRUE)

ll(infert)
model <- glm(case~spontaneous+induced, family=binomial, data=infert)
ll(model, dim=TRUE)
ll(model, sort=TRUE)
ll(model$family)
}
% Basics
\keyword{data}
\keyword{attribute}
\keyword{classes}
\keyword{list}
% Programming
\keyword{environment}
\keyword{print}
\keyword{utilities}
