library(ggplot2)
library(scales)
library(ggmap)
library(viridis)
US3@data$id <- rownames(US3@data)
newUS <- fortify(US3, region = "id")
newdf <- merge(newUS, US3@data, by = "id")
Myplot <- ggplot() +
  
  geom_polygon(data = newdf, aes(fill = Bush_pct, 
                                 x = long, 
                                 y = lat, 
                                 group = group)) +
  theme_nothing(legend = TRUE) + coord_map() + ggtitle("Vote Percentage for Bush, 2004") + theme(plot.title = element_text(hjust =0.5))

NicerPlot <- Myplot + scale_fill_viridis(option = "magma", direction = -1)
NicerPlot
