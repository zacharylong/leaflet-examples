df <- read.csv('https://raw.githubusercontent.com/plotly/datasets/master/2014_world_gdp_with_codes.csv')

# light grey boundaries
l <- list(color = toRGB("grey"), width = 0.5)

# specify map projection/options
g <- list(
  showframe = FALSE,
  showcoastlines = FALSE,
  projection = list(type = 'Mercator')
)

fig <- plot_geo(df)
fig <- fig %>% add_trace(
  z = ~GDP..BILLIONS., color = ~GDP..BILLIONS., colors = 'Blues',
  text = ~COUNTRY, locations = ~CODE, marker = list(line = l)
)
fig <- fig %>% colorbar(title = 'GDP Billions US$', tickprefix = '$')
fig <- fig %>% layout(
  title = '2014 Global GDP<br>Source:<a href="https://www.cia.gov/library/publications/the-world-factbook/fields/2195.html">CIA World Factbook</a>',
  geo = g
)

fig