library(shiny)
library(rCharts)


shinyUI(fluidPage(
                            
                            tags$div(
                                HTML("
                                     <h1> Exploring Dataset- mtcars</h1>
                                     <p>
                                     Shiny app plots interactively plots variables from mtcars dataset. 
                                     Variables can be chosen interactively against X-axis, Y-axis, and can be grouped. 
                                    </p>
                                     mtcars dataset has 32 observation and following 11 variables:<br>
                                     <pre>
                                     1-mpg	 Miles/(US) gallon
                                     2-cyl	 Number of cylinders
                                     3-disp	 Displacement (cu.in.)
                                     4-hp	 Gross horsepower
                                     5-drat	 Rear axle ratio
                                     6-wt	 Weight (lb/1000)
                                     7-qsec	 1/4 mile time
                                     8-vs	 V/S
                                     9-am	 Transmission (0 = automatic, 1 = manual)
                                     10-gear   Number of Gears
                                     11-carb   Number of carburetors
                                     </pre>
                                     ")),
                            
                            
                            
                            selectInput("var1","X-Axis Variables",names(mtcars)),
                                                      
                            selectInput("var2","Y-Axis Variables",names(mtcars)),
                                                      
                            selectInput("var3","Grouping",
                                        c("No. of Cylinders","V/S Engine" ,"Transmission","Number of Gears","Number Of Carburetors","No Group")),
                            plotOutput('newPlot'),
                            showOutput('chart1','nvd3')
                            
                            )

)