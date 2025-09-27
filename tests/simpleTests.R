
library(xptr)

a <- new_xptr("0xdeadbeef")
is_xptr(a)
xptr_address(a)
xptr_address(a, FALSE)

b <- new_xptr("0x11223344")
is_xptr(b)
xptr_address(b)
xptr_address(b, FALSE)

xptr_clear(b)
is_null_xptr(b)

set_xptr_address(b, xptr_address(a))
xptr_address(b)
xptr_address(b, FALSE)

xptr_clear(a)
xptr_clear(b)

a <- new_xptr("0x11223344")
b <- new_xptr("0x11223344", a)
is_xptr(a)
is_xptr(b)

n <- xptr_tag(b)
is_xptr(n)
