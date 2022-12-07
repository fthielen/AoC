library(tidyverse)
library(here)

dat <- read.csv(file = here("data/2022/input_d1.txt"),
         header = F,
         blank.lines.skip = F)

dat$nas <- 0

dat$nas[which(is.na(dat$V1))] <- 1

dat$id <- cumsum(dat$nas) + 1
dat %>% 
        filter(!is.na(V1)) %>% 
        group_by(id) %>% 
        summarise(sum = sum(V1)) %>% 
        arrange(desc(sum))


# Part 2 ------------------------------------------------------------------
dat %>% 
        filter(!is.na(V1)) %>% 
        group_by(id) %>% 
        summarise(sum = sum(V1)) %>% 
        arrange(desc(sum)) %>% 
        slice(1:3) %>% 
        summarise(sum = sum(sum))

