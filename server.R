library(shiny)
shinyServer(function(input, output) {
  output$text1 <- renderText(input$sex)
  output$text2 <- renderText(input$ticketClass)
  output$text3 <- renderText(input$embarked)
  output$text4 <- renderText(input$age)
  output$text5 <- renderText(input$parentChild)
  output$text6 <- renderText(input$familySize)
  
  train <- read.csv('titanicShiny_train.csv')
  model <- glm(formula=Survived ~. , family = binomial(link = "logit"), data = train) 
  
  modelprob <- reactive({
    sexInput <- input$sex
    classInput <- input$ticketClass
    embarkInput <- input$embarked
    ageInput <- input$age
    parchInput <- input$parentChild
    fam.sizeInput <- input$familySize
    dat <- data.frame('Pclass' = classInput, 'Sex' =factor(sexInput) , 'Age'=ageInput, 'Parch'=parchInput, 'Embarked'=factor(embarkInput), 
                      'FSize.Category'=fam.sizeInput)
    #predict(model, newdata=dat, type = "response")
    fitted.prob <- predict(model, newdata=dat, type = "response")
    fitted.prob
    })
  
  modelpred <- reactive({
    fitted.pred <- ifelse(modelprob() > 0.5, "You Survived", "Sorry, you didn't make it")
    fitted.pred
  })
  
  output$prob <- renderText({
    modelprob()
  })
  output$pred <- renderText({
    modelpred()
  })
  
  
})