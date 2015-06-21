sources <- c("yahoo", "google", "FRED", "oanda")

shinyUI(pageWithSidebar(    
    headerPanel("Simple QuantMod App"),
    sidebarPanel(
        p('Welcome!'),
        p('Plese choose the source:'),
        selectInput(inputId = "in_source",
                    label = "Source:",
                    choices = sources,
                    selected = "google"),
        p('Enter the symbol/ticker:'),
        textInput(inputId = "in_symbol",
                  label = "Symbol"),
        p('Do you wanna see the graph?'),
        checkboxInput(inputId = "in_showGraph",
                      label = strong("Show graph"),
                      value = FALSE),
        
        actionButton("goButton", 'Submit')        
        ),
    
    mainPanel(  
        p('You chose the symbol/ticker:'),
        textOutput('out_symbol'),
        p('Date:'),
        textOutput('out_date'),
        p('Open:'),
        textOutput('out_Op'),
        p('Day High:'),
        textOutput('out_Hi'),
        p('Day Low:'),
        textOutput('out_Lo'),
        p('Close:'),
        textOutput('out_Cl'),
        p('Volume:'),
        textOutput('out_Vo'),
        
        plotOutput(outputId = "main_plot", height = "200px"),    
#        Display this only if the showing graph was chosen
        conditionalPanel(condition = "input.in_showGraph == true",
                     plotOutput(outputId = "barchart_plot", height = "300px")
        )
    )    
))
