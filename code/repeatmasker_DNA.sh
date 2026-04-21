#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J repeatmasker
#SBATCH -c 1
#SBATCH -t 00:05:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

# Load modules
module load RepeatMasker/4.2.1-foss-2024a

input=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta
outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/repeatmasker_results
library=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/repeatmodeler_results/library

RepeatMasker -dir $outdir -lib $library $input