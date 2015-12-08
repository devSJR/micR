#' Helper function to read image files into EBImage
#' 
#' Selects objects based on a specific moment parameter, where currently only majoraxis (recalculated as micro meter) is used.
#' 
#' @param file is the raw image (currently supported: bmp, tiff, png, jpeg).
#' @details This is a helper function to prepare pixel graphics for further use in EBImage.
#' @author Stefan Roediger
#' @references T.B.D. 
#' @keywords bmp png tiff jpeg
#' @examples imgtoEBImage(system.file('images/Well_Slide2_9_APC.png', package='micR'))
#' @export imgtoEBImage

imgtoEBImage <- function(file) {
  
  file.ext <- file_ext(file)
  
  if (file.ext == "bmp") {
    as.Image(read.bmp(f = file))
  } 
  
  if (file.ext == "tiff" || file.ext == "png" || file.ext == "jpeg") {
    readImage(file)
  }
}