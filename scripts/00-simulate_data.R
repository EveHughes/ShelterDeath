#### Preamble ####
# Purpose: Simulate Data
# Author: Xinqi Yue
# Date: 19 September 2024
# Contact: xinqi.yue@utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(tidyverse)
# [...UPDATE THIS...]

#### Simulate data ####
# [...ADD CODE HERE...]

set.seed(304)

start_date <- as.Date("2023-01-01")
end_data <- as.Date("2023-12-31")

number_of_dates <- 100

data <-
  tibble(
    data = as.Date(runif(n = number_of_dates, 
                         min = as.numeric(start_date),
                         max = as.numeric(end_data)), 
                   origin = "1970-01-01"
                   ),

    number_of_marriage = rpois(n=100, lambda = 15)
  )


