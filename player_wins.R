# Produces a plot of the average home and away team score across the history of
# the AFL. Relies on data from 'prep_data.R'.

# For the pretty pictures
require(ggplot2)
# Load in the data (this is the output from 'prep_data.R')
load('data/player_wins.Rda')
df$win_excess = df$W - df$L
df = df[with(df, order(-df$win_excess, df$Player)), ]
# Pretty pictures
svg('player_wins.svg', width=8, height=6)
p = ggplot(df, aes(x = win_excess)) + geom_histogram(binwidth=1, aes(y=100*..count../sum(..count..))) + ylab('%') + ggtitle('The distribution of wins minus losses') + xlab('wins - losses')
show(p)
