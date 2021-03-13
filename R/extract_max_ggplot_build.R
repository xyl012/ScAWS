#' Extract the max value of the y axis of a ggplot
#' @export

extract_max_ggplot_build<- function(p){
  ymax<- max(ggplot2::ggplot_build(p)$layout$panel_scales_y[[1]]$range$range)
  return(ceiling(ymax))
}
