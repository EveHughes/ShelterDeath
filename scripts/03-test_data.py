#### Preamble ####
# Purpose: Sanity check of the data
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: Need to have simulated data

#### Workspace setup ####
import pandas as pd

#### Test data ####
df = pd.read_csv("data/simulated_data/simulated_shelter_residences_death_data.csv")

# Test for negative numbers in total deaths
has_negative_total = (df["total_death_num"] < 0).any()
print("Any negative total death count:", has_negative_total)

# Test if months are valid
valid_months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun",
                "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"]
all_months_valid = df["month"].isin(valid_months).all()
print("All months valid:", all_months_valid)

# Test if total_death_num equals sum of gender breakdowns
gender_sum_matches = (df["total_death_num"] ==
                      df["male_death_num"] +
                      df["female_death_num"] +
                      df["other_death_num"]).all()
print("All gender sums match total:", gender_sum_matches)
