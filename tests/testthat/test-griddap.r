context("griddap")

test_that("griddap returns the correct class", {
  skip_on_cran()

  a <- griddap(
    'erdQMekm14day',
    time = c('2015-12-28','2016-01-01'),
    latitude = c(24, 23),
    longitude = c(88, 90)
  )

  expect_is(a, "griddap_nc")
  expect_is(unclass(a), "list")
  expect_is(a$summary, "list")
  expect_is(a$summary$filename, "character")
  expect_is(a$data, "data.frame")
  expect_is(a$data$time, "character")
})

test_that("griddap fixes incorrect user inputs", {
  skip_on_cran()

  # wrong order of latitude
  a <- griddap('erdQMekm14day',
               time = c('2015-12-28','2016-01-01'),
               latitude = c(23, 24),
               longitude = c(88, 90)
  )
  # wrong order of longitude
  b <- griddap('erdQMekm14day',
               time = c('2015-12-28','2016-01-01'),
               latitude = c(24, 23),
               longitude = c(90, 88)
  )
  # wrong order of time
  c <- griddap('erdQMekm14day',
               time = c('2016-01-01', '2015-12-28'),
               latitude = c(24, 23),
               longitude = c(88, 90)
  )

  expect_is(a, "griddap_nc")
  expect_is(a$data, "data.frame")
  expect_is(b, "griddap_nc")
  expect_is(b$data, "data.frame")
  expect_is(c, "griddap_nc")
  expect_is(c$data, "data.frame")

  # wrong longitude formatting given
  expect_error(griddap('erdMBchlamday_LonPM180',
               time = c('2015-12-28','2016-01-01'),
               latitude = c(18.4, 18.6),
               longitude = c(-65, -197)), "One or both longitude values")

  # wrong latitude formatting given
  expect_error(griddap('erdMBchlamday_LonPM180',
               time = c('2015-12-28','2016-01-01'),
               latitude = c(18.4, 150),
               longitude = c(-65, -63)), "One or both latitude values")
})

test_that("griddap fields parameter works, and fails correctly", {
  skip_on_cran()

  d <- griddap(
    'erdQMekm14day',
    time = c('2015-12-28','2016-01-01'),
    latitude = c(24, 23),
    longitude = c(88, 90),
    fields = "mod_current"
  )

  expect_is(d, "griddap_nc")

  expect_error(griddap('erdMBchlamday_LonPM180',
                       time = c('2015-12-28','2016-01-01'),
                       latitude = c(20, 21),
                       longitude = c(10, 11),
                       fields = "mmmmmm"), "'arg' should be one of")
})

test_that("griddap fails well, in addition to above failure tests", {
  skip_on_cran()

  # named dimargs parameters not allowed when don't match those in dataset
  expect_error(griddap('erdMBchlamday_LonPM180', stuff = 5),
               "Some input dimensions \\(stuff\\)")
  expect_error(griddap('erdMBchlamday_LonPM180', a = "5"),
               "Some input dimensions \\(a\\)")

  # wrong latitude formatting given
  expect_error(griddap('erdMBchlamday_LonPM180',
                       time = c('2012-01-01', '2012-01-30'),
                       latitude = c(21, -120),
                       longitude = c(-80, -78)), "One or both latitude values")
})

# unlink(cache_info()$path, recursive = TRUE)

## FIXME more tests to add
# * fmt parameter
# * stride parameter
# * ncdf parameter
# * url parameter
# * store parameter
# * read parameter
# * callopts parameter
