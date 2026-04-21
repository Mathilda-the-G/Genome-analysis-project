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
module load BUSCO/5.8.2-gfbf-2024a

input=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/pilon_results/polished/pilon.fasta

#since it is read only, copying everything and store it temporarely
cp -r $AUGUSTUS_CONFIG_PATH $SNIC_TMP/
export AUGUSTUS_CONFIG_PATH=$SNIC_TMP/augustus_config

busco -i $input -m genome -o busco_results -l viridiplantae_odb10 -c 1