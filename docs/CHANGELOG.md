2025-10-03  Dirk Eddelbuettel  <edd@debian.org>

	* R/xptr.R: Ensure all roxygen2 blocks have @return entries
	* man/*: Re-rendered
	* docs/: Re-rendered

2025-09-28  Dirk Eddelbuettel  <edd@debian.org>

	* altdoc: Additional small customizations
	* docs/: Re-rendered

2025-09-27  Dirk Eddelbuettel  <edd@debian.org>

	* src/xptr.c: Use explicit Rf_error, compact some expressions

2025-09-26  Dirk Eddelbuettel  <edd@debian.org>

	* R/xptr.R: Adjust roxygen2 comment to ensure '.registration = TRUE'
	and '.fixes = "C_"' is passed to NAMESPACE; .Call() adjusted
	* NAMESPACE: Regenerated
	* src/xptr.c (R_init_xptr): Also call R_forceSymbols(dll, TRUE)

	* README.md: Edited throughout, added badges, r-universe mention,
	expand example to new non-pointer format character address

	* DESCRIPTION: Minor polish
	* man/xptr.Rd: Regenerated

	* tests/simpleTests.R: Add set of simple tests
	* tests/simpleTests.Rout.save: Add test reference output

	* docs/: Regenerated using `altdoc` and mkdocs
	* altdoc/: Added

2025-09-25  Dirk Eddelbuettel  <edd@debian.org>

	* DESCRIPTION (Authors@R): New Maintainer
	* DESCRIPTION (Version, Date): New minor version and date

	* src/xptr.c (xptr_address): New argument to use '%lld' instead of '%p'
	* R/xptr.R (xptr_address): Support new argument
	* man/xptr_address.Rd: Documentation

	* .github/workflows/ci.yaml: Support continuous integration
