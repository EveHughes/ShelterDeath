#### Preamble ####
# Purpose: Downloads and saves the data from Open Data Toronto
# Author: Xinqi Yue
# Date: 23 September 2024
# Contact: xinqi.yue@mail.utoronto.ca
# License: MIT
# Pre-requisites: None
# Any other information needed? None

import requests
import pandas as pd
from io import StringIO
	
base_url = "https://ckan0.cf.opendata.inter.prod-toronto.ca"
 
# Datasets are called "packages". Each package can contain many "resources"
# To retrieve the metadata for this package and its resources, use the package name in this page's URL:
url = base_url + "/api/3/action/package_show"
params = { "id": "deaths-of-shelter-residents"}
package = requests.get(url, params = params).json()
 
# To get resource data:
for idx, resource in enumerate(package["result"]["resources"]):
 
       # for datastore_active resources:
       if resource["datastore_active"]:
 
           # To get all records in CSV format:
           url = base_url + "/datastore/dump/" + resource["id"]
           resource_dump_data = requests.get(url).text
           data = pd.read_csv(StringIO(resource_dump_data))
           data.to_csv("data/raw_data/shelter_residences_death_raw_data.csv", index=False)
           break