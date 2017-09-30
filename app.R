devtools::install_github("henkar91/AdvRprogr_lab5")
library(INQStatsR)
df <- databycountry$new(api_key = "97c1f72e01dd5ba3", 
                        country_code = c("se,no,dk,fi,us,de"), 
                        data = c("population", 
                                 "bigmac_index",
                                 "death_rate",
                                 "debts_capita",
                                 "debts_percent",
                                 "fixed_telephone_subscriptions",
                                 "jobless_rate",
                                 "life_expectancy",
                                 "olympicsummergames_goldmedals",
                                 "gdp_capita",
                                 "corruption_index",
                                 "birth_rate",
                                 "electric_energy_consumption"), 
                        years = 2010:2017)


    # Define UI for application that draws a histogram
    ui <- fluidPage(
        
        # Application title
        titlePanel("INQStats API"),
        
        # Sidebar with parameters - data set
        sidebarLayout(
            sidebarPanel(
                #textInput(inputId = "input_df", label = "Specify name of data frame", value = ""),
                selectInput(inputId = "input_dataset", label = "Choose data set", df$get_dataset()),
                checkboxGroupInput(inputId = "input_country", label = "Choose Country", df$get_country())
                # sliderInput(inputId = "input_date_range", label = "Select Years", min = min(resp$year), max = max(resp$year),
                #            value = c(min(resp$year), max(resp$year)), dragRange = TRUE, step = 1)
            ),
            
            # Show a plot of the generated distribution
            mainPanel(
                plotOutput("time_serie_plot")
            )
        )
    )
    
    # Server function
    server <- function(input, output) {
        library(dplyr)
        library(ggplot2)
        
        output$time_serie_plot <- renderPlot({
            if (length(input$input_country) == 0) {
                
            } else {
                plot_df <- df$result %>%
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
    
    
    # Run the application 
    shinyApp(ui = ui, server = server)
    


