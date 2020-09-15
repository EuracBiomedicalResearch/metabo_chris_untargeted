dobox <- function(x, only_detected = FALSE,
                  col = gsub("60", "ff", col_group[xdata$sample_group]),
                  outline = FALSE, notch = TRUE, range = 0,
                  border = col_group[xdata$sample_group],
                  ylab = expression(log[2]~abundance), xaxt = "n", xlab = "",
                  ...) {
  if (only_detected)
    x[is.na(data_nofill)] <- NA
  boxplot(x, col = col, outline = outline, notch = notch, range = range,
          border = border, ylab = ylab, xaxt = xaxt, xlab = xlab, ...)
  grid(nx = NA, ny = NULL)
}