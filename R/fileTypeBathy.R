fileTypeBathy <-
function(lons, lats, resolution = 1, filetype){
    f.type <- c(".asc", "ESRI.asc", "GoogleEarth", ".grd", ".hdf", ".mat", 
                ".nc", ".ncHeader", "small.png", "medium.png", "large.png",
                "transparent.png", ".tif", ".xyz")
    
    if ( !any(filetype == f.type) )
      stop("Not allowed file type")
    
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
    fileTypeValue <- filetype
    dowloadCall <- paste(urlbase, "&minLon=", minLonValue, "&maxLon=", 
                         maxLonValue, "&minLat=", minLatValue, "&maxLat=",
                         maxLatValue, "&nLon=", nLonValue, "&nLat=", nLatValue,
                         "&fileType=", fileTypeValue, sep = "")
    destFile <- getwd()
    xmax <- maxLonValue
    xmin <- minLonValue
    ymax <- max(lats)
    ymin <- min(lats)
    xmean <- mean(xmax, xmin)
    ymean <- mean(ymax, ymin)    
    fileOut <- paste(destFile, "/tmp", "_", xmean, "E", ymean, "N", ".", 
                     strsplit(filetype, split="[.]")[[1]][2], sep = "")
    download.file(dowloadCall, destfile = fileOut, cacheOK = TRUE, mode = "wb")
    
  }
