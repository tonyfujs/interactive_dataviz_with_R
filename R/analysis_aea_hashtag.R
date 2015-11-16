# Load libraries and data -------------------------------------------------

library(twitteR)
library(dplyr)
library(tidyr)
library(stringr)
library(lubridate)

# Load data
load('./data/clean_data.Rdata')

# Analysis ----------------------------------------------------------------
# #eval15 trend-----
library(dygraphs)

dygraph(series, main = "#eval15 tweeter trend") %>% 
  dyRangeSelector(dateWindow = c("2015-11-09", "2015-11-11")) %>%
  dyOptions(stackedGraph = TRUE) %>%
  dyAxis("y", label = "Number of tweets per hour")

# Tweet mapping-----
library(leaflet)

df %>%
  filter(!is.na(longitude)) %>%
  leaflet() %>%
  addTiles() %>%
  addCircleMarkers()

# Display table-----
library(DT)
datatable(df[!is.na(df$text), c("created", "text", "screenName")],
          options = list(pageLength = 100))
