\name{update.list}
%%\alias{update}
\alias{update.list}
%%\alias{update.data.frame}
\title{
  Update the elements of a list
}
\description{
 Function to update the elements of a list to contain all of the named elements
 of a new list, overwriting elements with the same name, and (optionally) copying
 unnamed elements.
 }
\usage{
%%update(object,
%%       ...)
\method{update}{list}(object,
       new,
       unnamed=FALSE,
       ...)
%%\method{update}{data.frame}(object,
%%       new,
%%       by,
%%       by.object=by,
%%       by.new=by,
%%       append=TRUE,
%%       verbose=TRUE,
%%       unnamed=FALSE,
%%       ...)
}
\arguments{
  \item{object}{Object to be updated.}
  \item{new}{List or dataframe containing new elements.}
  \item{unnamed}{Logical. If \code{TRUE}, unnamed elements
        of \code{new} will be appended to \code{object}.}
%%   \item{by, by.object, by,new}{For dataframe objects, rows of \code{object}
%%        will be replaced by rows of \code{new} that have the same value
%%        for this \em{one} column.  (See examples below for an example.) }
%%  \item{verbose}{Display details of changes performed.}
  \item{...}{optional method arguments (ignored)}
}
\note{
  This method can be called directly, or as via the S3 base method for \code{update}.
}
\value{A new list constructed from the elements of \code{object} by merging the elements of \code{old} and \code{new} with named items of \code{new} replacing the corresponding elements of \code{old}.  Unnamed elements of \code{new} will be appened unless \code{unnamed=FALSE}.

%%For dataframe objects, entire columns are replaced unless \code{by}, \code{by.object}, or \code{by.new} are supplied, in which case replacement only occures for rows with matching values for the columns listed by these parameters.  The single argument \code{by} can by used to provides column names for that are common to both \code{old} and \code{new} objects, while \code{by.old} and \cody{by.new} specify column names specific to each object.
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

%%data(iris)
%%iris$Species <- as.character(iris$Species)
%%df.old <- cbind(iris[1:5,], letters=1:5)
%%df.new <- df.old[3:5,]
%%df.new$Petal.Width <- df.new$Petal.Width + 0.1
%%
%%df.old
%%df.new
%%update(df.old, df.new, by=c(letters))
}
\keyword{data}
\keyword{manip}
