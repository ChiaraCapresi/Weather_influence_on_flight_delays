# Weather_influence_on_flight_delays

This is a 1 week solo project I worked on as a final project of the "Professional Data Analysis" course at CodeClan.

## Context

In this project I assumed to have been hired by Newark airport to investigate the effect of weather on the length of departure delays for fligths departing from the New York airports “Newark Liberty International Airport”, “La Guardia Airport” and “JFK International Airport”.

## Datasets

I used the following Datasets:

- `flights` - which is a dataset provided by internal data of the three airports of interest, which contains informations about flights departing from them in 2017. These information concern for example, departure and arrival times and delays, departuring and arrival airports, length of flights, both in terms of distance and duration.

- `weather` - this way an exteral dataset collecting recordings of weather specific features over the year 2017 for the places where the three airports of interest are located.

- `airlines` - the airlines dataset contains names and carriers of airlines involved in flights departing from “Newark Liberty International Airport”, “La Guardia Airport” or “JFK International Airport” in 2017.


### Initial strategies:

- I could have decided to measure the departure delays in terms of number of delays or in terms of their length. I decided to concentrate on their length, since it seems to me much more interesting if I am in aim of comparing the delays with the weather conditions.


- Could have been interesting also analysing as a possible impact on the delays also the destination weather conditions at the moment of the landing. However, since we are assumed to investigate the weather impact on delays specifically on three of the New York airports, we may not be interested on the arrival weather conditions if the flight doesn't land in one of these three airports. Investigating the impact of weather on arrival delays at “Newark Liberty International Airport”, “La Guardia Airport” and “JFK International Airport", coluld be an interesting extention.

## Business questions:

-	Does the weather actually influence the length of departure delays?
-	Do the different airlines or the specific departure airports have a role to play together with the weather conditions with the 
        length of departure delays?
-	………








