library(tidyverse)
library(here)

dat <- read.csv(file = here("data/2023/input_d1.txt"),
                header = F,
                blank.lines.skip = F)

# Part 1 ------------------------------------------------------------------
# Extract first and last numeric value from each row of dat

ls_dat <- str_extract_all(dat[, 1], "[0-9]+")

ls_dat <- lapply(ls_dat, function(x) paste(x, collapse = ""))

nchar(ls_dat[[995]])

substr(ls_dat[995][[1]], 4, 4)






ls_res <- list()


for (i in 1:length(ls_dat)) {
        
        ls_res[i] <- as.numeric(paste(c(substr(ls_dat[[i]], 1, 1),
                                        substr(ls_dat[[i]], nchar(ls_dat[[i]]), nchar(ls_dat[[i]]))), collapse = ""))
        
        
}

sum(unlist(ls_res))


# Part 2 ------------------------------------------------------------------
dat[1:10,]
as.numeric(substr(dat[[1, 1]], 1, 1))
as.numeric(substr(dat[[3, 1]], 1, 1))


numbs <- c("one", "two", "three", "four", "five", "six", "seven", "eight", "nine")
xnums <- 1:9
names

substr(dat[[1, 1]], 1, 3) %in% numbs
substr(dat[[1, 1]], 1, 4) %in% numbs
substr(dat[[1, 1]], 1, 5) %in% numbs


x <- list()

i <- 999

for(i in 1:length(ls_dat)){
if(any(substr(dat[[i, 1]], 1, 3) == numbs)) {
        x[i] <- which(substr(dat[[i, 1]], 1, 3) == numbs)
}

if(any(substr(dat[[i, 1]], 1, 4) == numbs)) {
        x[i] <- which(substr(dat[[i, 1]], 1, 4) == numbs)
}

if(any(substr(dat[[i, 1]], 1, 5) == numbs)) {
        x[i] <- which(substr(dat[[i, 1]], 1, 5) == numbs)
}

}
x

y <- list()
for(i in 1:length(ls_dat)){
        if(any(substr(dat[i, ], nchar(dat[i,])-2, nchar(dat[i,])) == numbs)) {
                y[i] <- which(substr(dat[i, ], nchar(dat[i,])-2, nchar(dat[i,])) == numbs)
        }
        
        if(any(substr(dat[i, ], nchar(dat[i,])-3, nchar(dat[i,])) == numbs)) {
                y[i] <- which(substr(dat[i, ], nchar(dat[i,])-3, nchar(dat[i,])) == numbs)
        }
        
        if(any(substr(dat[i, ], nchar(dat[i,])-4, nchar(dat[i,])) == numbs)) {
                y[i] <- which(substr(dat[i, ], nchar(dat[i,])-4, nchar(dat[i,])) == numbs)
        }
        
}
y

x[1]
words <- strsplit(dat[[1]], "\\W+")[[1]]


