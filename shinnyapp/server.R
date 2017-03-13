library(shiny)
library(ggplot2)
library(plyr)


# Read in only Date and Primary.Type
crimedata <- read.csv(file="./data/chi_crime_agg.csv")
crimedata$month <- as.Date(crimedata$month)

#Get Total Crime Trend
allcrime  <- ddply(crimedata, c("month"), summarise,
                   count = sum(count)   )
allcrime$crime <- "TOTAL"
crimedata <- rbind(crimedata, allcrime)

crimelist <- data.frame(levels(crimedata$crime))
colnames(crimelist) <- c("crime")
crimelist$keep <- FALSE

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({

    # build selected list
  if(input$all) {crimelist$keep[crimelist$crim == 'TOTAL'] <- TRUE }
  if(input$theft) {crimelist$keep[crimelist$crim == 'THEFT'] <- TRUE }
  if(input$battery) {crimelist$keep[crimelist$crim == 'BATTERY'] <- TRUE }
  if(input$crimdam) {crimelist$keep[crimelist$crim == 'CRIMINAL DAMAGE'] <- TRUE }
  if(input$narc) {crimelist$keep[crimelist$crim == 'NARCOTICS'] <- TRUE }
  if(input$other) {crimelist$keep[crimelist$crim == 'OTHER OFFENSE'] <- TRUE }
  if(input$assault) {crimelist$keep[crimelist$crim == 'ASSAULT'] <- TRUE }
  if(input$burglary) {crimelist$keep[crimelist$crim == 'BURGLARY'] <- TRUE }
  if(input$motor) {crimelist$keep[crimelist$crim == 'MOTOR VEHICLE THEFT'] <- TRUE }
  if(input$robbery) {crimelist$keep[crimelist$crim == 'ROBBERY'] <- TRUE }
  if(input$decept) {crimelist$keep[crimelist$crim == 'DECEPTIVE PRACTICE'] <- TRUE }
  if(input$trespass) {crimelist$keep[crimelist$crim == 'CRIMINAL TRESPASS'] <- TRUE }
  if(input$prostit)  {crimelist$keep[crimelist$crim == 'PROSTITUTION'] <- TRUE }
  if(input$weapons) {crimelist$keep[crimelist$crim == 'WEAPONS VIOLATION'] <- TRUE }
  if(input$peace) {crimelist$keep[crimelist$crim == 'PUBLIC PEACE VIOLATION'] <- TRUE }
  if(input$child) {crimelist$keep[crimelist$crim == 'OFFENSE INVOLVING CHILDREN'] <- TRUE }
  if(input$sexualass) {crimelist$keep[crimelist$crim == 'CRIM SEXUAL ASSAULT'] <- TRUE }
  if(input$sex) {crimelist$keep[crimelist$crim == 'SEX OFFENSE'] <- TRUE }
  if(input$gambling) {crimelist$keep[crimelist$crim == 'GAMBLING'] <- TRUE }
  if(input$liquor) {crimelist$keep[crimelist$crim == 'LIQUOR LAW VIOLATION'] <- TRUE }
  if(input$interf) {crimelist$keep[crimelist$crim == 'INTERFERENCE WITH PUBLIC OFFICER'] <- TRUE }
  if(input$arson) {crimelist$keep[crimelist$crim == 'ARSON'] <- TRUE }
  if(input$homicide) {crimelist$keep[crimelist$crim == 'HOMICIDE'] <- TRUE }
  if(input$kid) {crimelist$keep[crimelist$crim == 'KIDNAPPING'] <- TRUE }
  if(input$intimid) {crimelist$keep[crimelist$crim == 'INTIMIDATION'] <- TRUE }
  if(input$stalk) {crimelist$keep[crimelist$crim == 'STALKING'] <- TRUE }
  if(input$obscen) {crimelist$keep[crimelist$crim == 'OBSCENITY'] <- TRUE }
  if(input$indecency) {crimelist$keep[crimelist$crim == 'PUBLIC INDECENCY'] <- TRUE }
  if(input$othnarc) {crimelist$keep[crimelist$crim == 'OTHER NARCOTIC VIOLATION'] <- TRUE }
  if(input$non) {crimelist$keep[crimelist$crim == 'NON-CRIMINAL'] <- TRUE }
  if(input$carry) {crimelist$keep[crimelist$crim == 'CONCEALED CARRY LICENSE VIOLATION'] <- TRUE }
  if(input$traffick) {crimelist$keep[crimelist$crim == 'HUMAN TRAFFICKING'] <- TRUE }
  if(input$ritu) {crimelist$keep[crimelist$crim == 'RITUALISM'] <- TRUE }
  if(input$domviol) {crimelist$keep[crimelist$crim == 'DOMESTIC VIOLENCE'] <- TRUE }
    
    #Keep only selected Crimes
    crimelist <- crimelist[crimelist$keep, ]
    crimelist   <- crimelist['crime']
    crimesfinal <- merge(crimedata, crimelist, by = 'crime')
    
    # draw the plot 
    g <- ggplot(data=crimesfinal, aes(x = month, y = count)) 
    g <- g + geom_line(aes(colour=crime, group=crime))
    g <- g + scale_x_date(name="Time", seq(as.Date(min(crimesfinal$month)), 
                                           as.Date(max(crimesfinal$month)), by="2 years"),
                          date_labels = "%Y")
    g <- g + ylab("Incidents") 
    g <- g + ggtitle("Monthly Incidents of Top 10 Reported Crimes")
    g <- g + theme(legend.position="bottom")
    g
 
    
  })
  
})
