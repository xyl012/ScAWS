#' Makes a list of seurat objects. Input is from make_star_matrix() and reference is chosen from SingleR references.
#' @export

make_seurat_object_list=function(matrix_list, singler_ref, singler_labels){
  for (i in 1:length(matrix_list)){
    colnames(matrix_list[[i]])=gsub("-1","",colnames(matrix_list[[i]]))
    y=Seurat::CreateSeuratObject(counts = matrix_list[[i]], min.cells = 3) #
    sce_y=Seurat::as.SingleCellExperiment(y)
    qcstats=scuttle::perCellQCMetrics(sce_y)
    qcfilter=scuttle::quickPerCellQC(qcstats)
    sce_y=sce_y[,!qcfilter$discard]
    sce_y=scuttle::logNormCounts(sce_y)
    print(summary(qcfilter$discard))
    pred=SingleR::SingleR(test=sce_y, ref=singler_ref, labels=singler_labels)
    y=Seurat::as.Seurat(sce_y)
    pred=gsub(" cells","",pred$labels, fixed = T)
    y$celltype=pred
    y=Seurat::NormalizeData(y)
    y=Seurat::FindVariableFeatures(y, selection.method = "vst", nfeatures = 2000)
    seu_list_object[[i]]=y
  }
  return(seu_list_object)
}
