#' Plots a pie chart of percentage cell types in each cell cluster. Input is a seurat object
#' @export

plot_corrplot_celltype=function(seurat_object, col){
celltype_df=cell_type_per_cluster(seurat_object, output="percent")
ncelltype_df=celltype_df[,-1]; clusters=colnames(ncelltype_df); ncelltype_df=as.matrix(ncelltype_df); rownames(ncelltype_df)=celltype_df$celltype; colnames(ncelltype_df)=clusters
plot=recordPlot(corrplot::corrplot(ncelltype_df, method = "pie", cl.pos = "n", col = col, cl.lim = c(0, 1), tl.col = "black"))
return(plot)
}
