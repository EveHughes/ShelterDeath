#### Preamble ####
# Purpose: Simulates data
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

#### Workspace setup ####
import pandas as pd
import numpy as np

#### Simulate data ####
np.random.seed(507)

# Generate monthly dates from Jan 2007 to Aug 2024
dates = pd.date_range(start="2007-01-01", end="2024-08-01", freq='MS')
years = dates.year
months = dates.strftime("%b")

# Simulate deaths using Poisson distribution
simulated_shelter_death = np.random.poisson(lam=3, size=len(dates))

# Allocate gender breakdown
male_death = np.round(simulated_shelter_death * 0.65).astype(int)
other_death = np.round(simulated_shelter_death * 0.15).astype(int)
female_death = simulated_shelter_death - male_death - other_death

# Create DataFrame
simulated_data = pd.DataFrame({
    "year": years,
    "month": months,
    "total_death_num": simulated_shelter_death,
    "male_death_num": male_death,
    "female_death_num": female_death,
    "other_death_num": other_death
})

#### Write CSV ####
simulated_data.to_csv(
    "data/simulated_data/simulated_shelter_residences_death_data.csv",
    index=False
)
