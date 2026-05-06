#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle 
#SBATCH -J braker3
#SBATCH -c 1
#SBATCH -t 24:00:00
#SBATCH --mem=96GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

cd $SNIC_TMP

outdir=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/braker3_results
masked_genome=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/repeatmasker_results/pilon.fasta.masked
c1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/c1.sorted.bam
c2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/c2.sorted.bam
c3=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/c3.sorted.bam
h1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/h1.sorted.bam
h2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/h2.sorted.bam
h3=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/h3.sorted.bam


module load SeqKit/2.10.1

seqkit seq -m 500 $masked_genome > genome.filtered.fasta

filtered_genome=$SNIC_TMP/genome.filtered.fasta

export AUGUSTUS_CONFIG_PATH=$HOME/bin/augustus_config

singularity exec \
    -B /gorilla/home/magu2329:/gorilla/home/magu2329 \
    --env AUGUSTUS_CONFIG_PATH=$AUGUSTUS_CONFIG_PATH \
    /crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/braker3.sif \
    braker.pl \
    --genome $filtered_genome \
    --bam $c1,$c2,$c3,$h1,$h2,$h3 \
    --softmasking  \
    --species moss_v2 \
    --AUGUSTUS_CONFIG_PATH=$AUGUSTUS_CONFIG_PATH \
    --threads 1 \
    --workingdir $outdir
