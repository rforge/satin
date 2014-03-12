xtrSatin <- function(satin.obj, points = NULL){
  so <- satin.obj
  if ( class(so) != "satin" )
    stop ( "need object of class 'satin'" )
  sL <- reshapeSatin(so, direction = "long")
  ni <- ncol(sL) - 2
  avp <- so$period
  
  if ( missing(points) ) {
    pts <- locator(type = "p", col = "white", cex = 1.5)       
    points <- as.data.frame(pts)
  }
  
  nPts <- nrow(points)
  param <- matrix(rep(NA, ni * nPts), ncol = ni)
  result <- data.frame(id = 1:nPts, points, d = rep(NA, nPts), 
                       lon = rep(NA, nPts), lat = rep(NA, nPts), 
                       rs.data = param )
  
  for ( i in 1:nPts ){
    p <- points
    d <- sqrt( outer(p[i, 1], sL[, 1], "-")^2 + outer(p[i, 2], sL[, 2], "-")^2 )
    d <- as.vector(d)
    minD <- min(d)
    result[i, 'd'] <- minD
    result[i, 5:(6+ni)] <- sL[which.min(d), ]
    attr(result, 'period') <- avp
  }
  result  
}
