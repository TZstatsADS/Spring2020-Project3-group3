###########################################################
### Train a classification model with training features ###
###########################################################
train <- function(feature_df = pairwise_data, par = NULL){
  ### Train an GNM model using processed features from training images
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  ### load libraries
  if(!require("gbm")){
    install.packages("gbm")
  }
  library(gbm)
  ### Train with GBM
  if(is.null(par)){
    k = 150
  } else {
    k = par$k
  }
  
  model <- gbm(emotion_idx ~., data = feature_df,
               distribution = "multinomial", n.trees = k) 
  
  gbm_model <- list(model = model, k = k)
  
  return(gbm_model)
}

