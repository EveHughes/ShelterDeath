#### Preamble ####
# Purpose: Sanity check of the data
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)

#### Test data ####
shelter_residences_death_data <-
  read_csv("data/simulated_data/simulated_shelter_residences_death_data.csv")

# Test for negative numbers
shelter_residences_death_data$total_death_num |> min() < 0

# Test if month are valid
valid_months <- c(
  "Jan", "Feb", "Mar", "Apr", "May", "Jun",
  "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"
)
all_correct <- all(months %in% valid_months)
all_correct

# Test if the total number of death matches the gender distribution
test_total_num <-
  shelter_residences_death_data$total_death_num ==
    shelter_residences_death_data$female_death_num +
      shelter_residences_death_data$male_death_num +
      shelter_residences_death_data$other_death_num
all_match <- all(test_total_num)
all_match
