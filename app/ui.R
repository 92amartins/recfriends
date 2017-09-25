library(RNeo4j)
library(shiny)
library(visNetwork)

graph <- startGraph(url = "http://hobby-leaganfmiielgbkeljhlocpl.dbs.graphenedb.com:24789/db/data/",
                    username = "prod-db",
                    password = "b.H54FGOIsVyQU.Zgnz3cXJm1ezS5Ze")

persons = getLabeledNodes(graph, "Person")
persons = sapply(persons, function(p) p$name)

shinyUI(fluidPage(
  titlePanel("Rec Friends"),
  sidebarLayout(
    sidebarPanel(
      shiny::radioButtons("persons",
                          "Pessoa",
                          choices = persons),
      selectInput("service", label = "", choices = c("Amigos", "Sugestoes"))
    ),
    mainPanel(visNetworkOutput("graph"))
)))