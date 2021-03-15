#' Intakes a path for an SRR_Acc_List.txt file from SRA and downloads the files into a destination directory
# Don't export as doesn't work, as sra has non uniform download links

sra_download = function(SRR_Acc_List, destination_directory){
  top_url="https://trace.ncbi.nlm.nih.gov/Traces/sra?run="
  # Read and create SRR list from SRR_Acc_List.txt
  accessions=as.vector(read.table(SRR_Acc_List))[[1]]
  for (i in 1:length(accessions)){
    SRR_url=paste0(top_url, accessions[i])
    download.file(url=SRR_url, destfile = paste(destination_directory, accessions[i], sep="/"))
  }
}
