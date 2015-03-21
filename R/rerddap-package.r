#' General purpose R client for ERDDAP servers
#'
#' ERDDAP Information
#'
#' NOAA's ERDDAP service holds many datasets of interest. It's built on top of
#' OPenDAP \url{http://www.opendap.org/}. You can search for datasets via
#' \code{\link{ed_search}}, list datasets via \code{\link{ed_datasets}},
#' get information on a single dataset via \code{\link{info}}, then get
#' data you want for either tabledap type via \code{\link{tabledap}}, or
#' for griddap type via \code{\link{griddap}}.
#'
#' tabledap and griddap have different interfaces to query for data, so
#' \code{\link{tabledap}} and \code{\link{griddap}} are separated out as
#' separate functions even though some of the internals are the same. In particular,
#' with tabledap you can query on/subset all variables, whereas with gridddap, you can
#' only query on/subset the dimension varibles (e.g., latitude, longitude, altitude).
#'
#' \bold{NOTE:} With griddap data vai \code{\link{griddap}} you can get a lot of
#' data quickly. Try small searches of a dataset to start to get a sense for the data,
#' then you can increase the amount of data you get. See \code{\link{griddap}}
#' for more details.
#'
#' @name rerddap-package
#' @aliases rerddap
#' @docType package
#' @title General purpose R client for ERDDAP servers
#' @author Scott Chamberlain \email{myrmecocystus@@gmail.com}
#' @keywords package
NULL

#' institutions
#'
#' @docType data
#' @keywords datasets
#' @format A character vector
#' @name institutions
NULL

#' ioos_categories
#'
#' @docType data
#' @keywords datasets
#' @format A character vector
#' @name ioos_categories
NULL

#' keywords
#'
#' @docType data
#' @keywords datasets
#' @format A character vector
#' @name keywords
NULL

#' longnames
#'
#' @docType data
#' @keywords datasets
#' @format A character vector
#' @name longnames
NULL

#' standardnames
#'
#' @docType data
#' @keywords datasets
#' @format A character vector
#' @name standardnames
NULL

#' variablenames
#'
#' @docType data
#' @keywords datasets
#' @format A character vector
#' @name variablenames
NULL
