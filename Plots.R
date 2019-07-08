
VERSION="R version 3.5.3 (2019-07-08)"


# get data
full_trains <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

# libraries
library(dplyr)
library(ggplot2)
library(stringr)

full_trains %>% 
  ggplot(aes(x = journey_time_avg)) + 
  geom_histogram(bins = 20) +
  labs(x = "Journey Time (mins.)", y = "Number of Instances", 
       title = "Histogram of Average Journey Time for trains on the SNCF network")


full_trains$nat <- "other"
full_trains$nat[full_trains$service == "National"] <- "National" 

full_trains$nat <- factor(full_trains$nat, levels = c("other", "National"))

full_trains %>%
  ggplot(aes(x = journey_time_avg, fill = nat)) +  
  geom_histogram(bins = 20, alpha = 0.5) +
  
  labs(x = "Journey Time (mins.)", y = "Number of Instances", 
       title = "Histogram of Average Journey Time for trains on the SNCF network")


paris_only <- full_trains %>%  filter(str_detect(departure_station, "^P"))

paris_only_2 <-   with(paris_only(aggregate(paris_only$Average_cancelation, by = list(year = year, month = month, departure_station = departure_station),mean)))
  
full_trains$Avg_canc_month <- full_trains$num_of_canceled_trains[full_trains$num_of_canceled_trains == 
  month
  year
full_trains %>%
  ggplot(aes(x = num_of_cancelled_trains, y = departure_station)) + 
  geom_point() +
  facet_wrap(~year)



