getYear <- function(x, format, ...)
  UseMethod("getYear")

getYear.default <- function(x, format, ...)
  stop("'getYear' can only be used on objects of a date/time class")

getYear.Date <-
getYear.POSIXct <-
getYear.POSIXlt <- function(x, format="%Y", ...)
  format(x=x, format=format, ...)

getMonth <- function(x, format, ...)
  UseMethod("getMonth")

getMonth.default <- function(x, format, ...)
  stop("'getMonth' can only be used on objects of a date/time class")

getMonth.Date <-
getMonth.POSIXct <-
getMonth.POSIXlt <- function(x, format="%m", ...)
  format(x=x, format=format)

getDay <- function(x, format, ...)
  UseMethod("getDay")

getDay.default <- function(x, format, ...)
  stop("'getDay' can only be used on objects of a date/time class")

getDay.Date <-
getDay.POSIXct <-
getDay.POSIXlt <- function(x, format="%d", ...)
  format(x=x, format=format)

getHour <- function(x, format, ...)
  UseMethod("getHour")

getHour.default <- function(x, format, ...)
  stop("'getHour' can only be used on objects of a date/time class")

getMin <- function(x, format, ...)
  UseMethod("getMin")

getMin.default <- function(x, format, ...)
  stop("'getMin' can only be used on objects of a date/time class")

getSec <- function(x, format, ...)
  UseMethod("getSec")

getSec.default <- function(x, format, ...)
  stop("'getSec' can only be used on objects of a date/time class")
