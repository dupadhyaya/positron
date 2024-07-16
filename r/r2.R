# second  practics


View(mtcars)


x <- 1:10
x

ls()

library(tidyverse)

mtcars %>% mutate(gear = factor(gear)) %>% ggplot(., aes(x=gear, y=after_stat(x), fill=gear)) + geom_col() + scale_fill_discrete()

graphFolder ='/Users/du/dup/au/graphs/'
dir(graphFolder)
ggsave(paste0(graphFolder,'g1.pdf'), device='pdf')

dev.copy(png,paste0(graphFolder,'g1.png'))
dev.off()
