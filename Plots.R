
VERSION="R version 3.5.3 (2019-07-08)"


# get data
full_trains <- read.csv("https://raw.githubusercontent.com/rfordatascience/tidytuesday/master/data/2019/2019-02-26/full_trains.csv")

# libraries
library(dplyr)
library(ggplot2)


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





