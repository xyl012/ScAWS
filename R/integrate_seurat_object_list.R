#' Intakes a seurat_object_list after processing via seurat_process_list and returns an integrated seurat object
#' @export

integrate_seurat_object_list=function(seurat_object_list, npcs, dims){
features=SelectIntegrationFeatures(object.list = seurat_object_list)
anchors=FindIntegrationAnchors(object.list = seurat_object_list, anchor.features = features)
integrated_seurat_object=IntegrateData(anchorset = anchors)
DefaultAssay(integrated_seurat_object) <- "integrated"
integrated_seurat_object=ScaleData(integrated_seurat_object, verbose = FALSE)
integrated_seurat_object=RunPCA(integrated_seurat_object, npcs = npcs, verbose = FALSE)
integrated_seurat_object=RunUMAP(integrated_seurat_object, reduction = "pca", dims = 1:dims)
integrated_seurat_object=FindNeighbors(integrated_seurat_object, reduction = "pca", dims = 1:dims)
integrated_seurat_object=FindClusters(integrated_seurat_object, resolution = 0.5)
return(integrated_seurat_object)
}
