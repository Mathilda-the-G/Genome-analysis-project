#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J flye_Nanopore_1 #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 64:00:00 #time
#SBATCH --mem=96GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load Flye/2.9.6-GCC-13.3.0 
# Go to the directory where I want the output
cd /gorilla/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results

# Run flye on the file
flye --nano-raw "/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_clean_nanopore.fq.gz" --out-dir /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results --threads 1

