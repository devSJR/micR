#' Function to define a region of interest of a cell nucleus
#' 
#' Find nucleus of a cell.
#' 
#' @param img.raw is the raw image that will used for the detection of the nucleus
#' @param gblur.sigma is the standard deviation of the Gaussian filter used for blurring (see gblur {EBImage})
#' @param thresh.w is the width of the moving rectangular window (see thresh {EBImage})
#' @param thresh.h is the height of the moving rectangular window (see thresh {EBImage})
#' @details This function is a pipline of EBImage function to process an image 
#' with the aim to find region of interest from nuclei.
#' @author Stefan Rödiger
#' @references Pau G, Fuchs F, Sklyar O, Boutros M and Huber W (2010). EBImage 
#' --an R package for image processing with applications to cellular phenotypes. 
#' Bioinformatics, 26(7), pp. 979--981. http://doi.org/10.1093/bioinformatics/btq046. 
#' @keywords nucleus blur watershed
#' @export img.processor

img.processor <- function(img.raw = NULL, gblur.sigma = 2, thresh.w = 20, 
			  thresh.h = 20, thresh.offset = 0.02, watershed.ext = 1) {
      img.gblur 	<- gblur(img.raw, sigma = gblur.sigma)
      img.thresh 	<- thresh(img.gblur, w = thresh.w, h = thresh.h, offset = thresh.offset)
      img.opening 	<- opening(img.thresh, makeBrush(5, shape='disc'))
      img.fillHull 	<- fillHull(img.opening)
      img.bwlabel 	<- bwlabel(img.fillHull)
      img.distmap 	<- distmap(img.bwlabel)
      img.watershed 	<- watershed(img.distmap, ext = watershed.ext)
}