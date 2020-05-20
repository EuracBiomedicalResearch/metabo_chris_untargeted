#' @description
#'
#' Apply a function to sets of columns, i.e. to sub-matrices of selected
#' columns defined with parameter `colgroup`.
#'
#' @param x `matrix` with numeric values.
#'
#' @param colgroup `character` or `factor` defining the sets of columns.
#'
#' @param FUN `function` to be applied to the sub-matrix.
#'
#' @param simplify `logical(1)` whether `cbind` should be called on the result.
#'
#' @return `matrix` with aggregated values. Number of columns represent the
#'     number of unique groups/sets defined by `colgroup`. Number of rows is
#'     either one (for `FUN` being e.g. `mean`, `sum` etc) or equal to the
#'     number of rows of `x` (for `FUN` being e.g. `rowSums`).
apply_colgroup <- function(x, colgroup, FUN, simplify = TRUE, ...) {
  if (missing(FUN)) stop("'FUN' is missing")
  if (length(colgroup) != ncol(x))
    stop("length of 'colgroup' should match ncol of 'x'")
  grps <- unique(colgroup)
  res <- lapply(grps, function(z) {
    x_sub <- x[, colgroup == z, drop = FALSE]
    FUN(x_sub, ...)
  })
  names(res) <- grps
  if (simplify)
    do.call(cbind, res)
  else res
}