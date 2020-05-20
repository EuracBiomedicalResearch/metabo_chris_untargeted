#' Calculate the mean only if we'be got enough values and report `NA`
#' otherwise
mean_if <- function(x, n = 6, na.rm = TRUE) {
  if (na.rm)
    x <- x[!is.na(x)]
  if (length(x) >= n)
    mean(x)
  else NA_real_
}