library("R.matlab")
data <-readMat("data.mat")
data <- data$train
dims <- dim(data)
label <- rep(seq(1,40), each = 10)
save(data, label, file = "data.RData")
rm(list = ls())

