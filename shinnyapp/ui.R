
#UI for Chicago Crimes App

library(shiny)
shinyUI(fluidPage(
  titlePanel("Analyze Trends In Chicago Crime"),
  p("These data were obtained from the City of Chicago Open Data portal. They reflect the 
      incidents of reported crimes from January 2001 to February 2017. To imporve 
      response time the data are stored as part of the application. The original
    dataset was aggregated to reflect monthly counts of various types of crimes."),
  h5("The original dataset and associated documentation can be found here:" 
    , a(" Crimes - 2001 to Present", href="https://data.cityofchicago.org/Public-Safety/Crimes-2001-to-present/ijzp-q8t2")),
  p("Select which Crimes to analyze.
    " ),
  p("Push the SUBMIT botton."),
  sidebarLayout(
    sidebarPanel(
  
      submitButton("Submit"),  
      
      checkboxInput("all", "Total/All Crimes", value = TRUE),
      checkboxInput("theft", "Theft", value = TRUE),
      checkboxInput("battery", "Battery", value = FALSE),
      checkboxInput("crimdam", "Criminal Damage", value = FALSE),
      checkboxInput("narc", "Narcotics", value = FALSE),
      checkboxInput("other", "Other Offense", value = FALSE),
      checkboxInput("assault", "Assault", value = FALSE),
      checkboxInput("burglary", "Burglary", value = FALSE),
      checkboxInput("motor", "Motor Vehicle Theft", value = FALSE),
      checkboxInput("robbery", "Robbery", value = FALSE),
      checkboxInput("decept", "Deceptive Practice", value = FALSE),
      checkboxInput("trespass", "Criminal Trespass", value = FALSE),
      checkboxInput("prostit", "Prostitution", value = FALSE),
      checkboxInput("weapons", "Weapons Violation", value = FALSE),
      checkboxInput("peace", "Public Peace Violation", value = FALSE),
      checkboxInput("child", "Offense Involving Children", value = FALSE),
      checkboxInput("sexualass", "Criminal Sexual Assault", value = FALSE),
      checkboxInput("sex", "Sex Offense", value = FALSE),
      checkboxInput("gambling", "Gambling", value = FALSE),
      checkboxInput("liquor", "Liquor Law Violation", value = FALSE),
      checkboxInput("interf", "Interference with Public Officer", value = FALSE),
      checkboxInput("arson", "Arson", value = FALSE),
      checkboxInput("homicide", "Homicide", value = FALSE),
      checkboxInput("kid", "Kidnapping", value = FALSE),
      checkboxInput("intimid", "Intimidation", value = FALSE),
      checkboxInput("stalk", "Stalking", value = FALSE),
      checkboxInput("obscen", "Obscenity", value = FALSE),
      checkboxInput("indecency", "Public Indecency", value = FALSE),
      checkboxInput("othnarc", "Other Narcotic Violation", value = FALSE),
      checkboxInput("non", "Non-Criminal", value = FALSE),
      checkboxInput("carry", "Concealed Carry License Violation", value = FALSE),
      checkboxInput("traffick", "Human Trafficking", value = FALSE),
      checkboxInput("ritu", "Ritualism", value = FALSE),
      checkboxInput("domviol", "Domestic Violence", value = FALSE)
                              
    ),
    mainPanel(
      plotOutput("plot1")
    )
  )
))















