#Intakes a seurat object list, a vector of markers, and a color col similar to ggplot and returns a list of seurat feature plots with the specified markers

seurat_feature_plot_list=function(seu_object, markers, cols){
  plotlist=list()
  for (i in 1:length(markers)){
    plot=print(FeaturePlot(seu_object, markers[i], cols = cols) + NoLegend())
    plotlist[[i]]=plot
    return(plotlist)
  }
}
