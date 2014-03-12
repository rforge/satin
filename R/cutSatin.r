cutSatin <- function(satin.obj, polygon = NULL, return.poly = FALSE){
  so <- satin.obj
  if ( class(so) != "satin" )
    stop ( "need object of class 'satin'" )
  if ( missing(polygon) ) {
    polygon <- getpoly()       
    polygon <- as.data.frame(polygon)
  }
  if ( polygon[1, 1] != polygon[nrow(polygon), 1] | 
         polygon[1, 2] != polygon[nrow(polygon), 2] )
    polygon <- rbind(polygon, polygon[1, ])
  names(polygon) <- c("x", "y")
  
  px <- min(polygon$x) ; pX <- max(polygon$x)
  py <- min(polygon$y) ; pY <- max(polygon$y)
   
  sL <- reshapeSatin(so, direction = "long")
  inPts <- inout(sL[, 1:2], polygon, bound = TRUE, quiet = TRUE)
  exPts <- as.logical( abs(as.numeric(inPts) - 1) ) 
  sL[exPts, -c(1, 2)] <- NA
  sL <- sL[sL$x >= px & sL$x <= pX, ]
  sL <- sL[sL$y >= py & sL$y <= pY, ]
  sC <- reshapeSatin(sL, direction = "wide")
  if ( return.poly == TRUE )
   sC <- list( aoi = sC, polygon = polygon )
  sC
}

