# Produces a plot of the average home and away team score across the history of
# the AFL. Relies on data from 'prep_data.R'.

# For the pretty pictures
require(ggplot2)
# Load in the data (this is the output from 'prep_data.R')
load('data/player_wins.Rda')
df$win_excess = df$W - df$L
df = df[with(df, order(-df$win_excess, df$Player)), ]
# Pretty pictures
# svg('player_wins_cropped.svg', width=8, height=6)
png('player_wins_cropped.png', width=800, height=600)
q = ggplot(df, aes(x = win_excess)) +
    geom_histogram(binwidth=1, aes(y=100*..count../sum(..count..))) +
    ylab('% of players') +
    geom_vline(aes(xintercept=df$win_excess[1:3]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[4:6]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[7:9]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[10]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[nrow(df) - 1:3 + 1]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[nrow(df) - 4:6 + 1]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[nrow(df) - 7:9 + 1]), alpha=0.25, colour='red') +
    geom_vline(aes(xintercept=df$win_excess[nrow(df) - 10 + 1]), alpha=0.25, colour='red') +
    ggtitle('The distribution of wins minus losses') + xlab('wins - losses')
show(q)
