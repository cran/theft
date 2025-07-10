## ----include = FALSE----------------------------------------------------------
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

## ----message = FALSE, warning = FALSE, eval = FALSE---------------------------
# theft::simData

## ----message = FALSE, warning = FALSE-----------------------------------------
head(simData)

## ----eval = FALSE-------------------------------------------------------------
# install_python_pkgs(venv = "theft-package", python = "/usr/local/bin/python3.10")

## ----eval = FALSE-------------------------------------------------------------
# init_theft("theft-package")

## ----message = FALSE, warning = FALSE-----------------------------------------
feature_matrix <- calculate_features(data = simData, feature_set = "catch22")
head(feature_matrix)

## ----message = FALSE, warning = FALSE-----------------------------------------
feature_matrix2 <- calculate_features(data = simData, 
                                      feature_set = NULL,
                                      features = list("mean" = mean, "sd" = sd))

head(feature_matrix2)

