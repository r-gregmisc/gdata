[![CRAN Status](https://r-pkg.org/badges/version/gdata)](https://cran.r-project.org/package=gdata)
[![CRAN Monthly](https://cranlogs.r-pkg.org/badges/gdata)](https://cran.r-project.org/package=gdata)
[![CRAN Total](https://cranlogs.r-pkg.org/badges/grand-total/gdata)](https://cran.r-project.org/package=gdata)

gdata
=====

Various R programming tools for data manipulation, including:
- medical unit conversions (`ConvertMedUnits`, `MedUnits`),
- combining objects (`bindData`, `cbindX`, `combine`, `interleave`),
- character vector operations (`centerText`, `startsWith`, `trim`),
- factor manipulation (`levels`, `reorder.factor`, `mapLevels`),
- obtaining information about R objects (`object.size`, `env`, `humanReadable`,
  `is.what`, `ll`, `keep`, `ls.funs`, `Args`, `nPairs`, `nobs`),
- manipulating MS-Excel formatted files (`read.xls`, `installXLSXsupport`,
  `sheetCount`, `xlsFormats`),
- generating fixed-width format files (`write.fwf`),
- extracting components of date & time objects (`getYear`, `getMonth`,
  `getDay`, `getHour`, `getMin`, `getSec`),
- operations on columns of data frames (`matchcols`, `rename.vars`),
- matrix operations (`unmatrix`, `upperTriangle`, `lowerTriangle`),
- operations on vectors (`case`, `unknownToNA`, `duplicated2`, `trimSum`),
- operations on data frames (`frameApply`, `wideByFactor`),
- value of last evaluated expression (`ans`), and
- wrapper for `sample` that ensures consistent behavior for both scalar and
  vector arguments (`resample`).

Installation
------------

The package can be installed from CRAN using the `install.packages` command:

```R
install.packages("gdata")
```

Usage
-----

For a summary of the package:

```R
library(gdata)
?gdata
```

Development
-----------

The package is developed openly on
[GitHub](https://github.com/r-gregmisc/gdata).

Feel free to open an [issue](https://github.com/r-gregmisc/gdata/issues) there
if you encounter problems or have suggestions for future versions.

The current development version can be installed using:

```R
library(remotes)
install_github("r-gregmisc/gdata")
```
