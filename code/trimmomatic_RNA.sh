#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J Trimmomatic_DNA_1 #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 02:00:00 #time
#SBATCH --mem=50GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load Trimmomatic/0.39-Java-17 #must check that the right thing is loaded by using module load software

rna=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data
outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1

for x, y in $rna;
do
    trimmomatic PE \
    -threads 1 \
    <input 1> <input 2> \
    <paired output 1> <unpaired output 1> \
    <paired output 2> <unpaired output 2> \
        ILLUMINACLIP:TruSeq3-SE:2:30:10 \
        LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
done
