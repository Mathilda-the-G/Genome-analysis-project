#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle 
#SBATCH -J star_RNA
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH --mem=8GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load STAR/2.7.11b-GCC-13.3.0
outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/star_results/
genome=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta


star --runThreadN 1  --runMode genomeGenerate --genomeDir $outdir --genomeFastaFiles $genome