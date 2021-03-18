#' In Seurat, mitochondrial genes are determined by the MT designation. This does not return all mitochondrial genes. We add other functions as a starting point for finding additional mitochondrial genes, but may return genes that aren't mitochondrial.
#' @export


# Get ensg that are mitochondrial
get_mitochondrial_genes=function(){
  reference_species="EnsDb.Hsapiens."
  reference_number="AH75011"
  query(AnnotationHub(), reference_species)
  edb=AnnotationHub()[[reference]]
  mito=genes(edb, filter = ~ seq_name == "^MT-")
  return(mito)
}
