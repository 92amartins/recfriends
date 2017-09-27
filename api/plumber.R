library(jsonlite)
library(RNeo4j)

graph <- startGraph(url = "http://hobby-leaganfmiielgbkeljhlocpl.dbs.graphenedb.com:24789/db/data/",
                    username = "prod-db",
                    password = "b.H54FGOIsVyQU.Zgnz3cXJm1ezS5Ze")

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
