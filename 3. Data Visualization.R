##Visualizations
options(scipen = 999)

ggplot(cleaned_trip_df) +
  geom_bar(mapping=aes(x = member_casual, fill=member_casual), position = 'dodge') +
  labs(fill = 'Member Type', 
       title = 'Total Each Member Type')


##Daily ride numbers
Daily_trip <- cleaned_trip_df %>%
  group_by(trip_days, member_casual) %>%
  summarise(Total_trip_per_day = n())

ggplot(Daily_trip, aes(x = trip_days, y= Total_trip_per_day,  fill= member_casual)) +
  geom_bar(stat = 'identity', position = 'dodge') +
  labs(x = 'Days of Week', y= 'Total Daily Trip', 
       title = 'Daily Ride Numbers')

##Number of rides per hour
ggplot(cleaned_trip_df) +
  geom_bar(mapping=aes(x = started_hour, fill=member_casual), position = 'dodge') +
  labs(x= 'Hour', y='Hourly ride number', fill = 'Member Type', 
       title = 'Hourly Ride Numbers in a Week') +
  facet_wrap(~trip_days)


##Number of ride per month
ggplot(cleaned_trip_df) +
  geom_bar(mapping = aes(x= trip_months, fill=member_casual), position= 'dodge') +
  labs(x= 'Month', y= 'Number of Rides', title= 'Number of Rides per month')

##Number of ride per season
ggplot(cleaned_trip_df) +
  geom_bar(mapping = aes(x= trip_seasons, fill=member_casual), position= 'dodge') +
  labs(x= 'Season', y= 'Number of Rides', title= 'Number of Rides per season')


##Finding most popular station
View ((cleaned_trip_df) %>%
        group_by(start_station_name) %>%
        summarise(count = n()) %>%
        arrange(desc(count)))


View (cleaned_trip_df %>% filter(member_casual == 'casual') %>%
        group_by(member_casual, start_station_name) %>%
        summarise(count = n()) %>%
        arrange(desc(count)))


View (cleaned_trip_df %>% filter(member_casual == 'member') %>%
        group_by(member_casual, start_station_name) %>%
        summarise(count = n()) %>%
        arrange(desc(count)))


