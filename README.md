
# targets <img src='man/figures/logo.png' align="right" height="139"/>

[![ropensci](https://badges.ropensci.org/401_status.svg)](https://github.com/ropensci/software-review/issues/401)
[![zenodo](https://zenodo.org/badge/200093430.svg)](https://zenodo.org/badge/latestdoi/200093430)
[![cran](http://www.r-pkg.org/badges/version/targets)](https://cran.r-project.org/package=targets)
[![status](https://www.repostatus.org/badges/latest/active.svg)](https://www.repostatus.org/#active)
[![check](https://github.com/wlandau/targets/workflows/check/badge.svg)](https://github.com/wlandau/targets/actions?query=workflow%3Acheck)
[![codecov](https://codecov.io/gh/wlandau/targets/branch/main/graph/badge.svg?token=3T5DlLwUVl)](https://codecov.io/gh/wlandau/targets)
[![lint](https://github.com/wlandau/targets/workflows/lint/badge.svg)](https://github.com/wlandau/targets/actions?query=workflow%3Alint)

The `targets` package is a
[Make](https://www.gnu.org/software/make/)-like pipeline toolkit for
Statistics and data science in R. With `targets`, you can maintain a
reproducible workflow without repeating yourself. `targets` learns how
your pipeline fits together, skips costly runtime for tasks that are
already up to date, runs only the necessary computation, supports
implicit parallel computing, abstracts files as R objects, and shows
tangible evidence that the results match the underlying code and data.
For deep dives into why and how to use `targets`, please see the [user
manual](https://wlandau.github.io/targets-manual).

## What about `drake`?

The [`drake`](https://github.com/ropensci/drake) package is an older and
more established R-focused pipeline toolkit. It has become a key piece
of the R ecosystem, and development will continue. However, nearly four
years of community feedback have exposed major user-side limitations
regarding data management, collaboration, and parallel efficiency.
Unfortunately, these limitations are permanent. Solutions in
[`drake`](https://github.com/ropensci/drake) itself would make the
package incompatible with existing projects that use it, and the
internal architecture is too copious, elaborate, and mature for such
extreme refactoring. That is why `targets` was created. The `targets`
package borrows from past learnings, user suggestions, discussions,
complaints, success stories, and feature requests, and it improves the
user experience in ways that will never be possible in
[`drake`](https://github.com/ropensci/drake). Please see the [statement
of need](https://wlandau.github.io/targets/articles/need.html) for
details.

## Installation

Install the GitHub development version to access the latest features and
patches.

``` r
library(remotes)
install_github("wlandau/targets", dependencies = TRUE)
```

## Help

  - Post to the [GitHub issue
    tracker](https://github.com/wlandau/targets/issues) to elicit help
    from the maintainer.
  - The [RStudio Community](https://community.rstudio.com/) forum is
    full of friendly enthusiasts of R and the tidyverse. Use the
    [`targets` tag](https://community.rstudio.com/tag/targets).
  - [Stack Overflow](https://stackoverflow.com/) broadcasts to the
    entire open source community. Use the [`targets-r-package`
    tag](https://stackoverflow.com/questions/tagged/targets-r-package).

## Documentation

  - [User manual](https://wlandau.github.io/targets-manual): in-depth
    discussion about how to use `targets`.
  - [Reference website](https://wlandau.github.io/targets/): formal
    documentation of all user-side functions, the statement of need, and
    multiple design documents of the internal architecture.

## Examples

  - [Minimal example](https://github.com/wlandau/targets-minimal).
  - [Machine learning with
    Keras](https://github.com/wlandau/targets-keras).
  - [Validating a Stan model](https://github.com/wlandau/targets-stan).

## Recorded talks

  - [R/Pharma 2020
    (9:24)](https://www.youtube.com/watch?v=GRqKJBaC5g4&list=PLMtxz1fUYA5C0YflXsR8EEAQXfjntlV1H&index=6)
  - [LA R Users October 2020
    (1:14:40)](https://www.youtube.com/watch?v=Qq25BUxpJu4)

## Courses

  - [Official half-day interactive
    tutorial](https://github.com/wlandau/targets-tutorial).

## Helpers

  - [`tarchetypes`](https://wlandau.github.io/tarchetypes): an R package
    to help define specialized targets such as dependency-aware R
    Markdown reports.
  - [`targetsketch`](https://wlandau.shinyapps.io/targetsketch): a Shiny
    app to help sketch pipelines
    ([app](https://wlandau.shinyapps.io/targetsketch),
    [source](https://github.com/wlandau/targetsketch)).

## Participation

Development is a community effort, and we welcome discussion and
contribution. By participating in this project, you agree to abide by
the [code of
conduct](https://github.com/wlandau/targets/blob/main/CODE_OF_CONDUCT.md)
and the [contributing
guide](https://github.com/wlandau/targets/blob/main/CONTRIBUTING.md).

## Citation

``` r
citation("targets")
#> Warning in citation("targets"): no date field in DESCRIPTION file of package
#> 'targets'
#> Warning in citation("targets"): could not determine year for 'targets' from
#> package DESCRIPTION file
#> 
#> To cite package 'targets' in publications use:
#> 
#>   William Michael Landau (NA). targets: Dynamic Function-Oriented
#>   'Make'-Like Declarative Workflows.
#>   https://wlandau.github.io/targets/,
#>   https://github.com/wlandau/targets.
#> 
#> A BibTeX entry for LaTeX users is
#> 
#>   @Manual{,
#>     title = {targets: Dynamic Function-Oriented 'Make'-Like Declarative Workflows},
#>     author = {William Michael Landau},
#>     note = {https://wlandau.github.io/targets/, https://github.com/wlandau/targets},
#>   }
```
