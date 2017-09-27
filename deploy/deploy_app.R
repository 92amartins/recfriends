library(rsconnect)

rsconnect::setAccountInfo(name="andreimartins",
                          token="249B8ED30D8D9323823FEA68A1712315",
                          secret="L1C5id+WH8Z0xvx7xTE701TLv7nH7GJp/wQMWjYk")

rsconnect::deployApp("app", appName = "recfriend")