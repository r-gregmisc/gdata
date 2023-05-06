## The setup seems to be quite messy, but it is so to enable use of this in
## several ways as shown below.

## 1. "R CMD check" should be the most authoritative way to run the RUnit
## tests for a developer. RUnit tests are issued during R CMD check of the
## package due to example section of .runRUnitTests() function. If any test
## fails or if there are any R errors during RUnit testing, R CMD check fails.
## These are variable values specific for this way:
##  - .path DEVEL/PATH/PKG.Rcheck/PKG/unitTests
##  - .way  function

## 2. Running ".runRUnitTests()" from within R after library(PKG) is handy for
## package useRs, since it enables useRs to be sure that all tests pass for
## their installation. This is just a convenient wrapper function to run
## the RUnit testing suite. These are variable values specific for this
## way:
##  - .path INSTALL/PATH/PKG/unitTests
##  - .way  function

## 3. The "Shell" is another possibility, mainly for a developer in order to
## skip possibly lengthy R CMD check and perform just RUnit testing with an
## installed version of a pcakage. These are variable values specific for
## this way:
##  - .path DEVEL/PATH/PKG/inst/unitTests
##  - .way  shell
##
## Rscript runRUnitTests.R
## R CMD BATCH runRUnitTests.R
## make
## make all

PKG  <- "gdata"

if(require("RUnit", quietly=TRUE)) {
  path <- normalizePath("unitTests")

  cat("\nRunning unit tests\n")
  print(list(pkg=PKG, getwd=getwd(), pathToUnitTests=path))

  library(package=PKG, character.only=TRUE)

  testFileRegexp <- "^runit.+\\.[rR]$"

  ## Debugging echo
  cat("\nRunning RUnit tests\n")
  print(list(pkg=PKG, getwd=getwd(), pathToRUnitTests=path))

  ## Define tests
  testSuite <- defineTestSuite(name=paste(PKG, "RUnit testing"), dirs=path,
                               testFileRegexp=testFileRegexp)

  ## Run
  tests <- runTestSuite(testSuite)

  if(file.access(path, 02) != 0) {
    ## Cannot write to path -> use writable one
    tdir <- tempfile(paste(PKG, "RUnitTests", sep="_"))
    dir.create(tdir)
    pathReport <- file.path(tdir, "report")
  } else {
    pathReport <- file.path(path, "report")
  }

  ## Print results:
  printTextProtocol(tests)
  printTextProtocol(tests, fileName=paste0(pathReport, ".txt"))

  ## Print HTML Version of results:
  printHTMLProtocol(tests, fileName=paste0(pathReport, ".html"))

  cat("\nRUnit reports also written to\n",
      pathReport, ".(txt|html)\n\n", sep="")

  ## Return stop() to cause R CMD check stop in case of
  ##  - failures i.e. FALSE to RUnit tests or
  ##  - errors i.e. R errors
  tmp <- getErrors(tests)
  if(tmp$nFail > 0 || tmp$nErr > 0) {
    stop("\n\nRUnit testing failed:\n",
         " - #test failures: ", tmp$nFail, "\n",
         " - #R errors: ",  tmp$nErr, "\n\n")
  }
} else {
  cat("R package 'RUnit' cannot be loaded - no unit tests run\n",
      "for package", PKG, "\n")
}
