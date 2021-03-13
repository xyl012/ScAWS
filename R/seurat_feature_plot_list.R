#' Intakes a seurat object list, a vector of markers, and a color col similar to ggplot and returns a list of seurat feature plots with the specified markers
#' @export

seurat_feature_plot_list=function(seurat_object, markers, cols){
  plotlist=list()
  for (i in 1:length(markers)){
    plot=print(Seurat::FeaturePlot(seurat_object, markers[i], cols = cols) + Seurat::NoLegend())
    plotlist[[i]]=plot
    return(plotlist)
  }
}
