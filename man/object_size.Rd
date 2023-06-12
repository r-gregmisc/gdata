\name{object_size}
\alias{object_size}
\alias{c.object_sizes}
\alias{as.object_sizes}
\alias{is.object_sizes}
\alias{format.object_sizes}
\alias{print.object_sizes}
\alias{object.size}
\title{Report the Space Allocated for Objects}
\description{
  Provides an estimate of the memory that is being used to store \R objects.
}
\usage{
object_size(\dots)

\method{is}{object_sizes}(x)

\method{as}{object_sizes}(x)

\method{c}{object_sizes}(\dots, recursive=FALSE)

\method{format}{object_sizes}(x, humanReadable=getOption("humanReadable"),
       standard="IEC", units, digits=1, width=NULL, sep=" ",
       justify=c("right", "left"), \dots)

\method{print}{object_sizes}(x, quote=FALSE,
      humanReadable=getOption("humanReadable"), standard="IEC", units, digits=1,
      width=NULL, sep=" ", justify=c("right", "left"), \dots)
}
\arguments{
  \item{\dots}{\code{object_size}: \R objects;
    \code{print} and \code{format}: arguments to be passed to other methods.}
  \item{x}{output from \code{object_size}.}
  \item{quote}{whether or not the result should be printed with
    surrounding quotes.}
  \item{humanReadable}{whether to use the \dQuote{human readable} format.}
  \item{standard,units,digits,width,sep,justify}{passed to
    \code{\link{humanReadable}}.}
  \item{recursive}{passed to the \code{\link[base]{c}} method.}
}
\value{
  A numeric vector class \code{c("object_sizes", "numeric")} containing
  estimated memory allocation attributable to the objects in bytes.
}
\details{
  The base R package \code{utils} provides an \code{object.size}
  function that handles a single object. The \code{gdata} package
  provides a similar \code{object_size} function that handles multiple
  objects.

  Both the \code{utils} and \code{gdata} implementations store the
  object size in bytes, but offer a slightly different user interface
  for showing the object size in other formats. The \code{gdata}
  implementation offers human readable format similar to \code{ls},
  \code{df} or \code{du} shell commands, by calling \code{humanReadable}
  directly, calling \code{print} with the argument
  \code{humanReadable=TRUE}, or by setting
  \code{options(humanReadable=TRUE)}.

  The 3.0.0 release of \code{gdata} renamed this function to
  \code{object_size}, allowing users to explicitly call the \code{gdata}
  implementation. This eliminates ambiguity and makes it less likely to
  get errors when running parts of an existing script without first
  loading the \code{gdata} package. The old \code{object.size} function
  name is now deprecated in the \code{gdata} package, pointing users to
  \code{object_size} and \code{utils::gdata} instead.
}
\seealso{
  \code{\link[utils]{object.size}} in package 'utils' for the base R
  implementation,
  \code{\link{Memory-limits}} for the design limitations on object size,
  \code{\link{humanReadable}} for human readable format.
}
\examples{
object_size(letters)
object_size(ls)

# Find the 10 largest objects in the base package
allObj <- sapply(ls("package:base"), function(x)
  object_size(get(x, envir=baseenv())))
(bigObj <- as.object_sizes(rev(sort(allObj))[1:10]))
print(bigObj, humanReadable=TRUE)

as.object_sizes(14567567)

oldopt <- options(humanReadable=TRUE)
(z <- object_size(letters,
                  c(letters, letters),
                  rep(letters, 100),
                  rep(letters, 10000)))
is.object_sizes(z)
as.object_sizes(14567567)
options(oldopt)

# Comparison
# gdata
print(object_size(loadNamespace), humanReadable=TRUE)
print(bigObj, humanReadable=TRUE)
# utils
print(utils::object.size(loadNamespace), units="auto")
sapply(bigObj, utils:::format.object_size, units="auto")
# ll
ll("package:base")[order(-ll("package:base")$KB)[1:10],]
}
\keyword{utilities}
