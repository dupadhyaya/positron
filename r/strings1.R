#string : count


library(stringr)

text <- "Dhiraj Upadhyaya, Hello"

text
matches <- gregexpr('a', text)
matches

unlist(matches)
count <- sum(unlist(matches) > 0)
count


str_count(text, 'a')

library(stringi)

stri_count_fixed(text, 'a')


skim(mtcars)


install.packages('healthyverse')
library(healthyverse)
library(healthyR)
?healthyR

library(healthyR)
library(timetk)
library(dplyr)

ts_signature_tbl(.data = m4_daily, .date_col = date, .pad_time = TRUE, id) %>%
    ts_median_excess_plt(
        .date_col           = date
        , .value_col        = value
        , .x_axis           = week
        , .ggplot_group_var = year
        , .years_back       = 5
    )
