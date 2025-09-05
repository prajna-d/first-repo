#!/bin/bash

query_file=$1
subject_file=$2
output_file=$3

#tblastn: protein query, nucleotide subject
tblastn -query "$query_file" -subject "$subject_file" -outfmt "6 pident length qlen slen" | awk '$1>=30 && $2>=($3*0.9){print $0}' > "$output_file"

#Print the number of matches identified to stdout
awk 'END{print NR}' "$output_file"