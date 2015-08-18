"""
Takes the data from http://afltables.com/afl/stats/biglists/bg11.txt and turns it into CSV for use in R for plotting.
"""
import os
# This specifies the location on each line of the entries
entry_char = [0, 7, 35, 40, 45, 50, 55, 64, 666]

# open the input and output files, this may not be portable
in_file = open('data/bg11.txt', 'r')
out_file = open('data/bg11_csv.txt', 'w')

# skip the heading lines
in_file.readline()
in_file.readline()

# walk through the input data file and output CSV format
for line in in_file:
    for char_pos in [40,45,50]:
        if line[char_pos] == ' ':
            line = line[:char_pos] + '0' + line[char_pos+1:]
    entry_char[-1] = len(line)
    for i in range(len(entry_char) - 1):
        out_file.write(line[entry_char[i]:entry_char[i+1]] + ',')
    # Trim trailing commas
    out_file.seek(-1, os.SEEK_END)
    out_file.truncate()
    # Next row

# Tidy your room
in_file.close()
out_file.close()
