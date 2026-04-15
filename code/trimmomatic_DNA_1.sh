#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J Trimmomatic_DNA_1 #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 2:00:00 #time
#SBATCH --mem=50GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load Trimmomatic/0.39-Java-17 #must check that the right thing is loaded by using module load software

# Go to the directory where I want the output
cd /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic_DNA

#input files
R1=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R1.fastq.gz
R2=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/genomics_chr3_data/chr3_illumina_R2.fastq.gz

trimmomatic PE \
    -threads 1 \
    $R1 $R2 \
    R1_paired.fastq.gz R1_unpaired.fastq.gz \
    R2_paired.fastq.gz R2_unpaired.fastq.gz \
    ILLUMINACLIP:$EBROOTTRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
