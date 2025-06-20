#### Preamble ####
# Purpose: Cleans the raw marriage data into an analysis dataset
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT

#### Workspace setup ####
import pandas as pd

#### Get data ####
raw_data = pd.read_csv("data/raw_data/shelter_residences_death_raw_data.csv")

#### Clean column names manually (like janitor::clean_names) ####
raw_data.columns = (
    raw_data.columns
    .str.strip()
    .str.lower()
    .str.replace(' ', '_')
    .str.replace(r'[^\w\s]', '', regex=True)
)

raw_data["transgendernonbinarytwospirit"] = raw_data["transgendernonbinarytwospirit"].fillna("NA")

#### Drop rows with missing values ####
cleaned_data = raw_data.dropna()

#to match original version
cleaned_data = cleaned_data[cleaned_data["_id"] < 213]

#### Save cleaned data ####
cleaned_data.to_csv(
    "data/analysis_data/shelter_residences_death_analysis_data.csv",
    index=False
)
