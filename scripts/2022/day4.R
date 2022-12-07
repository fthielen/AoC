2:8 %in% 3:7
all(3:7 %in% 2:8)

any(6:6 %in% 7:8)

eval(parse(text = "1:4"))

df_test <- data.frame(foo = c("2-4,6-8",
           "2-3,4-5",
           "5-7,7-9",
           "2-8,3-7",
           "6-6,4-6",
           "2-6,4-8")) %>% 
        mutate(foo = str_replace_all(foo, "-", ":"),
                bar = str_split_fixed(foo, ",", 2))

bar1in2 <- vector()
for (i in 1:nrow(df_test)) {
       bar1in2[i] <- all(
               eval(parse(text = df_test$bar[i,1])) %in% 
                       eval(parse(text = df_test$bar[i,2]))) 
}

bar2in1 <- vector()
for (i in 1:nrow(df_test)) {
        bar2in1[i] <- all(
                eval(parse(text = df_test$bar[i,2])) %in% 
                        eval(parse(text = df_test$bar[i,1]))) 
}

sum(bar1in2, bar2in1)


# Part 1 ------------------------------------------------------------------

library(tidyverse)
library(here)

dat <- read.csv(file = here("data/2022/input_d4.txt"),
                header = F, sep = "")

df_test <- dat %>% 
        rename("foo" = 1) %>% 
        mutate(foo = str_replace_all(foo, "-", ":"),
               bar = str_split_fixed(foo, ",", 2))

bar1in2 <- vector()
for (i in 1:nrow(df_test)) {
        bar1in2[i] <- all(
                eval(parse(text = df_test$bar[i,1])) %in% 
                        eval(parse(text = df_test$bar[i,2]))) 
}

bar2in1 <- vector()
for (i in 1:nrow(df_test)) {
        bar2in1[i] <- all(
                eval(parse(text = df_test$bar[i,2])) %in% 
                        eval(parse(text = df_test$bar[i,1]))) 
}

# Result (avoid double T)
sum(bar1in2 | bar2in1)


# Part 2 ------------------------------------------------------------------
# Easy: jusst replace all with any

bar1in2 <- vector()
for (i in 1:nrow(df_test)) {
        bar1in2[i] <- any(
                eval(parse(text = df_test$bar[i,1])) %in% 
                        eval(parse(text = df_test$bar[i,2]))) 
}

bar2in1 <- vector()
for (i in 1:nrow(df_test)) {
        bar2in1[i] <- any(
                eval(parse(text = df_test$bar[i,2])) %in% 
                        eval(parse(text = df_test$bar[i,1]))) 
}

# Result (avoid double T)
sum(bar1in2 | bar2in1)
