#!/bin/sh
# Author: Daja Alea Neugebauer
# Version: 0.1alpha

# Already unzipped .gz!

# Name of the genome file
genome=$1 # Test file; Run script with file name without .gff!

# Extract genome ID
id=$(basename $genome) # basename -> Name of file without suffix

# Calculate number of genes
gene_count=$(grep -c "gene" ./gff/$genome.gff) # grep looks for the word "gene" and -c counts it

# Calculate length of genomes
length=$(grep -v "^>" ./fasta/$genome.fna | wc -c) # wc -c counts character; | -> Piping

# GC/AT ratio
GC=$(grep -v "^>" ./fasta/$genome.fna | sed "s/[AT]//g" | wc -c)     # s -> Substitute; g -> Global
ratio=$(echo "scale=5; $GC / $length * 100" | bc) # Calculates ratio of GC (2 decimals)

# Append to output file without overwriting
echo "$id\t$gene_count\t$length\t$ratio" >> daja.csv # \t is tab and -e makes it possible

# Print the output file
cat daja.csv
