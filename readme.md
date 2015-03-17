---
title: "readme.md"
output: html_document
---

### Face image classification using pca and lda

#### dataset
The dataset used in this experiment is from the ORL data[1]. You may obtain this dataset from the [http://www.cl.cam.ac.uk/research/dtg/attarchive/facedatabase.html](this link). 

#### Preprocessing
We use matlab to reading the data and store them in a matfile. Then we use `readMat()` function from the R.matlab package to read them into R. In `preprocess_matlab_data.R`, we change the mat file to RData format which is more easy to use for R users. So if you use the data.RData file, you do not need to install the R.matlab package.

#### Process 
We use all the data to find the principal component, and pick the first 10. Then we split the data into train/test subsets,and  perform LDA on the subspace spanned by the principal components. On average, it's average precision is about `0.903`.

#### Reference
[1]F. Samaria and A. Harter "Parameterisation of a stochastic model for human face identification",2nd IEEE Workshop on Applications of Computer Vision,December 1994, Sarasota (Florida).