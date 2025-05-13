library(stringr)
library(stringi)
library(ggplot2)
library(ggsankey)
library(dplyr)
library(ktheme)
library(forcats)

htod<-read.csv("C:/Users/matves29/OneDrive - KTH/KTHB Gemensam - Filer som tillhör Lukas Ahlström/Grupp BoL/Undervisningsgruppen/Doktorandkurs/Workshopprogram/VT25/11. Finding data and making a small pipeline/data/high-speed trains operation data.csv")

plot(htod$arrival_delay[1:4000],htod$temperature[1:4000])

htod2<-htod

htod2 %>% group_by(station_name) %>% summarise(Mean_arriv=mean(arrival_delay), Mean_depar=mean(departure_delay)) %>% arrange(desc(Mean_arriv))

ordered_by_station<-htod2 %>% group_by(station_name) %>% summarise(Mean_arriv=mean(arrival_delay), Mean_depar=mean(departure_delay)) %>% arrange(desc(Mean_arriv))
top20<-ordered_by_station$station_name[1:20]



htod2 %>% group_by(station_name) %>% 
  summarise(Mean_arriv=mean(arrival_delay), 
            Mean_depar=mean(departure_delay), 
            stdev_arriv=sd(arrival_delay),
            stdev_delay=sd(departure_delay),
            n=length(arrival_delay),
            unique_arriv=length(unique(arrival_delay)),
            unique_dep=length(unique(departure_delay))) %>% 
  arrange(desc(unique_arriv))

ordered_by_station_2<- htod2 %>% group_by(station_name) %>% summarise(Mean_arriv=mean(arrival_delay), Mean_depar=mean(departure_delay), stdev_arriv=sd(arrival_delay),stdev_delay=sd(departure_delay),n=length(arrival_delay),unique_arriv=length(unique(arrival_delay)),unique_dep=length(unique(departure_delay))) %>% arrange(desc(unique_arriv))

top20_2<-ordered_by_station_2$station_name[1:20]



htod3<-htod2[which(htod2$station_name%in% top20),]
htod4<-htod2[which(htod2$station_name%in% top20_2),]


ggplot(htod3, aes(y=arrival_delay, fill=major_holiday)) + 
  geom_boxplot() + 
  scale_color_kth() +
  scale_fill_kth()+
  theme_kth_neo() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x ="",y="Arrival Delay",title="Arrivaldelay",
       subtitle="",
       caption="")

ggplot(htod3, aes(y=arrival_delay, fill=station_name)) + 
  geom_boxplot() + 
  scale_color_kth() +
  scale_fill_kth()+
  theme_kth_neo() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x ="",y="Arrival Delay",title="Arrivaldelay",
       subtitle="",
       caption="")

ggplot(htod4, aes(y=arrival_delay, fill=major_holiday)) + 
  geom_boxplot() + 
  scale_color_kth() +
  scale_fill_kth()+
  theme_kth_neo() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x ="",y="Arrival Delay",title="Arrivaldelay",
       subtitle="",
       caption="")

ggplot(htod4, aes(y=arrival_delay, fill=station_name)) + 
  geom_boxplot() + 
  scale_color_kth() +
  scale_fill_kth()+
  theme_kth_neo() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x ="",y="Arrival Delay",title="Arrivaldelay",
       subtitle="",
       caption="")

ggplot(ordered_by_station_2, aes(x=Mean_depar,y=Mean_arriv)) + 
  geom_point() + 
  scale_color_kth() +
  scale_fill_kth()+
  theme_kth_neo() +
  theme(legend.position="none",
        axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
  labs(x ="",y="Arrival Delay",title="Arrivaldelay",
       subtitle="",
       caption="")


max(htod$departure_delay[1:1000])
