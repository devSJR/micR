#' Determine a region of interest or preview area of an image object
#' 
#' Determine a region of interest or preview area of an image object
#' 
#' @param img.raw is the raw image that will used for the analysis
#' @param width is the width of the image area
#' @param hight is the hight of the image area
#' @details This function determines a region of interest or preview area of an 
#' image object. The imgtoEBImage function is used to read in the images.
#' @author Stefan Rödiger
#' @references T.B.D. 
#' @examples img.dim(system.file('images/Well_Slide2_9_APC.png', package='micR'), width = 25, hight = 25)
#' @keywords dimensions area
#' @export img.dim

img.dim <- function(img.raw, width = 25, hight = 25) {
    width <- as.integer(width)
    hight <- as.integer(hight)
    if (width < 0 || width > 100) stop("Region of interest on in a suitable range ([0 ... 100]).")
    if (hight < 0 || hight > 100) stop("Region of interest on in a suitable range ([0 ... 100]).")				  

    img.imported <- imgtoEBImage(img.raw)
    
    img.dim <- dim(img.imported)

    img.center <- data.frame(x.center = img.dim[1] * 0.5, y.center = img.dim[2] * 0.5)

    img.dim.reduced <- data.frame(x1 = img.center[["x.center"]] * (100 - width) / 100,
				  x2 = img.center[["x.center"]] * (100 + width) / 100,
				  y1 = img.center[["y.center"]] * (100 - hight) / 100,
				  y2 = img.center[["y.center"]] * (100 + hight) / 100
				 )
    
    img.reduced <- img.imported[img.dim.reduced[["y1"]]:img.dim.reduced[["y2"]], 
				img.dim.reduced[["x1"]]:img.dim.reduced[["x2"]]]

    list(img.raw = img.imported, img.reduced = img.reduced, img.dim = img.dim.reduced)
}