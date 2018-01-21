library(shiny)

shinyUI(fluidPage(
  titlePanel("Would You Survive the Sinking of the Titanic ?"),
  sidebarLayout(
    sidebarPanel(
      h4("Enter your details and hit Submit"),
      selectInput("sex", "Sex:", c("male", "female")),
      
      numericInput("ticketClass", "Choose your ticket class (1 = 1st, 2 = 2nd, 3 = 3rd):",
                   value = 3, min = 1, max = 3, step =1),
      selectInput("embarked", "What Port will you embark (C = Cherbourg, Q = Queenstown (now Cobh), S = S'hampton):", c("C", "Q", "S")),
                   
      sliderInput("age", "Enter your Age (Enter 0.4 if less than 1):",
                  0.4, 90, value = 20, step = 1),
      sliderInput("parentChild", "Choose number of (your) parents and children accompaning you (see Additional Information below):", 
                  0, 10, value = 0, step=1),
      selectInput("familySize", "Family Size. Single = Just You, Small = Between 2 and 4, Large = 5 or more (see Additional Information 
                  below):", c("Single", "Small", "Large")),
      h4("Additional Information:"),
      h5("Parents - Include your mother & father. For children - include any daughters, sons, & step daughter/sons 
         that accompanied you on your journey."),
      h5("Family Size - Include total of number of parents, brothers/sisters, husband/wife, daughters/sons, step sisters/brothers 
        that accompanied you on your journey."),
      
      submitButton("Submit") # Use the submit button if the computation is large and more complicated
      
    ),
    mainPanel(
      #h3("Your Input Settings:"),
      #h4("Sex:"),
      #h5(textOutput("text1")),
      #h4("Ticket Class:"),
      #h5(textOutput("text2")),
      #h4("Embarked:"),
      #h5(textOutput("text3")),
      #h4("Age:"),
      #h5(textOutput("text4")),
      #h4("No. of Parents/Children:"),
      #h5(textOutput("text5")),
      #h4("Family Size:"),
      #h5(textOutput("text6")),
      
      #plotOutput("plot1"),
      h2("Predicted Survival Rate"),
      h4("Your Probability of Survival is: "),
      h4(textOutput("prob")),
      textOutput(" "),
      h4("Therefore: "),
      h3(textOutput("pred"))      
      
    )
  )
))
