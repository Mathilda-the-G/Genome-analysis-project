#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle 
#SBATCH -J merqury
#SBATCH -c 1
#SBATCH -t 12:00:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load merqury/20240628-1ad7c32-gfbf-2024a
cd $SNIC_TMP

#best k-mer size
k=17
R1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/DNA_1/R1_paired.fastq.gz
R2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/DNA_1/R2_paired.fastq.gz
assembly=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta

outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/merqury_results/


meryl k=$k count $R1 $R2 output mossdb.meryl

merqury.sh mossdb.meryl $assembly merqury_result


cp -r $SNIC_TMP $outdir

