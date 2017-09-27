library(plumber)
service <- plumb("api/plumber.R")
service$run(port = 8000)