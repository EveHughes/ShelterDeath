# Analysis on Trend of Death of Shelter Residence in Toronto

## Overview

This project explores the growing concern of mortality among residents of Toronto's shelter system, with a focus on identifying trends and disparities in deaths between 2007 and 2024. Using data from OpenToronto, the study seeks to shed light on the demographics and seasonal variations that may contribute to these findings. The dataset includes key variables such as year, month, gender distribution, and total number of deaths.

The analysis shows that the number of deaths has steadily increased over the years, with a significant gender disparity: male deaths consistently account for the majority of fatalities. In addition, the analysis of seasonal trends shows that mortality peaks in the colder months of January and November, although there is no consistent seasonal pattern over the entire timeline. This suggests that other factors, such as the COVID-19 pandemic and social policy changes, may have a greater impact on mortality rates.

The project uses a variety of statistical and visualization techniques to illustrate these trends. The findings underscore the importance of addressing gender vulnerabilities and the critical need for public health interventions to reduce shelter mortality. The analysis also highlights the limitations of the dataset, including the lack of data on the demographics and health status of the entire shelter population, and gaps in information on gender identity before 2020. 


By providing insights into these patterns, the project aims to inform future interventions and policies aimed at improving the living conditions and health outcomes of people living in shelters.


## File Structure

The repo is structured as:

-   `data/raw_data` contains the raw data as obtained from X.
-   `data/analysis_data` contains the cleaned dataset that was constructed.
-   `data/simulated_data` contains the data that is simulated based on the sketches.
-   `other` contains details about LLM chat interactions and sketches.
-   `paper` contains the files used to generate the paper, including the Quarto document and reference bibliography file, as well as the PDF of the paper. 
-   `scripts` contains the R scripts used to simulate, download and clean data.


## Statement on LLM usage

Aspects of the code and text content of the paper were written with the help of ChatGPT. And the overview section of the Readme file were also written with help of ChatGPT. The entire chat history is available in inputs/llms/usage.txt.