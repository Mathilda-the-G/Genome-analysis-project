#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J repeatmasker
#SBATCH -c 2
#SBATCH -t 06:00:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

# Load modules
module load RepeatMasker/4.2.1-foss-2024a

input=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta
library=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/repeatmodeler_results/moss-families.fa

RepeatMasker \
    -lib $library\
    -cutoff 225\
    -xsmall \
    -gff \
    -nolow \
    -pa 2\
    $input