#' Makes a seurat object from a star matrix. Input is from make_star_matrix() and reference is chosen from SingleR references.
#' @export

make_seurat_object=function(star_matrix, ref){
  colnames(star_matrix)=gsub("-1","",colnames(star_matrix))
  y=Seurat::CreateSeuratObject(counts = star_matrix, min.cells = 3) #
  sce_y=Seurat::as.SingleCellExperiment(y)
  qcstats=scuttle::perCellQCMetrics(sce_y)
  qcfilter=scuttle::quickPerCellQC(qcstats)
  sce_y=sce_y[,!qcfilter$discard]
  sce_y=scuttle::logNormCounts(sce_y)
  print(summary(qcfilter$discard))
  pred=SingleR::SingleR(test=sce_y, ref=ref, labels=ref$label.fine)
  y=Seurat::as.Seurat(sce_y)
  pred=gsub(" cells","",pred$labels, fixed = T)
  y$celltype=pred
  y=Seurat::NormalizeData(y)
  y=Seurat::FindVariableFeatures(y, selection.method = "vst", nfeatures = 2000)
  seu_list_object=y
  return(y)
}
