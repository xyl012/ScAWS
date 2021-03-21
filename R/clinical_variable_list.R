#' Creates a clinical variable list that holds clinical data  (in [[1]]) and the name of the variable (in [[2]]) as a string
#' @export

clinical_variable_list=function(clinical_variable){
  clinical_variable_objet=list()
  clinical_variable_object[[1]]=clinical_variable #Data of the clinical variable
  clinical_variable_object[[2]]=variable_name_as_string(clinical_variable) #Name of the clinical variable as a string for graphing
  return(clinical_variable_object)
}
