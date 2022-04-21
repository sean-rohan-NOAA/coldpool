# Cold pool Table 2 (Part 3) - EBS and NBS Survey Start/End Dates and Number of Bottom and Surace Temperature Samples per Region Per Year (1982-2019, 2021)
# Created by: Nicole Charriere
# Contact: nicole.charriere@noaa.gov
# Created: 2022-04-20

#Join survey_dates_and_bottom_temperatures.csv and survey_dates_and_surface_samples
#Define surface sample .csv as x and bottom sample .csv as y then inner join by year, dates_EBS, and dates_NBS.

library(dplyr)

x <- read.csv("analysis/survey_dates_and_surface_samples.csv")
y <- read.csv("analysis/survey_dates_and_bottom_samples.csv")

Table_2_Cold_Pool <- dplyr::inner_join(x,y, by=c("year" = "year","dates_EBS" = "dates_EBS","dates_NBS" = "dates_NBS"))

head(Table_2_Cold_Pool)

#Rearrange Table 2 headers in order of year, dates_EBS, bottom_temp_samples_per_year_EBS, surf_temp_samples_per_year_EBS, dates_NBS, bottom_temp_samples_per_year_NBS, surf_temp_samples_per_year_NBS 

Table_2_Cold_Pool_Final <- dplyr::select(Table_2_Cold_Pool, year, dates_EBS, bottom_temp_samples_per_year_EBS, surf_temp_samples_per_year_EBS, dates_NBS, bottom_temp_samples_per_year_NBS, surf_temp_samples_per_year_NBS)

#Write Table 2 of All Cold Pool Temp Samples

View(Table_2_Cold_Pool_Final)
write.csv(Table_2_Cold_Pool_Final, file = "analysis/EBS_NBS_dates_surface_bottom_temps.csv", row.names = FALSE)
