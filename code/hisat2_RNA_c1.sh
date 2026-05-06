#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle 
#SBATCH -J hisat2_RNA_1
#SBATCH -c 16
#SBATCH -t 00:30:00
#SBATCH --mem=32GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load HISAT2/2.2.1-gompi-2024a
module load SAMtools/1.22.1-GCC-13.3.0

cd $SNIC_TMP

genome=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta

c1_f=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Control_1_f1_paired.fastq.gz
c1_r=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Control_1_r2_paired.fastq.gz

c2_f=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Control_2_f1_paired.fastq.gz
c2_r=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Control_2_r2_paired.fastq.gz

c3_f=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Control_3_f1_paired.fastq.gz
c3_r=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Control_3_r2_paired.fastq.gz

h1_f=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Heat_treated_42_12h_1_f1_paired.fastq.gz
h1_r=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Heat_treated_42_12h_1_r2_paired.fastq.gz

h2_f=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Heat_treated_42_12h_2_f1_paired.fastq.gz
h2_r=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Heat_treated_42_12h_2_r2_paired.fastq.gz

h3_f=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Heat_treated_42_12h_3_f1_paired.fastq.gz
h3_r=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1/trimmomatic/Heat_treated_42_12h_3_r2_paired.fastq.gz

forward=$c1_f
reverse=$c1_r



hisat2-build -p 16 $genome genome_index



hisat2 -q -x genome_index \
    -1 $forward \
    -2 $reverse \
| samtools sort -o c1.sorted.bam

cp $SNIC_TMP/*.sorted.bam /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results