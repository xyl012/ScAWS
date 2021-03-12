#Makes a list of seurat objects. Input is from make_star_matrix()
make_seurat_object_list=function(matlist){
  for (i in 1:length(matlist)){
    colnames(matlist[[i]])=gsub("-1","",colnames(matlist[[i]]))
    y=CreateSeuratObject(counts = matlist[[i]], min.cells = 3) #
    sce_y=as.SingleCellExperiment(y)
    qcstats=perCellQCMetrics(sce_y)
    qcfilter=quickPerCellQC(qcstats)
    sce_y=sce_y[,!qcfilter$discard]
    sce_y=logNormCounts(sce_y)
    print(summary(qcfilter$discard))
    pred=SingleR(test=sce_y, ref=ref, labels=ref$label.fine)
    pred_labels_list[[i]]=pred
    y=as.Seurat(sce_y)
    pred=gsub(" cells","",pred$labels, fixed = T)
    y$celltype=pred
    y=NormalizeData(y)
    y=FindVariableFeatures(y, selection.method = "vst", nfeatures = 2000)
    seu_list_object[[i]]=y
  }
  return(seu_list_object)
}
