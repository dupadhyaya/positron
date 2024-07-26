#ggplot advanced

#zoom part of the facet

pacman::p_load(tidyverse, ggforce)

ggplot(iris, aes(Petal.Length, Petal.Width, colour = Species)) + geom_point() +   facet_zoom(x = Species == "versicolor")


# Encircle setosa group
library("ggalt")

circle.df <- iris %>% filter(Species == "setosa")

ggplot(iris, aes(Petal.Length, Petal.Width)) + geom_point(aes(colour = Species)) +  geom_encircle(data = circle.df, linetype = 2)


# Basic scatter plot
ggplot(mpg, aes(cty, hwy)) + geom_point(size = 0.5)

# Jittered points
ggplot(mpg, aes(cty, hwy)) + geom_jitter(size = 0.5, width = 0.5)

#Create count charts to avoid overlap. Wherever there is more points overlap, the size of the circle gets bigger.
ggplot(mpg, aes(cty, hwy)) +  geom_count() + geom_point(size = 0.05, colour='red')


#Marginal density plots
library(ggpubr)
# Grouped Scatter plot with marginal density plots
ggscatterhist(
  iris, x = "Sepal.Length", y = "Sepal.Width",
  color = "Species", size = 3, alpha = 0.6,
  palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  margin.params = list(fill = "Species", color = "black", size = 0.2)
  )

# Use box plot as marginal plots
ggscatterhist(
  iris, x = "Sepal.Length", y = "Sepal.Width",
  color = "Species", size = 3, alpha = 0.6,
  palette = c("#00AFBB", "#E7B800", "#FC4E07"),
  margin.plot = "boxplot",
  ggtheme = theme_bw()
  )


#Basic Density Plot------
# Basic density plot
ggplot(iris, aes(Sepal.Length)) + geom_density()

# Add mean line
ggplot(iris, aes(Sepal.Length)) +
  geom_density(fill = "lightgray") +
  geom_vline(aes(xintercept = mean(Sepal.Length)), linetype = 2)

# Change line color by groups
ggplot(iris, aes(Sepal.Length, color = Species)) +
  geom_density() +
  scale_color_viridis_d()


# Add mean line by groups
mu <- iris %>% group_by(Species) %>%  summarise(grp.mean = mean(Sepal.Length))
mu
ggplot(iris, aes(Sepal.Length, color = Species)) + geom_density() + geom_vline(aes(xintercept = grp.mean, color = Species),   data = mu, linetype = 2) + scale_color_viridis_d()


ggplot(iris, aes(Sepal.Length)) + geom_histogram(aes(fill = Species, color = Species), bins = 20, position = "identity", alpha = 0.5) + scale_fill_viridis_d() + scale_color_viridis_d()


#ridgeLines-----
library(ggridges)
ggplot(iris, aes(x = Sepal.Length, y = Species)) +
  geom_density_ridges(aes(fill = Species)) +
  scale_fill_manual(values = c("#00AFBB", "#E7B800", "#FC4E07"))


#
# Reorder row names by mpg values
df <- mtcars %>% rownames_to_column() %>%  as_data_frame() %>%
  mutate(cyl = as.factor(cyl)) %>%   select(rowname, wt, mpg, cyl)
ggplot(df, aes(x = reorder(rowname, mpg), y = mpg)) +
  geom_col()  + rotate_x_text(angle = 45)

# Horizontal bar plots, 
# change fill color by groups and add text labels
ggplot(df, aes(x = reorder(rowname, mpg), y = mpg)) +
  geom_col( aes(fill = cyl)) + 
  geom_text(aes(label = mpg), nudge_y = 2) + 
  coord_flip() +
  scale_fill_viridis_d()

df2 <- df %>%  arrange(cyl, mpg) %>%
  mutate(rowname = factor(rowname, levels = rowname))

ggplot(df2, aes(x = rowname, y = mpg)) + geom_col( aes(fill = cyl)) + 
  scale_fill_viridis_d() +  rotate_x_text(45)

#https://www.datanovia.com/en/blog/ggplot-examples-best-reference/
