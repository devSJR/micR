#' Helper function to read image files into EBImage
#' 
#' Selects objects based on a specific moment parameter, where currently only majoraxis (recalculated as micro meter) is used.
#' 
#' @param file is the raw image (bmp).
#' @details This is a helper function to prepare pixel graphics for further use in EBImage.
#' @author Stefan Roediger
#' @references T.B.D. 
#' @keywords bmp
#' @export imgtoEBImage

imgtoEBImage <- function(file) {
  as.Image(read.bmp(f = file))
}