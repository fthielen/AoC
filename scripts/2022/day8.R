

df <- matrix(c(
        3,0,3,7,3,
        2,5,5,1,2,
        6,5,3,3,2,
        3,3,5,4,9,
        3,5,3,9,0),
        nrow = 5, byrow = T)

df_na <- rbind(rep(NA, ncol(df)),
               df,
               rep(NA, ncol(df)))
df_na <- cbind(rep(NA, nrow(df_na)),
               df_na,
               rep(NA, nrow(df_na)))

ncol(df)
nrow()

lk_lft <- df_na[2:6, 1:5] < df
lk_rgt <- df_na[2:6, 3:7] < df 
lk_up <- df_na[1:5, 2:6] < df 
lk_dwn <- df_na[3:7, 2:6] < df 

sum(lk_lft[2:4, 2:4] | lk_rgt[2:4, 2:4] | lk_up[2:4, 2:4] | lk_dwn[2:4, 2:4])


lk_lft <- df_na[2:(nrow(df_na)-1), 1:(ncol(df_na)-2)] < df
lk_rgt <- df_na[2:(nrow(df_na)-1), 3:ncol(df_na)] < df 
lk_up <- df_na[1:(nrow(df_na)-2), 2:(ncol(df_na)-1)] < df 
lk_dwn <- df_na[3:nrow(df_na), 2:(ncol(df_na)-1)] < df 

sum_inner <- sum(lk_lft[2:4, 2:4] | lk_rgt[2:4, 2:4] | lk_up[2:4, 2:4] | lk_dwn[2:4, 2:4])
sum_outer <- (nrow(df) - 2) * 2 + ncol(df) * 2

sum_inner + sum_outer


# Part 1 ------------------------------------------------------------------
# Read table

# Check length
dat_l <- readLines(here::here("data/2022/input_d8.txt"))
nchar(dat_l[1])

# From: https://stackoverflow.com/questions/31867715/how-can-i-read-a-matrix-from-a-txt-file-in-r

df <- as.matrix(read.fwf(here::here("data/2022/input_d8.txt"), widths = rep(1, nchar(dat_l[1]))))

df_na <- rbind(rep(NA, ncol(df)),
               df,
               rep(NA, ncol(df)))
df_na <- cbind(rep(NA, nrow(df_na)),
               df_na,
               rep(NA, nrow(df_na)))

lk_lft <- df_na[2:(nrow(df_na)-1), 1:(ncol(df_na)-2)] < df
lk_rgt <- df_na[2:(nrow(df_na)-1), 3:ncol(df_na)] < df 
lk_up <- df_na[1:(nrow(df_na)-2), 2:(ncol(df_na)-1)] < df 
lk_dwn <- df_na[3:nrow(df_na), 2:(ncol(df_na)-1)] < df 

sum_inner <- sum(lk_lft[2:4, 2:4] | lk_rgt[2:4, 2:4] | lk_up[2:4, 2:4] | lk_dwn[2:4, 2:4])
sum_outer <- (nrow(df) - 2) * 2 + ncol(df) * 2

sum_inner + sum_outer





# New ---------------------------------------------------------------------

df <- matrix(c(
        3,0,3,7,3,
        2,5,5,1,2,
        6,5,3,3,2,
        3,3,5,4,9,
        3,5,3,9,0),
        nrow = 5, byrow = T)

df_lft <- df_right <- df_up <- df_dwn <- matrix(nrow = nrow(df),
                 ncol = ncol(df))

for (i in 1:ncol(df)-1) {
        for(j in 1:ncol(df)-1){
        df_lft[i, j] <- any(df[i,1:j] < df[i,j+1])
        j <- j + 1
        }
        i <-  i + 1
}


df[1,1] > df[1,2]
any(df[1,1:3] > df[1,4])
df[,1:4] > df[,5]
?any

# Delete ------------------------------------------------------------------


xx <- as.matrix(df)

x <- scan(here::here("data/2022/input_d8.txt"))
mat


xx
strsplit(xx$df, split = "")

shift_lft <- df < c(df[, 2:ncol(df)], rep(NA, ncol(df)))
shift_lft[2:(nrow(df)-1), 1:3]
shift_lft[2:(nrow(df)-1), 2:4]
shift_rght <- df > c(rep(NA, 5), df[, 1:4])
shift_rght[2:4, 2:4]

shift_up <- df > rbind(df[2:5, ], rep(NA, 5))
shift_up[2:4, 2:4]

shift_dwn <- df > rbind(rep(NA, 5), df[1:4, ])
shift_dwn[2:4, 2:4]


sum(
        shift_lft[2:4, 2:3] | shift_rght[2:4, 2:4] | shift_up[2:4, 2:4] | shift_dwn[2:4, 2:4])


(nrow(df) - 2) * 2 + ncol(df) * 2