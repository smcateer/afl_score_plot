# ETL Script for AFL Tables' 'all games' data
# ===========================================
# This script will pull down the raw data from AFL Tables and parse it into the
# format expected by the plotting functions. Ugly stuff, but ETL is a dirty,
# dirty game. :/
#
# Output data is in the format of a data frame with the columns:
# 'id'        : integer rep order of games played
# 'date'      : like it sounds
# 'round'     : like it sounds, 'EF' = 'elimination final', ...
# 'team'      : like it sounds
# 'goals'     : like it sounds
# 'behinds'   : like it sounds
# 'points'    : = 6*goals + behinds
# 'venue'     : where the game was played
# 'home_away' : whether this team was the home or away team

# For the rename fn
require(plyr)
# Pull the raw data from AFL Tables
download.file('http://afltables.com/afl/stats/biglists/bg11.txt','data/bg11.txt')
# Call a Python script to parse the data into CSV format
system('python parse_scores.py')
# Load the data into R workspace
df = read.csv('data/bg11_csv.txt')
# Dump to file
save(df, file='data/player_wins.Rda')
