#Makes a list of seurat objects. Input is from make_star_matrix() and reference is chosen from SingleR references.
make_seurat_object_list=function(matlist, ref){
  for (i in 1:length(matlist)){
    colnames(matlist[[i]])=gsub("-1","",colnames(matlist[[i]]))
    y=Seurat::CreateSeuratObject(counts = matlist[[i]], min.cells = 3) #
    sce_y=Seurat::as.SingleCellExperiment(y)
    qcstats=scuttle::perCellQCMetrics(sce_y)
    qcfilter=scuttle::quickPerCellQC(qcstats)
    sce_y=sce_y[,!qcfilter$discard]
    sce_y=scuttle::logNormCounts(sce_y)
    print(summary(qcfilter$discard))
    pred=SingleR::SingleR(test=sce_y, ref=ref, labels=ref$label.coarse)
    y=Seurat::as.Seurat(sce_y)
    pred=gsub(" cells","",pred$labels, fixed = T)
    y$celltype=pred
    y=Seurat::NormalizeData(y)
    y=Seurat::FindVariableFeatures(y, selection.method = "vst", nfeatures = 2000)
    seu_list_object[[i]]=y
  }
  return(seu_list_object)
}
