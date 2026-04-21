#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J repeatmodeler
#SBATCH -c 2
#SBATCH -t 05:00:00
#SBATCH --mem=32GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

# Load modules
module load RepeatModeler/2.0.7-foss-2024a

input=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta

outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/repeatmodeler_results_2/

#Build
BuildDatabase -name moss -dir $outdir $input

#Model
RepeatModeler -database moss 
-threads 2 -LTRStruct -dir $outdir

