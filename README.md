
# ezTools

<!-- badges: start -->
[![Lifecycle:
experimental](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Travis build
status](https://travis-ci.org/vincenzocoia/distplyr.svg?branch=master)](https://travis-ci.org/vincenzocoia/distplyr)
[![CRAN
status](https://www.r-pkg.org/badges/version/distplyr)](https://CRAN.R-project.org/package=distplyr)
<!-- badges: end -->

The purpose of ezTools is to address missing values in data sets and to perform basic statistical analyses such as those that were required for my Master's Thesis project at the University of British Columbia. The functions are simple and easy to use for data frames, appropriately wrapped in a package called ezTools. 

Use ```ezTools``` to:

- Modify missing numeric values in datasets in preparation for run what-if analyses, or to introduce randomness
- Perform basic statistical analyses using parametric and non-parametric methods

__NOTE__: This package is very young. There are more functionalities coming soon.

## Basics of ezTools

```
library(ezTools)
```
imagine you are creating a data frame with both numeric and character variables, but some numeric inputs have missing values.
```
Example:
 df <-tibble(
  first = c("a", NA, "b", "c","d"),
  second = c(NA, 2, NA, 3, 4),
  third = c(10, NA, NA, 5, 6)
 )
```
To deal with this when modelling, one can simply remove or ignore them (e.g ```na.rm = TRUE```), in which case the NA values are forgotten. Now, what if you wanted to see the impact of changing them all to the mean and fit a model to this new distribution? ```NA2x()``` provides an easy and effective way to deal with missing numeric values.

```
NA2x(df)

# A tibble: 5 x 3
 first     second third
 <chr>      <dbl> <dbl>
 1 a          3    10
 2 NA         2     7
 3 b          3     7
 4 c          3     5
 5 d          4     6
```
The main function of NA2x is to convert missing values to the mean, but other statistics can be specified like replacing NAs with the median such as for non-parametric analyses.

```
NA2x(df, fun = median)
# A tibble: 5 x 3
 first     second third
 <chr>      <dbl> <dbl>
 1 a          3    10
 2 NA         2     6
 3 b          3     6
 4 c          3     5
 5 d          4     6
```

## Installation

You can install the released version of ezTools from [CRAN](https://CRAN.R-project.org) with:

``` r
devtools::install_github("liamg15/ezTools")
```
## Notes
_ezTools should not be used to optimize the distribution to fit data. It's simply a tool to answer what-if style questions. 

## Assignment 2B Exercise Explanations

### Exercise 1.1

All objects are ```@export```ed in this package. The justification for this is to make all functions available to the public once the repository is published.

All functions:
@export(NA2x)
- This function requires glue and tidyverse to work, so these packages are required. Glue is a small package so it's imported with ezTools. ezTools is dependent on tidyverse but since this package is large and updated frequently, it's added as a dependent package.
- By adding these packages into the description components of _this package_ I can create new functions which depend on the same functionalities that can be easily added without modifying the code with ```::```. This will reduce the chances of making minor mistakes (e.g repetitively using tidyverse:: to use functions from other packages).
- A simple vignette was made to help the users perform the function properly.

_Bonus_
A generic code of conduct was added to the repository.
The package website can be found at

## Exercise 1.2
