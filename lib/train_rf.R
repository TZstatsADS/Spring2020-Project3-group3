
train_rf <- function(train_df, para){
  
  ### Input:
  ### - a data frame containing features and labels
  ### - a parameter list
  ### Output: trained model
  
  model = randomForest(emotion_idx~.,data = train_df,ntree = para,importance = TRUE)
  
  
  return(model)
}