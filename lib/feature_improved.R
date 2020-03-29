#############################################################
### Improve features and responses for training images  ###
#############################################################

feature_improved <- function(data){
  
  # Using the inbuilt function
  PCA_data <- prcomp(data, scale. = T)
  
  # Feature select
  pca <- PCA_data$sdev^2/sum(PCA_data$sdev^2)
  
  k <- 0
  for(i in 1:length(pca)){
    k <- k + pca[i]
    if (k>=0.99){
      break
    }
  }
  
  #Result
  data_selected <- PCA_data$x[,1:i]
  return(data_selected)
}
