#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle
#SBATCH -J eggnogmapper
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH --mem=32GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load eggnog-mapper/2.1.13-gfbf-2024a



outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/eggnogmapper_results
genome=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/braker3_results/braker.aa
database=/sw/data/uppnex/eggNOG/5.0/rackham/

emapper.py \
  -i  $genome \
  -o eggnog_annotation \
  --data_dir $database \
  --itype proteins \
  --output_dir $outdir \
  --cpu 1 \
  --go_evidence experimental \
  --override \
  --decorate_gff yes \
  --decorate_gff_ID_field ID