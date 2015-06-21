library(UsingR)
library(quantmod)
library(ggplot2)
library(lubridate)

shinyServer(function(input, output) {
    
        sym <- reactive({
            getSymbols(input$in_symbol, src = input$in_source, auto.assign = FALSE)
            })
        output$out_date <- renderText({if (input$goButton > 0) { mdy(index(last(sym())))}})
        output$out_Op <- renderText({if (input$goButton > 0) { coredata(last(Op(sym())))[1]}})
        output$out_Hi <- renderText({if (input$goButton > 0) { coredata(last(Hi(sym())))[1]}})
        output$out_Lo <- renderText({if (input$goButton > 0) { coredata(last(Lo(sym())))[1]}})
        output$out_Cl <- renderText({if (input$goButton > 0) { coredata(last(Cl(sym())))[1]}})
        output$out_Vo <- renderText({if (input$goButton > 0) { coredata(last(Vo(sym())))[1]}})
        output$out_symbol <- renderText({input$in_symbol})
        
        output$barchart_plot <- renderPlot({
            if (input$goButton > 0) { 
                #barchart(sym())
                d <- data.frame( time=index(Cl(sym())), volume=drop(coredata(Cl(sym()))) )
                ggplot(d, aes(time, volume)) + geom_bar(stat="identity")
            }
        })        
})