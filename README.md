# Flights delays and weather conditions at "Newark", "JFK" and "La Guardia" airports

This is a 1 week solo project I worked on as a final project of the "Professional Data Analysis" course at CodeClan.

## Context

In this project I assumed to have been hired by Newark airport to investigate the effect of weather on the length of departure delays for fligths departing from the New York airports “Newark Liberty International Airport”, “La Guardia Airport” and “JFK International Airport”.

## Datasets

I used three Datasets:
- `flights` - Internal – This dataset contains information about flights departing from one of the following three New York airports:  
“Newark Liberty International Airport”, “La Guardia Airport” and “JFK International Airport” in 2017. Specifically, in addition to 
dentifiers like their number, and talinum, also data about their starting and ending points departure and arrival times and delays, 
duration and length of the flights. It is a dataset provided by the  internal data of the New York airports.
- `airlines` - Public - This is a public dataset, which contains the airlines’ names and their shortcuts.
- `weather` - External – This is an external dataset containing information about specific weather features recordings for the three
airports of interest in 2017.



### Initial strategies:

- I could have decided to measure the departure delays in terms of number of delays or in terms of their length. I decided to concentrate on their length, since it seems to me much more interesting if I am in aim of comparing the delays with the weather conditions.

- Comparing the `weather` and `flights` datasets came to light that  the weather recording information in the dataset I used, are only available for the departure airports. Since the `departure delays` and `arrival delays` variables are strongly correlated and the aim of the project is to focus mainly on three New York airports, I decided to concentrate most on the impact that weather has on the departure delays. Even if I am convinced that could be a good extension that of looking for a further dataset containing weather information also on the destination airports and analyse in which way the arrival place weather influence the arrival delays too or to analyse how much the weather conditions impact on the arrival delays at the airports of interests which I assume must be strongly correlated to the departure delays too. However, this could be an interesting point to analyse for a possible extension.

- Finally, since I am interested in the impact that the weather has on the departure delays and I it doesn’t seem to me reasonable that early departures can be caused by weather ( a part from specific and critical conditions that we are not considering in this analysis), I also decided to consider only positive values of departure delays, which correspond to the effective delays and not to the early departures. Furthermore, the first statistical analysis I performed seems to validate this assumption, since the  correlation between departure delays and weather conditions seems to be a bit higher if we take into account only effective delays.

## Business questions:

-	Does the weather effectively influence the flights departure delays and which weather condition impact mostly?
-	Are there any other factors that together with `wind speed`, `wind_dir` and `visibility` influence the length of flights delays in
        the three airports of interest?








