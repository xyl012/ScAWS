#' Intakes a list of seurat objects and outputs a processed list of seurat objects
#' @export

seurat_process_list=function(seurat_object_list){
  seurat_processed_list=list()
  for (i in 1:length(seurat_object_list)){
    seurat_processed_list[[i]]=seurat_process_object(seurat_object_list[[i]])
  }
  return(seurat_processed_list)
}
