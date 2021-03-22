#' Get the count or percentage of cell type per cluster. Input is from seurat_process. output options are "count" for cell counts or "percent" as cell count percents of the cluster.
#' @export

cell_type_per_cluster=function(seurat_object, output="count"){
  celltypes=unique(seurat_object$celltype)
  clusters=sort(levels(seurat_object$seurat_clusters))
  celltype_cluster_list=list()
  for (i in 1:length(clusters)){
    subset=subset(seurat_object, seurat_clusters==clusters[i])
    subset_celltype_names=names(table(subset$celltype))
    subset_celltype_counts=as.vector(table(subset$celltype))
    if (output=="count"){
      df=data.frame(celltype = subset_celltype_names, counts = subset_celltype_counts)
      celltype_cluster_list[[i]]=df
    } else if(output=="percent") {
      df=data.frame(celltype = subset_celltype_names, percents = subset_celltype_counts/sum(subset_celltype_counts))
      celltype_cluster_list[[i]]=df
    }
  }
  celltype_cluster_df=Reduce(function(d1, d2) merge(d1, d2, by = "celltype", all = TRUE),celltype_cluster_list)
  colnames(celltype_cluster_df)=c("celltype", clusters)
  celltype_cluster_df[is.na(celltype_cluster_df)]<-0
  return(celltype_cluster_df)
}
