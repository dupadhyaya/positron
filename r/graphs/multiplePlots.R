#multiple plots 
Folder1 = '/Users/du/dup/au/graphs/'
  
dir(Folder1)
#ggplot2-------
library(ggplot2)


#cowplot-------
library(cowplot)
df <- ToothGrowth
df$dose = factor(df$dose)
head(df)
bp <- ggplot(df, aes(x=dose, y=len, color=dose)) +  geom_boxplot() +   theme(legend.position = "none")
bp + background_grid(major='xy', minor='y')

cowplot::save_plot('./r/graphs/dose.pdf', bp, base_aspect_ratio = 1.3)

sp <- ggplot(mpg, aes(x = cty, y = hwy, colour = factor(cyl)))+  geom_point(size=2.5)
sp

cowplot::plot_grid(sp, bp, labels=c("A", "B"), ncol = 2, nrow = 1)

##ggdraw-----
plot.iris <- ggplot(iris, aes(Sepal.Length, Sepal.Width)) +   geom_point() + facet_grid(. ~ Species) + stat_smooth(method = "lm") +  background_grid(major = 'y', minor = "none") + panel_border() # and a border around each panel
plot.iris
ggdraw() +
  draw_plot(plot.iris, 0, .5, 1, .5) +
  draw_plot(sp, 0, 0, .5, .5) +
  draw_plot(bp, .5, 0, .5, .5) +
  draw_plot_label(c("A", "B", "C"), c(0, 0, 0.5), c(1, 0.5, 0.5), size = 15)

#gridExtra------
library(gridExtra)
?stat_summary
dp <- ggplot(df, aes(x=dose, y=len, fill=dose)) +  geom_dotplot(binaxis='y', stackdir='center') +  stat_summary(fun.data=mean_sdl, geom= "pointrange", color="red") + theme(legend.position = "none")
# Create a violin plot
vp <- ggplot(df, aes(x=dose, y=len)) + geom_violin()+   geom_boxplot(width=0.1)
# Create a stripchart
sc <- ggplot(df, aes(x=dose, y=len, color=dose, shape=dose)) + geom_jitter(position=position_jitter(0.2))+   theme(legend.position = "none") + theme_gray()
grid.arrange(bp, dp, vp, sc, ncol=2, nrow =2)
#grid.arrange() and arrangeGrob(): Change column/row span of a plot
grid.arrange(bp, arrangeGrob(dp, sc), ncol = 2)
grid.arrange(bp, arrangeGrob(dp, sc), nrow = 1, ncol=3)
?arrangeGrob

grid.arrange(bp, dp, sc, vp, ncol = 2,  layout_matrix = cbind(c(1,1,1), c(2,3,4)))
grid.arrange(bp, dp, sc, vp, ncol = 2,  layout_matrix = cbind(c(1,1,4), c(2,3,4)))

grid.arrange(bp, dp, sc, vp,  ncol=2, nrow=2, widths=c(4, 1.4), heights=c(1.4, 4))
#ggarrange------
library(ggpubr)
?ggpubr::ggarrange

ggarrange( bp, dp, labels = c("A", "B"), common.legend = TRUE, legend = "bottom"  )

#multipage----
ggarrange(bp, dp, sc, vp,  nrow = 2, ncol = 2)
multi.page <- ggarrange(bp, dp, sc, vp,  nrow = 2, ncol = 2)
multi.page
multi.page[[1]]
multi.page[[2]]

#ggexport
ggexport(multi.page, filename = paste0(Folder1,'multiPlots1.pdf'))

ggexport(bp, dp, sc, vp, filename = paste0(Folder1,'multiPlots2.pdf'), nrow = 2, ncol = 2)
#patchwork-------


#viewport method-----
# Move to a new page
library(grid)
grid.newpage()

# Create layout : nrow = 2, ncol = 2
pushViewport(viewport(layout = grid.layout(2, 3)))
# A helper function to define a region on the layout
define_region <- function(row, col){
  viewport(layout.pos.row = row, layout.pos.col = col)
} 
# Arrange the plots
print(bp, vp=  define_region(1, 1:3))
print(dp, vp = define_region(2, 1))
print(sc, vp = define_region(2, 2:3))

#grid------
ag <- grobTree(textGrob('+', x = unit(3,"cm"), y=unit(1,'npc') - unit(1,'in')))

qplot(1:10,1:10) + annotation_custom(ag)
