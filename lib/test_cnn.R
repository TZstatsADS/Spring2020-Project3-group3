test_cnn <- function(model_cnn, dat_test_improved){
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification
  x_test=array(dat_test_improved,dim=c(500,208,1))
  pred <- predict_classes(model_cnn, x_test)+1
  return(pred)
}

#model<-train_cnn(dat_train_improved,dat_train)[1]
#test_cnn(model[[1]], dat_test_improved)