# RStudio: Google Data Analytics - Study Case 1
Recently, I completed Google Data Analytics Professional by Coursera. The course is challenging and exciting at the same time. However, it is worth studying.
The course consists of 8 chapters, and at the end of the chapter, there are several case studies to solve. This article will consist of a case study on business solving for a marketing team of the bike-share fictional company, Cyclistic, in Chicago.
Approaching this case study, I would choose Rstudio and Tableu for processing and analyzing the data. I will explain it based on 6 steps of the analysis process: **Ask, Prepare, Process, Analyze, Share & Act.**

## 1.	ASK
At the start, we need to make sure the problems that we want to resolve and understand the expectations of the stakeholders.
 There are three questions asked by the marketing director of Cyclistic:
1.	How do annual members and casual riders use bicycles differently?
2.	Why do casual riders buy an annual membership in Cyclistic?
3.	How does the Cyclistic use digital media to influence Casual riders to become members?

## 2.	PREPARE
I’m going to use Cyclistic’s historical [trip data](https://divvy-tripdata.s3.amazonaws.com/index.html) from January 2022 to December 2022. We need to download all twelve CSV files and save them on our computer. I renamed the files to make it easier. 

    202201-divvy-tripdata.csv -> 2022_01.csv
    202202-divvy-tripdata.csv -> 2022_02.csv
And so on…


## 3.	PROCESS
We have over 5 million data to analyze. Instead of using a spreadsheet, I chose Rstudio as the tool for analysis purposes which is more efficient and faster.
Before importing the files into Rstudio, firstly, we need to install all the packages that are required in R.
We need tidyverse, janitor, skimr, and dplyr. After installing all the packages, we will be able to import all the CSV files.
Click here to see [Data Processing](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/blob/main/1.%20Data%20Process.R).


After preparing and combining all data, now we can turn to [Cleaning Process](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/blob/main/2.%20Data%20Cleaning.R).

These are the steps that I did in data cleaning:
 - By using clean_names(), will automatically ensure that column names are unique and consistent. It also determines that there are only characters, numbers, and underscore in the names.
 - I used remove_empty() to remove any empty columns and rows in the data frame.
 - Removing duplicate data by using distinct().
 - Removing unnecessary columns (ride_id, end_station_id, start_lat, start_lng, end_lng, and end_lat).
 - I also created some new columns for my analysis purposes. It is way easier to do it in new columns. 
 - The new columns that I created are trip duration (in minutes), day of the trip, month of the trip, season of the trip, and start hour of the trip.

However, after the cleaning process and adding some columns, there may still be some unsuitable data or errors. 

So, I checked the minimum and maximum value for trip duration. I grouped it by the member type and also dropped the NA value. The View() function will show us the result in a new tab, thus we see it easily. Here is the result.

| |Member Type|Max Trip Duration |Min Trip Duration|
|-|-----------|------------------|-----------------|
|1|Casual     |34354.067         |-127.0167        |
|2|Annual     |1493.233          |-168.7000        |

As we can see, there are some minus values in trip duration which is illogical. Therefore, we need to filter the trip duration that is less than 0 and drop the NA value.

I made a new data frame for the cleaned one. There are **5.667.717** rows before cleaning and now we have **4.369.052** rows after cleaning.

## 4.	ANALYZE & SHARE
After the cleaning process, now we have the appropriate data and are ready to analyze it. Let’s recall the first question about the difference between annual members and casual members in using bicycles. I would like to plot the problem into some observations.

 **- Member type distribution** 

![Total each member type](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/3dd2323e-7a8b-4146-9c56-9de7140d37d3)

Checking the total for each member type, there are around 40% casual members. This shows the opportunity to gain more annual members from the casual riders, rather than collecting new customers.
Now, let's check how casual riders and annual members use bicycles differently.


 **- Daily ride numbers**

![Daily Ride Numbers](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/661ef4e2-f08d-4f61-8cf8-008bf7131f50)


 **- Hourly ride numbers**

 ![Hourly ride number in a week](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/1c8a2baf-c2d9-45e5-81ff-5fc80baf4bc8)


  **- Monthly ride numbers**

![Number of ride per month](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/c7855b7f-23b7-402a-9a56-bd539e572b6f)


 **- Seasonal ride numbers**

![Number of Rides per season](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/8ad7e16c-78ad-4c94-b2b0-f8ce278a21dc)


 **- Most popular station to start**

1. Most popular station in general

| |Start Station Name                    |Count|
|-|--------------------------------------|-----| 
|1|Streeter Dr & Grand Ave               |71.259|
|2|Dusable Lake Shore Dr & Monroe St     |39.250|
|3|Dusable Lake Shore Dr & North Blvd    |37.696|
|4|Michigan Ave & Oak St                 |37.204|
|5|Wells St & Concord Ln                 |34.507|
|6|Millenium Park                        |32.846|
|7|Clark St & Elm St                     |32.556|
|8|Kingsburry St & Kinzie St             |31.614|
|9|Theater on the Lake                   |31.282|
|10|Wells St & Elm St                    |28.997|



2. Most popular station for casual member

| |Member Type|Start Station Name                    |Count|
|-|-----------|--------------------------------------|-----|
|1|Casual     |Streeter Dr & Grand Ave               |55.054|
|2|Casual     |Dusable Lake Shore Dr & Monroe St     |30.261|
|3|Casual     |Millenium Park                        |23.948|
|4|Casual     |Michigan Ave & Oak St                 |23.760|
|5|Casual     |Dusable Lake Shore Dr & North Blvd    |22.156|
|6|Casual     |Shedd Aquarium                        |19.421|
|7|Casual     |Theater on the Lake                   |17.332|
|8|Casual     |Wells St & Concord Ln                 |14.833|
|9|Casual     |Dusable Harbor                        |13.270|
|10|Casual    |Clark St & Armitage Ave               |12.777|


3. Most popular station for annual member

| |Member Type|Start Station Name                    |Count|
|-|-----------|--------------------------------------|-----|
|1|Annual     |Kingsbury St & Kinzie St              |23.523|
|2|Annual     |Clark St & Elm St                     |20.578|
|3|Annual     |Wells St & Concord Ln                 |19.674|
|4|Annual     |Clinton St & Washington Blvd          |18.828|
|5|Annual     |Loomis St & Lexington St              |18.252|
|6|Annual     |Clinton St & Madison St               |18.007|
|7|Annual     |University Ave & 57th St              |17.578|
|8|Annual     |Ellis Ave & 60th St                   |17.503|
|9|Annual     |Wells Street & Elm St                 |17.495|
|10|Annual    |Streeter Dr & Grand Ave               |16.205|



From several statistics above we can conclude that:
1.	Casual riders show a big number on weekends more than weekdays.
2.	The highest number of riders rose from June to September. Followed by the season, summer and fall show the largest number, which occurred from June until September.
3.	By looking at the table, we can also conclude which stations are most started to ride, either in general or by member type.

## 5.	ANALYZE & SHARE (Tableu Version)
To add and convince the results I have analyzed, I also visualized it using tableu. I am going to use data that I cleaned before by using R. You can see the result on my dashboard [here](https://public.tableau.com/views/StudyCase1DivvyTrip/Dashboard1?:language=en-GB&:display_count=n&:origin=viz_share_link).

## 6.	ACT
For the last step in this analysis phase, I’ll try to answer the third question about marketing strategy. Throughout the analysis process, I would like to suggest:
1.	Offers a discount or a special benefit for casual members who upgrade to the annual membership such as membership registration fee, free for the first month, and others.
   e.g:
2.	Offer exclusive benefits on weekend trips, including extended hours of use or discounted rates for weekend trips.
3.	Launch a promotional campaign with a summer theme that highlights the advantages of annual membership, such as access to special events or exclusive summer rides.
4.	Provide interesting content for social media, blogs, and email newsletters that show the benefits of annual membership, success stories, and testimonials.
5.	Create a referral program that encourages a sense of community by offering prizes to the new annual member and the casual member who refers others.

To use digital media, it is really important to encourage personalized communication through targeted email or social media ads, Thus all members believe that the company is aware of them.
