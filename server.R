require(rCharts)
library(ggplot2)
data(mtcars)
data <- mtcars
data$cyl <- as.factor(data$cyl)
data$vs <- as.factor(data$vs)
data$am <- as.factor(data$am)
data$gear <- as.factor(data$gear)
data$carb <- as.factor(data$carb)
shinyServer(
    function(input,output)
    {
        output$newPlot <- renderPlot({
            var3 <- switch(input$var3,"No. of Cylinders" = "cyl","V/S Engine"="vs" ,"Transmission"="am","Number of Gears"="gear","Number Of Carburetors"="carb","No Group" = "nop")
            fo <- as.formula(paste(".~",var3))
            if (input$var3=="No Group")
            {
                ggplot(data,aes_string(x=input$var1,y=input$var2)) + geom_point() + geom_smooth() + ggtitle(paste("Plot:  ",input$var1,"vs ",input$var2))
            }
            else
            {
                ggplot(data,aes_string(x=input$var1,y=input$var2)) + geom_point() + geom_smooth() + facet_grid(fo) + ggtitle(paste("Plot: ",input$var1,"vs ",input$var2,"  -Grouped by",input$var3))
            }
        })
        
        output$chart1 <-renderChart({
            var3 <- switch(input$var3,"No. of Cylinders" = "cyl","V/S Engine"="vs" ,"Transmission"="am","Number of Gears"="gear","Number Of Carburetors"="carb","No Group" = "nop")
            fo <- as.formula(paste(input$var2,"~",input$var1))
            chart1 <- nPlot(fo,group=var3,type='multiBarChart',dom='chart1',data=data)
            chart1$yAxis(axisLabel=input$var2,width=80)
            chart1$xAxis(axisLabel=input$var1)
            return(chart1)
        })
    }
)