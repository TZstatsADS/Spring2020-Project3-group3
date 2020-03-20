cv.function <- function(dat_train, K, para){
  ### Input:
  ### - train data frame
  ### - K: a number stands for K-fold CV
  ### - tuning parameters 
  
  n <- dim(dat_train)[1]
  n.fold <- round(n/K, 0)
  set.seed(0)
  s <- sample(rep(1:K, c(rep(n.fold, K-1), n-(K-1)*n.fold)))  
  cv.error <- rep(NA, K)
  
  for (i in 1:K){
    train.data <- dat_train[s != i,]
    test.data <- dat_train[s == i,]
    
    rf_pred <- predict(train_rf(train.data,para),test.data[,-which(names(test.data) == 'emotion_idx')])
    
    
    error <- mean(rf_pred != test.data$emotion_idx) 
    print(error)
    cv.error[i] <- error
    
  }			
  return(c(mean(cv.error),sd(cv.error)))
}