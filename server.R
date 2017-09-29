# Server function
server <- function(input, output) {
    library(dplyr)
    library(ggplot2)
    
    output$time_serie_plot <- renderPlot({
        if (length(input$input_country) == 0) {
            
        } else {
            plot_df <- data %>%
                filter(country %in% input$input_country,
                       dataset %in% input$input_dataset
                       #year %in% as.numeric(input$input_date_range)
                )
            plot_df$values <- as.numeric(as.character(plot_df$values))
            
            # make ggplot
            ggplot(data = plot_df, aes(x = years, y = values, colour = country, group = country)) +
                geom_path() +
                geom_point() +
                xlab("Years") +
                ylab(input$input_dataset) +
                title("Results")
        }
    })
}