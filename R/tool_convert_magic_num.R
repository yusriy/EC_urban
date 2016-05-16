convert_magic_num <- function(obj,types){
  for (i in 1:length(obj)){
    temp <- switch(types[i], character = as.character, numeric = as.numeric)
    obj[,i] <- temp(obj[,i])
  }
  obj
}