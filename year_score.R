# Produces a plot of the average home and away team score across the history of
# the AFL. Relies on data from 'prep_data.R'.

#For the rename fn
require(plyr)
# For the pretty pictures
require(ggplot2)
# Load in the data (this is the output from 'prep_data.R')
load('data/all_games.Rda')
# Add a column for the year
dl$year = as.numeric(format(dl$date, "%Y"))
# Form a new column for the mean score per year, per home/away
mean_score = aggregate(points ~ year + home_away, data=dl, mean)
# Rename the column for the plot
mean_score = rename(mean_score, c('home_away'='venue'))
# Pretty pictures
svg('year_score.svg', width=8, height=6)
p = ggplot(mean_score, aes(x=year, y=points, colour=venue)) + geom_line() + ggtitle('Mean AFL/VFL scores by year')
show(p)
