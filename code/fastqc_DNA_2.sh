#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J FastQC_DNA_2 #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 1:00:00 #time
#SBATCH --mem=30GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load FastQC/0.12.1-Java-17 #must check that the right thing is loaded by using module load software

# Go to the directory where I want the output
cd /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/fastqc/fastqc_results_DNA_2

# Run FastQC on the file
fastqc /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/trimmomatic_results_DNA/*.fastq.gz