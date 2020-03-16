#Loading libraries
library(dplyr)

# --- Festival days ---
# Christmas: 22 to 26 Dec, 2018 and 24 to 26 Dec, 2019 
# Thanksgiving: 21 to 25 Nov, 2018 and 27 to 29 Nov, 2019 

## --- Raw Data: City:Seattle Months:Nov, Dec Year:2018,2019 ----
nov2018_data <- read.csv("D:/UW_MSDS/Q2 - Applied Stats/Project/Festivals/movement-speeds-hourly-seattle-2018-11.csv/movement-speeds-hourly-seattle-2018-11.csv")
dec2018_data <- read.csv("D:/UW_MSDS/Q2 - Applied Stats/Project/Festivals/movement-speeds-hourly-seattle-2018-12.csv/movement-speeds-hourly-seattle-2018-12.csv")
nov2019_data <- read.csv("D:/UW_MSDS/Q2 - Applied Stats/Project/Festivals/movement-speeds-hourly-seattle-2019-11.csv/movement-speeds-hourly-seattle-2019-11.csv")
dec2019_data <- read.csv("D:/UW_MSDS/Q2 - Applied Stats/Project/Festivals/movement-speeds-hourly-seattle-2019-12.csv/movement-speeds-hourly-seattle-2019-12.csv")

## Quality Checks on raw data
#colnames(nov2018_data) 
#colnames(dec2018_data) 
#colnames(nov2019_data) 
#colnames(dec2019_data) 

#THNX 2018: Filter 21Nov to 25 Nov
thnx_data_2018 <- nov2018_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  filter(day >= 21, day <= 25) #5 days

#THNX 2019: Filter 27 Nov to 01 Dec 
thnx_data_2019_1 <- nov2019_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  filter(day >= 27, day <= 30) #4 days of Nov

thnx_data_2019_2 <- dec2019_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  filter(day == 1) #1 day of Dec

thnx_data_2019 <- rbind(thnx_data_2019_1, thnx_data_2019_2)
unique(thnx_data_2019$month)

all_thnx_data <- rbind(thnx_data_2018, thnx_data_2019)
all_thnx_data$flag <- "Thanksgiving" 

#THNX: Aggregate speeds at daily level
all_thnx_data <- all_thnx_data %>% 
  group_by(flag, year, month, day) %>%
  summarise(mean_speed = mean(speed_mph_mean)) 

#XMAS 2018: Filter 22 to 26 Dec, 2018 
xmas2018_data <- dec2018_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  filter(day >= 22, day <= 26) 

xmas2019_data <- dec2019_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  filter(day >= 24, day <= 29) 

all_xmas_data <- rbind(xmas2018_data, xmas2019_data)
all_xmas_data$flag <- "Christmas" 
unique(all_xmas_data$month)

#XMAS: Aggregate speeds at daily level
all_xmas_data <- all_xmas_data %>% 
  group_by(flag, year, month, day) %>%
  summarise(mean_speed = mean(speed_mph_mean)) 

all_festival_data <- rbind(all_thnx_data, all_xmas_data)

# all_xmas_data - population for Christmas
# all_thnx_data - population for Thanksgiving

# Histogram
g = all_festival_data$mean_speed
m <-mean(g)
std <-sqrt(var(g))
hist(g, density=20, breaks=40, prob=TRUE, 
     xlab="Mean speed", ylim=c(0, 0.6), 
     main="Normal curve over histogram")
curve(dnorm(x, mean=m, sd=std), 
      col="darkblue", lwd=2, add=TRUE, yaxt="n")

# QQ Plots
qqnorm(all_festival_data$mean_speed)
qqline(all_festival_data$mean_speed)

# --- Hypothesis Testing ---#
DF <- summary(all_thnx_data$mean_speed)
sd(all_thnx_data$mean_speed)
var(all_thnx_data$mean_speed)
Thanksgiving <- all_thnx_data$mean_speed
hist(Thanksgiving)
boxplot(Thanksgiving)

Christmas <- all_xmas_data$mean_speed
summary(all_xmas_data$mean_speed)
sd(all_xmas_data$mean_speed)
var(all_xmas_data$mean_speed)
hist(Christmas)
boxplot(Christmas)

#Welch Test
Thanksgiving <- all_thnx_data$mean_speed
Christmas <- all_xmas_data$mean_speed
t.test(Thanksgiving, Christmas, var.equal = FALSE)
qqplot(y=all_xmas_data$mean_speed)

#Anova
summary(aov(mean_speed ~ factor(flag), data=all_festival_data))

#Equal variance t-test
t.test(all_thnx_data$mean_speed, all_xmas_data$mean_speed, var.equal = TRUE)

# Daily data for 2018 and 2019 (for trend plots)
nov_data_2019 <- nov2019_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  group_by(year, month, day) %>%
  summarise(mean_speed = mean(speed_mph_mean))

dec_data_2019 <- dec2019_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  group_by(year, month, day) %>%
  summarise(mean_speed = mean(speed_mph_mean))

Nov_Dec_2019 <- rbind(nov_data_2019, dec_data_2019)

nov_data_2018 <- nov2018_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  group_by(year, month, day) %>%
  summarise(mean_speed = mean(speed_mph_mean))

dec_data_2018 <- dec2018_data %>% 
  select(year, month, day, speed_mph_mean) %>% 
  group_by(year, month, day) %>%
  summarise(mean_speed = mean(speed_mph_mean))

Nov_Dec_2018 <- rbind(nov_data_2018, dec_data_2018)

write.csv(Nov_Dec_2018, file = "D:/UW_MSDS/Q2 - Applied Stats/Project/Daily_Nov_Dec_2018.csv", col.names = TRUE, row.names = FALSE)
write.csv(Nov_Dec_2019, file = "D:/UW_MSDS/Q2 - Applied Stats/Project/Daily_Nov_Dec_2019.csv", col.names = TRUE, row.names = FALSE)