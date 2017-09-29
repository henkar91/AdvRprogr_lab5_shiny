library(INQStatsR)

df <- databycountry$new(api_key = "97c1f72e01dd5ba3", 
                        country_code = c("se", "no"),
                        # "se,no,dk,fi,us,de", 
                        data = c("population", 
                                 # "bigmac_index",
                                 # "death_rate",
                                 # "debts_capita",
                                 # "debts_percent",
                                 # "fixed_telephone_subscriptions",
                                 # "jobless_rate",
                                 # "life_expectancy",
                                 # "olympicsummergames_goldmedals",
                                 # "gdp_capita",
                                 # "corruption_index",
                                 # "birth_rate",
                                 "electric_energy_consumption"), 
                        years = 2010:2017)

data <- df$result

runGitHub("henkar91/AdvRprogr_lab5_shiny")
