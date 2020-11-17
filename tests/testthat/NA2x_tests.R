test_that("Testing inputs and outputs of NA2x", {
  x <- data.frame(
  "a" = c(1.1,2.4,3.6,4.3,5.2, NA),
  "b" = letters[1:6]
)
y <- letters[1:5]
  expect_equal(x, NA2x(x), throws_error()) # Expect that this throws an error since x has NAs and NA2x(x) does not.
  expect_that(NA2x(y), throws_error()) # This throws an error so the test is considered passed.
  expect_that(NA2x(x, verbose = TRUE), shows_message("Processing successful")) # This should work because verbose argument throws a message "Processing successful"
})
