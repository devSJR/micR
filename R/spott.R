#' Calculate the central tendency of an image object
#' 
#' Selects objects based on a specific moment parameter, where currently only majoraxis (recalculated as micro meter) is used.
#' 
#' @param img.raw is the raw image that will used for the detection of the nucleus
#' @param img.pp is input of the type img.processor object (see img.processor {micR})
#' @param img.moment is an computeFeatures.moment object (see computeFeatures.moment {EBImage})
#' @param quantile is a value to define the values removed by quantile filtering
#' @details This function calculates the mean of a quantile filtered image object.
#' @author Stefan Roediger
#' @references T.B.D. 
#' @keywords quantile mean
#' @export spott

spott <- function(img.raw, img.pp, img.moment, quantile = 0.03) {
	  if(quantile <= 0 || quantile >= 1) stop("'quantile' must be => 0 and <= 1.")
	  sapply(img.selector(img.moment), function(i) {
	  img.data <- img.raw@.Data[which(img.pp@.Data == i, arr.ind = TRUE)]
	  img.data.quantile <- quantile(img.data, c(quantile, 1 - quantile))
	  img.data <- subset(img.data, img.data.quantile[[1]] < img.data & img.data < img.data.quantile[[2]])
	  mean(img.data)
	}
    )
}
