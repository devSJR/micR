#' Image processing with micR
#' 
#' The package processes image data. micR combines several commonly required
#' functionality to import different images types, as supported by the R
#' environment. Functionality of packages from Bioconductor and CRAN are  
#' combined.
#'
#' @references T.B.D.
#' @name micR-package
#' @aliases micR-package micR
#' @docType package
#' @author Stefan Roediger.
#' Maintainer: Stefan Roediger <Stefan.Roediger@@b-tu.de>
#' @keywords package
#' @importFrom bmp read.bmp
#' @importFrom EBImage as.Image
#' @importFrom EBImage bwlabel
#' @importFrom EBImage computeFeatures
#' @importFrom EBImage computeFeatures.moment
#' @importFrom EBImage distmap
#' @importFrom EBImage fillHull
#' @importFrom EBImage gblur
#' @importFrom EBImage makeBrush
#' @importFrom EBImage opening
#' @importFrom EBImage readImage
#' @importFrom EBImage thresh
#' @importFrom EBImage watershed
#' @importFrom tools file_ext
NULL
