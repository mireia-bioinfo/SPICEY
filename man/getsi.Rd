% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/getsi.R
\name{getsi}
\alias{getsi}
\title{Compute GETSI scores on RNA data}
\usage{
getsi(rna_da)
}
\arguments{
\item{gr}{GRanges object with RNA differential expression data (avg_log2FC, p_val, cell_type, symbol)}
}
\value{
GRanges with computed GETSI scores (GETSI column)
}
\description{
Compute GETSI scores on RNA data
}
