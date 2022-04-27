
# theft <img src="man/figures/logo.png" align="right" width="120" />

[![DOI](https://zenodo.org/badge/351259952.svg)](https://zenodo.org/badge/latestdoi/351259952)

Tools for Handling Extraction of Features from Time series (theft)

## Installation

*Coming to CRAN soon… Stay posted!*

You can install the development version of `theft` from GitHub using the
following:

``` r
devtools::install_github("hendersontrent/theft")
```

## General purpose

`theft` is a software package for R that facilitates user-friendly
access to a structured analytical workflow for the extraction, analysis,
and visualisation of time-series features. The package provides a single
point of access to a large number of time-series features from a range
of existing R and Python packages and lets the user specify which groups
(or all) of the these features to calculate. The packages which `theft`
currently ‘steals’ features from include:

-   [catch22](https://link.springer.com/article/10.1007/s10618-019-00647-x)
    (R; [see `Rcatch22` for the native implementation on
    CRAN](https://github.com/hendersontrent/Rcatch22))
-   [feasts](https://feasts.tidyverts.org) (R)
-   [tsfeatures](https://github.com/robjhyndman/tsfeatures) (R)
-   [kats](https://facebookresearch.github.io/Kats/) (Python)
-   [tsfresh](https://tsfresh.com) (Python)
-   [tsfel](https://tsfel.readthedocs.io/en/latest/) (Python)

Note that `kats`, `tsfresh` and `tsfel` are Python packages. The R
package `reticulate` is used to call Python code that uses these
packages and applies it within the broader *tidy* data philosophy
embodied by `theft`. At present, depending on the input time series,
`theft` provides access to &gt;1300 features. Prior to using `theft`
(only if you want to use the `kats`, `tsfresh` or `tsfel` feature sets;
the R-based sets will run fine) you should have a working Python
installation and download `kats` using the instructions located
[here](https://facebookresearch.github.io/Kats/), `tsfresh`
[here](https://tsfresh.com) and/or `tsfel`
[here](https://github.com/fraunhoferportugal/tsfel).

For a comprehensive comparison of these six feature sets, please refer
to the recent paper [An Empirical Evaluation of Time-Series Feature
Sets](https://ieeexplore.ieee.org/document/9679937).

## Statistical and graphical tools

`theft` also contains an extensive suite of tools for automatic
processing of extracted feature vectors (including data quality
assessments and normalisation methods), low dimensional projections
(linear and nonlinear), data matrix visualisations, single feature and
multiple feature time-series classification procedures, and various
other statistical and graphical tools.

## Web application

An [interactive web
application](https://dynamicsandneuralsystems.shinyapps.io/timeseriesfeaturevis/)
has been built on top of `theft` which enables users to access most of
the functionality included in the package from within a web browser
without any code. The application automates the entire workflow included
in `theft`, converts all static graphics included in the package into
interactive visualisations, and enables downloads of feature
calculations. Note that since `theft` is an active development project,
not all functionality has been copied across to the webtool yet.

## Citation


    To cite package 'theft' in publications use:

      Trent Henderson (2022). theft: Tools for Handling Extraction of
      Features from Time Series. R package version 0.3.9.5.
      https://hendersontrent.github.io/theft/

    A BibTeX entry for LaTeX users is

      @Manual{,
        title = {theft: Tools for Handling Extraction of Features from Time Series},
        author = {Trent Henderson},
        year = {2022},
        note = {R package version 0.3.9.5},
        url = {https://hendersontrent.github.io/theft/},
      }
