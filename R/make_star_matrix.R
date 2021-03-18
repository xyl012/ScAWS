#' Takes the output from a STAR Single Cell quantification and generates a matrix in memory
#' @export

make_star_matrix=function(star_matrix_directory, matrix_type){
  # Filtered or raw STAR matrix output
  if (matrix_type=="filtered"){
  star_matrix_directory=paste0(star_matrix_directory, "/Solo.out/Gene/filtered")
  } else if(matrix_type=="raw"){
  star_matrix_directory=paste0(star_matrix_directory, "/Solo.out/Gene/raw")
  } else {
  print("Select filtered or raw STAR matrix type")
  }
  barcodes=readr::read_tsv(paste0(star_matrix_directory,"/","barcodes.tsv"), col_names = F)
  barcodes=as.character(unlist(barcodes))
  features=readr::read_tsv(paste0(star_matrix_directory,"/","features.tsv"), col_names = F)
  ensg=as.character(unlist(features[,1]))
  genename=as.character(unlist(features[,2]))
  mat=Matrix::readMM(paste0(star_matrix_directory,"/","matrix.mtx"))
  rownames(mat)=genename
  colnames(mat)=barcodes
  return(mat)
}
