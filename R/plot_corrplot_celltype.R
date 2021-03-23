#' Plots a pie chart of percentage cell types in each cell cluster. Input is a seurat object
#' @export

plot_corrplot_celltype=function(seurat_object, col){
  celltype_df=cell_type_per_cluster(seurat_object, output="percent")
  ncelltype_df=celltype_df[,-1]
  ncelltype_df=ncelltype_df[ , as.character(0:(ncol(ncelltype_df)-1))]
  rownames(ncelltype_df)=celltype_df$celltype; colnames(ncelltype_df)=colnames(celltype_df[,-1])
  ncelltype_df=as.matrix(ncelltype_df)
  corrplot::corrplot(ncelltype_df, ccl.lim = c(0, 1), tl.col = "black", col = col, cl.lim = c(0,1), method="circle")
  celltype_df=cell_type_per_cluster(seurat_object, output="count")
  ncelltype_df=celltype_df[,-1]
  ncelltype_df=ncelltype_df[ , as.character(0:(ncol(ncelltype_df)-1))]
  rownames(ncelltype_df)=celltype_df$celltype; colnames(ncelltype_df)=colnames(celltype_df[,-1])
  ncelltype_df=as.matrix(ncelltype_df)
  knitr::kable(ncelltype_df)
}
