foo <- c("vJrwpWtwJgWrhcsFMMfFFhFp", "jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL")

t_dat <- data.frame(inp = foo) %>% 
        mutate(len = nchar(inp),
               p1 = substring(inp, 1, len/2),
               p2 = substring(inp, len/2+1, len),
               uni = anyDuplicated(p1, p2))

library(tidyverse)
library(here)

dat <- read.csv(file = here("data/2022/input_d3.txt"),
                header = F, sep = "")
names(dat) <- "inp"
t_dat <- dat %>% 
        mutate(len = nchar(inp),
               p1 = substring(inp, 1, len/2),
               p2 = substring(inp, len/2+1, len))




xx <- str_split(t_dat$p1, "", simplify = F)
yy <- str_split(t_dat$p2, "")


res <- vector()
for (i in 1:length(xx)) {
        res[i] <- intersect(xx[[i]], yy[[i]])
        
}
res

df_pts <- data.frame(res = c(letters, LETTERS),
                     pts = 1:52)

data.frame(res) %>% 
        left_join(., df_pts, by = "res") %>% 
        summarise(sum = sum(pts))


# Part 2 ------------------------------------------------------------------


zz <- str_split(t_dat$inp, "")
res <- vector()


res <- vector()
for (i in seq(1, length(zz), by = 3)) {
        res[i] <- intersect(intersect(zz[[i]], zz[[i+1]]), zz[[i+2]])
        
}
res
res <- res[!is.na(res)]

data.frame(res = res) %>% 
        left_join(.,df_pts,by = "res") %>% 
        summarise(sum =sum(pts))
