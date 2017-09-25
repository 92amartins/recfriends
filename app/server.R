library(jsonlite)
library(shiny)
library(RNeo4j)
library(visNetwork)

graph <- startGraph(url = "http://hobby-leaganfmiielgbkeljhlocpl.dbs.graphenedb.com:24789/db/data/",
                    username = "prod-db",
                    password = "b.H54FGOIsVyQU.Zgnz3cXJm1ezS5Ze")

q_friends     <- "MATCH (p:Person {name:{person}})-[:KNOWS]-(friends)
                  RETURN friends.name"
q_suggested   <- "MATCH (p:Person {name:{person}})-[:SUGGESTED]->(suggested)
                  RETURN suggested.name"

edges <- data.frame(from = c("Arthur", "Arthur",  "Mari",    "Mari",    "Gabriel"),
                    to   = c("Mari",   "Eduardo", "Eduardo", "Gabriel", "Eduardo"))

shinyServer(function(input, output) {
  output$graph <- renderVisNetwork({
    query <- switch(input$service, Amigos    = q_friends, 
                                   Sugestoes = q_suggested)
    df <- cypher(graph, query, person = input$persons)
    names(df) <- "name"
    nodes <- data.frame(id = df$name, label = df$name)
    visNetwork(nodes, edges)
  })
})