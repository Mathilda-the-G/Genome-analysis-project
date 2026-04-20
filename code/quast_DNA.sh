#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J busco
#SBATCH -c 1
#SBATCH -t 02:00:00
#SBATCH --mem=64GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

# Load modules
module load QUAST/5.3.0-gfbf-2024a

input=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta




quast      test_data/contigs_1.fasta \
           test_data/contigs_2.fasta \
        -r test_data/reference.fasta.gz \
        -g test_data/genes.txt \
        -1 test_data/reads1.fastq.gz -2 test_data/reads2.fastq.gz \
        -o quast_test_output