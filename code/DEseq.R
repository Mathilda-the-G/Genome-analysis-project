#install.packages("htmltools")
#library(htmltools)
#source("https://bioconductor.org/biocLite.R")
#biocLite("DESeq2")
#BiocManager::install("DESeq2")

library( "DESeq2" )
library(ggplot2)
library(tidyverse) # includes ggplot2, for data visualisation. dplyr, for data manipulation.
library(RColorBrewer) # for a colourful plot
library(ggrepel) # for nice annotations


setwd("~/X4/Genome analysis")

# reading the text-file as a table
readLines("counts.txt", n = 3)
countData = read.table("counts.txt", header = TRUE, sep = "\t")

# fixing so only relevant data is kept
modifiedData = countData
gene_ids = modifiedData$Geneid
sample_cols = grep("c1|c2|c3|h1|h2|h3", colnames(modifiedData))
modifiedData = modifiedData[, sample_cols]
rownames(modifiedData) = gene_ids

modifiedData = modifiedData[!duplicated(rownames(modifiedData)), ]
modifiedData = apply(modifiedData, 2, as.numeric)
rownames(modifiedData) = gene_ids

#creating metadata for dds
metaData = data.frame(
  row.names = colnames(modifiedData),
  condition = c("control","control","control",
                "heat","heat","heat"))

dds = DESeqDataSetFromMatrix(
  countData = modifiedData,
  colData = metaData,
  design = ~ condition)

dds = DESeq(dds)

# checking the results
res = results(dds)
head(results(dds, tidy=TRUE))
summary(res)
res = res[order(res$padj),]
head(res)
res2 = as.data.frame(res)

# Plotting the vulcano plot
# remove NA values
res2 = na.omit(res2)

# classify genes
res2$Regulation = "Not significant"

res2$Regulation[res2$padj < 0.05 & res2$log2FoldChange > 1] = "Upregulated"
res2$Regulation[res2$padj < 0.05 & res2$log2FoldChange < -1] = "Downregulated"

# Keep only the 15 most significant genes (smallest adjusted p-values)
top15 = res2[order(res2$padj), ][1:15, ]

# Add alphabetical labels
top15$Label = LETTERS[1:15]

# plot 
ggplot(res2, aes(x = log2FoldChange, y = -log10(padj))) +
  geom_point(aes(color = Regulation)) +
  
  scale_color_manual(values = c(
    "Upregulated" = "red",
    "Downregulated" = "blue",
    "Not significant" = "grey"
  )) +
  theme_minimal() +
  geom_vline(xintercept = c(-1, 1), linetype = "dashed") +
  geom_text_repel(data = top15, aes(label = Label), size = 3, fontface = "bold") +
  geom_hline(yintercept = -log10(0.05), linetype = "dashed") +
  labs(
    title = "Differentially Expressed Genes",
    x = "Log2 Fold Change",
    y = "-Log10 Adjusted P-value"
  )



#First we need to transform the raw count data
#vst function will perform variance stabilizing transformation

vsdata = vst(res2, blind=FALSE)

plotPCA(vsdata, intgroup="condition")


vsdata = vst(dds, blind = FALSE)

# Get PCA data
pcaData = plotPCA(vsdata, intgroup = "condition", returnData = TRUE)
pcaData$Sample = c("c1","c2","c3","h1","h2","h3")

percentVar = round(100 * attr(pcaData, "percentVar"))

#Plot PCA
ggplot(pcaData,
  aes(PC1, PC2,color = condition,label = Sample)) +
  geom_point(size = 4) +
  geom_text_repel(size = 5,segment.color = NA,show.legend = FALSE) +
  xlab(paste0("PC1: ", percentVar[1], "% variance")) +
  ylab(paste0("PC2: ", percentVar[2], "% variance")) +
  theme_bw()