#' Intakes a seurat_object_list after processing via seurat_process_list and returns an integrated seurat object
#' @export

integrate_seurat_object_list=function(seurat_object_list, npcs, dims){
features=Seurat::SelectIntegrationFeatures(object.list = seurat_object_list)
anchors=Seurat::FindIntegrationAnchors(object.list = seurat_object_list, anchor.features = features)
integrated_seurat_object=Seurat::IntegrateData(anchorset = anchors)
Seurat::DefaultAssay(integrated_seurat_object) <- "integrated"
integrated_seurat_object=Seurat::ScaleData(integrated_seurat_object, verbose = FALSE)
integrated_seurat_object=Seurat::RunPCA(integrated_seurat_object, npcs = npcs, verbose = FALSE)
integrated_seurat_object=Seurat::RunUMAP(integrated_seurat_object, reduction = "pca", dims = 1:dims)
integrated_seurat_object=Seurat::FindNeighbors(integrated_seurat_object, reduction = "pca", dims = 1:dims)
integrated_seurat_object=Seurat::FindClusters(integrated_seurat_object, resolution = 0.5)
return(integrated_seurat_object)
}
