#' Makes a list of seurat objects. Input is from make_star_matrix() and reference is chosen from SingleR references.
#' @export

make_seurat_object_list=function(matrix_list, singler_ref, singler_labels, seurat_count_filter=F, min_nfeature_rna=200, max_nfeature_rna=2500, min_percent_mt=5){
  seurat_object_list=list()
  for (i in 1:length(matrix_list)){
    y=make_seurat_object(matrix_list[[i]], singler_ref, singler_labels, seurat_count_filter=F, min_nfeature_rna=min_nfeature_rna, max_nfeature_rna=max_nfeature_rna, min_percent_mt=min_percent_mt)
    seurat_object_list[[i]]=y
  }
  return(seurat_object_list)
}
