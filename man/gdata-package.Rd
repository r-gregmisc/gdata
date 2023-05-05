\name{gdata-package}
\alias{gdata-package}
\alias{gdata}
\docType{package}
\title{Various R Programming Tools for Data Manipulation}
\description{
Various R programming tools for data manipulation, including:
  \itemize{
    \item Medical unit conversions: \code{\link{ConvertMedUnits}},
      \code{\link{MedUnits}}
    \item Combining objects: \code{link{bindData}},
      \code{\link{cbindX}}, \code{\link{combine}},
      \code{\link{interleave}}
    \item Character vector operations: \code{\link{centerText}},
      \code{\link{startsWith}}, \code{\link{trim}}
    \item Factor manipulation: \code{\link{levels}},
      \code{\link{reorder.factor}}, \code{\link{mapLevels}}
    \item Obtaining information about R objects:
      \code{\link{object.size}}, \code{\link{env}},
      \code{\link{humanReadable}}, \code{\link{is.what}},
      \code{\link{ll}}, \code{\link{keep}}, \code{\link{ls.funs}},
      \code{\link{Args}}, \code{\link{nPairs}}, \code{\link{nobs}}
    \item Manipulating MS-Excel formatted files: \code{\link{read.xls}},
      \code{\link{installXLSXsupport}}, \code{\link{sheetCount}},
      \code{\link{xlsFormats}}
    \item Generating fixed-width format files: \code{\link{write.fwf}}
    \item Extracting components of date & time objects:
      \code{\link{getYear}}, \code{\link{getMonth}},
      \code{\link{getDay}}, \code{\link{getHour}}, \code{\link{getMin}},
      \code{\link{getSec}}
    \item Operations on columns of data frames: \code{\link{matchcols}},
      \code{\link{rename.vars}}
    \item Matrix operations: \code{\link{unmatrix}},
      \code{\link{upperTriangle}}, \code{\link{lowerTriangle}}
    \item Operations on vectors: \code{\link{case}},
      \code{\link{unknownToNA}}, \code{\link{duplicated2}},
      \code{\link{trimSum}}
    \item Operations on data frames: \code{\link{frameApply}},
      \code{\link{wideByFactor}}
    \item Value of last evaluated expression: \code{\link{ans}}
    \item Wrapper for \code{sample} that ensures consistent behavior for
      both scalar and vector arguments: \code{\link{resample}}
  }
}
\note{\code{browseVignettes()} shows package vignettes.}
\author{
  Gregory R. Warnes, Gregor Gorjanc, Arni Magnusson, Liviu Andronic, Jim
  Rogers, Don MacQueen, and Ales Korosec, with contributions by Ben
  Bolker, Michael Chirico, Gabor Grothendieck, Thomas Lumley, and Brian
  Ripley.
}
\keyword{package}
