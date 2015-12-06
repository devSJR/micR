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
#' @author Stefan Rödiger.
#' Maintainer: Stefan Rödiger <Stefan.Roediger@@b-tu.de>
#' @keywords package
#' @importFrom bmp read.bmp
#' @importFrom doParallel detectCores
#' @importFrom doParallel makeCluster
#' @importFrom doParallel registerDoParallel
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
#' @importFrom foreach foreach
#' @importFrom tools file_ext
NULL
