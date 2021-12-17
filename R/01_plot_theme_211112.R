######
# My Theme for plotting
######
###
# state: dezember 2021
# author: gian-Andrea egeler
###

#define colors for plot-----
## lunch types
#kudos: https://davidmathlogic.com/colorblind/
ColsPerCat_blind =  c("buffet" = "#004D40", 
                "never meat" = "#1E88E5",
                "veg-flexitarian" = "#AAED89",
                "meat-flexitarian" = "#5D6395",
                "meat-eater" =  "#c5b87c",
                "meat lover" = "#F59D28",
                "always meat" = "#D81B60") 


## define names for lunch types
NamesPerCat = tibble::tibble(lunch_type = c("buffet", 
                                    "never meat",
                                    "veg-flexitarian",
                                    "meat-flexitarian",
                                    "meat-eater",
                                    "meat lover",
                                    "always meat"),
                      plot_names = c("Buffetarian",
                                     "Never meat",
                                     "Vegetarian-\nflexitarian", 
                                     "Meat-\nflexitarian",
                                     "Meat eater" , 
                                     "Meat lover",
                                     "Always meat"))


##colors for meal content
#attention defines also the order of the legend
ColsperContent = c("Unknown" = "black",
                   "Vegan (substitute)" = "grey90", 
                   "Vegan (authentic)" = "#1E88E5",
                   "Vegetarian" = "#AAED89", 
                   "Fish" = "#5D6395", 
                   "Meat" = "#FFC107",
                   "Hot&Cold (buffet)" = "#004D40")


#defining mytheme-------
extrafont::loadfonts(device = "win", quiet = TRUE) # https://cran.r-project.org/web/packages/extrafont/README.html


#that geom_text inherits from theme: https://stackoverflow.com/questions/48977963/how-to-let-geom-text-inherit-theme-specifications-ggplot2
ggplot2::theme_set(ggplot2::theme_minimal(base_family = "Palatino Linotype"))
ggplot2::update_geom_defaults("text", list(family = ggplot2::theme_get()$text$family))



### for plots with double x-axis: https://stackoverflow.com/questions/52554822/save-a-ggplot2-time-series-plot-grob-generated-by-ggplotgrob
mytheme_facet <- ggplot2::theme_classic()+ # define theme for plot
    ggplot2::theme(axis.text.x = ggplot2::element_text(size=22),
                   axis.text.y = ggplot2::element_text(size=22, face = "plain"),
                   panel.grid.major = ggplot2::element_blank(),
                   legend.text = ggplot2::element_text(size = 22),
                   legend.title = ggplot2::element_text(size =22),
                   strip.text = ggplot2::element_text(size=22),
                   strip.text.x = element_text(size = 22,  face = "bold",  
                                               hjust = 0, 
                                               margin = margin(.05, 0, .05, 0.05, "cm")),
                   #background color to blank facet wraps
                   strip.background.x = ggplot2::element_blank(), 
                   # remove facet spacing on x-direction
                   strip.placement = 'outside',
                   panel.spacing.x = ggplot2::unit(0, "lines"), 
                   panel.spacing = unit(1, "lines"),
                   axis.title.y = ggplot2::element_text(size = 22, margin = ggplot2::margin(t = 0, r = 22, b = 0, l = 0)),
                   axis.title.x = ggplot2::element_text(size = 22,  margin = ggplot2::margin(t = 22, r = 0, b = 0, l = 0)),
                   plot.subtitle = ggplot2::element_text(margin = ggplot2::margin(b=15),size = 30),
                   plot.caption = ggplot2::element_text(margin = ggplot2::margin(t=15), face="italic", size=22),
                   text = ggplot2::element_text(family = ggplot2::theme_get()$text$family), 
                   legend.position = "bottom", 
                   legend.key.size = unit(1, "cm"),
                   plot.title = element_text(size = 25, face = "bold")) 

#set coord expansion
#source: https://stackoverflow.com/questions/61969752/force-the-origin-to-start-at-0-without-margin-between-data-and-x-axis-in-new-ggp
scale_y_origin <- function(...) {
    ggplot2::scale_y_continuous(expand = ggplot2::expansion(mult = c(0, 0.02)), ...)
}


#geom_text size "converter": https://stackoverflow.com/questions/17311917/ggplot2-the-unit-of-size
converter = (25.4/72.27)
