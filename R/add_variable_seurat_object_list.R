#' Takes a clinical variable vector, a character clinical variable name, and a list of seurat objects and returns the seurat object list with added metadata
#' @export

add_variable_seurat_list=function(variable, variable_name, seurat_object_list){
  for (i in 1:length(variable)){
    temp_vector=rep(variable[i], ncol(seurat_object_list[[i]]))
    seurat_object_list[[i]]=Seurat::AddMetaData(object = seurat_object_list[[i]], metadata = temp_vector, col.name = variable_name)
  }
  return(seurat_object_list)
}
