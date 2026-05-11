#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH --reservation=uppmax2026-1-61_8
#SBATCH -M pelle 
#SBATCH -J featurecounts
#SBATCH -c 1
#SBATCH -t 00:10:00
#SBATCH --mem=8GB
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

cd $SNIC_TMP

module load Subread/2.1.1-GCC-13.3.0

gtffile=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/braker3_results/braker.gtf

c1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/c1.sorted.bam
c2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/c2.sorted.bam
c3=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/c3.sorted.bam
h1=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/h1.sorted.bam
h2=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/h2.sorted.bam
h3=/home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/hisat2_results/h3.sorted.bam

featureCounts -p --countReadPairs -t exon -g gene_id -a $gtffile -o counts.txt $c1 $c2 $c3 $h1 $h2 $h3

cp -r $SNIC_TMP /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/assembly/featurecounts_results


