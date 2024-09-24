#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
library(tidyverse)

#### Clean data ####
raw_data <- read_csv("data/raw_data/shelter_residences_death_raw_data.csv") 

cleaned_data <-
  raw_data |>
  janitor::clean_names() |>
  tidyr::drop_na()

# Calculate the proportion of male in total shelter deaths
cleaned_data
cleaned_data <- cleaned_data %>%
  mutate(male_ratio = male / total_decedents)

# Calculate the proportion of female in total shelter deaths
cleaned_data <- cleaned_data %>%
  mutate(female_ratio = female / total_decedents)

# Replace "n/a" with NA
cleaned_data <- cleaned_data %>%
  mutate(transgender_non_binary_two_spirit = ifelse(transgender_non_binary_two_spirit == "n/a", NA, transgender_non_binary_two_spirit))

# Transfer transgender_non_binary_two_spirit death num to numeric data
cleaned_data <- cleaned_data %>%
  mutate(transgender_non_binary_two_spirit = as.numeric(transgender_non_binary_two_spirit))


# Calculate the proportion of transgender, non_binary or two spirit in total shelter deaths
cleaned_data <- cleaned_data %>%
  mutate(other_ratio = ifelse(is.na(transgender_non_binary_two_spirit) | total_decedents == 0, NA, transgender_non_binary_two_spirit / total_decedents))


#### Save data ####
write_csv(cleaned_data, "data/analysis_data/shelter_residences_death_analysis_data.csv") 

