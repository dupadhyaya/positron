#r file
mtcars


ls()
 x= c(1,2,4)
x


pacman::p_load(googlesheets4, tidyverse)

gsid ='1QjyyLz-7D4lal6urSKOQJxD_WEXo4paOjunqkwaqwpI'

df <- read_sheet(ss=gsid, sheet ='CS', col_types = 'iccccccccc')
df

