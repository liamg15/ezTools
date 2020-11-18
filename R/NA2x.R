
#' Replace numeric missing values with mean of the column
#'
#' @param data a dataframe containing numeric variables (e.g double or integer).No default data selected, must be an argument.
#' @param verbose the verbose argument indicates the output was successful, by default verbose = FALSE as this function was designed for small data sets. For larger data sets, verbose = TRUE may be useful to know the function is being applied to  large data frames as the function will take longer. If TRUE, returns Processing successful.
#' @param fun specifies the function to be applied to missing values. By default, fun refers to mean(.x). An alternative function can be specified (fun = f(x)).
#' @param trim a fraction of outlying observations to be ignored when calculating for the replacement of NA. By default the trim is set to 0.
#'
#' @return NA2x replaces each numeric missing value with the default being the mean of that column.
#'
#' @export
#'
#' @importFrom magrittr %>%
#' @import dplyr
#' @import tidyselect
#'
#' @examples
#'
#' # Create a data frame with both numeric and character variables.
#' df <-data.frame(
#'  first = c("a", NA, "b", "c","d"),
#'  second = c(NA, 2, NA, 3, 4),
#'  third = c(10, NA, NA, 5, 6)
#' )
#'
#'
#' # Input data frame with missing values.
#' NA2x(df)

NA2x <- function(data, verbose = FALSE, fun = mean, trim = 0) {
  {
    if(verbose) message("Processing successful")
    data %>%
      mutate(across(where(is.numeric),
                    ~ ifelse(is.na(.x), fun(.x, na.rm = TRUE, trim = trim), .x)
      )
      )
  }
}
