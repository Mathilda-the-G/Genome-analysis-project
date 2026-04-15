#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J Pilon #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 56:00:00 #time
#SBATCH --mem=90GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load Pilon/1.24-Java-17
# Go to the directory where I want the output
cd /gorilla/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results

genome=

# Run pilon on the assembly results
pilon --

