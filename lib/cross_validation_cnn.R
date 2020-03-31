cnn_cv <- function(dat_train_improved,dat_train){
  outcome=train_cnn(dat_train_improved,dat_train)[2]
  return(outcome)
}