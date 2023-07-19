## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>",
  fig.height = 7,
  fig.width = 7,
  warning = FALSE,
  fig.align = "center"
)

## ----setup, message = FALSE, warning = FALSE----------------------------------
library(dplyr)
library(ggplot2)
library(e1071)
library(theft)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  theft::simData

## ---- message = FALSE, warning = FALSE----------------------------------------
head(simData)

## ---- eval = FALSE------------------------------------------------------------
#  install_python_pkgs("C:/Users/User/Desktop/theft", "/usr/bin/python")

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

## ---- message = FALSE, warning = FALSE----------------------------------------
head(feature_list)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot(feature_matrix, type = "quality")

## ---- message = FALSE, warning = FALSE----------------------------------------
normed <- normalise(feature_matrix, method = "z-score")

## ---- message = FALSE, warning = FALSE----------------------------------------
plot(feature_matrix, type = "matrix")

## ---- message = FALSE, warning = FALSE----------------------------------------
low_dim <- reduce_dims(feature_matrix, 
                       method = "RobustSigmoid", 
                       low_dim_method = "PCA", 
                       seed = 123)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot(low_dim)

## ---- message = FALSE, warning = FALSE----------------------------------------
low_dim2 <- reduce_dims(feature_matrix, 
                        method = "RobustSigmoid", 
                        low_dim_method = "t-SNE", 
                        perplexity = 10,
                        seed = 123)

plot(low_dim2, show_covariance = FALSE)

## ---- eval = FALSE------------------------------------------------------------
#  low_dim3 <- reduce_dims(feature_matrix,
#                          method = "RobustSigmoid",
#                          low_dim_method = "t-SNE",
#                          perplexity = 10,
#                          seed = 123,
#                          max_iter = 5000,
#                          theta = 0.2)

## ---- message = FALSE, warning = FALSE----------------------------------------
plot(feature_matrix, type = "cor")

## ---- eval = FALSE------------------------------------------------------------
#  feature_matrix_filt <- filter_duplicates(feature_matrix, preference = "feasts")

## ---- message = FALSE, warning = FALSE----------------------------------------
feature_classifiers <- tsfeature_classifier(feature_matrix, by_set = FALSE, n_resamples = 5, use_null = TRUE)

## ---- message = FALSE, warning = FALSE----------------------------------------
myclassifier <- function(formula, data){
  mod <- e1071::svm(formula, data = data, kernel = "radial", scale = FALSE, probability = TRUE)
}

feature_classifiers_radial <- tsfeature_classifier(feature_matrix, classifier = myclassifier, by_set = FALSE, n_resamples = 5, use_null = TRUE)

## ---- message = FALSE, warning = FALSE----------------------------------------
feature_vs_null <- compare_features(feature_classifiers, by_set = FALSE, hypothesis = "null")
head(feature_vs_null)

## ---- message = FALSE, warning = FALSE----------------------------------------
pairwise_features <- compare_features(feature_classifiers, by_set = FALSE, hypothesis = "pairwise")
head(pairwise_features)

## ---- message = FALSE, warning = FALSE----------------------------------------
top_10 <- feature_vs_null %>% 
  dplyr::slice_min(p_value_adj, n = 10) %>% 
  dplyr::select(c(method, original_names, p_value_adj))

feature_matrix_filt <- feature_matrix[[1]] %>% 
  dplyr::filter(method %in% top_10$method & names %in% top_10$original_names)

feature_matrix_filt <- structure(list(feature_matrix_filt), class = "feature_calculations")
plot(feature_matrix_filt, type = "cor")

## ---- message = FALSE, warning = FALSE----------------------------------------
feature_matrix_filt[[1]] %>%
  ggplot2::ggplot(ggplot2::aes(x = group, y = values, colour = group)) +
  ggplot2::geom_violin() +
  ggplot2::geom_point(size = 1, alpha = 0.9, position = ggplot2::position_jitter(w = 0.05)) +
  ggplot2::labs(x = "Class",
                y = "Value") +
  ggplot2::scale_colour_brewer(palette = "Dark2") +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none",
                 panel.grid.minor = ggplot2::element_blank(),
                 strip.background = ggplot2::element_blank(),
                 axis.text.x = ggplot2::element_text(angle = 90)) +
  ggplot2::facet_wrap(~ names, ncol = 2, scales = "free_y")

## ---- message = FALSE, warning = FALSE----------------------------------------
set_classifiers <- tsfeature_classifier(feature_matrix, by_set = TRUE, n_resamples = 5, use_null = TRUE)
head(set_classifiers)

## ---- message = FALSE, warning = FALSE----------------------------------------
set_classifiers$ClassificationResults %>%
  dplyr::filter(model_type == "Main") %>% 
  dplyr::group_by(method) %>%
  dplyr::summarise(mu = mean(accuracy),
                   lower = mu - (1 * sd(accuracy)),
                   upper = mu + (1 * sd(accuracy))) %>%
  dplyr::ungroup() %>%
  ggplot2::ggplot(ggplot2::aes(x = reorder(method, -mu), y = mu, colour = method)) +
  ggplot2::geom_errorbar(ggplot2::aes(ymin = lower, ymax = upper)) +
  ggplot2::geom_point(size = 5) +
  ggplot2::labs(x = "Feature set",
                y = "Classification accuracy") +
  ggplot2::scale_colour_brewer(palette = "Dark2") +
  ggplot2::theme_bw() +
  ggplot2::theme(legend.position = "none",
                 panel.grid.minor = ggplot2::element_blank())

