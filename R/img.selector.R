#' Determines the object number of an EBImage processed image 
#' 
#' Selects objects based on a specific parameter value (currently nucleus diameter, only).
#' 
#' @param img.moment is the raw image that will used for the detection of the nucleus
#' @param min.diameter is the minimum diameter of a nucleus
#' @param max.diameter is the maximum diameter of a nucleus
#' @param pixel.length is the pixel length of the CCD chip (e.g., 325 nm)
#' @details This function which image object are within a defined size range (e.g., 
#' between 5 and 25 micro meter in diameter).
#' @author Stefan Roediger
#' @references T.B.D. 
#' @keywords select ROI diameter
#' @export img.selector

img.selector <- function(img.moment, min.diameter = 5, max.diameter = 55, pixel.length = 325) {
		res.selector <- 
				min.diameter <= (img.moment[, "m.majoraxis"] * pixel.length / 1000) & 
				(img.moment[, "m.majoraxis"] * pixel.length / 1000) <= max.diameter
				
		as.vector(which(res.selector == TRUE))
}