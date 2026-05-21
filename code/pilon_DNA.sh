#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle 
#SBATCH -J Pilon_polishing
#SBATCH -c 2 
#SBATCH -t 24:00:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load Pilon/1.24-Java-17
genome=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results/assembly.fasta
frag=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/bwa_results/aligned.sorted.bam

outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results

pilon --outdir $outdir --genome $genome --frags $frag

