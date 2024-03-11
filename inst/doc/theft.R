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
library(theft)

## ---- message = FALSE, warning = FALSE, eval = FALSE--------------------------
#  theft::simData

## ---- message = FALSE, warning = FALSE----------------------------------------
head(simData)

## ---- eval = FALSE------------------------------------------------------------
#  install_python_pkgs("theft-package")

## ---- eval = FALSE------------------------------------------------------------
#  init_theft("theft-package")

## ---- message = FALSE, warning = FALSE----------------------------------------
feature_matrix <- calculate_features(data = simData, 
                                     id_var = "id", 
                                     time_var = "timepoint", 
                                     values_var = "values", 
                                     group_var = "process", 
                                     feature_set = "catch22",
                                     seed = 123)

head(feature_matrix)

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
feature_matrix2 <- calculate_features(data = simData, 
                                      group_var = "process",
                                      feature_set = NULL,
                                      features = list("mean" = mean, "sd" = sd))

head(feature_matrix2)

