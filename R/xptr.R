#' There is limited native support for external pointers in the R interface.
#' This package provides some basic tools to verify, create and modify 'externalptr' objects.
#'
#'
#' @name xptr
#' @title Manipulating External Pointers
#' @useDynLib xptr, .registration = TRUE, .fixes = "C_"
#' @references \url{https://cran.r-project.org/doc/manuals/r-release/R-exts.html#External-pointers-and-weak-references}
#' @author Randy Lai and Dirk Eddelbuettel
#' @examples
#' library(xptr)
#' a <- new_xptr("0x11a888090")
#' b <- new_xptr("0x11a888098")
#' is_xptr(a)
#' xptr_address(a)
#' xptr_clear(a)
#' is_null_xptr(a)
#' set_xptr_address(a, xptr_address(b))
#' xptr_address(a)
#' xptr_address(a, FALSE)
NULL

#' Check if an object is an external pointer.
#' @param s An \code{externalptr} object
#' @return A boolean
#' @export
is_xptr <- function(s) {
    mode(s) == "externalptr"
}

#' Create an external pointer object.
#' @param address A string of pointer address
#' @param tag An optional tag
#' @param protected an objected to be protected from gc within the lifetime of the external pointer
#' @return An \code{externalptr} object
#' @export
new_xptr <- function(address = "", tag = NULL, protected = NULL) {
    .Call(C_new_xptr, address, tag, protected)
}

#' @rdname new_xptr
#' @export
null_xptr <- function(tag = NULL, protected = NULL) {
    .Call(C_null_xptr, tag, protected)
}

#' Check if the external pointer is null.
#' @param s An \code{externalptr} object
#' @return A boolean
#' @export
is_null_xptr <- function(s) {
    .Call(C_is_null_xptr, s)
}

#' External pointer address.
#' @param s An \code{externalptr} object
#' @param pf A \code{logical} selecting \sQuote{pointer} format (default)
#' or \sQuote{character} output
#' @return A string of pointer address
#' @export
xptr_address <- function(s, pf = TRUE) {
    .Call(C_xptr_address, s, as.logical(pf))
}

#' Tag of the external pointer.
#' @param s An \code{externalptr} object
#' @return The R object stored in the tag slot
#' @export
xptr_tag <- function(s) {
    .Call(C_xptr_tag, s)
}

#' Protected R object of the external pointer.
#' @param s An \code{externalptr} object
#' @return An R object
#' @export
xptr_protected <- function(s) {
    .Call(C_xptr_protected, s)
}

#' Clear the pointer address of the external pointer.
#' @param s An \code{externalptr} object
#' @return No return value as the function is called for its side effect
#' @export
xptr_clear <- function(s) {
    invisible(.Call(C_xptr_clear, s))
}

#' Set the address of the external pointer.
#' @param s An \code{externalptr} object
#' @param p A string of pointer address
#' @return No return value as the function is called for its side effect
#' @export
set_xptr_address <- function(s, p) {
    invisible(.Call(C_set_xptr_address, s, p))
}

#' Set a tag to the external pointer.
#' @param s An \code{externalptr} object
#' @param tag An R object
#' @return No return value as the function is called for its side effect
#' @export
set_xptr_tag <- function(s, tag) {
    invisible(.Call(C_set_xptr_tag, s, tag))
}

#' Set a protected R object to the external pointer.
#' @param s An \code{externalptr} object
#' @param protected An R object
#' @return No return value as the function is called for its side effect
#' @export
set_xptr_protected <- function(s, protected) {
    invisible(.Call(C_set_xptr_protected, s, protected))
}

#' Register a finalizer for external pointer.
#' @param s An \code{externalptr} object
#' @param f An R function
#' @param onexit should the finalizer execute on exit?
#' @return No return value as the function is called for its side effect
#' @seealso \code{\link[base]{reg.finalizer}}
#' @export
register_xptr_finalizer <- function(s, f, onexit = FALSE) {
    invisible(.Call(C_register_xptr_finalizer, s, f, onexit))
}
