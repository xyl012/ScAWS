#' Takes a character vector from list_dirs of directories from a STAR Single Cell quantification and generates a matrix in memory
#' @export

make_star_matrix_list=function(directories_vector, matrix_type){
  star_matrix_list=list()
  for (i in 1:length(directories_vector)) {
  star_matrix_list[[i]]=make_star_matrix(directories_vector[i], matrix_type)
  }
  return(star_matrix_list)
}
