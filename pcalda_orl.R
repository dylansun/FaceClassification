load("data.RData")
library(MASS)

## using all data to find the principal components, with scale 
pr.out = prcomp(data, scale = T)

## select firt 10 and project the data to subspace
npr = 10
data.new <- t(data) %*% pr.out$x[,1:npr]

## bind data 
df <- data.frame(data.new, as.factor(label))
names(df)[11] <- "label"

## repeat n times 
n <- 20
acc <- rep(0, n)
for(i in 1:n){
  ## divide data into train/test groups 
  train <- sample(1:nrow(df), replace = F, size = floor(.8 * nrow(df)))
  data.train <- df[train,]
  data.test <- df[-train,]
  
  ## fit lda model and predict
  lda.fit <- lda(label ~ . , data = data.train)
  lda.pred = predict(lda.fit , newdata = data.test[,-11])
  
  ## calculate acc 
  acc[i] <- sum(data.test[,11] == lda.pred$class) / length(data.test[,11])
}

mean(acc)
