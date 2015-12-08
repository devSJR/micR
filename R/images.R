#' @name Images
#' @title Exemplary images
#' @description Example images for the micR package
#' @docType data
#' @format .png images.
#' @source The data were taken with the VideoScan technology.
#' @author Jens Schneider (BTU CS), Stefan Roediger (BTU CS), Michal Burdukiewicz
#' (University of Wroclaw)
#' @references Roediger, S.; Schierack, P.; Boehm, A.; Nitschke, J.; Berger, I.; 
#' Froemmel, U.; Schmidt, C.; Ruhland, M.; Schimke, I.; Roggenbuck, D.; 
#' Lehmann, W.; Schroeder, C. Adv. Biochem. Eng. Biotechnol. 2013, 133, 35--74.
#' @examples 
#' # read all images
#' img.APC <- imgtoEBImage(system.file('images/Well_Slide2_9_APC.png', package='micR'))
#' img.Cy3 <- imgtoEBImage(system.file('images/Well_Slide2_9_Cy3.png', package='micR'))
#' img.DAPI <- imgtoEBImage(system.file('images/Well_Slide2_9_DAPI.png', package='micR'))
#' img.FITC <- imgtoEBImage(system.file('images/Well_Slide2_9_FITC.png', package='micR'))
NULL
