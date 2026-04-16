#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J BWA
#SBATCH -c 2
#SBATCH -t 02:00:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

# Load modules
module load bwa-mem2/2.3-GCC-13.3.0
module load SAMtools/1.19.2-GCC-13.3.0


# Input files
ref=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results/assembly.fasta
read1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/DNA_1/R1_paired.fastq.gz
read2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/DNA_1/R2_paired.fastq.gz

outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/bwa_results

bwa-mem2 index $ref
bwa-mem2 mem -t 2 $ref $read1 $read2 | \
samtools sort -o $outdir/aligned_reads_sorted.bam
samtools index $outdir/align_reads_sorted.bam