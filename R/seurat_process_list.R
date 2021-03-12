# Intakes a list of seurat objects and outputs a processed list of seurat objects
seurat_process_list=function(seurat_object_list){
  seurat_processed_list=list()
  for (i in 1:length(seurat_object_list)){
    seurat_processed_list[[i]]=seurat_process(seurat_object_list[[i]])
  }
  seurat_processed_list
}
