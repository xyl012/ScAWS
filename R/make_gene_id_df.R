#' get the gene names and associated entrez ids from STARsolo output and make a dataframe
#' @export

make_gene_id_df=function(star_matrix_directory, matrix_type){
  # Filtered or raw STAR matrix output
  if (matrix_type=="filtered"){
    star_matrix_directory=paste0(star_matrix_directory, "/Solo.out/Gene/filtered")
  } else if(matrix_type=="raw"){
    star_matrix_directory=paste0(star_matrix_directory, "/Solo.out/Gene/raw")
  } else {
    print("Select filtered or raw STAR matrix type")
  }
  features=readr::read_tsv(paste0(star_matrix_directory,"/","features.tsv"), col_names = F)
  ensg=as.character(unlist(features[,1]))
  genename=as.character(unlist(features[,2]))
  return(features)
}
