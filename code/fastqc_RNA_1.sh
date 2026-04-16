#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J FastQC_DNA_1 #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 0:40:00 #time
#SBATCH --mem=20GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load FastQC/0.12.1-Java-17 #must check that the right thing is loaded by using module load software

rna=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data
outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/fastqc/RNA_1

# Run FastQC on the file
fastqc -o $outdir /home/magu2329/Genome_Analysis/Genome-analysis-project/code/preprocessing_slurm/*.fq.gz