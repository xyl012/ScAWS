#' Process a Seurat object with specified dimensions and principal components
#'
#' @export

seurat_process_object=function(seurat_object, dims, npcs){
  # Run the standard workflow for visualization and clustering
  seurat_object=Seurat::ScaleData(seurat_object, verbose = FALSE)
  seurat_object=Seurat::RunPCA(seurat_object, npcs = npcs, verbose = FALSE)
  # t-SNE and Clustering
  seurat_object=Seurat::RunUMAP(seurat_object, reduction = "pca"
                  , dims = 1:dims)
  seurat_object=Seurat::FindNeighbors(seurat_object, reduction = "pca"
                        , dims = 1:dims)
  seurat_object=Seurat::FindClusters(seurat_object
                       #, resolution = 0.5
  )
  return(seurat_object)
}
