getGridData <-
function(lons, lats, dates, dataset, timeperiod, keep.nc = FALSE){
  centeredTime <- getDates(dataset, timeperiod)
  if (length(centeredTime) < 1){
    stop ("Selected time period is not available")
  }
  
  urlbase <- 'http://coastwatch.pfel.noaa.gov/coastwatch/CWBrowserWW360.jsp'
  
  year <- substring(centeredTime, first = 1, last = 4)
  month <- substring(centeredTime, first = 6, last = 7)
  day <- substring(centeredTime, first = 9, last = 10)
  hour <- substring(centeredTime, first = 12, last = 13)
  minute <- substring(centeredTime, first = 15, last = 16)
  second <- substring(centeredTime, first = 18, last = 19)
  satTime <- ISOdatetime(year, month, day, hour, minute, second)
  dates <- strptime(dates, format = "%Y-%m-%d")
  #for(i in 1:length(lons)){ if (lons[i] < 0) {lons[i] <- lons[i] + 360} }
  xmax <- max(lons)
  xmin <- min(lons)
  ymax <- max(lats)
  ymin <- min(lats)
  tmax <- max(dates)
  tmin <- min(dates)
  tind <- satTime[satTime >= tmin & satTime <= tmax]
  if (length(tind) == 0) {
    stop ("There is not data available for requested dates or area. 
          Use getDates to get available dates of requested variable")    
  }
  else{
    for(i in 1:length(tind)){      
      dateStr <- substring(tind[i], first = 1, last = 10)
      timeStr <- substring(tind[i], first = 12, last = 19)
      dowloadCall <- paste(urlbase, '?get=griddata&dataset=', dataset, 
                           '&minlon=', xmin, '&maxlon=', xmax, '&minlat=', ymin, 
                           '&maxlat=', ymax, '&timeperiod=', timeperiod, 
                           '&centeredTime=~', dateStr, 'T', timeStr, 
                           '&filetype=.nc', sep = "")
      destFile <- getwd()
      xmean <- mean(xmax, xmin)
      ymean <- mean(ymax, ymin)
      fileDate <- substring(tind[i], first = 1, last = 10)
      fileOut <- paste(destFile, "/", dataset, "_", i, "_", xmean, "E", ymean, 
                       "N", fileDate, ".nc", sep = "")
      download.file(dowloadCall, destfile = fileOut, cacheOK = TRUE, mode = "wb")
      test <- readLines(fileOut, warn=FALSE)
      ind.test <- rep(NA, length(test))
      for(tt in 1:length(test)){ind.test[tt] <- regexpr("There was an error", 
                                                        test[tt])}
      if (abs(sum(ind.test)) != length(ind.test)) {
        stop ("There was an error in the url call. There is no data; probably 
             because the region requested is beyond the region with data in the 
             source data file")
      }      
      outData <- open.ncdf(fileOut)
      nx <- get.var.ncdf(outData, varid = "lon")
      ny <- get.var.ncdf(outData, varid = "lat")
      nz <- tind
      if (i == 1) {
        outArray <- array(dim = c(length(nx), length(ny), length(tind)))        
      }
      
      outArray[, , i] <- get.var.ncdf(outData)
      Sys.sleep(.2)
      close.ncdf(outData)
    }
    rownames <- if ( min(nx) > 0 ) { nx - 360 } else {nx}
    colnames <- ny
    laynames <- as.character(tind)
    dimnames(outArray) <- list(rownames, colnames, laynames)  
  }  
  
  dataInfo <- outData$var[[1]]$longname
  dataInfo2 <- strsplit(dataInfo, split = ", ")[[1]]
  n.char <- length(dataInfo2)
  paramName <- dataInfo2[1]
  windType <- dataInfo2[n.char]
  if ( paramName == "Wind" ){
    paramName <- paste(paramName, " ", "(", windType, ")", sep = "")
  }
  if ( paramName == "Wind Diffusivity Current" ){
    paramName <- paste(paramName, " ", "(", windType, ")", sep = "")
  }
  if ( paramName == "Wind Stress" ){
    paramName <- paste(paramName, " ", "(", windType, ")", sep = "")
  }
  units <- outData$var[[1]]$units
    
  lon <-  as.numeric(dimnames(outArray)[[1]])
  lat <-  as.numeric(dimnames(outArray)[[2]])
  per <-  dimnames(outArray)[[3]]
  
  dimnames(outArray) <- list(1:length(rownames), 1:length(colnames), laynames)
  outArray <- aperm(outArray, c(2,1,3))  
  
  satin.obj <- list(longitude = lon, latitude = lat, rs.data = outArray, 
                    rs.name = paramName, rs.units = units, period = per, 
                    itype="bloomWatch")
  
  attr(satin.obj, "class") <- "satin"
  if ( keep.nc == FALSE) { 
    nc <- list.files(pattern=glob2rx("*.nc"))
#    os <- .Platform$OS.type
#    if ( os == "windows" )
#      shell(paste("del", paste(nc, collapse=" ")))  
#    else 
#      system(paste("rm", paste(nc, collapse=" ")))
    file.remove(paste(nc, collapse=" "))
  }
  return(satin.obj)
}
