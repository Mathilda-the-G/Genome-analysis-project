#!/bin/bash

#SBATCH -A uppmax2026-1-61
#SBATCH -M pelle #partition
#SBATCH -J Pre-processing_RNA_1
#SBATCH -c 1 
#SBATCH -t 00:10:00 
#SBATCH --mem=8GB 
#SBATCH --output=%x.%j.out
#SBATCH --error=%x.%j.err

module load FastQC/0.12.1-Java-17
module load Trimmomatic/0.39-Java-17

cd $SNIC_TMP
mkdir fastqc_1
mkdir trimmomatic
mkdir fastqc_2

F1=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_f1.fq.gz || exit 1
echo "found F1"
R2=/crex/proj/uppmax2026-1-61/Genome_Analysis/2_Zhou_2023/reads/transcriptomic_data/Control_1_r2.fq.gz || exit 1
echo "found R2"

# Run FastQC on the file
fastqc F1 -o $SNIC_TMP/fastqc_1/
echo "fastqc on F1 completed"

fastqc R2 -o $SNIC_TMP/fastqc_1/
echo "fastqc on R2 completed"

# Run trimmomatic on the RNA
trimmomatic PE \
    -threads 1 \
    $F1 $R2 \
    $SNIC_TMP/trimmomatic/Control_1_f1_paired.fastq.gz $SNIC_TMP/trimmomatic/Control_1_f1_unpaired.fastq.gz \
    $SNIC_TMP/trimmomatic/Control_1_r2_paired.fastq.gz $SNIC_TMP/trimmomatic/Control_1_r2_unpaired.fastq.gz \
    ILLUMINACLIP:$EBROOTTRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
    LEADING:3 TRAILING:3 SLIDINGWINDOW:4:15 MINLEN:36
echo "Trimmomatic completed"


# Run FastQC on trimmed RNA

trimmed=$SNIC_TMP/trimmomatic/*.fastq.gz
fastqc $trimmed -o $SNIC_TMP/fastqc_2/
echo "fastqc on trimmed completed"

cp $SNIC_TMP/fastqc_1/ /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/fastqc/RNA_1

cp $SNIC_TMP/trimmomatic/ /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/trimmomatic/RNA_1

cp $SNIC_TMP/fastqc_2/ /home/magu2329/Genome_Analysis/Genome-analysis-project/analysis/preprocessing/trimming_software/fastqc/RNA_2