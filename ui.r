ui <- fluidPage(
    
    # Application title
    titlePanel("INQStats API"),
    
    # Sidebar with parameters - data set
    sidebarLayout(
        sidebarPanel(
            selectInput(inputId = "input_dataset", label = "Choose data set", unique(data$dataset)),
            checkboxGroupInput(inputId = "input_country", label = "Choose Country", unique(data$country))
            # sliderInput(inputId = "input_date_range", label = "Select Years", min = min(resp$year), max = max(resp$year),
            #            value = c(min(resp$year), max(resp$year)), dragRange = TRUE, step = 1)
        ),
        
        # Show a plot of the generated distribution
        mainPanel(
            plotOutput("time_serie_plot")
        )
    )
)