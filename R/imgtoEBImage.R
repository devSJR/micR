#' Helper function to read image files into EBImage
#' 
#' Selects objects based on a specific moment parameter, where currently only majoraxis (recalculated as micro meter) is used.
#' 
#' @param file is the raw image (currently supported: bmp, tiff, png, jpeg).
#' @param convert.bmp is a binary operator used to convert the bmp integer matrix to floating point.
#' @details This is a helper function to prepare pixel graphics for further use in EBImage.
#' @author Stefan Roediger
#' @references T.B.D. 
#' @keywords bmp png tiff jpeg
#' @examples imgtoEBImage(system.file('images/Well_Slide2_9_APC.png', package='micR'))
#' @export imgtoEBImage
imgtoEBImage <- function(file, convert.bmp = TRUE) {
  
  file.ext <- file_ext(file)
  
  if (file.ext == "tiff" || file == "tif" || file.ext == "png" || file.ext == "jpeg") {
    readImage(file)
  } else {
    if (file.ext == "bmp")
	if(convert.bmp) { 
		  as.Image(read.bmp(f = file) / 255)
		  } else {
		  as.Image(read.bmp(f = file))
		  }
  } 
}
