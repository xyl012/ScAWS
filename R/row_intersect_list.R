#' Gets the intersection of rows between all datatables in the list
#' @export

row_intersect_list=function(list){
  common_names = Reduce(intersect, lapply(list, row.names))
  list = lapply(list, function(x) { x[row.names(x) %in% common_names,] })
}
