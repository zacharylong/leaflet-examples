library(RColorBrewer)
library(rgdal)
US3 <- readOGR(dsn="Projectmaps", layer = "US3")
mycolours <- brewer.pal(8, "Blues")
mybreaks <- c(0, 20, 40, 50, 60, 80, 100)
cut(US3$Bush_pct, mybreaks)
mycolourscheme <- mycolours[findInterval(US3$Bush_pct, vec = mybreaks)]
plot(US3, col = mycolourscheme, main = "Percentage Vote Share for Bush - 2004", cex = 5)
legend(-119, 31.5, legend = levels(cut(US3$Bush_pct, mybreaks)), fill = mycolourscheme, cex = 0.8, title = "% vote for Bush")