#' Returns the variable name as a string
#' @export

variable_name_as_string=function(variable) {
  string=deparse(substitute(variable))
  return(string)
}
