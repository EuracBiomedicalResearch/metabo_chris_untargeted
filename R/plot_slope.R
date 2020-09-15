#' @description
#'
#' Plot model fit for a specific batch
#'
#' @param y `numeric` vector with the intensities to plot.
#'
plot_slope <- function(x, y, model, ...) {
  plot(x, y, ...)
  if (length(model) > 1){
    abline(model)
  }
  grid()
}