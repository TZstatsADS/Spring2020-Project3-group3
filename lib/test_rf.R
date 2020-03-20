test_rf <- function(model, test_df){
  
  ### Input: 
  ###  - the fitted classification model using training data
  ### (since knn does not need to train, we only specify k here)
  ###  - processed features from testing images 
  ### Output: training model specification
  
  pred <- predict(model,test_df)
  return(pred)
}