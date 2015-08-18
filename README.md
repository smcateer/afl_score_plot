AFL score plot
==============

Small scripts for plotting historical AFL scores. In particular, average home and away team scores are plotted against the years 1897-present.

Pulls data from [AFL Tables](http://afltables.com/afl/afl_index.html) and plots it.

Relies on a R 3.1.2 (with plyR 1.8.1 and ggplot2 1.0.1) and Python 2.7.

## prep_data.R

Downloads the data and squishes it into a nice long format for plotting. This calls parse_scores.py.

## parse_scores.py

Just text manipulation. Takes the raw data and turns it into CSV format.

## year_score.R

Plots a pretty picture like year_score.svg.
