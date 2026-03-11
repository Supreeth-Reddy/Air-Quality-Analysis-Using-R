library(readxl)
library(tidyr)
library(dplyr)
library(ggplot2)
library(lubridate)


# -------------------------------------------------
# DATA LOADING AND PREPARATION
# -------------------------------------------------

df_hyd <- read_excel("data/Hyderabad AQI.xlsx") %>%
  pivot_longer(cols = -Month, names_to = "Year", values_to = "AQI") %>%
  mutate(
    Month_num = match(Month, month.abb),
    Year = as.numeric(Year),
    Date = make_date(Year, Month_num, 1),
    City = "Hyderabad"
  )


df_chennai <- read_excel("data/Chennai AQI.xlsx") %>%
  pivot_longer(cols = -Month, names_to = "Year", values_to = "AQI") %>%
  mutate(
    Month_num = match(Month, month.abb),
    Year = as.numeric(Year),
    Date = make_date(Year, Month_num, 1),
    City = "Chennai"
  )


df_blr <- read_excel("data/Bangalore AQI.xlsx") %>%
  pivot_longer(cols = -Month, names_to = "Year", values_to = "AQI") %>%
  mutate(
    Month_num = match(Month, month.abb),
    Year = as.numeric(Year),
    Date = make_date(Year, Month_num, 1),
    City = "Bangalore"
  )


aqi_data <- bind_rows(df_hyd, df_chennai, df_blr)


# -------------------------------------------------
# VISUALIZATION SECTION
# -------------------------------------------------

# AQI Trend Comparison
trend_plot <- ggplot(aqi_data, aes(x = Date, y = AQI, color = City)) +
  geom_line(linewidth = 1) +
  geom_point() +
  labs(
    title = "Monthly AQI Trend Comparison",
    x = "Year",
    y = "AQI"
  ) +
  theme_minimal()

print(trend_plot)

ggsave("plots/aqi_trend_comparison.png",
       plot = trend_plot,
       width = 8,
       height = 5)



# AQI Distribution by City
city_distribution_plot <- ggplot(aqi_data, aes(x = City, y = AQI, fill = City)) +
  geom_boxplot() +
  labs(
    title = "AQI Distribution Across Cities",
    x = "City",
    y = "AQI"
  ) +
  theme_minimal()

print(city_distribution_plot)

ggsave("plots/city_aqi_distribution.png",
       plot = city_distribution_plot,
       width = 8,
       height = 5)



# Monthly AQI Pattern
monthly_plot <- ggplot(aqi_data, aes(x = Month, y = AQI, fill = City)) +
  geom_boxplot() +
  labs(
    title = "Monthly AQI Variation",
    x = "Month",
    y = "AQI"
  ) +
  theme_minimal()

print(monthly_plot)

ggsave("plots/monthly_aqi_pattern.png",
       plot = monthly_plot,
       width = 8,
       height = 5)



# Year-wise AQI Variation
yearly_plot <- ggplot(aqi_data, aes(x = factor(Year), y = AQI, fill = City)) +
  geom_boxplot() +
  labs(
    title = "Year-wise AQI Variation",
    x = "Year",
    y = "AQI"
  ) +
  theme_minimal()

print(yearly_plot)

ggsave("plots/yearly_aqi_variation.png",
       plot = yearly_plot,
       width = 8,
       height = 5)



# -------------------------------------------------
# STATISTICAL ANALYSIS SECTION
# -------------------------------------------------

# Descriptive Statistics by City
city_stats <- aqi_data %>%
  group_by(City) %>%
  summarise(
    Mean_AQI = mean(AQI, na.rm = TRUE),
    Median_AQI = median(AQI, na.rm = TRUE),
    SD_AQI = sd(AQI, na.rm = TRUE),
    Min_AQI = min(AQI, na.rm = TRUE),
    Max_AQI = max(AQI, na.rm = TRUE)
  )

print(city_stats)



# Year-wise Mean AQI
year_stats <- aqi_data %>%
  group_by(Year, City) %>%
  summarise(Mean_AQI = mean(AQI, na.rm = TRUE))

print(year_stats)



# Monthly Mean AQI
month_stats <- aqi_data %>%
  group_by(Month, City) %>%
  summarise(Mean_AQI = mean(AQI, na.rm = TRUE))

print(month_stats)



# Correlation Between Cities
city_wide <- aqi_data %>%
  select(Date, City, AQI) %>%
  pivot_wider(names_from = City, values_from = AQI)

cor_matrix <- cor(city_wide[,-1], use = "complete.obs")

print(cor_matrix)



# ANOVA Test (Difference Between Cities)
anova_model <- aov(AQI ~ City, data = aqi_data)

summary(anova_model)



# Linear Regression Trend (Example: Hyderabad)

hyd_data <- aqi_data %>%
  filter(City == "Hyderabad")

trend_model <- lm(AQI ~ Date, data = hyd_data)

summary(trend_model)
