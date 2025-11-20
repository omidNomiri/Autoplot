#' Auto Plot for a single vector
#'
#' Draws a small set of exploratory plots for a numeric or categorical vector.
#'
#' @param x A numeric vector or a factor/character vector (one column).
#' @param colname Optional character: column name (used in titles).
#' @return Invisible NULL. Function draws plots to the active graphics device.
#' @examples
#' auto_plot(iris)
#' @export
auto_plot = function(x, colname = NULL) {

  if (is.numeric(x)) {
    x_clean = x[is.finite(x)]
    if (length(x_clean) == 0) {
      plot.new()
      title("No valid numeric data")
      return(invisible(NULL))
    }

    par(mfrow = c(2, 2), mar = c(4, 4, 2, 1))

    hist(
      x_clean,
      main = paste("Histogram of", colname),
      col = "skyblue", border = "white")

    boxplot(
      x_clean,
      main = paste("Boxplot of", colname),
      col = "lightgreen")

    plot(
      density(x_clean),
      main = paste("Density of", colname),
      col = "blue", lwd = 2)

    plot(
      x_clean, type = "l",
      main = paste("Line Plot of", colname),
      col = "purple", lwd = 2)

    par(mfrow = c(1,1))
    return(invisible(NULL))
  }

  else if (is.factor(x) || is.character(x)) {
    counts = table(x)
    if (length(counts) == 0) {
      plot.new()
      title("No valid categorical data")
      return(invisible(NULL))
    }

    par(mfrow = c(1, 2), mar = c(4, 4, 2, 1))

    barplot(
      counts,
      main = paste("Barplot of", colname),
      col = "orange", las = 2)

    pie(
      counts,
      main = paste("Pie of", colname),
      col = rainbow(length(counts)))

    par(mfrow = c(1,1))
    return(invisible(NULL))
  }

  else {
    plot.new()
    title(paste("Unsupported type:", class(x)))
    return(invisible(NULL))
  }
}
