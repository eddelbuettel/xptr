

# Manipulating External Pointers

## Description

There is limited native support for external pointers in the R
interface. This package provides some basic tools to verify, create and
modify ‘externalptr’ objects.

## Author(s)

Randy Lai and Dirk Eddelbuettel

## References

<a href="https://cran.r-project.org/doc/manuals/r-release/R-exts.html#External-pointers-and-weak-references">https://cran.r-project.org/doc/manuals/r-release/R-exts.html#External-pointers-and-weak-references</a>

## Examples

``` r
library("xptr")

library(xptr)
a <- new_xptr("0x11a888090")
b <- new_xptr("0x11a888098")
is_xptr(a)
```

    [1] TRUE

``` r
xptr_address(a)
```

    [1] "0x11a888090"

``` r
xptr_clear(a)
is_null_xptr(a)
```

    [1] TRUE

``` r
set_xptr_address(a, xptr_address(b))
xptr_address(a)
```

    [1] "0x11a888098"

``` r
xptr_address(a, FALSE)
```

    [1] "4740120728"
