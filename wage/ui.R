library(shiny)

shinyUI(fluidPage(
    titlePanel("Average Wage Based on A Few Factors"),

    fluidRow(
        h4("How to use this app:"),
        h4("step 1. Fill out information of age, job class,martial status, etc.  All fields are required."),
        h4("step 2. Click Submit button to get the predicted wage based on the informaion you filled out.")
    ),
    
    fluidRow(
        column(3,
            numericInput("age", 
                         label = h3("Age"), 
                         value = 30)),
        
        column(3,
               radioButtons("job", label = h3("Job Class"),
                            choices = list("Industrial" = 1, "Information" = 2),
                        selected = 1))
    ),
    
    fluidRow(
        column(3,
               radioButtons("marriage", label = h3("Marital Status"),
                            choices = list("Never Married" = 1, "Married" = 2,
                                           "Windowed" = 3, "Divorced" = 4, 
                                           "Separated" = 5),selected = 1)),
        
        column(3,
               radioButtons("education", label = h3("Education"),
                            choices = list("< HS Grd" = 1, "HS Grad" = 2,
                                           "Some College" = 3, "College Grad" = 4, 
                                           "Advanced Degree" = 5),selected = 1)),
        
        column(3,
               radioButtons("race", label = h3("Race"),
                            choices = list("White" = 1, "Black" = 2,
                                           "Asian" = 3, "Other" = 4), 
                                           selected = 1))
               
        
        ),
    
    fluidRow(
        column(3,
               radioButtons("health", label = h3("Health"),
                            choices = list("<=Good" = 1, ">=Very Good" = 2),
                                           selected = 1)),
        
        column(3,
               radioButtons("health_ins", label = h3("Has Health Insurance"),
                            choices = list("Yes" = 1, "No" = 2),
                                           selected = 1)),
        
        column(3,
               submitButton("Submit"))
     ),
    
    fluidRow(
        h3(textOutput("result"))
        )
    ))