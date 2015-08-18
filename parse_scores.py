import re
import os
sep = re.compile('\. +|  +|(?<=[0-9])\.|\n')

in_file = open('data/bg3.txt', 'r')
out_file = open('data/bg3_csv.txt', 'w')

in_file.readline()
in_file.readline()
out_file.write('id,date,round,home_team,home_goals,home_behinds,home_points,away_team,away_goals,away_behinds,away_points,venue\n')
for line in in_file:
    split_line = sep.split(line)
    for entry in split_line:
        out_file.write(entry + ',')
    out_file.seek(-2, os.SEEK_END)
    out_file.truncate()
    out_file.write('\n')

in_file.close()
out_file.close()
