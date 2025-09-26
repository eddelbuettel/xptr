## xptr: Manipulating External Pointers

[![ci](https://github.com/eddelbuettel/xptr/actions/workflows/ci.yaml/badge.svg)](https://github.com/eddelbuettel/xptr/actions/workflows/ci.yaml)
[![License](https://img.shields.io/badge/License-MIT-orange.svg)](https://opensource.org/licenses/MIT)
[![r-universe](https://eddelbuettel.r-universe.dev/badges/xptr)](https://eddelbuettel.r-universe.dev/xptr)
[![Last Commit](https://img.shields.io/github/last-commit/eddelbuettel/xptr)](https://github.com/eddelbuettel/xptr)

### About

External pointers are a powerful tool supported by the C API of the R environment and language that
is documented in the [Writing R Extensions manual][WRE docs].  But there is limited native support
for external pointers on the R side.  This package provides some basic tools to verify, create,
modify, and tag 'externalptr' objects


### Usage

```r
library(xptr)
a <- new_xptr("0x11a888090")
b <- new_xptr("0x11a888098")
is_xptr(a)
#> [1] TRUE
xptr_address(a)
#> [1] "0x11a888090"
xptr_clear(a)
is_null_xptr(a)
#> [1] TRUE
set_xptr_address(a, xptr_address(b))
xptr_address(a)           # default 'pointer' variant
#> [1] "0x11a888098"
> xptr_address(a, FALSE)  # non-'pointer' variant
[1] "4740120728"
>
```

### Installation

The package is not currently on CRAN.


The [r-univere page][r-univere page] has source and binary builds from the repository version which
may differ from the CRAN version and shows how to install them. Lastly, one can always rely on
`remotes::install_github()`:

```r
> remotes::install_github("eddelbuettel/xptr")
```

### Author

Randy Lai created the R package and prepared versions 1.0 to 1.1.3 between 2017 and 2020.

Dirk Eddelbuettel adopted the package in 2025.

### License

MIT


[WRE docs]: https://cran.r-project.org/doc/manuals/r-release/R-exts.html#External-pointers-and-weak-references
[r-univere page]: https://eddelbuettel.r-universe.dev/rcppmlpackexamples
