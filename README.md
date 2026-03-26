# Air Quality Analysis Using R
This repository contains an R script for analyzing and visualizing Air Quality Index (AQI) data for three major Indian cities: Bangalore, Chennai, and Hyderabad. The analysis explores trends, distributions, and statistical differences in AQI over time and between cities.

## Project Overview
The project aims to:
- Load, clean, and merge monthly AQI data from multiple Excel files.
- Perform exploratory data analysis (EDA) to uncover patterns and trends.
- Create compelling visualizations to compare AQI across cities, months, and years.
- Conduct statistical tests to derive quantitative insights from the data.

## Dataset
The AQI data is provided for the following cities, with each city's data in a separate `.xlsx` file located in the `data/` directory:
- Bangalore
- Chennai
- Hyderabad

The data is structured with months as rows and years as columns, which is reshaped into a tidy format for analysis.

## Analysis and Visualizations
The `Air_Quality_Analysis.R` script performs several key analyses and generates the corresponding visualizations.

### Statistical Analysis
- **Descriptive Statistics:** Calculates mean, median, standard deviation, min, and max AQI for each city.
- **Grouped Summaries:** Computes mean AQI by year and by month for each city.
- **Correlation Analysis:** Determines the correlation in AQI fluctuations between the cities.
- **ANOVA Test:** Assesses if there are statistically significant differences in the mean AQI values among the three cities.
- **Linear Regression:** Models the AQI trend over time for each city (example shown for Hyderabad).

### Visualizations
The following plots are generated using `ggplot2` and saved in the `plots/` directory:

1.  **Monthly AQI Trend Comparison:** A line chart showing the AQI trend over the years for all three cities.
    `plots/aqi_trend_comparison.png`
2.  **AQI Distribution Across Cities:** Boxplots comparing the overall AQI distribution for each city.
    `plots/city_aqi_distribution.png`
3.  **Monthly AQI Variation:** Boxplots showing the AQI pattern for each month of the year.
    `plots/monthly_aqi_pattern.png`
4.  **Year-wise AQI Variation:** Boxplots illustrating the distribution of AQI values for each year.
    `plots/yearly_aqi_variation.png`

## Project Structure

```
Air-Quality-Analysis-Using-R/
├── Air_Quality_Analysis.R      # Main R script for analysis and visualization
├── data/
│   ├── Bangalore AQI.xlsx      # AQI data for Bangalore
│   ├── Chennai AQI.xlsx        # AQI data for Chennai
│   └── Hyderabad AQI.xlsx      # AQI data for Hyderabad
└── plots/                      # Directory for saved plots
```

## Prerequisites

This analysis requires R and the following packages.

- `readxl`
- `tidyr`
- `dplyr`
- `ggplot2`
- `lubridate`

You can install all required packages by running the following command in your R console:
```R
install.packages(c("readxl", "tidyr", "dplyr", "ggplot2", "lubridate"))
```

## How to Run

1.  Clone this repository to your local machine.
2.  Ensure you have R and RStudio (or another R IDE) installed.
3.  Set the working directory to the root of the cloned repository.
4.  Open and run the `Air_Quality_Analysis.R` script.

The script will print the statistical analysis results to the console and save the generated plots to the `plots/` directory.
