# Makes a Seurat object from a star matrix
make_seurat_object=function(star_mat){
  colnames(star_mat)=gsub("-1","",colnames(star_mat))
  y=CreateSeuratObject(counts = star_mat, min.cells = 3) #
  sce_y=as.SingleCellExperiment(y)
  qcstats=perCellQCMetrics(sce_y)
  qcfilter=quickPerCellQC(qcstats)
  sce_y=sce_y[,!qcfilter$discard]
  sce_y=logNormCounts(sce_y)
  print(summary(qcfilter$discard))
  pred=SingleR(test=sce_y, ref=ref, labels=ref$label.fine)
  pred_labels=pred
  y=as.Seurat(sce_y)
  pred=gsub(" cells","",pred$labels, fixed = T)
  y$celltype=pred
  y=NormalizeData(y)
  y=FindVariableFeatures(y, selection.method = "vst", nfeatures = 2000)
  return(y)
}
