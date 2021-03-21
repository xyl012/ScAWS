#' Filter cells by barcode rank/FDR, knee, and emptydrops. Compare overlap and keep if unfiltered in at least one
#' @export

filter_cells_drops=function(matrix, n_expect_cells, FDR){
  stats=DropletUtils::barcodeRanks(matrix)
  e.out=DropletUtils::emptyDrops(matrix)
  e.keep=e.out$FDR <= FDR
  e.keep[is.na(e.keep)] <- FALSE
  k.keep <- DropletUtils::metadata(stats)$knee <= stats$total
  c.keep=DropletUtils::defaultDrops(matrix, expected=n_expect_cells)
  at.least.one <- k.keep | e.keep | c.keep
  table(e.keep);table(k.keep);table(c.keep);table(at.least.one)
  filt_mat=matrix[, at.least.one]
  return(filtered_matrix)
}
