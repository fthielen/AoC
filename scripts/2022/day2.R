factor(letters[1:3], ordered = T)

tibble(u = LETTERS[1:3],
           me = LETTERS[c(25, 24, 26)]) %>% 
        mutate(out = case_when(
                u == "A" & me == "Y" ~ 6,
                u == "B" & me == "Z" ~ 6,
                u == "C" & me == "X" ~ 6,
                u == "A" & me == "Z" ~ 0,
                u == "B" & me == "X" ~ 0,
                u == "C" & me == "Y" ~ 0,
                u == "A" & me == "X" ~ 3,
                u == "B" & me == "Y" ~ 3,
                u == "C" & me == "Z" ~ 3
                ),
               pts = case_when(
                       me == "X" ~ 1,
                       me == "Y" ~ 2,
                       me == "Z" ~ 3,
               ),
               tot = out + pts
               ) %>% 
        summarise(sum = sum(tot))



tibble(u = LETTERS[1:3],
       me = LETTERS[c(25, 24, 26)]) %>% 
        mutate(me2 = case_when(
                u == "A" & me == "Y" ~ "A",
                u == "B" & me == "Z" ~ "C",
                u == "C" & me == "X" ~ "B",
                u == "A" & me == "Z" ~ "B",
                u == "B" & me == "X" ~ "A",
                u == "C" & me == "Y" ~ "C",
                u == "A" & me == "X" ~ "C",
                u == "B" & me == "Y" ~ "B",
                u == "C" & me == "Z" ~ "A"
        ),
        out = case_when(
                me2 == "A" ~ 1,
                me2 == "B" ~ 2,
                me2 == "C" ~ 3,
        ),
        pts = case_when(
                me == "X" ~ 0,
                me == "Y" ~ 3,
                me == "Z" ~ 6,
        ),
        tot = out + pts
        ) %>% 
        summarise(sum = sum(tot))



# Part 1 ------------------------------------------------------------------

library(tidyverse)
library(here)

dat <- read.csv(file = here("data/2022/input_d2.txt"),
                header = F, sep = " ")
head(dat)
dat %>% 
        rename("u" = 1, "me" = 2) %>% 
        mutate(out = case_when(
                u == "A" & me == "Y" ~ 6,
                u == "B" & me == "Z" ~ 6,
                u == "C" & me == "X" ~ 6,
                u == "A" & me == "Z" ~ 0,
                u == "B" & me == "X" ~ 0,
                u == "C" & me == "Y" ~ 0,
                u == "A" & me == "X" ~ 3,
                u == "B" & me == "Y" ~ 3,
                u == "C" & me == "Z" ~ 3
        ),
        pts = case_when(
                me == "X" ~ 1,
                me == "Y" ~ 2,
                me == "Z" ~ 3,
        ),
        tot = out + pts
        ) %>% 
        summarise(sum = sum(tot))


# Part 2 ------------------------------------------------------------------


dat %>% 
        rename("u" = 1, "me" = 2) %>% 
        mutate(me2 = case_when(
                u == "A" & me == "Y" ~ "A",
                u == "B" & me == "Z" ~ "C",
                u == "C" & me == "X" ~ "B",
                u == "A" & me == "Z" ~ "B",
                u == "B" & me == "X" ~ "A",
                u == "C" & me == "Y" ~ "C",
                u == "A" & me == "X" ~ "C",
                u == "B" & me == "Y" ~ "B",
                u == "C" & me == "Z" ~ "A"
        ),
        out = case_when(
                me2 == "A" ~ 1,
                me2 == "B" ~ 2,
                me2 == "C" ~ 3,
        ),
        pts = case_when(
                me == "X" ~ 0,
                me == "Y" ~ 3,
                me == "Z" ~ 6,
        ),
        tot = out + pts
        ) %>% 
        summarise(sum = sum(tot))
