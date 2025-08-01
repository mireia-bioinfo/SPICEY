% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annotate_re_genes.R
\name{annotate_with_nearest}
\alias{annotate_with_nearest}
\title{Annotate regulatory regions to their gene targets using distance to the nearest transcription start site (TSS)}
\usage{
annotate_with_nearest(
  retsi,
  txdb,
  annot_dbi,
  protein_coding_only = TRUE,
  keep_mito = FALSE,
  verbose = TRUE,
  add_tss_annotation = FALSE
)
}
\arguments{
\item{retsi}{A \code{GRanges} or \code{data.frame} of regulatory elements to annotate.
If a \code{data.frame}, it must have columns sufficient to construct
a \code{GRanges} object, including \code{seqnames}, \code{start}, and \code{end}.}

\item{txdb}{A \code{TxDb} object (from \pkg{GenomicFeatures}) representing genome annotation.
Can be created using \code{GenomicFeatures::makeTxDbFromGFF()} or a prebuilt
TxDb package such as \code{TxDb.Hsapiens.UCSC.hg38.knownGene}.}

\item{annot_dbi}{An \code{AnnotationDbi} object (e.g., \pkg{org.Hs.eg.db})
for mapping gene IDs to gene symbols and types.}

\item{protein_coding_only}{Logical, default \code{TRUE}.
If \code{TRUE}, restricts to protein-coding genes based on the \code{GENETYPE} annotation in \code{annot_dbi}.}

\item{keep_mito}{Logical, default \code{FALSE}. Whether to keep mitochondrial chromosomes.}

\item{verbose}{Logical, default \code{TRUE}. If \code{TRUE}, prints informative messages.}

\item{add_tss_annotation}{Logical, default \code{TRUE}.
If \code{TRUE}, annotate REs overlapping TSS directly.}
}
\value{
A \code{data.frame} containing:
\itemize{
\item \code{distanceToTSS}: Distance to nearest TSS.
\item \code{annotation}: "Promoter" (< 2kb) or "Distal".
\item \code{nearestGeneSymbol}: Symbol of the nearest gene.
\item Optional \code{in_TSS} and \code{TSS_gene} if \code{add_tss_annotation = TRUE}.
\item Other original metadata columns.}
}
\description{
Annotate a set of regulatory elements with their putative target genes
based on distance to the nearest TSS, classifying as "Promoter" (<2kb) or "Distal",
and adding the nearest gene symbol using Biomart-annotated genes.
Optionally, annotate direct overlap with TSS using 1-bp TSS coordinates.
}
\examples{
library(TxDb.Hsapiens.UCSC.hg38.knownGene)
library(org.Hs.eg.db)
data(atac)
retsi <- compute_spicey_index(atac = atac)
retsi_gene_nearest <- annotate_with_nearest(
  retsi = retsi,
  txdb = TxDb.Hsapiens.UCSC.hg38.knownGene,
  annot_dbi = org.Hs.eg.db)
}
