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
