% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/annotate_re_genes.R
\name{annotate_with_nearest}
\alias{annotate_with_nearest}
\title{Annotate regions with nearest gene and promoter information}
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
\item{retsi}{A \code{GRanges} object or \code{data.frame} containing regulatory elements to annotate.}

\item{txdb}{A \code{TxDb} object used to extract promoter regions.}

\item{annot_dbi}{An \code{AnnotationDbi} annotation database object (e.g., \code{org.Hs.eg.db}) for mapping gene IDs to gene symbols and types.}

\item{protein_coding_only}{Logical indicating whether to restrict promoter regions to protein-coding genes only (default: \code{TRUE}).}

\item{keep_mito}{Logical indicating whether to keep mitochondrial (chrM/MT) chromosomes in promoter extraction (default: \code{FALSE}).}

\item{verbose}{Logical; if \code{TRUE}, informative messages are printed during processing (default: \code{TRUE}).}

\item{add_tss_annotation}{Logical; whether to also annotate whether a region overlaps a TSS (default: \code{TRUE}).}
}
\value{
A \code{data.frame} with the following columns:
\itemize{
\item \code{distanceToTSS}: Distance to the nearest TSS
\item \code{annotation}: Promoter/Distal classification based on distance
\item \code{nearestGeneSymbol}: Symbol of the nearest gene
\item \code{in_TSS} (optional): Logical indicating if RE overlaps a TSS
\item \code{TSS_gene} (optional): Gene symbol for overlapping TSS
\item Other original metadata
}
}
\description{
This function uses ChIPseeker-like logic to annotate peaks with distance to the nearest
TSS (transcription start site), classifies them as Promoter (<2kb) or Distal, and adds
the nearest gene ID using Biomart-annotated genes. Optionally, it can annotate whether a
region overlaps a TSS directly using 1-bp TSS coordinates.
}
