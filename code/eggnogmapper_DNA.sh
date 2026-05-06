#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle 
#SBATCH -J eggnogmapper
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH --mem=8GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load eggnog-mapper/2.1.13-gfbf-2024a



outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/eggnogmapper_results
genome=BRAKER_output
database=/sw/data/uppnex/eggNOG/5.0/rackham/

emapper.py -i proteins.faa -o $outdir --cpu 1