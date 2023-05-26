#!/bin/sh
# Author: Daja Alea Neugebauer
# Version: 0.1alpha

# Already unzipped .gz!

rm daja.csv
for genome in $(ls ./gff | sed "s/.gff//g") # g -> Global
do
    srun -c 1 sh ./single_bacteria_genome.sh $genome & # & -> 1 core/thread; Parallel
done

# header = FALSE -> If header isn't there yet and I want one
# header = TRUE -> If Nina already has one

# Output: daja.csv
