Player wins plot
================

Plots a histogram of the (wins - losses) for every player who ever played VFL/AFL.

Pulls data from [AFL Tables](http://afltables.com/afl/afl_index.html) and plots it.

## `prep_data.R`

Downloads the data and squishes it into a nice long format for plotting. This calls parse_data.py.

## `parse_data.py`

Just text manipulation. Takes the raw data and turns it into CSV format.

## `player_wins.R`

Plots a pretty picture: [`player_wins.svg`](https://github.com/smcateer/afl_score_plot/blob/player_wins/player_wins.svg).

## Notes

Relies on a R 3.1.2 (with ggplot2 1.0.1) and Python 2.7. Implemented on a *nix OS.
