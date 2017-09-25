library(RNeo4j)
library(jsonlite)
library(dplyr)

BuildGraph <- function(relationships, type){
  from <- getOrCreateNode(graph, "Person", name = relationships$from)
  to   <- getOrCreateNode(graph, "Person", name = relationships$to)
  createRel(from, type, to)
}

BuildSuggestions <- function(){
  query <- "MATCH (from:Person)-[:KNOWS]-(friend)-[:KNOWS]-(to:Person)
            WHERE NOT (from)-[:KNOWS]-(to)
            RETURN from.name, to.name"
  rs <- cypher(graph, query) %>%
    distinct()
  by(rs, 1:nrow(rs), BuildGraph, "SUGGESTED")
}

#* @get /friends
GetFriends <- function(person){
  query <- "MATCH (p:Person {name:{person}})-[:KNOWS]-(friends)
            RETURN friends.name"
  rs <- cypher(graph, query, person = person)
  toJSON(list(friends = rs$friends.name), pretty = TRUE)
}

#* @get /suggested
SuggestedFriends <- function(person){
  query <- "MATCH (p:Person {name:{person}})-[:SUGGESTED]->(suggested)
            RETURN suggested.name"
  rs <- cypher(graph, query, person = person)
  toJSON(list(suggested = rs$suggested.name), pretty = TRUE)
}

graph <- startGraph(url = "http://hobby-leaganfmiielgbkeljhlocpl.dbs.graphenedb.com:24789/db/data/",
                    username = "prod-db",
                    password = "b.H54FGOIsVyQU.Zgnz3cXJm1ezS5Ze")
clear(graph, FALSE)

addConstraint(graph, "Person", "name")
friendships <- read.csv("data/friendship.csv")

by(friendships, 1:nrow(friendships), BuildGraph, "KNOWS")
BuildSuggestions()
