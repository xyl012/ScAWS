#Computes the coefficient of variation for a group of numbers, input being similar to mean()
coefficient_of_variation <- function(x){
  m=mean(x)
  sd=sd(x)
  return((sd/m)*100)
}
