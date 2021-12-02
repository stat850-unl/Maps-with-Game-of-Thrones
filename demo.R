library(sf)
library(tidyverse)

# First, plot the continents
continents <- sf::read_sf("data/Continents.shp")
ggplot(continents) + geom_sf()

# Can we label them?
# First, generate a label
continents <- continents %>%
  mutate(label_loc = st_centroid(geometry))

# Then, add the label to the plot using geom_sf_text
ggplot(continents) + geom_sf() +
  geom_sf_text(aes(label_loc, label = name))

# What is in a geometry object, anyways?
continents$geometry[[1]]
str(continents$geometry[[1]])
continents$geometry[[1]][[1]]


islands <- sf::read_sf("data/Islands.shp")
ggplot(continents) + geom_sf() +
  geom_sf_text(aes(label_loc, label = name)) + 
  geom_sf(data = islands)

# ggthemes has themes for maps
library(ggthemes)
ggplot(continents) + geom_sf() +
  geom_sf_text(aes(label_loc, label = name)) + 
  geom_sf(data = islands) + 
  theme_map()



# Other types of geometries
rivers <- sf::read_sf("data/Rivers.shp")
ggplot(continents) + 
  geom_sf() + 
  geom_sf(data = rivers, color = "blue")

str(rivers$geometry[[1]])
