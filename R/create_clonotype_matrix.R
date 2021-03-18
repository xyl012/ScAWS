#' Creates a matrix of clonotypes from 10x cellranger output
#' @export

# Add to the Seurat object's metadata.
#clono_seurat <- AddMetaData(object=seurat_obj, metadata=tcr)

create_clonotype <- function(tcr_dir, tcr_annotations){ #, seurat_obj
  tcr <- read.csv(paste(tcr_dir,tcr_annotations, sep="/"))
  # Remove the -1 at the end of each barcode.
  # Subsets so only the first line of each barcode is kept,
  # as each entry for given barcode will have same clonotype.
  tcr$barcode <- gsub("-1", "", tcr$barcode)
  tcr <- tcr[!duplicated(tcr$barcode), ]

  # Only keep the barcode and clonotype columns.
  # We'll get additional clonotype info from the clonotype table.
  tcr <- tcr[,c("barcode", "raw_clonotype_id")]
  names(tcr)[names(tcr) == "raw_clonotype_id"] <- "clonotype_id"

  # Clonotype information
  clono <- read.csv(paste(tcr_dir,"clonotypes.csv", sep="/"))
  tcr <- merge(tcr, clono)

  # Reorder so barcodes are first column and set them as rownames.
  tcr <- tcr[, c(2,1:ncol(tcr))]
  rownames(tcr) <- tcr[,1]
  tcr[,1] <- NULL
  #get consensus annotations
  tcr_consensus_annotations=paste(tcr_dir,"consensus_annotations.csv",sep="/")
  tcr_consensus_annotations=fread(paste0(tcr_consensus_annotations), sep=",")
  tcr_consensus_annotations=tcr_consensus_annotations[!duplicated(tcr_consensus_annotations$clonotype_id),]#get first consensus by removing duplicates
  tcr=merge(tcr, tcr_consensus_annotations, by="clonotype_id", all.x=T)#merge into tcr
  # Add to the Seurat object's metadata.
  #clono_seurat <- AddMetaData(object=seurat_obj, metadata=tcr)
  return(tcr)
}
