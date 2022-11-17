## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 8,
  fig.width = 8,
  warning = FALSE,
  fig.align = "center"
)

## ----setup, message = FALSE, warning = FALSE----------------------------------
library(theft)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  theft::simData

## ---- message = FALSE, warning = FALSE----------------------------------------
head(simData)

## ---- message = FALSE, warning = FALSE----------------------------------------
feature_matrix <- calculate_features(data = simData, 
                                     id_var = "id", 
                                     time_var = "timepoint", 
                                     values_var = "values", 
                                     group_var = "process", 
                                     feature_set = "catch22",
                                     seed = 123)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  feature_matrix <- calculate_features(data = simData,
#                                       id_var = "id",
#                                       time_var = "timepoint",
#                                       values_var = "values",
#                                       group_var = "process",
#                                       feature_set = "catch22",
#                                       catch24 = TRUE,
#                                       seed = 123)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  init_theft(path_to_python)

## ---- message = FALSE, warning = FALSE----------------------------------------
head(feature_list)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot_quality_matrix(feature_matrix)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  plot_quality_matrix(feature_matrix, ignore_good_features = TRUE)

## ---- message = FALSE, warning = FALSE----------------------------------------
normed <- normalise_feature_frame(feature_matrix, 
                                  names_var = "names", 
                                  values_var = "values", 
                                  method = "RobustSigmoid")

## ---- message = FALSE, warning = FALSE----------------------------------------
plot_all_features(feature_matrix, 
                  is_normalised = FALSE,
                  id_var = "id", 
                  method = "RobustSigmoid",
                  clust_method = "average",
                  interactive = FALSE)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  plot_feature_matrix(feature_matrix,
#                      is_normalised = FALSE,
#                      id_var = "id",
#                      method = "RobustSigmoid",
#                      clust_method = "average",
#                      interactive = TRUE)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot_low_dimension(feature_matrix, 
                   is_normalised = FALSE, 
                   id_var = "id", 
                   group_var = "group", 
                   method = "RobustSigmoid", 
                   low_dim_method = "PCA", 
                   plot = TRUE,
                   show_covariance = TRUE,
                   seed = 123)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot_low_dimension(feature_matrix, 
                   is_normalised = FALSE, 
                   id_var = "id", 
                   group_var = "group", 
                   method = "RobustSigmoid", 
                   low_dim_method = "t-SNE", 
                   perplexity = 10, 
                   plot = TRUE,
                   show_covariance = FALSE,
                   seed = 123)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot_ts_correlations(simData, 
                     id_var = "id", 
                     time_var = "timepoint",
                     values_var = "values",
                     cor_method = "pearson",
                     clust_method = "average",
                     interactive = FALSE)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  plot_ts_correlations(simData,
#                       id_var = "id",
#                       time_var = "timepoint",
#                       values_var = "values",
#                       cor_method = "spearman",
#                       clust_method = "average",
#                       interactive = TRUE)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot_feature_correlations(feature_matrix, 
                          id_var = "id", 
                          names_var = "names",
                          values_var = "values",
                          cor_method = "pearson",
                          clust_method = "average",
                          interactive = FALSE)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  outputs <- compute_top_features(feature_matrix,
#                                  id_var = "id",
#                                  group_var = "group",
#                                  num_features = 10,
#                                  normalise_violin_plots = FALSE,
#                                  method = "RobustSigmoid",
#                                  cor_method = "pearson",
#                                  test_method = "gaussprRadial",
#                                  clust_method = "average",
#                                  use_balanced_accuracy = FALSE,
#                                  use_k_fold = TRUE,
#                                  num_folds = 10,
#                                  use_empirical_null =  TRUE,
#                                  null_testing_method = "ModelFreeShuffles",
#                                  p_value_method = "gaussian",
#                                  num_permutations = 10,
#                                  pool_empirical_null = FALSE,
#                                  seed = 123)

## ---- message = FALSE, warning = FALSE, echo = FALSE--------------------------
head(theft::demo_outputs$ResultsTable)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  head(outputs$ResultsTable)

## ---- message = FALSE, warning = FALSE, echo = FALSE--------------------------
print(theft::demo_outputs$FeatureFeatureCorrelationPlot)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  print(outputs$FeatureFeatureCorrelationPlot)

## ---- message = FALSE, warning = FALSE, echo = FALSE--------------------------
print(theft::demo_outputs$ViolinPlots)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  print(outputs$ViolinPlots)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  multi_outputs <- fit_multi_feature_classifier(feature_matrix,
#                                                id_var = "id",
#                                                group_var = "group",
#                                                by_set = TRUE,
#                                                test_method = "svmLinear",
#                                                use_balanced_accuracy = TRUE,
#                                                use_k_fold = TRUE,
#                                                num_folds = 10,
#                                                use_empirical_null =  TRUE,
#                                                null_testing_method = "ModelFreeShuffles",
#                                                p_value_method = "gaussian",
#                                                num_permutations = 10,
#                                                seed = 123)

## ---- message = FALSE, warning = FALSE, echo = FALSE--------------------------
print(theft::demo_multi_outputs$FeatureSetResultsPlot)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  print(multi_outputs$FeatureSetResultsPlot)

## ---- message = FALSE, warning = FALSE, echo = FALSE--------------------------
head(theft::demo_multi_outputs$TestStatistics)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  head(multi_outputs$TestStatistics)

## ---- message = FALSE, warning = FALSE, echo = FALSE--------------------------
head(theft::demo_multi_outputs$RawClassificationResults)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  head(multi_outputs$RawClassificationResults)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  d2 <- process_hctsa_file("https://cloudstor.aarnet.edu.au/plus/s/6sRD6IPMJyZLNlN/download")

