# Data Cleaning

library(tidyverse)
library(lubridate)


airlines <- read_csv(here::here("raw_data/airlines.csv"))
airports <- read_csv(here::here("raw_data/airports.csv"))
flights <- read_csv(here::here("raw_data/flights.csv"))
planes <- read_csv(here::here("raw_data/planes.csv"))
weather <- read_csv(here::here("raw_data/weather.csv"))


#I will generally postpone the cleaning decisions after the joins operations. However, there are a few necessary actions that rised from the `data_exploration` file that I can handle right now.

#`weather` dataset

# From`Assumption 1` of the `data_exploration` file, I decided to delete from the `weather` dataset the columns `temp`, `dewp`,`pressure`,`precip` and `humid`, since the non NAs values here are only the 2% of the entire dataset, which make them not statistically significant.
#I am going to delete also the 'year' column, since all the data refers to the same year, i.e. 2017.

#The first think I need to do is joining the`flights` dataset with the one containing information about the `weather`. Before doing that we notice that in the two datasets appears columns with the same name, e.g. 'year', 'month', 'day' etc..., wich apparently refer to different things, actually I want that the coincide since I am interested in comparing weather and flights times, but I have this information also in the `time_hour` column which is used for the join, so I think that the best choice should be that of deleting them from both the datasets before joining.

weather <- weather %>% 
  select(-c("temp", "dewp", "pressure", "precip", "humid", "year", "month", "day", "hour"))



flights <- flights %>% 
  select(-c("month", "day", "hour", "year"))

flights_weather <- inner_join(flights, weather, by = c("time_hour", "origin"))


#Finally I am going to create separate columns for `year`, `month`, `day` and `hour`.

flights_weather <- flights_weather %>% 
  mutate(
    year = year(time_hour),
    month = month(time_hour),
    day = day(time_hour),
    hour = hour(time_hour)
  )


#In the following I am going to sobstitute the NAs in the weather parameters with a mean of their value for the same month, hour and day and drop all the NAs in those valus left. I will also drop the NAs in the 'dep_delay' column for now.

flights_weather <- flights_weather %>% 
  group_by(month, day, hour) %>%
  mutate(across(.col = c("wind_speed", "wind_gust", "wind_dir", "visib"), .fns = ~coalesce(.x, mean(.x, na.rm = TRUE)))) %>% 
  filter(!((is.na(wind_speed) | (is.na(wind_dir)) | (is.na(wind_gust)) | (is.na(visib)) | is.na(dep_delay)))) %>% 
  ungroup()

#Now I am going to group the wind speed in categories, in such a way to have also a categorical version of them.
#From Assumption 2 in the file `data_exploration_part1`, I am going to create a new dataset containing only the necessary information about flights and weather interactions

flights_weather <- flights_weather %>% 
  mutate(wind_speed_group = case_when(
    #wind_speed >= 0 &
    wind_speed <= 5 ~ "0 - 5",
    wind_speed > 5 & wind_speed <= 15 ~ "6 - 15",
    wind_speed > 15 & wind_speed <= 25 ~ "16 - 25",
    wind_speed > 25 & wind_speed <= 35 ~ "26 - 35"
  )) %>% 
  mutate(visib_group = case_when(
    visib <= 2 ~ "less than 2",
    visib <= 5 ~ "3 - 5",
    visib <= 8 ~ "6 - 8",
    visib > 8 ~ "greater than 8"
  )) %>% 
  mutate(wind_dir_group = case_when(
    wind_dir <= 100 ~ "less than 100",
    wind_dir <= 200 ~ "100 - 200",
    wind_dir <= 300 ~ "200 - 300",
    wind_dir > 300 ~ "greater than 300"
  )) %>% 
  select(-c("dep_time", "sched_dep_time", "arr_time", "sched_arr_time", "minute", "year")) %>% 
  filter(dep_delay >= 0) #I am going to consider only departure delays and not early departures.





write_csv(flights_weather, "cleaned_data/flights_weather.csv")


tight_flights_weather <- flights_weather %>% 
  mutate(wind_speed_group = case_when(
    #wind_speed >= 0 & 
    wind_speed <= 25 ~ "less than 25",
    wind_speed > 25 & wind_speed <= 35 ~ "over 26"
  )) %>% 
  mutate(visib_group = case_when(
    visib <= 8 ~ "less than 8",
    visib > 8 ~ "greater than 8"
  )) %>% 
  mutate(wind_dir_group = case_when(
    wind_dir <= 200 ~ "less than 200",
    wind_dir > 200 ~ "greater than 200"
  ))


write_csv(tight_flights_weather, "cleaned_data/tight_flights_weather.csv")


## airlines: the column `name` seems to be confusing, I will rename it as `airline`.

airlines <- airlines %>% 
  rename("airline" = "name")

weather_impact <- left_join(tight_flights_weather, airlines, "carrier")

write_csv(weather_impact, "cleaned_data/weather_imp.csv")

































