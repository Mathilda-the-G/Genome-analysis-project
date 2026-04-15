#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J BWA #name of the job
#SBATCH -c 1 #cores
#SBATCH -t 0:10 #time
#SBATCH --mem=10GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load BWA/0.7.19-GCCcore-13.3.0 #must check that the right thing is loaded by using module load software

# Go to the directory where I want the output
cd /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/bwa_results

ref=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results/assembly.fasta
read1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/trimmomatic_results_DNA/R1_paired.fastq.gz
read2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/trimmomatic_results_DNA/R2_paired.fastq.gz


# Run bwa on the file
bwa aln $ref $read1 > read1.sai; bwa aln $ref $read2 > read2.sai
bwa sampe $ref read1.sai read2.sai $read1 $read2 > aln-pe.sam
