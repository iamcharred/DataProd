sources <- c("yahoo", "google", "FRED", "oanda")

shinyUI(pageWithSidebar(    
    headerPanel("Simple QuantMod App"),
    sidebarPanel(
        p('Welcome! This is a simple app showing the basic data handling functions you can do with the 
quantmod data.
\n
The app requires the following inputs -- 
\n
1. Choose source: Yahoo, Google, FRED, oanda. 
2. Input a valid ticker/symbol. 
3. Choose if you want to show the bargraph of the closing price. 
For example: "GOOG" from yahoo
\n
It will give you the following - 
\n
1. as of Date of the data being shown
2. OHLC Data : Open, Series High, Series Low, Close, Volume 
3. Graph of the Close data'),
        p('Plese choose the source:'),
        selectInput(inputId = "in_source",
                    label = "Source:",
                    choices = sources,
                    selected = "google"),
        p('Enter the symbol/ticker, for example, GOOG or AAPL:'),
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
