svm_train <- function(feature_df = pairwise_data, cost=1, probability=FALSE){
  ### Train an SVM model using processed features from training images
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  library("e1071")
  
  svm_model <- svm(emotion_idx~., data = feature_df,
                   kernel = "linear", cost = cost, probability=probability) 
  
  return(model = svm_model)
}