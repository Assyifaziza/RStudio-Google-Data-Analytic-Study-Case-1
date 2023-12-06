# RStudio: Google Data Analytic - Study Case 1
Recently, I've completed Google Data Analytics Professional by coursera. The course are both challenging and exciting at the same time. However, it is worth studying.
The course consists of 8 chapters, which at the end of the chapter there are several case studies to solve. This article will consist a case study on business solving for a marketing team of the bike-share fictional company, Cyclistic, in Chicago.
Approching this case study, I would choose Rstudio and Tableu for processing and analizing the data. I will explain it based on 6 step of the analysis process: **Ask, Prepare, Process, Analyze, Share & Act.**
## 1.	ASK
At the start, we need to make sure the problems that we want to resolve and understand the expectations of the stakeholders.
 There are three questions asked by the marketing director of Cyclistic:
1.	How do annual members and casual riders use bicycles differently?
2.	Why do casual riders buy annual membership in Cyclistic?
3.	How does the Cyclistic use digital media to influence Casual riders to become members?

## 2.	PREPARE
I’m going to use Cyclistic’s historical [trip data](https://divvy-tripdata.s3.amazonaws.com/index.html) from January 2022 to December 2022. We need to download all the twelve csv files and save it in our computer. I renamed the files to make it easier. 

![image](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/cd313bd1-825a-4980-b0c2-828b2bed617f)

## 3.	PROCESS
We have over 5 million data to analyze. Instead of using spreadsheet, I chose Rstudio as the tool for analysis purposes which is more efficient and faster.
Before importing the files into Rstudio, firstly, we need to install all the packages that required in R.
We need tidyverse, janitor, skimr, and dplyr. After installing all the packages, we will be able to import all the cv files.
Click here to see [Data Processing](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/blob/main/1.%20Data%20Process.R).


After preparing and combining all data, now we can turn to [Cleaning Process](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/blob/main/2.%20Data%20Cleaning.R).

These are the steps that I did in data cleaning:
 - By using clean_names(), will automatically ensure that column names are unique and consistent. It also determines that there are only characters, numbers, and underscore in the names.
 - I used remove_empty() to remove any empty columns and rows in the dataframe.
 - Removing duplicate data by using distinct().
 - Removing unnecessary columns (ride_id, end_station_id, start_lat, start_lng, end_lng, and end_lat).
 - I also created some new columns for my analysis purposes. It is way easier to do it in new columns. 
 - The new columns that I created are trip duration (in minutes), day of trip, month of trip, season of trip, and start hour of trip.

However, after the cleaning process and adding some columns, there may still be some unsuitable data or error. 

So, I checked the minimum and maximum value for trip duration. I grouped it by the member type and also dropped the NA value. The View() function will show us the result in new tab, thus we see it easily. Here is the result.

![image](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/7fe2db79-0bdc-4d76-a5b6-cea1bade326e)

As we can see, there are some minus value in trip duration which is illogical. Therefore, we need to filter the trip duration that are less than 0 and drop the NA value.

I made new dataframe for the cleaned one. There are **5.667.717** rows before cleaning and now we have **4.369.052** rows after cleaning.

## 4.	ANALYZE & SHARE
After cleaning process, now we have the appropriate data and ready to analyze it. Let’s recall the first questions about the difference between annual member and casual member on using bicycle. I would like to plot the problem into some observation.

 **- Member type distribution** 

![Total each member type](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/c36befec-11ae-4528-ab09-ee234203f758)

Checking total for each member type, there are around 40% casual member. This shows the opportunity to gain more annual member from the casual riders, rather than collecting new customer.
Now, lets check how casual riders and annual member use bicycle differently.

 **- Daily ride numbers**

![Daily Ride Numbers](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/661ef4e2-f08d-4f61-8cf8-008bf7131f50)

 **- Hourly ride numbers**

 ![Hourly ride number in a week](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/1c8a2baf-c2d9-45e5-81ff-5fc80baf4bc8)

  **- Monthly ride numbers**

![Number of ride per month](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/c7855b7f-23b7-402a-9a56-bd539e572b6f)


 **- Seasonal ride numbers**

![Number of Rides per season](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/8ad7e16c-78ad-4c94-b2b0-f8ce278a21dc)

 **- Most popular station to start**
Most popular place in general.

![image](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/a8bdda17-14b0-48f0-9424-de6532c0b6ba)


Most popular station for casual member.

![image](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/b8fd031b-c933-4854-84c8-d5c82ad20256)


Most popular station for annual member

![image](https://github.com/Assyifaziza/RStudio-Google-Data-Analytic-Study-Case-1/assets/130541237/1050c7ec-3279-4f9f-9d84-83ce4fb68cb2)


From several statistic above we can conclude that:
1.	Casual riders show a big number on weekend more than weekdays.
2.	The highest number of riders rose from june to september. Followed by the season, summer and fall show the largest number which is occurred during june until september.
3.	By looking at the table, we can also conclude which stations are most started to ride, either in general or by member type.

## 5.	ANALIZE & SHARE (Tableu Version)
To add and convince the results I have analyzed, I also visualized it using tableu. I am going to use data that I cleaned before by using R. You can see the result on my dashboard [here](https://public.tableau.com/views/StudyCase1DivvyTrip/Dashboard1?:language=en-GB&:display_count=n&:origin=viz_share_link).

## 6.	ACT
For the last step in this analysis phase, I’ll try to answer the third question about marketing starategy. Through all the way of analysis process, I would like to suggest:
1.	Offers a discount or a special benefit for casual members who upgrade to the annual member such as membership registration fee, free for the first month, and others.
2.	Offer exclusive benefits on weekend trips, including extended hours of use or discounted rates for weekend trip.
3.	Launch promotional campaign with a summer theme that highlight the advantages of annual membership, such as access to special events or exclusive summer rides.
4.	Provide interesting content for social media, blogs, and email newsletters that shows the benefits of annual membership, success stories, and testimonials.
5.	Create a referral program that encourages a sense of community by offering prizes to both the new annual member and the casual member who refers others.

In order to use digital media, it is really important to encourage personalized communication through targetted email or social media ads, Thus all members believe that the company is aware of them.
