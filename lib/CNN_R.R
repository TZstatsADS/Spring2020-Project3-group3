library(devtools)
library(keras)
library(tensorflow)
tensorflow::install_tensorflow()
tensorflow::tf_config()
install_tensorflow(gpu=TRUE)
keras::install_keras(tensorflow="gpu")
train_cnn <- function(dat_train_improved,dat_train){
  
  ### Input:
  ### - a data frame containing features and labels
  ### Output: trained model
  model_cnn <- keras_model_sequential() 
  model_cnn %>% 
    #first layer is Convolution Layer
    layer_conv_1d(filters = 100, kernel_size = 3, activation = "relu",input_shape = c(208,1)) %>%
    #Second layer is Pooling Layer
    layer_max_pooling_1d(pool_size = 3) %>%
    #Third layer is Convolution Layer
    layer_conv_1d(filters = 100, kernel_size = 3, activation = "relu") %>% 
    layer_dropout(rate = 0.2) %>% 
    #Fourth layer is Flatten Layer
    layer_flatten() %>% 
    layer_dropout(rate = 0.2) %>%
    #Fifth layer is Dense Layer
    layer_dense(units = 100, activation = 'relu') %>% 
    layer_dropout(rate = 0.2) %>%
    #Sixth layer is Dense Layer
    layer_dense(units = 22, activation = 'softmax')
  
  
  model_cnn %>% compile(
    loss="sparse_categorical_crossentropy",
    optimizer = optimizer_adam(lr = 0.001),
    metrics = c('accuracy')
  )
  x_train=array(dat_train_improved,dim=c(2000,208,1))
  y_train=array(as.numeric(dat_train$emotion_idx))-1
  
  outcome <- model_cnn %>% fit(
    x_train, y_train, 
    epochs = 30, batch_size = 100, 
    validation_split = 0.2,
    verbose = 2
  )
  return(list(model_cnn,outcome))
}

test_cnn <- function(model_cnn, dat_test_improved){
  ### Input: 
  ###  - the fitted classification model using training data
  ###  - processed features from testing images 
  ### Output: training model specification
  x_test=array(dat_test_improved,dim=c(500,208,1))
  pred <- predict_classes(model_cnn, x_test)+1
  return(pred)
}


cnn_cv <- function(dat_train_improved,dat_train){
  outcome=train_cnn(dat_train_improved,dat_train)[2]
  return(outcome)
}


model<-train_cnn(dat_train_improved,dat_train)[1]
test_cnn(model[[1]], dat_test_improved)
cnn_cv(dat_train_improved,dat_train)