#' Makes a seurat object from a star matrix. Input is from make_star_matrix() and reference is chosen from SingleR references.
#' @export

make_seurat_object=function(star_matrix, singler_ref, singler_labels, min_nfeature_rna=200, max_nfeature_rna=2500, min_percent_mt=5){
  colnames(star_matrix[[i]])=gsub("-1","",colnames(star_matrix[[i]]))
  y=Seurat::CreateSeuratObject(counts = star_matrix[[i]], min.cells = 3) #
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
  y[["percent.mt"]] <- Seurat::PercentageFeatureSet(y, pattern = "^MT-")
  y=Seurat::subset(y, subset = nFeature_RNA > min_nfeature_rna & nFeature_RNA < max_nfeature_rna & percent.mt < min_percent_mt)
  y=Seurat::NormalizeData(y)
  y=Seurat::FindVariableFeatures(y, selection.method = "vst", nfeatures = 2000)
  return(y)
}
