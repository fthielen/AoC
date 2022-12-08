foo <- "mjqjpqmgbljsphdztnvjfqwrcgsmlb"
foo <- "bvwbjplbgvbhsrlpgdmjqwftvncz"
foo <- "nppdvjthqldpwncqszvftbrmjlhg"
foo <- "nznrnfrfntjfmvfwmzdfjlvtqnbhcprsg"

xx <- strsplit(foo, split = "")
xx <- unlist(xx)


w_ind <- F
i <- 0
v_i <- vector()
while (!w_ind) {
        w_ind <- sum(stringi::stri_duplicated(xx[(1+i):(4+i)])) == 0
        w_ind
        i <- i + 1
        v_i[i] <- i+3
        i
}
v_i[length(v_i)]


# Part 1 ------------------------------------------------------------------

dat <- read.csv(file = here::here("data/2022/input_d6.txt"),
                header = F)

input <- unlist(strsplit(dat$V1, split = ""))

w_ind <- F # which indication
i <- 0
v_i <- vector()
while (!w_ind) {
        w_ind <- sum(stringi::stri_duplicated(input[(1+i):(4+i)])) == 0
        w_ind
        i <- i + 1
        v_i[i] <- i+3
        i
}
v_i[length(v_i)]


# Part 2 ------------------------------------------------------------------

# Change 1:14 but also add 13 to i


# input <- unlist(strsplit("bvwbjplbgvbhsrlpgdmjqwftvncz", split = ""))


w_ind <- F # which indication
i <- 0
v_i <- vector()
while (!w_ind) {
        w_ind <- sum(stringi::stri_duplicated(input[(1+i):(14+i)])) == 0
        w_ind
        i <- i + 1
        v_i[i] <- i+13
        i
}
v_i[length(v_i)]
