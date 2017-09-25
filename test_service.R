library(plumber)
service <- plumb("friends.R")
service$run(port=8000)