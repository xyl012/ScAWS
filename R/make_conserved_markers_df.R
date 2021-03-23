#' Find all conserved markers for each cluster and make a data frame
#' @export
make_conserved_markers_df=function(seurat_object){
# nlength=length(unique(seurat_object$seurat_clusters))
# conserved_markers=function(seurat_object, group_var){
#   for (i in 1:nlength){
#     DefaultAssay(seurat_object)="RNA"
#     print(i)
#     markers=FindConservedMarkers(seurat_object, ident.1 = (i-1), grouping.var = group_var, verbose = FALSE)
#     list_conserved_markers[[i]]=markers
#   }
#   return(list_conserved_markers)
# }
#
# list_conserved_markers=list()
# treat_cons_mark=conserved_markers(seurat_object, item)
# names(treat_cons_mark)=0:(nlength-1)
# treat_cons_mark_df=data.frame()
#
# for (i in 1:length(treat_cons_mark)){
#   temp=treat_cons_mark[[i]]
#   temp$seurat_clusters=i
#   treat_cons_mark_df=rbind(treat_cons_mark_df, temp)
# }
# dim(treat_cons_mark_df)
# treat_cons_mark_df=do.call(rbind, treat_cons_mark)
# return(treat_cons_mark_df)
}
