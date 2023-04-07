library(gdata)

fp <- try(gdata:::findPerl(), silent = TRUE)
if(is(fp, "try-error"))
{
  message(
    "****************************************************\n",
    "** Unable to locale Perl executable.\n",
    "** Skipping test -- Expect diffs.\n",
    "****************************************************\n"
  )
  quit(save="no")
}

if ( ! 'XLS' %in% xlsFormats() )
{
  message(
    "****************************************************\n",
    "** Perl support for reading XLS files missing. ",
    "** Skipping test -- Expect diffs.\n",
    "****************************************************\n"
  )
  quit(save=FALSE)
}

packageFile <- function(...) system.file(..., package="gdata")

# iris.xls is included in the gregmisc package for use as an example
xlsfile <- packageFile('xls','iris.xls')

iris.1 <- read.xls(xlsfile) # defaults to csv format
iris.1

iris.2 <- read.xls(xlsfile,method="csv") # specify csv format
iris.2

iris.3 <- read.xls(xlsfile,method="tab") # specify tab format
iris.3

stopifnot(all.equal(iris.1, iris.2))
stopifnot(all.equal(iris.1, iris.3))

exampleFile <- packageFile('xls', 'ExampleExcelFile.xls')

# see the number and names of sheets:
sheetCount(exampleFile)
sheetNames(exampleFile)


example.1 <- read.xls(exampleFile, sheet=1) # default is first worksheet
example.1

example.2 <- read.xls(exampleFile, sheet=2) # second worksheet by number
example.2

example.3 <- read.xls(exampleFile, sheet=3, header=FALSE) # third worksheet by number
example.3

example.4 <- read.xls(exampleFile, sheet=4, header=FALSE) # fourth worksheet by number
example.4

## Check handling of skip.blank.lines=FALSE

example.skip <- read.xls(exampleFile, sheet=2, blank.lines.skip=FALSE)
example.skip

## Check handing of fileEncoding for latin-1 characters

latin1File  <- packageFile('xls', 'latin-1.xls' )

if(.Platform$OS.type=="unix")
  {
      example.latin1 <- read.xls(latin1File,
                                 fileEncoding='latin1',
                                 encoding='latin1',
                                 stringsAsFactors=FALSE)
  } else {
      example.latin1 <- read.xls(latin1File,
                                        #fileEncoding='latin1',
                                 encoding='latin1',
                                 stringsAsFactors=FALSE)
  }

## Check handling of very wide file

wideFile  <- packageFile('xls', 'wide.xls' )
wideFileX <- packageFile('xls', 'wide.xlsx')

example.wide <- read.xls(wideFile)
stopifnot(dim(example.wide)==c(0,256))

## Check handling of files with dates calculated relative to
## 1900-01-01 and 1904-01-01

file.1900  <- packageFile('xls', 'ExampleExcelFile_1900.xls' )
file.1904  <- packageFile('xls', 'ExampleExcelFile_1904.xls' )

example.1900 <- read.xls(file.1900, sheet=3, header=FALSE)
example.1900

example.1904 <- read.xls(file.1904, sheet=3, header=FALSE)
example.1904

# All columns should be identical *except* column 8
stopifnot( na.omit(example.1900 [,-8] == example.1904 [,-8]) )

# Column 8 will differ by 1462 due to different date baselines (1900 vs 1904)
stopifnot( na.omit(example.1900 [,8] - example.1904 [,8]) == 1462 )

