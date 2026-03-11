install.packages("readxl")
install.packages("tidyr")
install.packages("dplyr")
install.packages("ggplot2")
install.packages("lubridate")

library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)
library(lubridate)


df_hyd <- read_excel("data/Hyderabad AQI.xlsx") %>%
  pivot_longer(cols = -Month, names_to = "Year", values_to = "AQI") %>%
  mutate(
    Month = match(Month, month.abb),
    Year = as.numeric(Year),
    Date = make_date(Year, Month, 1),
    City = "Hyderabad"
  )

df_chennai <- read_excel("data/Chennai AQI.xlsx") %>%
  pivot_longer(cols = -Month, names_to = "Year", values_to = "AQI") %>%
  mutate(
    Month = match(Month, month.abb),
    Year = as.numeric(Year),
    Date = make_date(Year, Month, 1),
    City = "Chennai"
  )


df_blr <- read_excel("data/Bangalore AQI.xlsx") %>%
  pivot_longer(cols = -Month, names_to = "Year", values_to = "AQI") %>%
  mutate(
    Month = match(Month, month.abb),
    Year = as.numeric(Year),
    Date = make_date(Year, Month, 1),
    City = "Bangalore"
  )



