scaleSatin <-
function(satin.obj, extent = 1, FUN = mean, format = "wide")
{
  so <- satin.obj
  if ( class(so) != "satin" )
   stop ( "need object of class 'satin'" )
  itype <- so$itype 
  if ( itype == 'quikscat')
    stop ( "only works with 'oceancolor' and 'bloomwatch' data")
  xtt <- extent
  per <- so$period
  x <- so$longitude
  y <- so$latitude
  z <- so$rs.data
  nr <- dim(z)[1]; nc <- dim(z)[2]
  vz <- as.vector(z)
  pers <- rep(per, each=nr*nc)
  
  xs <- seq( floor(min(x)), ceiling(max(x)), xtt )
  if ( max(x) > xs[length(xs)] ) 
    xs <- c( xs, xs[length(xs)] + xtt )

  ys <- seq( floor(min(y)), ceiling(max(y)), xtt )
  if ( max(y) > ys[length(ys)] ) 
    ys <- c( ys, ys[length(ys)] + xtt )

   pmx <- xs[-length(xs)] + xtt / 2
   pmy <- ys[-length(ys)] + xtt / 2

   nlon <- x
   for (i in 1:nc) {
     for(j in 1:length(xs)) {
       if(x[i] >= xs[j] & x[i] < xs[j+1]) 
         nlon[i] <- pmx[j]
     }
   }     

   nlat <- y
   for (i in 1:nr) {
     for(j in 1:length(ys)) {
       if(y[i] >= ys[j] & y[i] < ys[j+1]) 
         nlat[i] <- pmy[j]
     }    
   }     

   D <- data.frame( lon=sort(rep(nlon, nr)), lat=rep(nlat, nc), 
                     date=pers, rs.data=vz )
   if (format == 'long'){  
     D <- D[complete.cases(D), ]
     sx <- aggregate(D$rs.data, by=list(D$lon, D$lat, D$date), FUN, na.rm=TRUE)
     colnames(sx) <- c("longitude", "latitude", "period", "rs.data")
   } 
   if (format == 'wide'){    
     sx <- tapply(D$rs.data, list(D$lat, D$lon, D$date), FUN, na.rm=TRUE)
     dimnames(sx) <- NULL
     sx <- list(longitude=pmx, latitude=pmy, rs.data=sx, rs.name=so$rs.name, 
                rs.units=so$rs.units, period=per, itype = itype)
     attr(sx, "class") <- "satin" 
   }
  sx
}

