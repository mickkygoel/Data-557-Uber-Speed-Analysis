library(dplyr)
library(lubridate)

a1=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-1.csv")
a2=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-2.csv")
a3=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-3.csv")
a4=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-4.csv")
a5=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-5.csv")
a6=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-6.csv")
a7=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-7.csv")
a8=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-8.csv")
a9=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-9.csv")
a10=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-10.csv")
a11=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-11.csv")
a12=read.csv("C:/Users/Dell/Downloads/movement-speeds-hourly-seattle-2019-12.csv")
a6total=c(a1,a2,a3,a4,a5,a6)
---
  
  b=head(a1,50)
b = subset(b, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
b$hr=as.numeric(substr(b[,5],12,13))
b = subset(b, select = -c(hour) )
b$weekday=wday(as.Date((substr(b[,4],1,10))))
b=as.data.frame(b[(b$weekday>=2&b$weekday<=6),])
morning=as.data.frame(b[(b$hr>=8&b$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(b[(b$hr>=17&b$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

b=as.data.frame(rbind(morning,evening))

---
  library(dplyr)
##Jan
---
  a1 = subset(a1, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a1$hr=as.numeric(substr(a1[,5],12,13))
a1 = subset(a1, select = -c(hour) )
a1$weekday=wday(as.Date((substr(a1[,4],1,10))))
a1=as.data.frame(a1[(a1$weekday>=2&a1$weekday<=6),])
morning=as.data.frame(a1[(a1$hr>=8&a1$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a1[(a1$hr>=17&a1$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a1=as.data.frame(rbind(morning,evening))

##Feb
a2 = subset(a2, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a2$hr=as.numeric(substr(a2[,5],12,13))
a2 = subset(a2, select = -c(hour) )
a2$weekday=wday(as.Date((substr(a2[,4],1,10))))
a2=as.data.frame(a2[(a2$weekday>=2&a2$weekday<=6),])
morning=as.data.frame(a2[(a2$hr>=8&a2$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a2[(a2$hr>=17&a2$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a2=as.data.frame(rbind(morning,evening))
#Mar
a3 = subset(a3, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a3$hr=as.numeric(substr(a3[,5],12,13))
a3 = subset(a3, select = -c(hour) )
a3$weekday=wday(as.Date((substr(a3[,4],1,10))))
a3=as.data.frame(a3[(a3$weekday>=2&a3$weekday<=6),])
morning=as.data.frame(a3[(a3$hr>=8&a3$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a3[(a3$hr>=17&a3$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a3=as.data.frame(rbind(morning,evening))
#April
a4 = subset(a4, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a4$hr=as.numeric(substr(a4[,5],12,13))
a4 = subset(a4, select = -c(hour) )
a4$weekday=wday(as.Date((substr(a4[,4],1,10))))
a4=as.data.frame(a4[(a4$weekday>=2&a4$weekday<=6),])
morning=as.data.frame(a4[(a4$hr>=8&a4$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a4[(a4$hr>=17&a4$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a4=as.data.frame(rbind(morning,evening))
#May
a5 = subset(a5, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a5$hr=as.numeric(substr(a5[,5],12,13))
a5 = subset(a5, select = -c(hour) )
a5$weekday=wday(as.Date((substr(a5[,4],1,10))))
a5=as.data.frame(a5[(a5$weekday>=2&a5$weekday<=6),])
morning=as.data.frame(a5[(a5$hr>=8&a5$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a5[(a5$hr>=17&a5$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a5=as.data.frame(rbind(morning,evening))

#June
a6 = subset(a6, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a6$hr=as.numeric(substr(a6[,5],12,13))
a6= subset(a6, select = -c(hour) )
a6$weekday=wday(as.Date((substr(a6[,4],1,10))))
a6=as.data.frame(a6[(a6$weekday>=2&a6$weekday<=6),])
morning=as.data.frame(a6[(a6$hr>=8&a6$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a6[(a6$hr>=17&a6$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a6=as.data.frame(rbind(morning,evening))
#July
a7 = subset(a7, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a7$hr=as.numeric(substr(a7[,5],12,13))
a7 = subset(a7, select = -c(hour) )
a7$weekday=wday(as.Date((substr(a7[,4],1,10))))
a7=as.data.frame(a7[(a7$weekday>=2&a7$weekday<=6),])
morning=as.data.frame(a7[(a7$hr>=8&a7$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a7[(a7$hr>=17&a7$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a7=as.data.frame(rbind(morning,evening))

#August
a8 = subset(a8, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a8$hr=as.numeric(substr(a8[,5],12,13))
a8= subset(a8, select = -c(hour) )
a8$weekday=wday(as.Date((substr(a8[,4],1,10))))
a8=as.data.frame(a8[(a8$weekday>=2&a8$weekday<=6),])
morning=as.data.frame(a8[(a8$hr>=8&a8$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a8[(a8$hr>=17&a8$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a8=as.data.frame(rbind(morning,evening))

#Sept
a9 = subset(a9, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a9$hr=as.numeric(substr(a9[,5],12,13))
a9 = subset(a9, select = -c(hour) )
a9$weekday=wday(as.Date((substr(a9[,4],1,10))))
a9=as.data.frame(a9[(a9$weekday>=2&a9$weekday<=6),])
morning=as.data.frame(a9[(a9$hr>=8&a9$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a9[(a9$hr>=17&a9$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a9=as.data.frame(rbind(morning,evening))
#Oct
a10 = subset(a10, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a10$hr=as.numeric(substr(a10[,5],12,13))
a10 = subset(a10, select = -c(hour) )
a10$weekday=wday(as.Date((substr(a10[,4],1,10))))
a10=as.data.frame(a10[(a10$weekday>=2&a10$weekday<=6),])
morning=as.data.frame(a10[(a10$hr>=8&a10$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a10[(a10$hr>=17&a10$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a10=as.data.frame(rbind(morning,evening))

#Nov
a11 = subset(a11, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a11$hr=as.numeric(substr(a11[,5],12,13))
a11 = subset(a11, select = -c(hour) )
a11$weekday=wday(as.Date((substr(a11[,4],1,10))))
a11=as.data.frame(a11[(a11$weekday>=2&a11$weekday<=6),])
morning=as.data.frame(a11[(a11$hr>=8&a11$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a11[(a11$hr>=17&a11$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a11=as.data.frame(rbind(morning,evening))

#Dec
a12 = subset(a12, select = -c(segment_id,start_junction_id,end_junction_id,osm_way_id,osm_start_node_id,osm_end_node_id,speed_mph_stddev) )
a12$hr=as.numeric(substr(a12[,5],12,13))
a12 = subset(a12, select = -c(hour) )
a12$weekday=wday(as.Date((substr(a12[,4],1,10))))
a12=as.data.frame(a12[(a12$weekday>=2&a12$weekday<=6),])
morning=as.data.frame(a12[(a12$hr>=8&a12$hr<=10),])
morning$peak_hour_slot="morning"
morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

evening=as.data.frame(a12[(a12$hr>=17&a12$hr<=19),])
evening$peak_hour_slot="evening"
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,hr,peak_hour_slot,weekday)  %>%
                           summarise(mean_speed=mean(speed_mph_mean)))

a12=as.data.frame(rbind(morning,evening))

#Whole of 2019
total=rbind(a1,a2,a3,a4,a5,a6,a7,a8,a9,a10,a11,a12)
morning=total[total$peak_hour_slot=="morning",]
evening=total[total$peak_hour_slot=="evening",]

morning <- as.data.frame(morning %>% 
                           group_by(day,month,year,peak_hour_slot)  %>%
                           summarise(mean_speed_bypeakhour=mean(mean_speed)))
evening <- as.data.frame(evening %>% 
                           group_by(day,month,year,peak_hour_slot)  %>%
                           summarise(mean_speed_bypeakhour=mean(mean_speed)))
'''
write.csv(morning,"C:/Users/Dell/Desktop/morning.csv")
write.csv(evening,"C:/Users/Dell/Desktop/evening.csv")
'''

#Descriptive stats
summary(morning$mean_speed_bypeakhour)
summary(evening$mean_speed_bypeakhour)
sd(morning$mean_speed)*sd(morning$mean_speed)
sd(evening$mean_speed)*sd(evening$mean_speed)

#EDA
Morning=morning$mean_speed_bypeakhour
Evening=evening$mean_speed_bypeakhour
plot(hist(Morning),main=NULL)
plot(hist(Evening),main=NULL)
boxplot(Morning)
boxplot(Evening)

#Large sample z-test
s1=sd(morning$mean_speed)
s2=sd(evening$mean_speed)
n1=length(morning$mean_speed)
n2=length(evening$mean_speed)
Morning=morning$mean_speed
Evening=evening$mean_speed
X=mean(Morning)-mean(Evening)
mu0=0
se=sqrt(((s1*s1)/n1)+((s2*s2)/n2))
zstat=((X-mu0)/se)
data.frame(zstat,p=round((1-pnorm(zstat)),4))

#Unequal variances-- welch test

tstat=(t.test(morning$mean_speed,evening$mean_speed,var.equal=F))$statistic
tstat


#Welch test sampling (simulation) from morning and evening
set.seed(123456)
reps=20000
z=rep(NA,reps)
tstat=c(reps)
n1=50
n2=50
for(i in 1:reps)
{
  morning_sample=sample_n(morning,50,replace=TRUE)
  evening_sample=sample_n(evening,50,replace=TRUE)
  tstat[i]=t.test(morning_sample,evening_sample,alternative="less",mu=0,var.equal=F)$statistic
}
welch.df = (s1^2/n1 + s2^2/n2)^2/
  (s1^4/(n1^2*(n1-1)) + s2^4/(n2^2*(n2-1)))
mean(abs(tstat)>qt(.975,welch.df))