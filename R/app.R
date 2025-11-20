library(shiny)

ui = fluidPage(
  titlePanel("Auto Plot App"),

  sidebarLayout(
    sidebarPanel(
      fileInput("file", "Upload CSV", accept = ".csv"),
      actionButton("go", "Generate Plots")
    ),

    mainPanel(
      uiOutput("plots_ui")
    )
  )
)

server = function(input, output) {

  observeEvent(input$go, {
    req(input$file)
    df = read.csv(input$file$datapath)

    output$plots_ui = renderUI({
      plot_list = lapply(names(df), function(colname) {
        plotOutput(
          outputId = paste0("plot_", colname),
          height = "700px"
        )
      })
      do.call(tagList, plot_list)
    })

    lapply(names(df), function(colname) {
      output[[paste0("plot_", colname)]] = renderPlot({
        auto_plot(df[[colname]], colname)
      })
    })

  })
}

shinyApp(ui, server)
