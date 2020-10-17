library(ggplot2)
library(tidyverse)


phone <- read.table(file = "clipboard", 
                      sep = "\t", header=TRUE)

phone_data <- data.frame(Hour = 0:23,
                         Level_Count = c(13, 4,3,0, 0,0, 6, 40, 41, 41, 51, 44, 53, 42,47,41,59,60,50,47,47,41,42,33))


phone_data %>%
    ggplot()+
    geom_col(aes(x=Hour,
                 y=Level_Count),
             fill = "slateblue1",
             color = "white",
             size =0.5)+
    coord_polar(start = 4.5) +
    theme_minimal() +
    theme(legend.position = "none",
          axis.title.y=element_blank(),
          axis.text.y=element_blank(),
          axis.ticks.y=element_blank(),
          plot.title = element_text(hjust = 0.5))+
    ggtitle("Phone Usage Intensity") + 
    scale_x_continuous("", limits = c(0, 24), 
                       breaks = seq(0, 23),
                       labels = c("12am", seq(1,5),"6am",seq(7,11), "12pm",seq(1,5), "6pm",seq(7,11)))

phone_data %>%
    ggplot()+
    geom_line(aes(x=Hour,
                 y=Level_Count),
             color = "slateblue1") +
    ggtitle("Phone Usage by Hour of day") +
    theme_minimal() +
    scale_x_continuous("", limits = c(0, 24), 
                       breaks = seq(0, 23),
                       labels = seq(0,23))
    