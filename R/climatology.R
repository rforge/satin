climatology <- function(satin.obj) 
{
  so <- satin.obj
  if ( class(so) != "satin" )
    stop ( "need object of class 'satin'" )
  arr <- so$rs.data
  clim <- array(NA, dim=c(nrow(arr), ncol(arr), 5) )
  dimnames(clim)[[3]] <- list("coverage", "mean", "std. dev.", "min.", "max.")
  clim[, , 1] <- apply(!is.na(arr), MARGIN=c(1, 2), "sum")
  clim[, , 1] <- clim[, , 1]/dim(arr)[3] * 100
  clim[, , 2] <- apply(arr, MARGIN=c(1, 2), "mean", na.rm=TRUE )
  clim[, , 3] <- apply(arr, MARGIN=c(1, 2), "sd", na.rm=TRUE )   
  clim[, , 4] <- apply(arr, MARGIN=c(1, 2), "min", na.rm=TRUE )
  clim[, , 5] <- apply(arr, MARGIN=c(1, 2), "max", na.rm=TRUE )

  for ( i in 2:5)
    clim[ , , i][clim[ , , 1] == 0] <- NA

  pFr <- so$period[1]
  pTo <- so$period[dim(arr)[3]]
  so$rs.data <- clim
  so$period <- paste(dimnames(clim)[[3]], "\n from ", pFr, " to: ", pTo)
  so  		
}