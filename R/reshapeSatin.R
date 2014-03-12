reshapeSatin <- function(x, direction = "long")
{
  if ( direction == "long") {
    so <- x
    if ( class(so) != "satin" )
      stop ( "need object of class 'satin'" )
    lon <- so$longitude ; nx <- length(lon)
    lat <- so$latitude  ; ny <- length(lat)
    vlon <- rep(lon, each = ny)
    vlat <- rep(lat, nx)
    z <- so$rs.data
    ni <- dim(z)[3]
    Z <- array(z, dim = c(ny * nx, ni))
    result <- data.frame(x = vlon, y = vlat, rs.data = Z)
    attr(result, "rs.name")  <- so$rs.name
    attr(result, "rs.units")  <- so$rs.units
    attr(result, "period") <- so$period
    attr(result, "itype") <- so$itype
  }
  if ( direction == "wide" ) {
    dl <- x
    if ( is.null(attr(dl, "rs.name") ) )
      stop ( "x can't be reshaped as a satin object" ) 
    ni <- ncol(dl) - 2
    rs.name <- attr(dl, "rs.name")
    rs.units <- attr(dl, "rs.units")
    period <- attr(dl, "period")
    itype <- attr(dl, "itype")
    lon <- unique(dl[ , 'x'])
    lat <- sort(unique(dl[ , 'y']))
    Z <- as.vector( as.matrix(dl[ , -c(1, 2)]) )
    z <- array( Z, dim = c(length(lat), length(lon), ni) )
    result <- list(longitude = lon, latitude = lat, rs.data = z, 
                   rs.name = rs.name, rs.units = rs.units, period = period, 
                   itype = itype)
    attr(result, "class") <- "satin"
  }
  result
}