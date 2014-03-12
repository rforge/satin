getGridBathy <-
function(lons, lats, resolution = 1, keep.nc = FALSE){
    urlbase <- 'http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp?get=bathymetryData'
    minLonValue <- min(lons)
    #minLonValue <- ifelse(minLonValue < 0, minLonValue + 360, minLonValue)
    maxLonValue <- max(lons)
    #maxLonValue <- ifelse(maxLonValue < 0, maxLonValue + 360, maxLonValue)
    minLatValue <- min(lats)
    maxLatValue <- max(lats)
    Width <- maxLonValue - minLonValue
    Height <- maxLatValue - minLatValue
    nLonValue <- Width/resolution
    nLatValue <- Height/resolution    
    dowloadCall <- paste(urlbase, "&minLon=", minLonValue, "&maxLon=", 
                         maxLonValue, "&minLat=", minLatValue, "&maxLat=",
                         maxLatValue, "&nLon=", nLonValue, "&nLat=", nLatValue,
                         "&fileType=", ".nc", sep = "")
    destFile <- getwd()
    xmax <- max(lons)
    xmin <- min(lons)
    ymax <- max(lats)
    ymin <- min(lats)
    xmean <- mean(xmax, xmin)
    ymean <- mean(ymax, ymin)    
    fileOut <- paste(destFile, "/tmp", "_", xmean, "E", ymean, "N", ".nc", sep = "")
    download.file(dowloadCall, destfile = fileOut, cacheOK = TRUE, mode = "wb")
    
    outData <- open.ncdf(fileOut)
    nx <- get.var.ncdf(outData, varid = "lon")
    ny <- get.var.ncdf(outData, varid = "lat")
    outArray <- array(dim = c(length(nx), length(ny), 1))
    outArray[, , 1] <- get.var.ncdf(outData)
    outArray <- aperm(outArray, c(2,1,3)) 
    Sys.sleep(.2)
    close.ncdf(outData)
    
    lon <- if ( min(nx) > 0 ) { nx - 360 } else {nx}
    lat <- ny
    
    satin.obj <- list(longitude = lon, latitude = lat, tb.data = outArray, 
                      itype="ETOPO1")
    
    attr(satin.obj, "class") <- "satin"
    if ( keep.nc == FALSE) { 
      nc <- list.files(pattern=glob2rx("*.nc"))
      os <- .Platform$OS.type
      if ( os == "windows" )
        shell(paste("del", paste(nc, collapse=" ")))  
      else 
        system(paste("rm", paste(nc, collapse=" ")))
    }
    return(satin.obj)
    
  }
