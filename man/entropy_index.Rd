% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/spicey_indices.R
\name{entropy_index}
\alias{entropy_index}
\title{Calculate normalized shannon-entropy of specificity scores}
\usage{
entropy_index(spec_df, group_col)
}
\arguments{
\item{spec_df}{A data.frame containing the computed specificity scores
containing at least the following columns:
\describe{
\item{cell_type}{Cell type or cluster label.}
\item{score}{Specificity score for each feature in each cell type.}
\item{\code{[group_col]}}{Column containing the feautre identifier (e.g., gene_id or region)
The \strong{name of this column must match the value passed to the \code{group_col} argument}}}}

\item{group_col}{A string specifying the name of the column in \code{da} that
identifies each feature, such as \code{gene_id} for genes or \code{region} for ATAC peaks.}
}
\value{
A data.frame with one row per feature, containing:
\describe{
\item{group_col}{Feature identifier.}
\item{entropy}{Raw Shannon entropy computed from specificity scores.}
\item{norm_entropy}{Normalized entropy score (1 - exp(-entropy))
bounded between 0 and 1, where lower values indicate higher specificity.}}
}
\description{
Computes the entropy of specificity scores (RETSI or GETSI) across cell types
Entropy quantifies how evenly a feature's activity is distributed among cell types,
yielding scores from 0 to 1, where  where values close to 1 indicate
widespread distribution across cell types, and values near 0 denote dominating
distribution towards one cell type.
}
