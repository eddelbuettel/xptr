#' There is limited native support for external pointers in the R interface.
#' This package provides some basic tools to verify, create and modify 'externalptr' objects.
#'
#'
#' @name xptr
#' @title Manipulating External Pointer
#' @useDynLib xptr, .registration = TRUE, .fixes = "C_"
#' @references \itemize{
#' \item \url{https://cran.r-project.org/doc/manuals/r-release/R-exts.html#External-pointers-and-weak-references}
#' }
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
"_PACKAGE"

#' Check if an object is an external pointer.
#' @param s an \code{externalptr} object
#' @return a boolean
#' @export
is_xptr <- function(s) {
    mode(s) == "externalptr"
}

#' Create an external pointer object.
#' @param address a string of pointer address
#' @param tag an optional tag
#' @param protected an objected to be protected from gc within the lifetime of the external pointer
#' @return an \code{externalptr} object
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
#' @param s an \code{externalptr} object
#' @return a boolean
#' @export
is_null_xptr <- function(s) {
    .Call(C_is_null_xptr, s)
}

#' External pointer address.
#' @param s an \code{externalptr} object
#' @param pf a \code{logical} selecting \sQuote{pointer} format (default)
#' or \sQuote{character} output
#' @return a string of pointer address
#' @export
xptr_address <- function(s, pf = TRUE) {
    .Call(C_xptr_address, s, as.logical(pf))
}

#' Tag of the external pointer.
#' @param s an \code{externalptr} object
#' @return an R object
#' @export
xptr_tag <- function(s) {
    .Call(C_xptr_tag, s)
}

#' Protected R object of the external pointer.
#' @param s an \code{externalptr} object
#' @return an R object
#' @export
xptr_protected <- function(s) {
    .Call(C_xptr_protected, s)
}

#' Clear the pointer address of the external pointer.
#' @param s an \code{externalptr} object
#' @export
xptr_clear <- function(s) {
    invisible(.Call(C_xptr_clear, s))
}

#' Set the address of the external pointer.
#' @param s an \code{externalptr} object
#' @param p a string of pointer address
#' @export
set_xptr_address <- function(s, p) {
    invisible(.Call(C_set_xptr_address, s, p))
}

#' Set a tag to the external pointer.
#' @param s an \code{externalptr} object
#' @param tag an R object
#' @export
set_xptr_tag <- function(s, tag) {
    invisible(.Call(C_set_xptr_tag, s, tag))
}

#' Set a protected R object to the external pointer.
#' @param s an \code{externalptr} object
#' @param protected an R object
#' @export
set_xptr_protected <- function(s, protected) {
    invisible(.Call(C_set_xptr_protected, s, protected))
}

#' Register a finalizer for external pointer.
#' @param s an \code{externalptr} object
#' @param f an R function
#' @param onexit should the finalizer execute on exit?
#' @seealso \code{\link[base]{reg.finalizer}}
#' @export
register_xptr_finalizer <- function(s, f, onexit = FALSE) {
    invisible(.Call(C_register_xptr_finalizer, s, f, onexit))
}
