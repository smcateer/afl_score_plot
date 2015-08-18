"""
Takes the data from http://afltables.com/afl/stats/biglists/bg3.txt and turns it into CSV for use in R for plotting.
"""
import re
import os
# This splits the entries according to the headers below ('headers').
sep = re.compile('\. +|  +|(?<=[0-9])\.|\n')

# open the input and output files, this may not be portable
in_file = open('data/bg3.txt', 'r')
out_file = open('data/bg3_csv.txt', 'w')

# skip the heading lines
in_file.readline()
in_file.readline()

# write out own header line
headers = 'id,date,round,home_team,home_goals,home_behinds,home_points,away_team,away_goals,away_behinds,away_points,venue\n'
out_file.write(headers)

# walk through the input data file and output CSV format
for line in in_file:
    # Old chop-chop
    split_line = sep.split(line)
    for entry in split_line:
        out_file.write(entry + ',')
    # Trim trailing commas
    out_file.seek(-2, os.SEEK_END)
    out_file.truncate()
    # Next row
    out_file.write('\n')

# Tidy your room
in_file.close()
out_file.close()
