#!/bin/bash

#SBATCH -A uppmax2026-1-61 #project code
#SBATCH -M pelle #partition
#SBATCH -J Pilon_polishing #name of the job
#SBATCH -c 2 #cores
#SBATCH -t 00:10:00 #time #ska vara 20
#SBATCH --mem=64GB #memory allocated to job
#SBATCH --output=%x.%j.out  #output file
#SBATCH --error=%x.%j.err  #error file

module load Pilon/1.24-Java-17
genome=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/flye_results/assembly.fasta
frag=FILES_AFTER_BWA.BAM
jump=FILES_AFTER_BWA.BAM

outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results

pilon --outdir $outdir --genome $genome --frags $frag

