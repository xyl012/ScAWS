#Takes the output from a STAR Single Cell quantification and generates a matrix in memory
make_star_matrix=function(mtx_stardir){
  barcodes=readr::read_tsv(paste0(mtx_stardir,"/","barcodes.tsv"), col_names = F)
  barcodes=as.character(unlist(barcodes))
  features=readr::read_tsv(paste0(mtx_stardir,"/","features.tsv"), col_names = F)
  ensg=as.character(unlist(features[,1]))
  genename=as.character(unlist(features[,2]))
  mat=Matrix::readMM(paste0(mtx_stardir,"/","matrix.mtx"))
  rownames(mat)=genename
  colnames(mat)=barcodes
  return(mat)
}
