library(shiny)

martialConv<-function(x) { 
    if ( x == 1 ) {
        c(0,0,0,0)
    } else if ( x == 2) {
        c(1,0,0,0)
    } else if ( x == 3) {
        c(0,1,0,0)
    } else if ( x == 4) {
        c(0,0,1,0)
    } else {
        c(0,0,0,1)
    }    
}

raceConv<-function(x) {
    if ( x == 1 ) {
        c(0,0,0)
    } else if ( x == 2) {
        c(1,0,0)
    } else if ( x == 3) {
        c(0,1,0)
    } else {
        c(0,0,1)
    }
}

jobConv<-function(x){
    if ( x == 2 ) {
        1
    } else {
        0
    }
}

wage <- function(age,martialv,racev,educationv,jobv,healthv,insv) {
    sumw<- -2525.5373 + 2015 * 1.2918 + age * 0.2824 + martialv[1] * 17.8304 + martialv[2] * 3.8702 + martialv[3] * 4.0289 
    sumw<- sumw + martialv[4] * 12.7386 + racev[1] * (-7.6285) + racev[2] * (-4.9544) + racev[3] * (-9.0571) + educationv[1] * 6.8694 
    sumw<- sumw + educationv[2] * 17.9441 + educationv[3] * 30.6646 + educationv[4] * 53.3241 + jobv * 3.0153 
    sumw<- sumw + healthv * 7.2149 + insv * (-17.0747)
    sumw
}    

shinyServer(function(input,output) {
    output$result <- renderText({
        paste("The predicted wage based on the group you selected is $",round(wage(input$age,martialConv(input$marriage),raceConv(input$race),
                                                                            martialConv(input$education),jobConv(input$job),
                                                                            jobConv(input$health),jobConv(input$health_ins)),3), ".")
    })
})