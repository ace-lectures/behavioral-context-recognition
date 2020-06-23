

num_features <- 60 # how many features
num_samples <- 300 # how many samples
DATASET <- matrix(runif(num_features * num_samples),
                  nrow = num_samples, ncol = num_features)

# setting some dummy names for the features e.g. f23
colnames(DATASET) <- paste0("f", 1:ncol(DATASET))

# let's make 30% of all features to be correlated with feature "f1"
num_feat_corr <- num_features * .3
idx_correlated_features <- as.integer(seq(from = 1,
                                          to = num_features,
                                          length.out = num_feat_corr))[-1]
for (i in idx_correlated_features) {
  DATASET[,i] <- DATASET[,1] + runif(num_samples) # adding some noise
}

corrplot(cor(DATASET), diag = FALSE, order = "FPC",
         tl.pos = "td", tl.cex = 0.5, method = "color", type = "upper")