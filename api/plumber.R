library(RNeo4j)

graph <- startGraph(url = "http://hobby-leaganfmiielgbkeljhlocpl.dbs.graphenedb.com:24789/db/data/",
                    username = "prod-db",
                    password = "b.H54FGOIsVyQU.Zgnz3cXJm1ezS5Ze")

#* @get /friends
GetFriends <- function(person){
  cat("[",format(Sys.time(), "%b %Y %d %X"), "]", file = "./api/logs/friends.log",
      "Buscando amigos de", person, 
      fill = TRUE, append = TRUE)
  query <- "MATCH (p:Person {name:{person}})-[:KNOWS]-(friends)
            RETURN friends.name"
  rs <- cypher(graph, query, person = person)
  cat("[",format(Sys.time(), "%b %Y %d %X"), "]", file = "./api/logs/friends.log",
      "Sucesso!", nrow(rs), "amigos de", person, "encontrado(s)",
      fill = TRUE, append = TRUE)
  list(friends = rs$friends.name)
}

#* @get /suggested
SuggestedFriends <- function(person){
  cat("[",format(Sys.time(), "%b %Y %d %X"), "]", file = "./api/logs/recs.log",
      "Buscando recomendações para", person, 
      fill = TRUE, append = TRUE)  
  query <- "MATCH (p:Person {name:{person}})-[:SUGGESTED]->(suggested)
            RETURN suggested.name"
  rs <- cypher(graph, query, person = person)
  cat("[",format(Sys.time(), "%b %Y %d %X"), "]", file = "./api/logs/recs.log",
      "Sucesso!", nrow(rs), "recomendação(ões) encontradas", person, 
      fill = TRUE, append = TRUE)
  list(suggested = rs$suggested.name)
}
