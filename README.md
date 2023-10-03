
# theft <img src="man/figures/logo.png" align="right" width="120" />

[![CRAN
version](https://www.r-pkg.org/badges/version/theft)](https://www.r-pkg.org/pkg/theft)
[![CRAN RStudio mirror
downloads](https://cranlogs.r-pkg.org/badges/theft)](https://www.r-pkg.org/pkg/theft)
[![DOI](https://zenodo.org/badge/351259952.svg)](https://zenodo.org/badge/latestdoi/351259952)

Tools for Handling Extraction of Features from Time series (theft)

## Installation

You can install the stable version of `theft` from CRAN:

``` r
install.packages("theft")
```

You can install the development version of `theft` from GitHub using the
following:

``` r
devtools::install_github("hendersontrent/theft")
```

Please also check out our paper [Feature-Based Time-Series Analysis in R
using the theft Package](https://arxiv.org/abs/2208.06146) which
discusses the motivation and theoretical underpinnings of `theft` and
walks through all of its functionality using the [Bonn EEG
dataset](https://journals.aps.org/pre/abstract/10.1103/PhysRevE.64.061907)
— a well-studied neuroscience dataset.

## General purpose

`theft` is a software package for R that facilitates user-friendly
access to a structured analytical workflow for the extraction, analysis,
and visualisation of time-series features. The package provides a single
point of access to $>1200$ time-series features from a range of existing
R and Python packages. The packages which `theft` ‘steals’ features from
currently are:

- [catch22](https://link.springer.com/article/10.1007/s10618-019-00647-x)
  (R; [see `Rcatch22` for the native implementation on
  CRAN](https://github.com/hendersontrent/Rcatch22))
- [feasts](https://feasts.tidyverts.org) (R)
- [tsfeatures](https://github.com/robjhyndman/tsfeatures) (R)
- [Kats](https://facebookresearch.github.io/Kats/) (Python)
- [tsfresh](https://tsfresh.com) (Python)
- [TSFEL](https://tsfel.readthedocs.io/en/latest/) (Python)

Note that `Kats`, `tsfresh` and `TSFEL` are Python packages. `theft` has
built-in functionality for helping you install these libraries—all you
need to do is install Python 3.9 on your machine. If you wish to access
the Python feature sets, please run `?install_python_pkgs` in R after
downloading `theft` or consult the vignette in the package for more
information. For a comprehensive comparison of these six feature sets
across a range of domains (including computation speed, within-set
feature composition, and between-set feature correlations), please refer
to the paper [An Empirical Evaluation of Time-Series Feature
Sets](https://ieeexplore.ieee.org/document/9679937).

The core workflow for feature-based time-series analysis (and
corresponding functions) in `theft` is presented below:

<img src="vignettes/workflow-graphic_v05.png" width="700" alt="Structured workflow of the theft package for R" />

As you can see from the graphic above, `theft` contains a convenient and
extensive suite of tools for semi-automated processing of extracted
features (including data quality assessments and normalisation methods),
low dimensional projections (linear and nonlinear), data matrix and
feature distribution visualisations, time-series classification
procedures, statistical hypothesis testing, and various other
statistical and graphical tools.

## Citation

If you use `theft` in your own work, please cite both the paper:

T. Henderson and Ben D. Fulcher. [Feature-Based Time-Series Analysis in
R using the theft Package](https://arxiv.org/abs/2208.06146). arXiv,
(2022).

and the software:


    To cite package 'theft' in publications use:

      Henderson T (2023). _theft: Tools for Handling Extraction of Features
      from Time Series_. R package version 0.5.4,
      <https://hendersontrent.github.io/theft/>.

    A BibTeX entry for LaTeX users is

      @Manual{,
        title = {theft: Tools for Handling Extraction of Features from Time Series},
        author = {Trent Henderson},
        year = {2023},
        note = {R package version 0.5.4},
        url = {https://hendersontrent.github.io/theft/},
      }
