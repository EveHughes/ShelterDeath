#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None


#### Workspace setup ####
library(opendatatoronto)
library(tidyverse)
library(dplyr)

#### Download data ####
# get package
package <- show_package("deaths-of-shelter-residents")
package

# get all resources for this package
resources <- list_package_resources("deaths-of-shelter-residents")

# identify datastore resources; by default, Toronto Open Data sets datastore resource format to CSV for non-geospatial and GeoJSON for geospatial resources
datastore_resources <- filter(resources, tolower(format) %in% c('csv', 'geojson'))

# load the first datastore resource as a sample
data <- filter(datastore_resources, row_number()==1) %>% get_resource()
#### Save data ####
# change the_raw_data to whatever name you assigned when you downloaded it.
write_csv(data, "data/raw_data/shelter_residences_death_raw_data.csv") 

