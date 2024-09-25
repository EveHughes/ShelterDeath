#### Preamble ####
# Purpose: Simulates data
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
library(dplyr)
library(lubridate)

#### Simulate data ####
set.seed(507)

# Simulate data
dates <- seq.Date(
  from = as.Date("2007-01-01"),
  to = as.Date("2024-08-01"),
  by = "month"
)
years <- format(dates, "%Y")

months <- format(dates, "%b")

simulated_shelter_death <- rpois(length(months), lambda = 3)

male_death <- round(simulated_shelter_death * 0.65)

other_death <- round(simulated_shelter_death * 0.15)

female_death <- simulated_shelter_death - male_death - other_death

simulated_data <- data.frame(
  year = years,
  month = months,
  total_death_num = simulated_shelter_death,
  male_death_num = male_death,
  female_death_num = female_death,
  other_death_num = other_death
)

#### Write_csv
write.csv(simulated_data,
  "data/simulated_data/simulated_shelter_residences_death_data.csv",
  row.names = FALSE
)
