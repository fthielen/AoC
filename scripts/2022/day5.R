
lstrt

lstrt[[2]][length(lstrt[[2]]):length(lstrt[[2]])]

asd <- letters[1:3]

head(asd, -2)

move <- list(c(1,2,1),
             c(3,1,3),
             c(2,2,1),
             c(1,1,2))

i <- 4

# Move
lstrt[[move[[i]][3]]] <- c(lstrt[[move[[i]][3]]], rev(tail(lstrt[[move[[i]][2]]], move[[i]][1])))
# Delete
lstrt[[move[[i]][2]]] <- head(lstrt[[move[[i]][2]]], -move[[i]][1])

lstrt

lstrt <- list(l1 = c("Z", "N"),
              l2 = c("M", "C", "D"),
              l3 = c("P"))




for (i in 1:2) {
        # Move
        lstrt[[move[[i]][3]]] <- c(lstrt[[move[[i]][3]]], rev(tail(lstrt[[move[[i]][2]]], move[[i]][1])))
        # Delete
        lstrt[[move[[i]][2]]] <- head(lstrt[[move[[i]][2]]], -move[[i]][1])
        
}
lstrt


lapply(lstrt, last)


# Part 1 ------------------------------------------------------------------

library(tidyverse)
library(here)

dat <- read.csv(file = here("data/2022/input_d5.txt"),
                header = F, sep = "", skip = 9)
move <- dat %>% 
        select(V2, V4, V6) 
move <- split(move, seq(nrow(move)))


dat <- read.csv(file = here("data/2022/input_d5.txt"),
                header = F, sep = "/", fill = T)
input <- head(dat, 9)



input <- read.fwf(file = here("data/2022/input_d5.txt"), header = F,
         widths = rep(c(1), times = 35)) %>% 
        slice(1:8) %>% 
        select(V2, V6, V10, V14, V18, V22, V26, V30, V34)

lstrt <- lapply(as.list(input), function(x) rev(x[x != " "]))

for (i in 1:length(move)) {
        # Move
        lstrt[[move[[i]][[3]]]] <- c(lstrt[[move[[i]][[3]]]], rev(tail(lstrt[[move[[i]][[2]]]], move[[i]][[1]])))
        # Delete
        lstrt[[move[[i]][[2]]]] <- head(lstrt[[move[[i]][[2]]]], -move[[i]][[1]])
        
}
lstrt
lapply(lstrt, last)


# Part 2 ------------------------------------------------------------------
# Just remove rev()

lstrt <- list(l1 = c("Z", "N"),
              l2 = c("M", "C", "D"),
              l3 = c("P"))

move <- list(c(1,2,1),
             c(3,1,3),
             c(2,2,1),
             c(1,1,2))


for (i in 1:4) {
        # Move
        lstrt[[move[[i]][3]]] <- c(lstrt[[move[[i]][3]]], tail(lstrt[[move[[i]][2]]], move[[i]][1]))
        # Delete
        lstrt[[move[[i]][2]]] <- head(lstrt[[move[[i]][2]]], -move[[i]][1])
        
}
lstrt

# For real
dat <- read.csv(file = here("data/2022/input_d5.txt"),
                header = F, sep = "", skip = 9)
move <- dat %>% 
        select(V2, V4, V6) 
move <- split(move, seq(nrow(move)))

input <- read.fwf(file = here("data/2022/input_d5.txt"), header = F,
                  widths = rep(c(1), times = 35)) %>% 
        slice(1:8) %>% 
        select(V2, V6, V10, V14, V18, V22, V26, V30, V34)

lstrt <- lapply(as.list(input), function(x) rev(x[x != " "]))

for (i in 1:length(move)) {
        # Move
        lstrt[[move[[i]][[3]]]] <- c(lstrt[[move[[i]][[3]]]], tail(lstrt[[move[[i]][[2]]]], move[[i]][[1]]))
        # Delete
        lstrt[[move[[i]][[2]]]] <- head(lstrt[[move[[i]][[2]]]], -move[[i]][[1]])
        
}
lstrt
lapply(lstrt, last)
