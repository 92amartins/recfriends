library(analogsea)
library(plumber)

# List droplets
analogsea::droplets()

# Provision software
id <- 63921020
mydrop <- plumber::do_provision(id)

# Install API-specific packages
analogsea::install_r_package(id, "jsonlite")
# RNeo4j dependencies. Order matters.
analogsea::install_r_package(id, "openssl")
analogsea::install_r_package(id, "curl")
analogsea::install_r_package(id, "httr")
analogsea::install_r_package(id, "RNeo4j")

# Deploy API
vm <- analogsea::droplet(id)
plumber::do_deploy_api(vm, "recfriends", "api", 8050)
