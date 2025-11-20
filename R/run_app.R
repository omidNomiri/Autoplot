#' Run the example Shiny app included in the package
#'
#' @export
run_app = function() {
  shiny::runApp(system.file("shiny", package = "Autoplot"), launch.browser = TRUE)
}
