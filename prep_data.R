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
download.file('http://afltables.com/afl/stats/biglists/bg3.txt','data/bg3.txt')
# Call a Python script to parse the data into CSV format
system('python parse_scores.py')
# Load the data into R workspace
df = read.csv('data/bg3_csv.txt')
# Recognise the dates as "Date" objects
df$date = as.Date(df$date, '%d-%B-%Y')
# Change to long format (one shore per line, not one game per line)
# The home teams
dl_h = df[ , c('id','date','round','home_team','home_goals','home_behinds','home_points','venue')]
dl_h = rename(dl_h, c('home_team'='team', 'home_goals'='goals', 'home_behinds'='behinds', 'home_points'='points'))
dl_h$home_away = 'home'
# The away teams
dl_a = df[ , c('id','date','round','away_team','away_goals','away_behinds','away_points','venue')]
dl_a = rename(dl_a, c('away_team'='team', 'away_goals'='goals', 'away_behinds'='behinds', 'away_points'='points'))
dl_a$home_away = 'away'
# Stack 'em up
dl = rbind(dl_h, dl_a)
# Some tidy-up
rm(df, dl_h, dl_a)
# Some sorting (NB these are hard coded .. may need updating)
dl$round = factor(dl$round, levels = c('R1','R2','R3','R4','R5','R6','R7','R8','R9','R10','R11','R12','R13','R14','R15','R16','R17','R18','R19','R20','R21','R22','R23','R24','EF','QF','SF','PF','GF') )
# Some more sorting
dl$home_away = factor(dl$home_away, levels = c('home', 'away') )
# Dump to file
save(dl, file='data/all_games.Rda')