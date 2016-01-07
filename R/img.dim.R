#' Define a region of interest or preview area of an image object
#' 
#' The function defines a region of interest or preview area of an image object.
#' This can be useful if images are large and processing of the images gets time
#' consuming for fast previews. The functions preserves the raw image.
#' 
#' @param img.raw is the raw image that will used for the analysis
#' @param width is the width of the image area
#' @param hight is the hight of the image area
#' @details This function determines a region of interest or preview area of an 
#' image object. The imgtoEBImage function is used to read in the images. It is 
#' to read in images via the micR package to save time during processing test runs. 
#' The img.dim function returns a list with the following objects: img.raw (raw image), 
#' img.reduced (size reduce image) and img.dim (pixel range used after reduction).
#' @author Stefan Roediger
#' @references T.B.D. 
#' @examples
#' # Import an image via img.dim and assign it to the object img.red with 
#' # reduced size. Finally plot a histogram of the reduced image.
#' img.red <- img.dim(system.file('images/Well_Slide2_9_DAPI.png', 
#'                    package='micR'), width = 25, hight = 25)
#' hist(img.red[["img.reduced"]], main = "DAPI (nuclei)")
#' @keywords dimensions area
#' @export img.dim

img.dim <- function(img.raw, width = 25, hight = 25) {
    width <- as.integer(width)
    hight <- as.integer(hight)
    if (width < 0 || width > 100) stop("Region of interest not in a suitable range ([0 ... 100]).")
    if (hight < 0 || hight > 100) stop("Region of interest not in a suitable range ([0 ... 100]).")				  

    img.raw <- imgtoEBImage(img.raw)
    
    img.dim <- dim(img.raw)

    img.center <- data.frame(x.center = img.dim[1] * 0.5, y.center = img.dim[2] * 0.5)

    x.center.shift <- as.integer(img.center[["x.center"]] * (width - 1) / 100)
    y.center.shift <- as.integer(img.center[["y.center"]] * (hight - 1) / 100)
    
    img.dim.reduced <- data.frame(x1 = img.center[["x.center"]] - x.center.shift,
				  x2 = img.center[["x.center"]] + x.center.shift,
				  y1 = img.center[["y.center"]] - y.center.shift,
				  y2 = img.center[["y.center"]] + y.center.shift
			
		      )
    
    img.reduced <- img.raw[img.dim.reduced[["x1"]]:img.dim.reduced[["x2"]], 
			   img.dim.reduced[["y1"]]:img.dim.reduced[["y2"]]]

    list(img.raw = img.raw, img.reduced = img.reduced, img.dim = img.dim.reduced)
    }
