##Cleaning data
trip_df <- clean_names(trip_df)

##Removing empty columns and rows
trip_df <- remove_empty(trip_df, which = c("cols"))
trip_df <- remove_empty(trip_df, which = c("rows"))

##Removing duplicate data
trip_df <- distinct(trip_df)

##Removing unneeded columns
trip_df <- trip_df %>%
  select(-c(ride_id, start_station_id, end_station_id, start_lat, start_lng, end_lng, end_lat))

skim_without_charts(trip_df)

##trip duration
trip_df$trip_duration <- as.numeric(difftime(trip_df$ended_at, trip_df$started_at, units = 'mins'))

##creating day & month
trip_df$trip_days <- wday(trip_df$started_at, label = TRUE)

trip_df$trip_months <- month(trip_df$started_at, label = TRUE)

##Started hour of the trip
trip_df$started_hour <- hour(trip_df$started_at)

##Creating seasons
trip_df$trip_seasons <- ifelse(month(trip_df$started_at) %in% c(3, 4, 5), "Spring", 
                               ifelse(month(trip_df$started_at) %in% c(6, 7, 8), "Summer", 
                                      ifelse(month(trip_df$started_at) %in% c(9, 10, 11), "Fall", "Winter")))

##Checking the highest and the lowest trip duration
View(trip_df %>% group_by(member_casual) %>% drop_na() %>%
      summarize(max_trip_duration = max(trip_duration), 
                min_trip_duration = min(trip_duration)))


##removing 0 minute or less trip_duration and NA value
cleaned_trip_df <- trip_df %>%
  filter(trip_duration > 0) %>% drop_na()


