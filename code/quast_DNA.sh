#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J quast
#SBATCH -c 1
#SBATCH -t 00:05:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

# Load modules
module load QUAST/5.3.0-gfbf-2024a

input=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta
ref=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results/assembly.fasta
read1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/DNA_1/R1_paired.fastq.gz
read2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/DNA_1/R2_paired.fastq.gz


quast      $input \
        -r $ref \
        -o quast_DNA